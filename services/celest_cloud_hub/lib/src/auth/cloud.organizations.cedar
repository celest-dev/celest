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