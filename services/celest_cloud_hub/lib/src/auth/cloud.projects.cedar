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