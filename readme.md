# Résumé Builder

This repository contains the LaTeX source code for a basic résumé, as well as a
supporting continuous build framework that can be used to develop it. The latest
PDF release can be found [here](https://github.com/lordjabez/resume/releases/latest).

[![Build Status](https://github.com/lordjabez/resume/actions/workflows/build.yml/badge.svg)](https://github.com/lordjabez/file-memoizer/actions/workflows/build.yml)


## Prerequisites

The scripts use docker to ensure a consistent development environment
for building. It can be downloaded from <https://www.docker.com>.

The image used can be found at <https://hub.docker.com/r/lordjabez/xelatex>.

These tools have only been tested on MacOS, but will probably work on any Linux platform.


## Files

*   `resume.tex`: Source code for the résumé content

*   `setup.tex`: Source code for various LaTeX formatting options

*   `version.tx`: Source code for version string to insert into final document

*   `.scripts/build.bash`: Script that uses Docker to render the résumé to PDF; the result is written to `dist/resume.pdf`

*   `.scripts/develop.bash`: Builds and then opens the résumé, then rebuilds automatically on every source
    file change (run this in the background during development to get near real-time rendering)


## Credits

The inspiration for this résumé came from <http://www.latextemplates.com/template/wilson-resume-cv>,
which is licensed under CC BY-NC-SA 3.0 (<http://creativecommons.org/licenses/by-nc-sa/3.0>). Its
current form here has been heavily modified from the original.

The font used is Erewhon, which can be found at <http://www.ctan.org/tex-archive/fonts/erewhon>.
Erewhon is based on the Heuristica package, which is based in turn on Utopia. Erewhon adds a
number of new features — small caps in all styles rather than just regular, added figure styles
(proportional, inferior, numerator, denominator) and superior letters. The size is 6% smaller
than Heuristica, matching that of UtopiaStd. It is licensed under The SIL Open Font License,
and is maintained by Michael Sharpe.
