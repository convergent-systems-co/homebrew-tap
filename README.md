# homebrew-tap

Homebrew tap for [Convergent Systems Co](https://github.com/convergent-systems-co) tools.

## Setup

```sh
brew tap convergent-systems-co/tap
```

## Formulae

### gitignore

A CLI tool for managing `.gitignore` files from curated templates.

```sh
brew install convergent-systems-co/tap/gitignore
```

**Source:** https://github.com/convergent-systems-co/gitignore

## Automation

Formula versions are updated automatically via GitHub Actions whenever a new release is published in the upstream project. The workflow:

1. Runs daily and on manual trigger
2. Downloads the macOS binaries from the upstream release
3. Computes SHA256 checksums
4. Opens a pull request with the updated formula
