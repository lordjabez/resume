#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


bin/build.bash

open dist/*.pdf

fswatch -o *.tex | xargs -n1 bin/build.bash
