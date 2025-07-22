# New agent template

[![upkie](https://img.shields.io/badge/upkie-8.0.0-bbaacc)](https://github.com/upkie/upkie/tree/v8.0.0)

Template repository to create new agents with custom spines for [Upkie](https://github.com/upkie/upkie) wheeled bipeds.

If you don't need a custom spine, you can implement your agent in Python directly, as done for instance in the [MPC balancer](https://github.com/upkie/mpc_balancer).

## Getting started

1. Create a new repository from this template
2. Replace `LICENSE` with the license of your choice (the default one is Apache-2.0)
3. Search for the string "TODO" and update files accordingly:
    - The first instance is in `Makefile`
    - The second instance is in `WORKSPACE`
4. Start listing your dependencies in `environment.yaml`
5. Implement your agent starting from `agent/main.py`
6. Customize your C++ spines in the `spines` directory

## Usage

- Install Python packages to a conda environment: `conda env create -f environment.yaml -n your_agent_name`
- Activate conda environment: `conda activate your_agent_name`
- Build and run the custom simulation spine: `make run_bullet_spine`
- Build the custom pi3hat spine: `make build`
- Upload the working directory to the robot: `make upload`
- Run the pi3hat spine on the robot: `make run_pi3hat_spine`
- Run your agent on the robot: `python agent/main.py`
