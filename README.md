This is a template repository to create new agents for [Upkie](https://github.com/upkie/upkie) wheeled bipeds. All features from the main repository are available in Bazel via `@upkie` targets.

## Setup

- Create a new repository from this template.
- Search for the string "XXX": it indicates template values to configure, such as the project name.
- Replace ``LICENSE`` with the license of your choice (the default one is Apache-2.0)
- Implement your agent in the ``agent`` directory.
- Optional: adapt the spines in the ``spines`` directory, for instance with custom observers.

## Usage

The `Makefile` can be to build and upload your agent to the real robot. Run ``make help`` for a list of available rules.

You can also run your agent locally with Bazelisk:

```bash
$ ./tools/bazelisk run //agent
```
