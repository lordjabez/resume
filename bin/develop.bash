#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


bin/build.bash

open "dist/resume.pdf"

fswatch -o *.tex | xargs -n1 bin/build.bash
