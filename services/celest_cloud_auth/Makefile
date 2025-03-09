lib/src/database/schema/*.drift.dart: lib/src/database/schema/*.drift
	@echo "Generating Drift code..."
	@dart run build_runner build --delete-conflicting-outputs

drift_schema/*.json: lib/src/database/schema/*.drift.dart
	@echo "Generating schema JSON..."
	@mkdir -p drift_schema
	@dart run drift_dev schema dump lib/src/database/auth_database.dart drift_schema/

lib/src/database/schema_versions.dart: drift_schema/*.json
	@echo "Generating migration steps..."
	@dart run drift_dev schema steps drift_schema/ lib/src/database/schema_versions.dart

drift: lib/src/database/schema_versions.dart

cedar: lib/src/authorization/cedar/*
	@echo "Generating Cedar code..."
	@dart run tool/generate_policy_set.dart

.PHONY: drift cedar
all: drift cedar
