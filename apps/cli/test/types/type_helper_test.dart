import 'dart:io' as io;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:celest_cli/src/analyzer/celest_analyzer.dart';
import 'package:celest_cli/src/context.dart';
import 'package:celest_cli/src/project/celest_project.dart';
import 'package:celest_cli/src/project/project_paths.dart';
import 'package:celest_cli/src/utils/analyzer.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

import '../analyzer/celest_analyzer_test.dart';
import '../common.dart';

Future<InterfaceType> _resolveInterfaceType(
  String packageName,
  String typeName,
) async {
  final session = celestProject.analysisContext.currentSession;
  final result = await session.getLibraryByUri(
    'package:$packageName/models.dart',
  );
  late final LibraryElement libraryElement;
  switch (result) {
    case LibraryElementResult(element: final resolved):
      libraryElement = resolved;
    default:
      fail(
        'Could not resolve package:$packageName/models.dart: ${result.runtimeType}',
      );
  }
  final interface = libraryElement.getClass(typeName);
  expect(interface, isNotNull, reason: 'Expected to resolve $typeName');
  return interface!.thisType;
}

CelestProject? _tryGetCelestProject() {
  try {
    return celestProject;
  } catch (_) {
    return null;
  }
}

void main() {
  group('TypeHelper.invalidatePaths', () {
    setUpAll(initTests);

    tearDown(() async {
      CelestAnalyzer().reset();
      final project = _tryGetCelestProject();
      if (project != null) {
        await project.close();
      }
    });

    test('removes cached entries for project files', () async {
      const projectName = 'type_helper_invalidation_example';
      celestProject = await newProject(
        name: projectName,
        models: '''
sealed class Shape {
  const Shape();
}

final class Circle extends Shape {
  const Circle();
}
''',
      );
      final originalPaths = celestProject.projectPaths;
      final canonicalPaths = ProjectPaths(
        io.Directory(originalPaths.projectRoot).resolveSymbolicLinksSync(),
        parentAppRoot: originalPaths.parentAppRoot,
        clientDir: originalPaths.clientRoot,
        outputsDir: originalPaths.outputsDir,
      );
      projectPaths = canonicalPaths;
      addTearDown(() => projectPaths = null);

      final analyzer = CelestAnalyzer();
      await analyzer.analyzeProject();

      final shapeType = await _resolveInterfaceType(projectName, 'Shape');
      final circleType = await _resolveInterfaceType(projectName, 'Circle');

      final shapeRef = typeHelper.toReference(shapeType);
      final circleRef = typeHelper.toReference(circleType);
      final shapeWireType = typeHelper.toUri(shapeType);
      expect(shapeWireType, isNotNull);

      typeHelper.cacheSubtypes(shapeType.element, [circleType]);
      await shapeType.hasAllowedSubtypes();
      final circleVerdict = typeHelper.isSerializable(circleType);
      expect(typeHelper.subtypes.containsKey(shapeType.element), isTrue);
      expect(
        typeHelper.serializationVerdicts[circleType],
        equals(circleVerdict),
      );
      expect(
        typeHelper.fromReference(circleRef).getDisplayString(),
        circleType.getDisplayString(),
      );
      expect(
        typeHelper.fromWireType(shapeWireType!).getDisplayString(),
        shapeType.getDisplayString(),
      );

      final modelsPath =
          circleType.element.library.firstFragment.source.fullName;
      expect(modelsPath, isNotEmpty, reason: 'Expected models path to resolve');
      expect(
        p.isWithin(projectPaths.projectRoot, modelsPath),
        isTrue,
        reason:
            'Expected $modelsPath to be within ${projectPaths.projectRoot} (context path)',
      );
      expect(
        path.isWithin(projectPaths.projectRoot, modelsPath),
        isTrue,
        reason: 'Expected $modelsPath to be within ${projectPaths.projectRoot}',
      );
      typeHelper.invalidatePaths([modelsPath]);

      expect(typeHelper.subtypes.containsKey(shapeType.element), isFalse);
      final remainingVerdicts = typeHelper.serializationVerdicts.keys
          .map((type) => type.getDisplayString())
          .toList(growable: false);
      expect(
        remainingVerdicts,
        isEmpty,
        reason:
            'Expected serialization verdicts to be cleared, found $remainingVerdicts.',
      );
      expect(() => typeHelper.fromReference(shapeRef), throwsA(isA<Error>()));
      expect(() => typeHelper.fromReference(circleRef), throwsA(isA<Error>()));
      expect(
        () => typeHelper.fromWireType(shapeWireType),
        throwsA(isA<Error>()),
      );
    });

    test('ignores paths outside the project root', () async {
      const projectName = 'type_helper_invalidation_outside_project';
      celestProject = await newProject(
        name: projectName,
        models: 'class Foo { const Foo(); }',
      );
      final originalPaths = celestProject.projectPaths;
      final canonicalPaths = ProjectPaths(
        io.Directory(originalPaths.projectRoot).resolveSymbolicLinksSync(),
        parentAppRoot: originalPaths.parentAppRoot,
        clientDir: originalPaths.clientRoot,
        outputsDir: originalPaths.outputsDir,
      );
      projectPaths = canonicalPaths;
      addTearDown(() => projectPaths = null);

      final analyzer = CelestAnalyzer();
      await analyzer.analyzeProject();

      final fooType = await _resolveInterfaceType(projectName, 'Foo');
      final fooRef = typeHelper.toReference(fooType);
      final fooWireType = typeHelper.toUri(fooType);
      expect(fooWireType, isNotNull);

      typeHelper.isSerializable(fooType);
      await fooType.hasAllowedSubtypes();
      typeHelper.cacheSubtypes(fooType.element, const []);
      final externalPath = path.join(io.Directory.systemTemp.path, 'foo.dart');

      typeHelper.invalidatePaths([externalPath]);

      expect(typeHelper.serializationVerdicts.containsKey(fooType), isTrue);
      expect(typeHelper.subtypes.containsKey(fooType.element), isTrue);
      expect(
        typeHelper.fromReference(fooRef).getDisplayString(),
        fooType.getDisplayString(),
      );
      expect(
        typeHelper.fromWireType(fooWireType!).getDisplayString(),
        fooType.getDisplayString(),
      );
    });
  });
}
