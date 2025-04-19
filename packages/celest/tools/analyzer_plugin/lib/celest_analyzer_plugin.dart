import 'dart:io' as io;

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/analysis/uri_converter.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer/source/source_range.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/ast/utilities.dart';
import 'package:analyzer_plugin/plugin/navigation_mixin.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart' as protocol;
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
// ignore: implementation_imports
import 'package:analyzer_plugin/src/utilities/navigation/navigation.dart';
import 'package:analyzer_plugin/utilities/navigation/navigation.dart';
import 'package:celest_analyzer_plugin/src/analyzer_helpers.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:source_span/source_span.dart';
import 'package:yaml/yaml.dart';

final class ProjectRoots {
  late AnalysisContextCollection _contextCollection;
  final Map<String, Set<ContextRoot>> roots = {};

  AnalysisContext contextFor(String path) {
    return _contextCollection.contextFor(path);
  }

  bool contains(String path) {
    for (final root in roots.values.expand((it) => it)) {
      if (p.isWithin(root.root, path)) {
        print('Found $path in ${root.root}');
        return true;
      }
    }
    return false;
  }
}

final class CelestAnalyzerPlugin extends ServerPlugin
    with NavigationMixin, DartNavigationMixin {
  CelestAnalyzerPlugin({
    this.withDebugging = false,
    @visibleForTesting ResourceProvider? resourceProvider,
  }) : super(
          resourceProvider:
              resourceProvider ?? PhysicalResourceProvider.INSTANCE,
        );

  static final Logger logger = Logger('Celest.AnalyzerPlugin');

  final bool withDebugging;
  final ProjectRoots _projectRoots = ProjectRoots();

  @override
  String get name => 'celest';

  @override
  String get version => '1.0.0';

  @override
  String get contactInfo => 'support@celest.dev';

  @override
  List<String> get fileGlobsToAnalyze => ['**/*.dart'];

  @override
  void onError(Object exception, StackTrace stackTrace) {
    logger.shout('Error in plugin', exception, stackTrace);
  }

  @override
  void onDone() {
    logger.info('Plugin done');
  }

  @override
  Future<ResolvedUnitResult> getResolvedUnitResult(String path) async {
    for (var i = 0; i < 5; i++) {
      final analysisContext = _projectRoots.contextFor(path);
      try {
        logger.info('getResolvedUnitResult $path');
        final analysisSession = analysisContext.currentSession;
        final unitResult = await analysisSession.getResolvedUnit(path);
        if (unitResult is ResolvedUnitResult) {
          return unitResult;
        }
      } on InconsistentAnalysisException {
        // Retry analysis on InconsistentAnalysisException
        logger.warning('getResolvedUnitResult Retrying analysis for $path');
        await analysisContext.applyPendingFileChanges();
      }
    }
    throw RequestFailure(
      RequestErrorFactory.pluginError(
        'Failed to get resolved unit result for $path',
        null,
      ),
    );
  }

  @override
  Future<NavigationRequest> getNavigationRequest(
    AnalysisGetNavigationParams parameters,
  ) async {
    logger.info('getNavigationRequest $parameters');
    var path = parameters.file;
    if (!_projectRoots.contains(path)) {
      return NoopNavigationRequest(
        resourceProvider: resourceProvider,
        offset: parameters.offset,
        length: parameters.length,
        path: path,
      );
    }
    final result = await getResolvedUnitResult(path);
    var offset = parameters.offset;
    var length = parameters.length;
    if (offset < 0 && length < 0) {
      offset = 0;
      length = result.content.length;
    }
    return DartNavigationRequestImpl(
      resourceProvider,
      offset,
      length,
      result,
    );
  }

  @override
  List<NavigationContributor> getNavigationContributors(String path) {
    return [CelestNavigationContributor(_projectRoots)];
  }

  @override
  Future<void> analyzeFile({
    required AnalysisContext analysisContext,
    required String path,
  }) async {}

  @override
  Future<AnalysisSetContextRootsResult> handleAnalysisSetContextRoots(
    AnalysisSetContextRootsParams parameters,
  ) async {
    logger.info('handleAnalysisSetContextRoots $parameters');
    _projectRoots.roots.clear();
    for (final contextRoot in parameters.roots) {
      if (contextRoot.optionsFile case final options?) {
        final analysisOptions = loadYaml(await io.File(options).readAsString());
        final enabledPlugins = switch (analysisOptions) {
          {
            'analyzer': {
              'plugins': final List<Object?> plugins,
            }
          } =>
            plugins.cast<String>(),
          _ => const [],
        };
        logger.info(
          'handleAnalysisSetContextRoots Found plugins in ${contextRoot.root}: '
          '$enabledPlugins',
        );
        if (enabledPlugins.contains('celest')) {
          (_projectRoots.roots[contextRoot.root] ??= {}).add(contextRoot);
        }
      }
    }
    return super.handleAnalysisSetContextRoots(parameters);
  }

  @override
  Future<void> afterNewContextCollection({
    required AnalysisContextCollection contextCollection,
  }) async {
    _projectRoots._contextCollection = contextCollection;
    await super.afterNewContextCollection(contextCollection: contextCollection);
  }

  @override
  Future<void> beforeContextCollectionDispose({
    required AnalysisContextCollection contextCollection,
  }) {
    for (final context in contextCollection.contexts) {
      logger.info(
        'beforeContextCollectionDispose Disposing context: '
        '${context.contextRoot}',
      );
    }
    return super.beforeContextCollectionDispose(
      contextCollection: contextCollection,
    );
  }
}

