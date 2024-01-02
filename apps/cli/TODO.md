## Init

- Generate analysis_options.yaml
- Copy documentation comments from source to generated files
- Copy `@deprecated` annotations from source to generated files (any others?)
- Check if resources are defined in the wrong file (e.g. an `@api` annotation used outside an API file)

## EnvVars

- Do not track `config/.env` in git and add it to `.gitignore`
