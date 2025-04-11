.PHONY: database

database:
	@echo "Generating Dart Drift classes..."
	@dart run build_runner build --delete-conflicting-outputs
	@echo "Generating schema JSON for databases..."
	@dart run drift_dev make-migrations
