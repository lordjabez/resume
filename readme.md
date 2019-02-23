# Jud's resume

This repository contains the LaTeX source code for my resume, as
well a supporting continuous build script that I used to develop it.


## Files

*   `resume.tex`: The source code for the resume
*   `resume.pdf`: Latest rendered version
*   `develop.bash`: This script recompiles the resume with each change


## Usage

These tools were made for MacOS, but should work for other platforms with some minor
modification. To setup the dependencies, use `brew` to install the following:

```
brew cask install mactex
brew install fswatch
```

Then execute `develop.bash` in a terminal window; it will open the rendered PDF in Preview
and then watch for changes to `resume.tex`, automatically compiling each time the file
is changed. Preview will then automatically reload the new version.
