// Admins can perform all admin actions.
@id("cloud.admin")
permit (
    principal is Celest::User,
    action in [
        Celest::Action::"create",
        Celest::Action::"get",
        Celest::Action::"list",
        Celest::Action::"update",
        Celest::Action::"delete",
        Celest::Action::"invoke"
    ],
    resource
)
when { principal in Celest::Role::"admin" };

// Editors can perform all edit actions.
@id("cloud.editor")
permit (
    principal is Celest::User,
    action in [
        Celest::Action::"get",
        Celest::Action::"list",
        Celest::Action::"update",
        Celest::Action::"invoke"
    ],
    resource
)
when { principal in Celest::Role::"editor" };

// Viewers can perform all view actions.
@id("cloud.viewer")
permit (
    principal is Celest::User,
    action in [
        Celest::Action::"get",
        Celest::Action::"list",
        Celest::Action::"invoke"
    ],
    resource
)
when { principal in Celest::Role::"viewer" };

// Users can do anything to their own profiles.
@id("cloud.users.self")
permit (
    principal is Celest::User,
    action,
    resource is Celest::User
)
when { principal == resource };

// Admin functions and APIs.
@id("cloud.functions.admin")
permit (
    principal in Celest::Role::"admin",
    action == Celest::Action::"invoke",
    resource in ?resource
);

// Authenticated functions and APIs.
@id("cloud.functions.authenticated")
permit (
    principal in Celest::Role::"authenticated",
    action == Celest::Action::"invoke",
    resource in ?resource
);

// Anonymous functions and APIs.
@id("cloud.functions.anonymous")
permit (
    principal in Celest::Role::"anonymous",
    action == Celest::Action::"invoke",
    resource in ?resource
);

// Public functions and APIs.
@id("cloud.functions.public")
permit (
    principal,
    action == Celest::Action::"invoke",
    resource in ?resource
);
