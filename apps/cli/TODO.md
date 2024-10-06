## Codegen

- Copy documentation comments from source to generated files
- Generate OpenAPI specs from code
    - [ ] Fix all getters being generated for classes like IList
    - [ ] Fix generics
    - [ ] Fix extension types
    - [ ] Fix overrides
    - [ ] Fix custom toJson/fromJson (we can't synthesize a specific shape only a type)
        - For custom toJson, response types can only be a base type like `object` or `string`
        - For custom fromJson, request types can only be a base type like `object` or `string`
    - [ ] Fix `required` fields (take into account nullability + default values)
    - [ ] Fix `default` values
- Generate Dockerfiles
- Generate full client as part of `celest init`. To prevent lengthy starts, maybe bundle the generated client.

## Functions

- Allow returning `Response` from functions for raw response control.

## Environment Variables

- Overhaul environment variables to avoid intermediate `Env` generation
