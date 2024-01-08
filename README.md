This is a template repository to create new agents for [Upkie](https://github.com/tasts-robots/upkie) wheeled bipeds. All features from the main repository are available in Bazel via `@upkie` targets.

## Setup

- Create a new repository from this template.
- Search for the string "XXX": it indicates template values to configure, such as the project name.
- Adapt the spines to taste, for instance with custom observers.
- Implement your agent in the agent directory.

## Usage

The `Makefile` can be to build and upload your agent to the real robot. Run ``make help`` for a list of available rules.

You can also run your agent locally with Bazelisk:

```bash
$ ./tools/bazelisk run //agent
```
