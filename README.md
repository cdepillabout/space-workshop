<img src="./logo.svg" width="150px" height="150px" alt="Logo" align="right"/>

# Haskell Spaceflight Workshop

[![Build Status](https://travis-ci.org/lancelet/space-workshop.svg?branch=master)](https://travis-ci.org/lancelet/space-workshop)

The workshop contents are now complete. Final modifications and updates may still be made prior to LambdaJam 2019, but the current version is representative.

The current notes for the workshop are available from
[GitHub pages](https://lancelet.github.io/space-workshop), built using Travis CI.

## Instructions for Participants

Please make sure that you download the required dependencies for the workshop and [the notes](https://lancelet.github.io/space-workshop) in advance. We are using the [`stack`](https://www.haskellstack.org) build tool (apologies if this is not to your taste; PRs are very welcome!). Dependencies can be fetched by doing:

```
$ stack --install-ghc test --only-dependencies
```

in the checked-out repository.

## Developer Notes

See the `.travis.yml` file for detailed CI build instructions.

A manual build can be performed as follows:

```
$ export IDDQD=1
$ stack test
$ stack exec tex-plots   # generates PGF-format plots for the LaTeX notes
$ cd notes
$ make                   # generates the LaTeX notes.pdf
```

Be careful: the LaTeX file has `\nonstopmode` set so that it doesn't hang the CI build. It may be best to remove this when making local changes so that errors are more obvious.

The Makefile for the notes supports a `watch` phony target to continuously watch the source files and re-run LaTeX as required:

```
$ make watch
```
