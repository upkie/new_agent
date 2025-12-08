# New agent template

[![upkie](https://img.shields.io/badge/upkie-10.0.0-bbaacc)](https://github.com/upkie/upkie/tree/v10.0.0)

Template repository to create new agents for [Upkie](https://github.com/upkie/upkie) wheeled bipeds.

If you don't need a custom spine, you can implement your agent in Python directly, as done for instance in the [MPC balancer](https://github.com/upkie/mpc_balancer).

## Getting started

1. Create a new repository from this template
2. Replace `LICENSE` with the license of your choice (the default one is Apache-2.0)
3. Update your project name and dependencies in `pyproject.toml`
4. Set your project name in `WORKSPACE` and in `Makefile`
5. Search for the string "TODO" and check that you all occurrences
6. Rename the `new_agent` directory to your agent's name and implement it there
7. Customize your C++ spines in the `spines` directory

## Usage

- Install Python packages to a conda environment: `conda env create -f environment.yaml -n your_agent_name`
- Activate conda environment: `conda activate your_agent_name`
- Build and run the custom simulation spine: `make run_bullet_spine`
- Build the custom pi3hat spine: `make build`
- Upload the working directory to the robot: `make upload`
- Run the pi3hat spine on the robot: `make run_pi3hat_spine`
- Run your agent on the robot: `python agent/main.py`
