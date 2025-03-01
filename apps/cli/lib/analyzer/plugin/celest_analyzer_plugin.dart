import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:celest_cli/analyzer/analysis_error.dart';
import 'package:celest_cli/src/context.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:source_span/source_span.dart';

final class CelestAnalyzerPlugin extends ServerPlugin {
  CelestAnalyzerPlugin({
    void Function(Object error, StackTrace stackTrace)? onError,
    void Function()? onDone,
    this.withDebugging = false,
    @visibleForTesting ResourceProvider? resourceProvider,
  }) : _onError = onError,
       _onDone = onDone,
       super(
         resourceProvider:
             resourceProvider ?? PhysicalResourceProvider.INSTANCE,
       );

  static final Logger logger = Logger('Celest.AnalyzerPlugin');

  final void Function(Object error, StackTrace stackTrace)? _onError;
  final void Function()? _onDone;
  final bool withDebugging;

  @override
  void onError(Object exception, StackTrace stackTrace) {
    logger.severe('Error in plugin', exception, stackTrace);
    _onError?.call(exception, stackTrace);
  }

  @override
  void onDone() {
    logger.info('Plugin done');
    _onDone?.call();
  }

  @override
  Future<AnalysisGetNavigationResult> handleAnalysisGetNavigation(
    AnalysisGetNavigationParams parameters,
  ) async {
    logger.info('Handling analysis get navigation');
    if (withDebugging) {
      final fileText = await fileSystem.file(parameters.file).readAsString();
      final file = SourceFile.fromString(fileText, url: parameters.file);
      final span = file.span(
        parameters.offset,
        parameters.offset + parameters.length,
      );
      logger.info(span.debugHighlight('Navigation request'));
    }
    return AnalysisGetNavigationResult(
      <String>[],
      <NavigationTarget>[],
      <NavigationRegion>[],
    );
  }

  @override
  Future<void> analyzeFile({
    required AnalysisContext analysisContext,
    required String path,
  }) async {
    logger.info('Analyzing $path');
  }

  @override
  List<String> get fileGlobsToAnalyze => ['**/*.dart'];

  @override
  String get name => 'celest';

  @override
  String get version => '1.0.0';
}
