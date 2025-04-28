// ignore_for_file: avoid_print

import 'package:celest_cloud_core/celest_cloud_core.dart';

void main() {
  final orderBy = OrderByClause.parse('name, -age');
  print(orderBy);

  final filter = Filter.parse('name = "John" AND age > 18');
  print(filter);
}
