# -*- python -*-
#
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def upkie_repository():
    """
    Clone repository from GitHub and make its targets available for binding.
    """
    git_repository(
        name = "upkie",
        remote = "https://github.com/upkie/upkie.git",
        commit = "d6b91e4bcacc60e814637e9a59faba1a0e092eb3",
        shallow_since = "1711032853 +0100",
    )
