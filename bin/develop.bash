#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


bin/build.bash

open resume.pdf

bin/build.bash --watch
