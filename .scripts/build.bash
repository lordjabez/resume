#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


mkdir -p dist

docker run --rm -v $(pwd):/data lordjabez/xelatex xelatex -halt-on-error -output-directory dist "resume.tex"
