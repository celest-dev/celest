import 'package:celest/celest.dart';
import 'package:celest/project.dart' as project;

@project.environments(named: ['prod', 'staging', 'dev'])
void define(ProjectContext context) {}
