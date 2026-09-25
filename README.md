# Jud's Résumé

This repository contains Jud Neer's resume in Markdown and PDF formats. See the
[latest PDF release](https://github.com/lordjabez/resume/releases/latest).

[![Build Status](https://github.com/lordjabez/resume/actions/workflows/build.yml/badge.svg)](https://github.com/lordjabez/resume/actions/workflows/build.yml)

## Prerequisites

Docker. Builds run in a container so the output is identical on any machine, including CI.

## Files

- `resume.md`: Markdown source for the résumé content
- `bin/build.bash`: Builds the Docker image (if needed) and uses it to produce `resume.pdf`
- `bin/develop.bash`: Builds and then opens the résumé, then rebuilds automatically on every source
    file change (run this in the background during development to get near real-time rendering)
- `md-to-pdf.config.js`: Page size, margins, and font settings
- `fonts/`: Bundled [Inter](https://rsms.me/inter/) font files (SIL Open Font License)
- `Dockerfile`, `package.json`, `package-lock.json`: Pinned md-to-pdf, Puppeteer, and Chrome versions

## Consistent rendering

Page breaks depend on text metrics, so every input to layout is pinned: the font is loaded from
`fonts/` instead of the OS, the lockfile fixes the Chrome build, and the image always runs as
`linux/amd64` (under emulation on Apple Silicon, since Chrome for Testing has no Linux ARM build).

## To-Do

- Add the proper release stuff to CI/CD including tagging and versioning (by date)

```yaml
      - name: Rename output file
        run: mv "resume.pdf" "judson-neer-resume-$VERSION_NUMBER.pdf"
      - name: Upload resume artifact
        uses: actions/upload-artifact@v4
        with:
          name: resume
          path: "*.pdf"
      - name: Release resume
        if: startsWith(github.ref, 'refs/tags/')
        uses: softprops/action-gh-release@v1
        with:
          files: "*.pdf"
```
