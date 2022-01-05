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
