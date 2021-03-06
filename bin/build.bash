#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


mkdir -p dist

VERSION=${TRAVIS_TAG-$(git describe)}

docker run --rm -v $(pwd):/data lordjabez/xelatex xelatex -halt-on-error -output-directory dist "\def\version{$VERSION}\input resume.tex"
mv "dist/resume.pdf" "dist/judson-neer-resume-$VERSION.pdf"
