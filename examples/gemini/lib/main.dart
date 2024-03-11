import 'dart:developer';

// Import the generated Celest client
import 'package:celest_backend/client.dart';
import 'package:flutter/material.dart';

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
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  /// The selected model to use.
  ///
  /// This is first set by [_availableModelsDropdown] when the available models
  /// are loaded from the backend.
  late String _selectedModel;

  /// Whether [_availableModelsFuture] has completed and the available models
  /// have been loaded fromthe backend.
  var _loadedAvailableModels = false;
  final _availableModelsFuture = celest.functions.gemini.availableModels();

  /// Sends the prompt request to the backend and updates the UI with the
  /// response.
  Future<void> _sendGeminiRequest() async {
    try {
      final response = await celest.functions.gemini.generateContent(
        prompt: _questionController.text,
        modelName: _selectedModel,
      );
      log(response);
      setState(() {
        _answerController.text = response;
      });
    } on Exception catch (e) {
      log('Failed to generate content', error: e);
      setState(() {
        _answerController.text = '$e';
      });
    }
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
      dropdownMenuEntries: availableModels
          .map((value) => DropdownMenuEntry(value: value, label: value))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gemini Prompt'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'GPT Settings',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  // Fetches available models from the backend to populate a
                  // dropdown menu.
                  FutureBuilder<List<String>>(
                    future: _availableModelsFuture,
                    builder: (context, snapshot) => switch (snapshot) {
                      // Build the dropdown when data is available
                      AsyncSnapshot(:final data?) =>
                        _availableModelsDropdown(data),

                      // Handle the error case
                      AsyncSnapshot(:final error?) => Text('$error'),

                      // If waiting, show a progress indicator
                      _ => const CircularProgressIndicator(),
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your question here',
                    ),
                    controller: _questionController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        !_loadedAvailableModels ? null : _sendGeminiRequest,
                    child: const Text('Ask your question!'),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Answer',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    readOnly: true,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your answer will go here',
                    ),
                    controller: _answerController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
