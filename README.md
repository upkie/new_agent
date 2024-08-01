This template repository makes it easier to create new agents for [Upkie](https://github.com/upkie/upkie) wheeled bipeds.

## Getting started

1. Create a new repository from this template.
2. Search for the string "TODO" and update files accordingly
3. Replace ``LICENSE`` with the license of your choice (the default one is Apache-2.0)
4. Implement your agent in the ``agent`` directory.
5. Implement your C++ spines in the ``spines`` directory.

## Usage

- Python packages: ``conda create -f environment.yaml``
- Run the simulation spine: ``make simulate``
- Build the pi3hat spine locally: ``make build``
- Upload the full repository (with built spines) to the robot: ``make upload``
- Run the pi3hat spine: ``make run_pi3hat_spine`` (on robot)
- Run your agent: ``python ./agent/run.py``
