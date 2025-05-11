import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// Import the generated Celest client
import 'package:gemini_example_client/gemini_example_client.dart';

void main() {
  // Initializes Celest in your Flutter app
  celest.init();
  runApp(const GeminiApp());
}

class GeminiApp extends StatefulWidget {
  const GeminiApp({super.key});

  @override
  State<GeminiApp> createState() => _GeminiAppState();
}

class _GeminiAppState extends State<GeminiApp> {
  // Controllers for the text fields.
  final _promptController = TextEditingController();
  final _answerController = TextEditingController();
  final _answerScrollController = ScrollController();

  /// The selected model to use.
  ///
  /// This is first set by [_availableModelsDropdown] when the available models
  /// are loaded from the backend.
  late String _selectedModel;

  /// Whether [_availableModelsFuture] has completed and the available models
  /// have been loaded from the backend.
  var _loadedAvailableModels = false;
  final _availableModelsFuture = celest.functions.gemini.availableModels();

  StreamSubscription<String>? _contentStreamSub;

  @override
  void dispose() {
    _availableModelsFuture.ignore();
    _contentStreamSub?.cancel();
    _contentStreamSub = null;
    _promptController.dispose();
    _answerController.dispose();
    _answerScrollController.dispose();
    super.dispose();
  }

  /// Sends the prompt request to the backend and updates the UI with the
  /// response as it streams in.
  void _sendGeminiRequest() {
    final contentStream = celest.functions.gemini.generateContent(
      prompt: _promptController.text,
      modelName: _selectedModel,
    );
    setState(() {
      _answerController.text = '';
      _contentStreamSub?.cancel();
      _contentStreamSub = contentStream.listen(
        (response) {
          log(response);
          setState(() => _answerController.text += response);
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _answerScrollController.jumpTo(
              _answerScrollController.position.maxScrollExtent,
            );
          });
        },
        onError: (error, stackTrace) {
          log(
            'Failed to generate content',
            error: error,
            stackTrace: stackTrace,
          );
          setState(() => _answerController.text = '$error');
        },
        onDone: () => log('Finished generating content'),
      );
    });
  }

  /// Builds a dropdown menu with the available models loaded from the backend.
  Widget _availableModelsDropdown(List<String> availableModels) {
    assert(
      availableModels.isNotEmpty,
      'Backend will always return at least one model',
    );
    final defaultModel = availableModels.first;
    if (!_loadedAvailableModels) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _selectedModel = defaultModel;
          _loadedAvailableModels = true;
        });
      });
    }
    return DropdownMenu<String>(
      initialSelection: defaultModel,
      label: const Text('Model'),
      onSelected: (newValue) {
        if (newValue == null) return;
        setState(() {
          _selectedModel = newValue;
        });
      },
      dropdownMenuEntries:
          availableModels
              .map((value) => DropdownMenuEntry(value: value, label: value))
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Gemini AI')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Fetches available models from the backend to populate a
                    // dropdown menu.
                    FutureBuilder<List<String>>(
                      future: _availableModelsFuture,
                      builder:
                          (context, snapshot) => switch (snapshot) {
                            // Build the dropdown when data is available
                            AsyncSnapshot(:final data?) =>
                              _availableModelsDropdown(data),

                            // Handle the error case
                            AsyncSnapshot(:final error?) => Text('$error'),

                            // If waiting, show a progress indicator
                            _ => const CircularProgressIndicator(),
                          },
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'What is the meaning of life?',
                        ),
                        controller: _promptController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed:
                          !_loadedAvailableModels ? null : _sendGeminiRequest,
                      child: const Text('Prompt'),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Text('Answer', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 20),
                TextField(
                  readOnly: true,
                  showCursor: false,
                  canRequestFocus: false,
                  maxLines: 15,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'The response will be streamed here',
                  ),
                  scrollController: _answerScrollController,
                  controller: _answerController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
