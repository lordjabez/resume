#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


.scripts/build.bash

open dist/resume.pdf

fswatch -o *.tex | xargs -n1 .scripts/build.bash
