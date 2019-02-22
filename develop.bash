#!/usr/bin/env bash
set -e


SOURCE_FILENAME="resume.tex"
RENDERED_FILENAME="resume.pdf"


open "${RENDERED_FILENAME}"


fswatch -o "${SOURCE_FILENAME}" | xargs -n1 pdflatex "${SOURCE_FILENAME}"
