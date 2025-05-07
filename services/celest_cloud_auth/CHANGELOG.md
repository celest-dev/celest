## NEXT

- chore: Simplify `middleware` getter

## 0.3.3

- fix: Migration of Cloud Auth tables
- perf: Use batches for migrations

## 0.3.2+1

- fix: Session duration on Web

## 0.3.2

- fix: Properly set/check session duration

## 0.3.1

- fix: Allow dashes in routes

## 0.3.0

- feat!: Make database modular
- refactor!: Rename `AuthDatabase` to `CloudAuthDatabase`
- refactor!: Rename all entities with `cloud_auth_` prefix
- fix: Correctly route `users/me`
- fix: Verification code email rendering
- chore: Make `Authorizer` a class
- chore: Update dependencies

## 0.2.0

- refactor(cloud_auth)!: Consolidate session logic (#273)
- chore: Update license

## 0.1.1

- fix: Ensure Cedar types are registered during seeding
- fix: Ensure session is linked to user cork

## 0.1.0+1

- chore: Remove some leftover print statements

## 0.1.0

- Initial release.
