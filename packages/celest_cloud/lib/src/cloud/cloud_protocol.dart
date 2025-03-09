import 'package:celest_cloud/src/cloud/authentication/authentication_protocol.dart';
import 'package:celest_cloud/src/cloud/operations/operations_protocol.dart';
import 'package:celest_cloud/src/cloud/organizations/organizations_protocol.dart';
import 'package:celest_cloud/src/cloud/projects/projects_protocol.dart';
import 'package:celest_cloud/src/cloud/subscriptions/subscriptions_protocol.dart';
import 'package:celest_cloud/src/cloud/users/users_protocol.dart';

abstract interface class CloudProtocol {
  AuthenticationProtocol get authentication;
  OrganizationsProtocol get organizations;
  OperationsProtocol get operations;
  UsersProtocol get users;
  ProjectsProtocol get projects;
  SubscriptionsProtocol get subscriptions;
}
