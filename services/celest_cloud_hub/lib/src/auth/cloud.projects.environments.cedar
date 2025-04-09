// Users can view project environmentss they are viewers of.
@id("cloud.projects.environments.viewer")
permit (
    principal,
    action in Celest::Action::"view",
    resource is Celest::Project::Environment
)
when
{
    (principal is Celest::Project::Member || principal is Celest::Project::Environment::Member) &&
    resource in principal.parent &&
    principal.role == Celest::Role::"viewer"
};

// Users can edit project environments they are editors of.
@id("cloud.projects.environments.editor")
permit (
    principal,
    action in Celest::Action::"edit",
    resource is Celest::Project::Environment
)
when
{
    (principal is Celest::Project::Member || principal is Celest::Project::Environment::Member) &&
    resource in principal.parent &&
    principal.role == Celest::Role::"editor"
};

// Users can do anything but delete project environments they are admins of.
@id("cloud.projects.environments.admin")
permit (
    principal,
    action in Celest::Action::"admin",
    resource is Celest::Project::Environment
)
when
{
    (principal is Celest::Project::Member || principal is Celest::Project::Environment::Member) &&
    resource in principal.parent &&
    principal.role == Celest::Role::"admin"
};

// Users can do anything to environments they are owners of.
@id("cloud.projects.environments.owner")
permit (
    principal,
    action in Celest::Action::"owner",
    resource is Celest::Project::Environment
)
when
{
    (principal is Celest::Project::Member || principal is Celest::Project::Environment::Member) &&
    resource in principal.parent &&
    principal.role == Celest::Role::"owner"
};

// Users can create environments in projects they have admin access to.
@id("cloud.projects.environments.creator")
permit (
    principal,
    action == Celest::Action::"create",
    resource is Celest::Project::Environment
)
when
{
    (principal is Celest::Project::Member || principal is Celest::Project::Environment::Member) &&
    resource in principal.parent &&
    principal.role in Celest::Role::"admin"
};

// Members can deploy environments in projects they have deploy or admin access to.
@id("cloud.projects.environments.deployer")
permit (
    principal,
    action == Celest::Action::"deploy",
    resource is Celest::Project::Environment
)
when
{
    (principal is Celest::Project::Member || principal is Celest::Project::Environment::Member) &&
    resource in principal.parent &&
    principal.role in Celest::Role::"admin"
};