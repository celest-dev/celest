import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:logging/logging.dart';

final class CelestAnalyzerPlugin extends ServerPlugin {
  CelestAnalyzerPlugin({
    void Function(Object error, StackTrace stackTrace)? onError,
    void Function()? onDone,
  })  : _onError = onError,
        _onDone = onDone,
        super(resourceProvider: PhysicalResourceProvider.INSTANCE);

  static final Logger logger = Logger('CelestAnalyzerPlugin');

  final void Function(Object error, StackTrace stackTrace)? _onError;
  final void Function()? _onDone;

  @override
  void onError(Object exception, StackTrace stackTrace) {
    logger.info('Error in plugin', exception, stackTrace);
    _onError?.call(exception, stackTrace);
  }

  @override
  void onDone() {
    logger.info('Plugin done');
    _onDone?.call();
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
