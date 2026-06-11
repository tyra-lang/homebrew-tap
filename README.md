# Tyra Homebrew Tap

Official [Homebrew](https://brew.sh) tap for the [Tyra programming language](https://github.com/tyra-lang/tyra) — a statically-typed, AI-friendly language for backend services, CLI tools, and business applications.

## Installation

```bash
brew install tyra-lang/tap/tyra
```

If the above command does not resolve the tap automatically, run:

```bash
brew tap tyra-lang/tap
brew install tyra
```

## What Gets Installed

| Item | Location |
| --- | --- |
| `tyra` binary | `$(brew --prefix)/bin/tyra` |
| `libtyra_runtime.a` | `$(brew --prefix)/lib/tyra/libtyra_runtime.a` |
| Standard library (`stdlib/`) | `$(brew --prefix)/lib/tyra/stdlib/` |

The runtime library and standard library are placed under `lib/tyra/`. The `tyra` toolchain locates them automatically; no extra environment variables are needed when installing via Homebrew.

**Dependency:** [`bdw-gc`](https://formulae.brew.sh/formula/bdw-gc) (installed automatically).

## Verify

```bash
tyra --version
```

Quick smoke test:

```bash
echo 'fn main() -> Unit
  print("hello from tyra")
end' > /tmp/hello.ty
tyra run /tmp/hello.ty
# => hello from tyra
```

## Platform Support

The current formula supports **macOS (Apple Silicon / arm64)** only.

For other platforms (Linux x86\_64, macOS Intel), use the `curl | sh` installer or build from source — see the [installation guide](https://github.com/tyra-lang/tyra/blob/main/docs/getting-started/01-installation.md).

## Updating

```bash
brew update && brew upgrade tyra
```

## Uninstall

```bash
brew uninstall tyra
```

---

Licensed under the [Apache License 2.0](LICENSE).
Source: [tyra-lang/tyra](https://github.com/tyra-lang/tyra)
