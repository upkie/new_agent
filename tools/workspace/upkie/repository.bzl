# -*- python -*-
#
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def upkie_repository(
        version = "6.1.0",
        sha256 = "b4a0e0472da216e8e999709ef16c855c241bc0b95b0c388253d321410e22c25c"):
    """
    Download release archive from GitHub.

    Args:
        version: Version of the library to download.
        sha256: SHA-256 checksum of the downloaded archive.
    """
    http_archive(
        name = "upkie",
        url = "https://github.com/upkie/upkie/archive/refs/tags/v{}.tar.gz".format(version),
        sha256 = sha256,
        strip_prefix = "upkie-{}".format(version),
    )
