# Makefile for custom spines
#
# SPDX-License-Identifier: Apache-2.0
# Copyright 2022 Stéphane Caron
# Copyright 2023-2024 Inria

# Hostname or IP address of the Raspberry Pi read from the UPKIE_NAME
# environment variable. Valid usage: ``make upload UPKIE_NAME=foo``
REMOTE = ${UPKIE_NAME}

BASEDIR = $(shell dirname $(CURDIR))
BASEDIR_NAME = $(shell basename $(BASEDIR))

BAZEL = $(BASEDIR)/tools/bazelisk
CURDATE = $(shell date --iso=seconds)
RASPUNZEL = $(BASEDIR)/tools/raspunzel

# Help snippet adapted from:
# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@echo "Host targets:\n"
	@grep -P '^[a-zA-Z0-9_-]+:.*? ## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-24s\033[0m %s\n", $$1, $$2}'
	@echo "\nRaspberry Pi targets:\n"
	@grep -P '^[a-zA-Z0-9_-]+:.*?### .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?### "}; {printf "    \033[36m%-24s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: check_upkie_name
check_upkie_name:
	@ if [ -z "${UPKIE_NAME}" ]; then \
		echo "ERROR: Environment variable UPKIE_NAME is not set.\n"; \
		echo "This variable should contain the robot's hostname or IP address for SSH. "; \
		echo "You can define it inline for a one-time use:\n"; \
		echo "    make some_target UPKIE_NAME=your_robot_hostname\n"; \
		echo "Or add the following line to your shell configuration:\n"; \
		echo "    export UPKIE_NAME=your_robot_hostname\n"; \
		exit 1; \
	fi

.PHONY: clean_broken_links
clean_broken_links:
	find -L $(BASEDIR) -type l ! -exec test -e {} \; -delete

.PHONY: build
build: clean_broken_links  ## build Raspberry Pi targets
	$(BAZEL) build --config=pi64 //spines:mock_spine
	$(BAZEL) build --config=pi64 //spines:pi3hat_spine

.PHONY: clean
clean:  ## clean all local build and intermediate files
	$(BAZEL) clean --expunge

.PHONY: upload
upload: check_upkie_name build  ## upload built targets to the Raspberry Pi
	ssh $(REMOTE) sudo date -s "$(CURDATE)"
	ssh $(REMOTE) mkdir -p $(BASEDIR_NAME)
	ssh $(REMOTE) sudo find $(BASEDIR_NAME) -type d -name __pycache__ -user root -exec chmod go+wx {} "\;"
	rsync -Lrtu --delete-after --delete-excluded --exclude bazel-out/ --exclude bazel-testlogs/ --exclude bazel-$(BASEDIR_NAME) --progress $(BASEDIR)/ $(REMOTE):$(BASEDIR_NAME)/

run_agent:  ### run agent with Bazel on the Raspberry Pi
	$(RASPUNZEL) run -v -s //agent

run_mock_spine:  ### run the mock spine on the Raspberry Pi
	$(RASPUNZEL) run -s //spines:mock_spine

# NB: run_pi3hat_spine is used in build instructions
run_pi3hat_spine:  ### run the pi3hat spine on the Raspberry Pi
	$(RASPUNZEL) run -s //spines:pi3hat_spine
