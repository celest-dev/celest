// This file is generated. To update, run `dart tool/generate_policy_set.dart`.
library;

import 'package:cedar/cedar.dart';

/// The core policy set.
///
/// Included policies:
/// - cloud.operations.cedar
/// - cloud.organizations.cedar
/// - cloud.projects.cedar
/// - cloud.projects.environments.cedar
final corePolicySet = PolicySet.parse(corePolicySetCedar);

/// The core policy set, in Cedar IDL.
const corePolicySetCedar = '''
// ---------------------------- //
// -- cloud.operations.cedar -- //
// ---------------------------- //

@id("cloud.operations.viewer")
permit (
    principal,
    action in Celest::Action::"view",
    resource is Celest::Operation
)
when
{
    if
        principal is Celest::Organization::Member ||
        principal is Celest::Project::Member
    then
        resource in principal.parent &&
        principal.role in Celest::Role::"viewer"
    else
        if
            principal is Celest::User ||
            principal is Celest::ServiceAccount
        then
            resource in principal
        else
            false
};

// @id("cloud.operations.editor")
// permit (
//     principal,
//     action in Celest::Action::"edit",
//     resource is Celest::Operation
// )
// when
// {
//     if
//         principal is Celest::Organization::Member ||
//         principal is Celest::Project::Member
//     then
//         resource in principal.parent &&
//         principal.role in Celest::Role::"editor"
//     else
//         if
//             principal is Celest::User ||
//             principal is Celest::ServiceAccount
//         then
//             resource in principal
//         else
//             false
// };

// @id("cloud.operations.admin")
// permit (
//     principal,
//     action in Celest::Action::"admin",
//     resource is Celest::Operation
// )
// when
// {
//     if
//         principal is Celest::Organization::Member ||
//         principal is Celest::Project::Member
//     then
//         resource in principal.parent &&
//         principal.role in Celest::Role::"admin"
//     else
//         if
//             principal is Celest::User ||
//             principal is Celest::ServiceAccount
//         then
//             resource in principal
//         else
//             false
// };
// ------------------------------- //
// -- cloud.organizations.cedar -- //
// ------------------------------- //

// Users can view organizations they are viewers of.
@id("cloud.organizations.viewer")
permit (
    principal is Celest::Organization::Member,
    action in Celest::Action::"view",
    resource is Celest::Organization
)
when
{ resource in principal.parent && principal.role in Celest::Role::"viewer" };

// Users can edit organizations they are editors of.
@id("cloud.organizations.editor")
permit (
    principal is Celest::Organization::Member,
    action in Celest::Action::"edit",
    resource is Celest::Organization
)
when
{ resource in principal.parent && principal.role in Celest::Role::"editor" };

// Users can do anything but delete organizations they are admins of.
@id("cloud.organizations.admin")
permit (
    principal is Celest::Organization::Member,
    action in Celest::Action::"admin",
    resource is Celest::Organization
)
when
{ resource in principal.parent && principal.role in Celest::Role::"admin" };

// Users can do anything to organizations they are owners of.
@id("cloud.organizations.owner")
permit (
    principal is Celest::Organization::Member,
    action in Celest::Action::"owner",
    resource is Celest::Organization
)
when
{ resource in principal.parent && principal.role in Celest::Role::"owner" };

// Any registered user can create an organization.
// TODO: They shouldn't be able to create a resource anywhere, only in the root.
@id("cloud.organizations.creator")
permit (
    principal is Celest::User,
    action == Celest::Action::"create",
    resource is Celest::Organization
);
// -------------------------- //
// -- cloud.projects.cedar -- //
// -------------------------- //

// Users can view projects they are viewers of.
@id("cloud.projects.viewer")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"view",
    resource is Celest::Project
)
when
{ resource in principal.parent && principal.role == Celest::Role::"viewer" };

// Users can edit projects they are editors of.
@id("cloud.projects.editor")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"edit",
    resource is Celest::Project
)
when
{ resource in principal.parent && principal.role == Celest::Role::"editor" };

// Users can do anything but delete projects they are admins of.
@id("cloud.projects.admin")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"admin",
    resource is Celest::Project
)
when
{ resource in principal.parent && principal.role == Celest::Role::"admin" };

// Users can do anything to projects they are owners of.
@id("cloud.projects.owner")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"owner",
    resource is Celest::Project
)
when
{ resource in principal.parent && principal.role == Celest::Role::"owner" };

// Users can create projects in organizations they have admin access to.
@id("cloud.projects.creator")
permit (
    principal is Celest::Organization::Member,
    action == Celest::Action::"create",
    resource is Celest::Project
)
when
{
    resource in principal.parent &&
    principal.role in Celest::Role::"admin"
};
// --------------------------------------- //
// -- cloud.projects.environments.cedar -- //
// --------------------------------------- //

// Users can view project environmentss they are viewers of.
@id("cloud.projects.environments.viewer")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"view",
    resource is Celest::Project::Environment
)
when
{
    resource in principal.parent &&
    principal.role == Celest::Role::"viewer"
};

// Users can edit project environments they are editors of.
@id("cloud.projects.environments.editor")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"edit",
    resource is Celest::Project::Environment
)
when
{
    resource in principal.parent &&
    principal.role == Celest::Role::"editor"
};

// Users can do anything but delete project environments they are admins of.
@id("cloud.projects.environments.admin")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"admin",
    resource is Celest::Project::Environment
)
when
{
    resource in principal.parent &&
    principal.role == Celest::Role::"admin"
};

// Users can do anything to environments they are owners of.
@id("cloud.projects.environments.owner")
permit (
    principal is Celest::Project::Member,
    action in Celest::Action::"owner",
    resource is Celest::Project::Environment
)
when
{
    resource in principal.parent &&
    principal.role == Celest::Role::"owner"
};

// Users can create environments in projects they have admin access to.
@id("cloud.projects.environments.creator")
permit (
    principal is Celest::Project::Member,
    action == Celest::Action::"create",
    resource is Celest::Project::Environment
)
when
{
    resource in principal.parent &&
    principal.role in Celest::Role::"admin"
};

// Members can deploy environments in projects they have deploy or admin access to.
@id("cloud.projects.environments.deployer")
permit (
    principal is Celest::Project::Member,
    action == Celest::Project::Environment::Action::"deploy",
    resource is Celest::Project::Environment
)
when
{
    resource in principal.parent &&
    principal.role in Celest::Role::"admin"
};
''';