final class NoopNavigationRequest implements NavigationRequest {
  NoopNavigationRequest({
    required this.resourceProvider,
    required this.offset,
    required this.length,
    required this.path,
  });

  @override
  final int? length;

  @override
  final int offset;

  @override
  final String path;

  @override
  final ResourceProvider resourceProvider;
}

extension on NavigationRequest {
  String toDebugString() {
    return '$runtimeType(path: $path, offset: $offset, length: $length)';
  }
}

extension SourceSpanDebug on SourceSpan {
  String debugHighlight(String message) {
    final uri = p.prettyUri(sourceUrl);
    final line = start.line + 1;
    final column = start.column + 1;
    final buffer = StringBuffer()..write('$uri:$line:$column: $message');
    final highlight = this.highlight();
    if (highlight.isNotEmpty) {
      buffer
        ..writeln()
        ..write(highlight);
    }
    return buffer.toString();
  }
}

final class CelestNavigationContributor implements NavigationContributor {
  CelestNavigationContributor(this._projectRoots);

  final ProjectRoots _projectRoots;
  static final Logger _logger = Logger('Celest.NavigationContributor');

  @override
  void computeNavigation(
    NavigationRequest request,
    NavigationCollector collector,
  ) {
    if (request is! DartNavigationRequest) {
      return;
    }
    _logger.info('computeNavigation Request: ${request.toDebugString()}');
    final offset = request.offset;
    final length = request.length ?? 0;
    final targetNode =
        NodeLocator(offset, offset + length).searchWithin(request.result.unit);
    if (targetNode == null || targetNode == request.result.unit) {
      _logger.warning('computeNavigation Target node not found');
      return;
    }
    _logger.info(
      'computeNavigation Target node: $targetNode '
      '(${targetNode.runtimeType})',
    );
    final libraryPath =
        request.result.libraryElement2.firstFragment.source.fullName;
    _logger.info('computeNavigation Library path: $libraryPath');
    final visitor = NavigationVisitor(
      collector,
      _projectRoots,
      request.result.session.uriConverter,
    );
    targetNode.accept(visitor);

    collector as NavigationCollectorImpl;
    _logger.info({
      'fileMap': collector.fileMap,
      'regionMap': collector.regionMap,
      'targetMap': collector.targetMap,
    });
  }
}

final class NavigationVisitor extends RecursiveAstVisitor<void> {
  NavigationVisitor(this.collector, this._projectRoots, this._uriConverter);

  final NavigationCollector collector;
  final ProjectRoots _projectRoots;
  final UriConverter _uriConverter;

  static final Logger _logger = Logger('Celest.NavigationVisitor');

  @override
  void visitSimpleIdentifier(SimpleIdentifier node) {
    final methodInvocation = node.parent;
    if (methodInvocation is! MethodInvocation) {
      return;
    }

    final element = methodInvocation.methodName.element;
    if (element is! MethodElement2) {
      _logger.severe('Unexpected element: $element (${element.runtimeType})');
      return;
    }
    _logger.info('Element: $element (${element.runtimeType})');
    final cloudFunctionAnnotation = element.metadata2.annotations
        .firstWhereOrNull((annotation) => annotation.isCloudFunction);
    if (cloudFunctionAnnotation == null) {
      _logger.warning('CloudFunction annotation not found');
      return;
    }
    final (api, function) =
        switch (cloudFunctionAnnotation.computeConstantValue()) {
      final DartObject obj => (
          obj.getField('api')?.toStringValue(),
          obj.getField('function')?.toStringValue(),
        ),
      _ => (null, null),
    };
    if (api == null || function == null) {
      _logger.severe('Invalid CloudFunction annotation');
      return;
    }

    final targetLibraryUri =
        Uri.parse('package:celest_backend/src/functions/$api.dart');
    final targetPath = _uriConverter.uriToPath(targetLibraryUri);
    if (targetPath == null) {
      _logger.severe('Target URI not found: $targetLibraryUri');
      return;
    }
    final targetContext = _projectRoots.contextFor(targetPath);
    final targetResult =
        targetContext.currentSession.getParsedLibrary(targetPath);
    if (targetResult is! ParsedLibraryResult) {
      _logger.shout(
        'Target library could not be parsed: $targetPath '
        '(${targetResult.runtimeType})',
      );
      return;
    }
    final functionTarget = targetResult.units
        .expand((unit) => unit.unit.declarations)
        .whereType<FunctionDeclaration>()
        .singleWhereOrNull((decl) => decl.name.lexeme == function);
    if (functionTarget == null) {
      _logger.shout('Function not found: $function');
      return;
    }
    final functionLocation = SourceRange(
      functionTarget.name.offset,
      functionTarget.name.length,
    );

    final targetFileResult =
        targetContext.currentSession.getFile(targetPath) as FileResult;
    final targetFile = SourceFile.fromString(
      targetFileResult.file.readAsStringSync(),
      url: targetPath,
    );
    final targetSpan = targetFile.span(
      functionLocation.offset,
      functionLocation.end,
    );

    collector.addRange(
      node.sourceRange,
      protocol.ElementKind.FUNCTION,
      protocol.Location(
        targetPath,
        functionLocation.offset,
        functionLocation.length,
        targetSpan.start.line,
        targetSpan.start.column,
        endLine: targetSpan.end.line,
        endColumn: targetSpan.end.column,
      ),
    );
  }
}
