#!/usr/bin/env bash
set -e


SOURCE_FILENAME="resume.tex"
RENDERED_FILENAME="resume.pdf"

TEX_COMMAND="xelatex"


open "${RENDERED_FILENAME}"


fswatch -o *.tex | xargs -n1 "${TEX_COMMAND}" "${SOURCE_FILENAME}"
