.PHONY: all
all:
	@echo "Generating protobuf files..."
	buf generate
	dart format .
	@echo "Generating built_value files..."
	dart run build_runner build --delete-conflicting-outputs
	@echo "Done"
