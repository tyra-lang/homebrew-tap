# Contributing to tyra-lang/homebrew-tap

## How the formula is maintained

**Version bumps are automated.** When a new release tag (`v*`) is pushed to [tyra-lang/tyra](https://github.com/tyra-lang/tyra), the `bump-homebrew` job in [release.yml](https://github.com/tyra-lang/tyra/blob/main/.github/workflows/release.yml) automatically updates the three release-specific fields in `Formula/tyra.rb` and commits the result directly to this repository:

- `version "..."` — the new version string
- `url "..."` — the tarball URL for the new release
- `sha256 "..."` — the SHA-256 checksum of the tarball

You do **not** need to open a PR for a version bump — doing so would likely conflict with the automated commit.

**Everything else is welcome as a PR:** documentation improvements, `install` or `test` block fixes, formula quality enhancements, and so on.

## Formula structure

`Formula/tyra.rb` follows the standard Homebrew formula layout:

- **`version`** — release version string (auto-managed)
- **`url` / `sha256`** — download URL and integrity checksum (auto-managed)
- **`depends_on "bdw-gc"`** — runtime dependency on the Boehm GC library
- **`def install`** — installs the `tyra` binary to `bin/`, and places `libtyra_runtime.a` and `stdlib/` under `lib/tyra/`
- **`test do`** — writes a minimal `.ty` program and asserts the expected output

## Local verification

Clone this repository and run the following commands:

```bash
# Install from the local formula file
brew install --build-from-source ./Formula/tyra.rb

# Audit the formula (linting + online checks)
brew audit --strict --online ./Formula/tyra.rb

# Run the formula's test block (must be installed first)
brew test tyra
```

## Reporting issues

- **Bugs in the formula** (install failures, test failures, dependency issues): open an issue here.
- **Bugs in the Tyra language or compiler**: open an issue in [tyra-lang/tyra](https://github.com/tyra-lang/tyra/issues).
