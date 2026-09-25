# Jud's Résumé

This repository contains Jud Neer's resume in Markdown and PDF formats. The latest
PDF release can be found [here](https://github.com/lordjabez/resume/releases/latest).

[![Build Status](https://github.com/lordjabez/resume/actions/workflows/build.yml/badge.svg)](https://github.com/lordjabez/resume/actions/workflows/build.yml)


## Prerequisites

```bash
npm install -g md-to-pdf
```


## Files

* `resume.md`: Markdown source for the résumé content
* `bin/build.bash`: Script that uses md-to-pdf to produce a PDF; the result is written to `resume.pdf`
* `bin/develop.bash`: Builds and then opens the résumé, then rebuilds automatically on every source
    file change (run this in the background during development to get near real-time rendering)


## To-Do

* Fix-up CI/CD build so it is formatted identically as a local build (md-to-pdf in Docker)
* Add the proper release stuff to CI/CD including tagging and versioning (by date)

```
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
