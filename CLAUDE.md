# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Single-document repo: `resume.md` is the source of truth for Jud's résumé, rendered to `resume.pdf` with [md-to-pdf](https://github.com/simonhaenisch/md-to-pdf) inside Docker. The PDF is gitignored (`**/*.pdf`), so never try to commit it.

## Commands

- Build once: `bin/build.bash` (builds the `resume-builder` image if needed, writes `resume.pdf`; extra args pass through to md-to-pdf)
- Live preview: `bin/develop.bash` (builds, opens the PDF, then runs md-to-pdf `--watch` in the container; run in the background)

There are no tests or linters. To verify an edit, build and check that pages break where intended, e.g. compare `pdftotext -f N -l N` first/last lines per page, and `pdffonts resume.pdf` should list only Inter.

## Rendering consistency

The main requirement is that local and CI builds paginate identically. Everything that affects layout is pinned:

- Font: Inter is loaded via `@font-face` from `fonts/` (set in `md-to-pdf.config.js`), never from the OS. If markup starts using a new weight or style (e.g. bold italic), add that woff2 file and `@font-face` rule, or Chrome will synthesize it or fall back to a system font.
- Chrome: `package-lock.json` pins puppeteer, which pins the Chrome build downloaded in the image.
- Platform: `bin/build.bash` always uses `linux/amd64` (Chrome for Testing has no linux/arm64 build, so Apple Silicon runs it under emulation).
- Inter's contextual alternates (`calt`) are disabled in the config CSS. When enabled, hyphens, en dashes, parens, and `+` next to digits or capitals render as alternate glyphs with no Unicode mapping, and extractors like pypdf and pdfminer (typical of ATS parsers) read them as private-use characters. `pdftotext` hides the problem, so check with `uv run --with pypdf` that extracted text has no ``–`` characters.
- Page settings live in `md-to-pdf.config.js`. Don't pass `--pdf-options` on the CLI: it replaces the config's `pdf_options` wholesale instead of merging.

## Formatting conventions

- Page breaks are controlled manually with `<div style="page-break-before: always;"></div>` between sections. Content edits can shift pagination, so check that breaks still land sensibly after changing length.
- Each role is an `###` heading (`Title, Organization`) followed by an italic date range (`_Month YYYY – Month YYYY_`, en dash) and a bulleted list of accomplishments.
- Bullets lead with a past-tense verb (present tense for the current role) and favor concrete, quantified outcomes.

## CI

`.github/workflows/build.yml` runs `bin/build.bash` on `ubuntu-latest` for every branch. On `main` it deploys the PDF to GitHub Pages as `judson-neer-resume.pdf` (plus an `index.html` redirect), giving a stable link that opens inline: <https://lordjabez.github.io/resume/judson-neer-resume.pdf>. There is no versioning or GitHub Releases; release assets are served as `application/octet-stream` attachments, so browsers download them instead of displaying them.
