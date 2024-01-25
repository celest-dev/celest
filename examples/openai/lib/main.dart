import 'package:flutter/material.dart';
// Import the generated Celest client
import 'package:celest_backend/client.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:logger/logger.dart';
// Import needed for input formatters
import 'package:flutter/services.dart';

void main() {
  // Initializes Celest in your Flutter app
  celest.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  TextEditingController maxTokensController = TextEditingController();

  // contains value of selected model from drodown menu
  String? _selectedModelValue;

  double? _tempratureSliderValue;

  var _loadedModels = false;
  final _modelFuture = celest.functions.openAi.availableModels();

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 100, left: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 100),
                  ),
                  const Text("AI model settings"),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  // adds dropdown with available models from backend
                  FutureBuilder<List<String>>(
                    future: _modelFuture, // Replace with your future
                    builder: (BuildContext context,
                        AsyncSnapshot<List<String>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Show a progress indicator when waiting for the future to complete
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle the error case
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        // Build the dropdown when data is available
                        assert(
                          snapshot.data!.isNotEmpty,
                          'Backend should always return at least one model',
                        );
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            _selectedModelValue = snapshot.data!.first;
                            _loadedModels = true;
                          });
                        });
                        return DropdownButton<String>(
                          value: snapshot.data!.first,
                          //handle change of dropdown value
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedModelValue = newValue;
                            });
                          },
                          items: snapshot.data!
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        );
                      } else {
                        // Handle the case when the future completes with no data
                        return const Text("No data available");
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Tooltip(
                        message:
                            "The maximum number of words to generate from AI",
                        child: SizedBox(
                          width: 200,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter
                                  .digitsOnly, // Allow only digits
                            ],
                            decoration: const InputDecoration(
                              // border: OutlineInputBorder(),
                              hintText: 'Max tokens',
                            ),
                            controller: maxTokensController,
                          ),
                        ),
                      ),
                      Tooltip(
                        message:
                            "The higher the temperature, the more random the text",
                        child: SizedBox(
                          width: 200,
                          child: Slider(
                            value: _tempratureSliderValue ?? 0,
                            min: 0,
                            max: 1,
                            divisions: 10,
                            label: _tempratureSliderValue.toString(),
                            onChanged: (double value) {
                              // Use setState but limit its scope only to the slider
                              setState(() {
                                _tempratureSliderValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  TextField(
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your question here',
                    ),
                    controller: questionController,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                    onPressed: !_loadedModels
                        ? null
                        : () async {
                            String response =
                                await celest.functions.openAi.openAiRequest(
                              prompt: questionController.text,
                              model: _selectedModelValue!,
                              parameters: ModelParameters(
                                maxTokens: maxTokensController.text.isNotEmpty
                                    ? int.tryParse(maxTokensController.text)
                                    : null,
                                temperature: _tempratureSliderValue,
                              ),
                            );
                            logger.d(response);
                            setState(() {
                              answerController.text = response;
                            });
                          },
                    child: const Text("Ask your question!"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Text("Answer: "),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  TextField(
                    readOnly: true,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'your answer will go here',
                    ),
                    controller: answerController,
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
