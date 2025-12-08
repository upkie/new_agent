# New agent template

[![upkie](https://img.shields.io/badge/upkie-10.0.0-bbaacc)](https://github.com/upkie/upkie/tree/v10.0.0)

Template repository to create new agents for [Upkie](https://github.com/upkie/upkie) wheeled bipeds.

## Getting started

1. Create a new repository from this template
2. Replace `LICENSE` with the license of your choice (the default one is Apache-2.0)
3. Update your project name and dependencies in `pyproject.toml`
4. Rename the `new_agent` directory to your agent's name
5. Replace occurrences of "new\_agent" by this directory name in `pyproject.toml`
6. Implement your agent in this directory

## Usage

This project uses [pixi](https://pixi.sh/latest/#installation) to run tasks:

- Start a simulation: `pixi run simulation`
- Run the agent: `pixi run agent`

You can use the Makefile to deploy the agent to your robot:

1. `make pack_pixi_env` to package the Python environment
2. `make upload` to upload the agent to the robot
3. Log into the robot and go to the agent directory
4. `make unpack_pixi_env` to unpack the Python environment
5. `make run_agent` to run the agent
