#!/usr/bin/env bash
set -e


cd "$(dirname "$0")/.."


md-to-pdf --pdf-options '{"margin": "16mm"}' resume.md
