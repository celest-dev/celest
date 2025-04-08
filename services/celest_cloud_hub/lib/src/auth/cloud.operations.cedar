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