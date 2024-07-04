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
        commit = "7d6f171b3516065e0767c6d5ffe27b4404dbc0d5",
        shallow_since = "1720024110 +0200",
    )
