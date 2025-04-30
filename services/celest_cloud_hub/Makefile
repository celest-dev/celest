lib/src/database/schema/*.drift.dart: lib/src/database/schema/*.drift
	@echo "Generating Drift code..."
	@dart run build_runner build --delete-conflicting-outputs

lib/src/database/cloud_hub_database.steps.dart: lib/src/database/cloud_hub_database.dart lib/src/database/schema/*.drift.dart
	@echo "Generating migration steps..."
	@dart run drift_dev make-migrations

drift: lib/src/database/cloud_hub_database.steps.dart

cedar: lib/src/auth/*.cedar
	@echo "Generating Cedar code..."
	@dart run tool/generate_policy_set.dart

.PHONY: drift cedar
all: drift cedar
