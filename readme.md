# Résumé Builder

This repository contains the LaTeX source code for a basic résumé, as well as a
supporting continuous build framework that can be used to develop it. The latest
PDF release can be found [here](https://github.com/lordjabez/resume/releases/latest).

[![Build Status](https://travis-ci.org/lordjabez/resume.svg?branch=master)](https://travis-ci.org/lordjabez/resume)


## Prerequisites

The scripts use docker to ensure a consistent development environment
for building. It can be downloaded from <https://www.docker.com>.

The image used can be found at <https://hub.docker.com/r/lordjabez/xelatex>.

These tools have only been tested on MacOS, but will probably work on any Linux platform.


## Files

*   `resume.tex`: Source code for the résumé content

*   `setup.tex`: Source code for various LaTeX formatting options

*   `.travis.yml`: Continuous integration script for [Travis CI](https://travis-ci.org/lordjabez/resume)

*   `bin/build.bash`: Script that uses Docker to render the résumé to PDF; the result is written to `dist/resume.pdf`

*   `bin/develop.bash`: Builds and then opens the résumé, then rebuilds automatically on every source
    file change (run this in the background during development to get near real-time rendering)


## Credits

The inspiration for this résumé came from <http://www.latextemplates.com/template/wilson-resume-cv>,
which is licensed under CC BY-NC-SA 3.0 (<http://creativecommons.org/licenses/by-nc-sa/3.0>). Its
current form here has been heavily modified from the original.

The font used is Erewhon, which can be found at <http://www.ctan.org/tex-archive/fonts/erewhon>.
Erewhon is based on the Heuris­tica pack­age, which is based in turn on Utopia. Erewhon adds a
num­ber of new fea­tures — small caps in all styles rather than just reg­u­lar, added fig­ure styles
(pro­por­tional, in­fe­rior, nu­mer­a­tor, de­nom­i­na­tor) and su­pe­rior let­ters. The size is 6% smaller
than Heuris­tica, match­ing that of Utopi­aStd. It is licensed under The SIL Open Font License,
and is maintained by Michael Sharpe.
