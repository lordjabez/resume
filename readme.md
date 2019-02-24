# Résumé Builder

This repository contains the LaTeX source code for a résumé, as well
a supporting continuous build script that can be used to develop it.


## Files

*   `resume.tex`: The source code for the résumé
*   `resume.pdf`: Latest rendered version
*   `develop.bash`: This script recompiles the résumé with each change


## Usage

These tools were made for MacOS, but should work for other platforms with some minor
modification. To setup the dependencies, use `brew` to install the following:

```
brew cask install mactex
brew install fswatch
```

Then execute `develop.bash` in a terminal window; it will open the rendered PDF in
Preview and then watch for changes to `resume.tex`, automatically compiling each
time the file is changed. Preview will then automatically reload the new version
when you click on it.


## Credits

The inspiration for this résumé came from <http://www.latextemplates.com/template/wilson-resume-cv>,
which is licensed under CC BY-NC-SA 3.0 (<http://creativecommons.org/licenses/by-nc-sa/3.0>). It's
current form here has been heavily modified from the original.

The font used is Erewhon, which can be found at <http://www.ctan.org/tex-archive/fonts/erewhon>.
Erewhon is based on the Heuris­tica pack­age, which is based in turn on Utopia. Erewhon adds a
num­ber of new fea­tures — small caps in all styles rather than just reg­u­lar, added fig­ure styles
(pro­por­tional, in­fe­rior, nu­mer­a­tor, de­nom­i­na­tor) and su­pe­rior let­ters. The size is 6% smaller
than Heuris­tica, match­ing that of Utopi­aStd. It is licensed under The SIL Open Font License,
and is maintained by Michael Sharpe.
