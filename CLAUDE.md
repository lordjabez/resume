# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Single-document repo: `resume.md` is the source of truth for Jud's résumé, rendered to `resume.pdf` with [md-to-pdf](https://github.com/simonhaenisch/md-to-pdf). The PDF is gitignored (`**/*.pdf`), so never try to commit it.

## Commands

- Prerequisite: `npm install -g md-to-pdf`
- Build once: `bin/build.bash` (writes `resume.pdf`, 16mm margins)
- Live preview: `bin/develop.bash` (builds, opens the PDF, then rebuilds on every change to `resume.md`; run in the background)

There are no tests or linters. To verify an edit, build and check the PDF renders and paginates correctly.

## Formatting conventions

- Page breaks are controlled manually with `<div style="page-break-before: always;"></div>` between sections. Content edits can shift pagination, so check that breaks still land sensibly after changing length.
- Each role is an `###` heading (`Title, Organization`) followed by an italic date range (`_Month YYYY – Month YYYY_`, en dash) and a bulleted list of accomplishments.
- Bullets lead with a past-tense verb (present tense for the current role) and favor concrete, quantified outcomes.

## CI

`.github/workflows/build.yml` builds the PDF on every push using `baileyjm02/markdown-to-pdf`, which is not the same renderer as the local build, so CI output may be formatted differently. The `Dockerfile` (md-to-pdf on node:alpine) exists to eventually make CI match local builds; see the To-Do in `README.md` for planned release/versioning work.
