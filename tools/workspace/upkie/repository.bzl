# -*- python -*-
#
# Copyright 2022 Stéphane Caron

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def upkie_repository():
    """
    Clone repository from GitHub and make its targets available for binding.
    """
    git_repository(
        name = "upkie",
        remote = "https://github.com/tasts-robots/upkie.git",
        commit = "f497c7f5b1c09c262cfbb81c2cc73d4d8d870586",
        shallow_since = "1692894116 +0200",
    )
