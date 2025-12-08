# Makefile for Upkie agents
#
# SPDX-License-Identifier: Apache-2.0

PROJECT_NAME = $(shell basename $(CURDIR))
PYTHON = python3

# Help snippet adapted from:
# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@echo "Host targets:\n"
	@grep -P '^[a-zA-Z0-9_-]+:.*? ## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-24s\033[0m %s\n", $$1, $$2}'
	@echo "\nRobot targets:\n"
	@grep -P '^[a-zA-Z0-9_-]+:.*?### .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?### "}; {printf "    \033[36m%-24s\033[0m %s\n", $$1, $$2}'

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

clean:  ## clean build and environment files
	rm -f environment.tar

pack_pixi_env:  ## pack Python environment to be deployed to your Upkie
	pixi run pack

run_agent:  ### run agent on the real robot
	@if [ -f ${MAMBA_ROOT_PREFIX}/envs/$(PROJECT_NAME)/activate.sh ]; then \
		echo "Running the agent from the unpacked Python environment..."; \
		. ${MAMBA_ROOT_PREFIX}/envs/$(PROJECT_NAME)/activate.sh && $(PYTHON) -m $(PROJECT_NAME); \
	else \
		echo "Running the agent in current Python environment..."; \
		$(PYTHON) -m $(PROJECT_NAME); \
	fi

# See also: https://github.com/orgs/upkie/discussions/467
unpack_pixi_env:  ### unpack Python environment
	@pixi-unpack environment.tar -e upkie -o ${MAMBA_ROOT_PREFIX}/envs/$(PROJECT_NAME) || { \
		echo "Error: pixi-pack not found"; \
		echo "See https://github.com/Quantco/pixi-pack?tab=readme-ov-file#-installation"; \
		exit 1; \
	}

upload: check_upkie_name  ## upload balancer to the robot
	ssh ${UPKIE_NAME} mkdir -p $(PROJECT_NAME)
	ssh ${UPKIE_NAME} sudo find $(PROJECT_NAME) -type d -name __pycache__ -user root -exec chmod go+wx {} "\;"
	rsync -Lrtu --delete-after \
		--exclude .pixi \
		--exclude activate.sh \
		--exclude env/ \
		--progress \
		$(CURDIR)/ ${UPKIE_NAME}:$(PROJECT_NAME)/
