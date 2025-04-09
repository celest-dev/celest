PROTOS := $(shell cd proto; find . -path './celest/*' -name '*.proto')
AST_PROTOS := $(PWD)/packages/celest_ast/proto

protos:
	@go install github.com/googleapis/api-linter/cmd/api-linter@latest

	buf lint
	cd proto && \
		api-linter --set-exit-status \
			-I $(HOME)/.cache/buf/v3/modules/b5/buf.build/googleapis/googleapis/$(shell yq '.deps[] | select(.name == "buf.build/googleapis/googleapis") | .commit' buf.lock)/files \
			-I $(HOME)/.cache/buf/v3/modules/b5/buf.build/bufbuild/protovalidate/$(shell yq '.deps[] | select(.name == "buf.build/bufbuild/protovalidate") | .commit' buf.lock)/files \
			-I $(HOME)/.cache/buf/v3/modules/b5/buf.build/celest-dev/cedar/$(shell yq '.deps[] | select(.name == "buf.build/celest-dev/cedar") | .commit' buf.lock)/files \
			-I $(AST_PROTOS) \
			-I . \
			--config=aip.yaml \
			$(PROTOS)
	buf generate
	(cd packages/celest_cloud && dart format .)
	(cd packages/celest_ast && buf generate && dart format .)
