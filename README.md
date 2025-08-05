# scheme-primer

Interactive Scheme Primer, written in Scheme.

**Status: Work in progress** - Basic framework implemented, menu system working. Educational content modules are placeholders awaiting implementation.

## Description

Inspired by the primer in 'The Diamond Age', spaced repetition, 'Remembering the Kanji', Rocksmith, Zarf's 'Lists and Lists', Spock's test at the beginning of 'Star Trek IV: The Voyage Home', 'The Little Schemer', Dan Friedman's C311 course, and my experience teaching Scheme over many years.

## Quick Start

### Using Chez Scheme (Recommended)

```bash
chez-scheme
> (load "primer.scm")
Welcome to the Scheme Primer, version 0.1.0
# Interactive menu will appear
```

### Using Racket

```bash
racket
> (load "primer.scm")
Welcome to the Scheme Primer, version 0.1.0
# Interactive menu will appear
```

## Repository Structure

- `primer.scm` - Main interactive primer application
- `cons/` - miniKanren examples for teaching cons operations
- `faster-miniKanren/` - High-performance miniKanren implementation
- `miniKanren-in-miniKanren/` - Meta-circular miniKanren interpreters

## Educational Content Status

| Module | Status | Description |
|--------|--------|-------------|
| parentheses practice | ⏸️ Planned | Basic parentheses matching exercises |
| 'cons' practice | ⏸️ Planned | List construction exercises |
| 'car' and 'cdr' practice | ⏸️ Planned | List decomposition exercises |
| box-and-pointers practice | ⏸️ Planned | Memory model visualization |
| conditionals practice | ⏸️ Planned | Boolean logic and branching |
| 'lambda' and application practice | ⏸️ Planned | Function definition and calls |
| variables, scope, binding, and shadowing practice | ⏸️ Planned | Lexical scoping concepts |
| point-wise programming practice | ⏸️ Planned | Functional programming patterns |
| simple recursion practice | ⏸️ Planned | Basic recursive algorithms |
| 'quasiquote', 'unquote', and 'unquote-splicing' practice | ⏸️ Planned | Macro system foundations |
| pattern-matching practice | ⏸️ Planned | Advanced pattern matching |

## Dependencies

- Chez Scheme (recommended) or Racket for running the primer
- The primer is self-contained and requires no external packages

## Examples and Tests

### faster-miniKanren

The `faster-miniKanren` subdirectory contains a high-performance implementation of miniKanren with comprehensive tests:

```bash
cd faster-miniKanren
racket test-all.rktl  # Run all tests (passes)
```

### cons examples

The `cons` directory contains miniKanren-based examples for teaching list construction, but requires Vicare Scheme to run properly.

## License

MIT License - see LICENSE file for details.