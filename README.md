# Upkie agent template

[![upkie](https://img.shields.io/badge/upkie-11.0.0-bbaacc)](https://github.com/upkie/upkie/tree/v11.0.0)

> [!IMPORTANT]
> **This template is deprecated.** New agents no longer need a separate template
> repository. The recommended way to start a new project is to add
> [upkie](https://github.com/upkie/upkie) as a submodule of your own project.
> Your agent stays in your repository, while the submodule pins the exact
> version of Upkie you develop against, and lets you make local modifications
> to it while you develop.

## Recommended pipeline

1. Create your project repository, then add Upkie as a submodule:

```console
git submodule add https://github.com/upkie/upkie.git
git -C upkie checkout v11.0.0
git commit -am "Add upkie submodule"
```

2. Depend on the submodule rather than on the released package, for instance in `pyproject.toml`:

```toml
[tool.pixi.pypi-dependencies]
upkie = { path = "upkie", editable = true }
```

3. Implement your agent in your own project, and iterate.

Because the library lives inside your project, you can tweak environments, wrappers or spines locally and see the effect right away. Changes stay in the submodule, so they are easy to review, revert, or contribute back upstream.

Note that people cloning your project will need the submodule too:

```console
git clone --recurse-submodules <your-project-url>
```

To move to a newer release of Upkie later on, check out the corresponding tag in the submodule and commit the updated pointer.

## Legacy instructions

<details>
<summary>Using this template repository (no longer recommended)</summary>

### Getting started

1. Create a new repository from this template
2. Replace `LICENSE` with the license of your choice (the default one is Apache-2.0)
3. Update your project name and dependencies in `pyproject.toml`
4. Rename the `new_agent` directory to your agent's name
5. Replace occurrences of "new\_agent" by this directory name in `pyproject.toml`
6. Implement your agent in this directory

### Usage

This project uses [pixi](https://pixi.sh/latest/#installation) to run tasks:

- Start a simulation: `pixi run simulation`
- Run the agent: `pixi run agent`

### Deploying to the robot

You can use the Makefile to deploy the agent to your robot:

1. `make pack_pixi_env` to package the Python environment
2. `make upload` to upload the agent to the robot
3. Log into the robot and go to the agent directory
4. `make unpack_pixi_env` to unpack the Python environment
5. `make run_agent` to run the agent

</details>
