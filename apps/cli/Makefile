lib/database/*.drift.dart lib/database/database.g.dart: lib/database/*.drift
	@echo "Generating Dart Drift classes..."
	@dart run build_runner build --delete-conflicting-outputs

lib/database/schema/*.json: lib/database/database.g.dart
	@echo "Generating schema JSON..."
	@mkdir -p lib/database/schema/
	@dart run drift_dev schema dump lib/database/database.dart lib/database/schema/

lib/database/database_versions.dart: lib/database/schema/*.json
	@echo "Generating migration steps..."
	@dart run drift_dev schema steps lib/database/schema/ lib/database/database_versions.dart

all: lib/database/database_versions.dart
