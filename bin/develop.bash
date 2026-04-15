#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


bin/build.bash

open resume.pdf

md-to-pdf --watch --pdf-options '{"margin": "16mm"}' resume.md
