import 'package:celest/celest.dart';
import 'package:celest/project.dart' as project;

@project.environments(named: ['prod'])
void define(ProjectContext context) {}
