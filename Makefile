.PHONY: generate generate-timestamped

# Use simple assignment to avoid having different time values whenever this is
# referenced
time_now := $(shell date -u +%Y-%m-%dT%H_%M_%SZ)


generate:
	@copier copy \
		-r HEAD \
		${PWD} \
		tmp-test-generations/current
	@echo Stored in: tmp-test-generations/current

generate-timestamped:
	@copier copy \
		-r HEAD \
		${PWD} \
		tmp-test-generations/${time_now}
	@echo Stored in: tmp-test-generations/${time_now}
