#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


# Always build for amd64 so the same Chrome binary renders on every host
# (Chrome for Testing has no linux/arm64 build; Apple Silicon uses emulation)
docker build --quiet --platform linux/amd64 --tag resume-builder . > /dev/null

docker run --rm --init --platform linux/amd64 --user "$(id -u):$(id -g)" \
    --volume "$PWD:/work" resume-builder "$@" resume.md
