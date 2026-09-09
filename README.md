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

## Olympus availability

The legacy Olympus v2.3.0 formula has been removed because it is not production-ready.
The replacement release target is **v1.0.0**. It is not available through this tap yet.
Restore the Olympus formula only after the replacement runtime and release artifacts
have been verified. Existing legacy installations are not automatically removed.

## Automation

Formula versions are updated automatically via GitHub Actions whenever a new release is published in the upstream project. The workflow:

1. Runs daily and on manual trigger
2. Downloads the macOS binaries from the upstream release
3. Computes SHA256 checksums
4. Opens a pull request with the updated formula
