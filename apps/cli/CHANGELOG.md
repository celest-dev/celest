## NEXT

- fix: Don't throw if analysis_options.yaml is missing
- refactor(celest): Move `connect` method to `CelestDatabase` class

## 1.0.12

- feat: Support cross-compilation with Dart 3.8
- feat: Ensure primary org creation on login
- feat: Add Linux installer

## 1.0.11

- feat: Add `celest auth token` command
- feat: Add `celest auth whoami` command
- feat: Add `--token` parameter to `auth login`

## 1.0.10+3

- fix: Pass `flutter_assets` to backend when using `celest deploy`
- fix: Sentry integration
- fix: Ensure pub cache is fixed during startup
- fix: Fix project name in status command

## 1.0.10+2

- chore: Add back Sentry integration

## 1.0.10+1

- fix: Handle control characters when prompting for secrets

## 1.0.10

- feat: Add templates to `celest init`
- feat: Add `celest status` command
- chore: Update to analyzer model v2
- chore: Use distroless Docker base images

## 1.0.9

- feat: Re-implement `celest upgrade`
- feat: Add Celest Cloud commands
- chore: Remove unused native assets code
- chore: Run build_runner daemon with `celest start`

## 1.0.8

- fix: Websocket error condition (#265)
- fix: Ensure @authenticated routes require auth with external providers (#266)
- fix: Rename database environment variables (#277)
- chore: Add full reset to generated client (#269)
- chore: Pass Celest's VM service URI to auxiliary start commands (#270)
- chore: Re-implement celest build (#279)
- chore: Update license

## 1.0.7

- Initial open-source release.
