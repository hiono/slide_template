# Template for Slide

The following items should be installed as a preliminary preparation.

1. `docker` & `minid`
2. `lefthook`
3. `make`
4. `direnv`
5. `git`

## Initial settings

```bash
git clone git@github.com:hiono/<Repository>.git
cd <Repository directory>
direnv allow
lefthook install
git tag -a 0.0 -m 'Initial commit' main
git flow init -d -f
```

## myengine.js built-in markdown-it plugin

- markdown-it-anchor
- markdown-it-attrs
- markdown-it-div
- markdown-it-implicit-figures
- markdown-it-mark
- @gerhobbelt/markdown-it-inline-text-color

## mystyles.scss

Base style is Marpit gaia theme.
And, Changed the pagination display and added classes for multicolumn (multicolumn,column-left,column-right).
