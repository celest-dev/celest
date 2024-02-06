// Import the generated Celest client
import 'package:celest_backend/client.dart';
import 'package:celest_backend/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

void main() {
  // Initializes Celest in your Flutter app
  celest.init();
  runApp(const OpenAiApp());
}

class OpenAiApp extends StatefulWidget {
  const OpenAiApp({super.key});

  @override
  State<OpenAiApp> createState() => _OpenAiAppState();
}

class _OpenAiAppState extends State<OpenAiApp> {
  static final _logger = Logger(
    printer: PrettyPrinter(),
  );

  // Controllers for the text fields.
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  final _maxTokensController = TextEditingController();

  /// The selected model to use.
  ///
  /// This is first set by [_availableModelsDropdown] when the available models
  /// are loaded from the backend.
  late String _selectedModel;

  /// The value of the temperature slider.
  var _temperatureSliderValue = 1.0;

  /// Whether [_availableModelsFuture] has completed and the available models
  /// have been loaded fromthe backend.
  var _loadedAvailableModels = false;
  final _availableModelsFuture = celest.functions.openAi.availableModels();

  /// Sends the prompt request to the backend and updates the UI with the
  /// response.
  Future<void> _sendOpenAiRequest() async {
    try {
      final response = await celest.functions.openAi.openAiRequest(
        prompt: _questionController.text,
        model: _selectedModel,
        parameters: ModelParameters(
          maxTokens: _maxTokensController.text.isNotEmpty
              ? int.parse(_maxTokensController.text)
              : null,
          temperature: _temperatureSliderValue,
        ),
      );
      _logger.d(response);
      setState(() {
        _answerController.text = response;
      });
    } on Exception catch (e) {
      _logger.e(e);
      setState(() {
        _answerController.text = '${e.runtimeType}: $e';
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
          title: const Text('OpenAI Prompt'),
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
                      AsyncSnapshot(:final error?) =>
                        Text('${error.runtimeType}: $error'),

                      // If waiting, show a progress indicator
                      _ => const CircularProgressIndicator(),
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        Tooltip(
                          message:
                              'The maximum number of words for the AI to generate',
                          child: SizedBox(
                            width: 150,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              // Allow only digits
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                hintText: 'Max tokens',
                              ),
                              controller: _maxTokensController,
                            ),
                          ),
                        ),
                        Tooltip(
                          message:
                              'The higher the temperature, the more random the text',
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Temperature',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                width: 150,
                                child: Slider(
                                  value: _temperatureSliderValue,
                                  min: 0,
                                  max: 2,
                                  divisions: 10,
                                  label: _temperatureSliderValue.toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _temperatureSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        !_loadedAvailableModels ? null : _sendOpenAiRequest,
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
