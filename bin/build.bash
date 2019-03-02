#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


mkdir -p dist

VERSION=${TRAVIS_TAG-$(git describe)}

docker run --rm -v $(pwd):/data lordjabez/xelatex xelatex -halt-on-error -output-directory dist "\def\version{$VERSION}\input resume.tex"
cp "dist/resume.pdf" "dist/Judson Neer Resume v$VERSION.pdf"
