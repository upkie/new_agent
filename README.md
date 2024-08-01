This template repository makes it easier to create new agents for [Upkie](https://github.com/upkie/upkie) wheeled bipeds.

## Getting started

1. Create a new repository from this template.
2. Search for the string "TODO" and update files accordingly
3. Replace ``LICENSE`` with the license of your choice (the default one is Apache-2.0)
4. Implement your agent in the ``agent`` directory.
5. Implement your C++ spines in the ``spines`` directory.

## Usage

### Python environment

You can install and keep track of your Python dependencies using the Conda environment file:

```console
conda create -f environment.yaml
```

Alternatively, you can ``pip install upkie`` from PyPI.

### Running the simulation spine

Use the Makefile to start a simulation using your custom Bullet spine:

```bash
$ make simulate
```

### Building the pi3hat spine

Use the Makefile to cross-compile and upload your spines to the robot:

```bash
$ make build   # builds the mock and pi3hat spines
$ make upload  # uploads this repository (spines included) to your robot
```

### Running the pi3hat spine

Spines are built to a local Bazel cache directory in this repository. We then upload the full repository to the robot and run them from there:

```bash
$ ssh your-robot
$ cd ./this_repository_name
$ make run_pi3hat_spine
```

### Running your agent

Run your agent directly as a Python script:

```bash
$ ssh your-robot
$ cd ./this_repository_name
$ python ./agent/run.py
```
