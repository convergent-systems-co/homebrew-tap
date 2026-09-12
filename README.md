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

Thread versions are updated automatically when its upstream release workflow sends a `thread-release` repository dispatch. The tap workflow:

1. Accepts the release version from the dispatch or a manual trigger
2. Downloads the release's published `checksums.txt`
3. Validates all macOS and Linux artifacts and updates the matching formula fields
4. Checks Ruby syntax and commits the formula update
