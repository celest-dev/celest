.PHONY: database

database:
	@echo "Generating Dart Drift classes..."
	@dart run build_runner build --delete-conflicting-outputs
	@for DB in cache cloud; do \
		echo "Generating schema JSON for $${DB} database..."; \
		mkdir -p lib/database/$${DB}/schema/; \
		dart run drift_dev schema dump lib/database/$${DB}/$${DB}_database.dart lib/database/$${DB}/schema/; \
		echo "Generating migration file for $${DB} database..."; \
		dart run drift_dev schema steps lib/database/$${DB}/schema/ lib/database/$${DB}/$${DB}.migrations.dart; \
	done
