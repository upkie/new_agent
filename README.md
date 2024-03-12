This template repository makes it easier to create new agents for [Upkie](https://github.com/upkie/upkie) wheeled bipeds.

## Getting started

1. Create a new repository from this template.
2. Replace ``LICENSE`` with the license of your choice (the default one is Apache-2.0)
3. Implement your agent in the ``agent`` directory.
4. Optional: set the project name in the first instruction of the Bazel ``WORKSPACE`` file
5. Optional: you can develop custom spines in the ``spines`` directory.

## Usage

Run your agent directly as a Python script:

```bash
$ python ./run_agent.py
```

If you are implementing custom C++ spines, use the `spines/Makefile` to build and upload your spines to the real robot. Run ``make help`` for a list of available rules.
