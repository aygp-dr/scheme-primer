# scheme-primer

Interactive Scheme Primer, written in Scheme.

**Version: 0.1.0** - Basic educational modules now implemented!

## Description

An interactive educational tool for learning Scheme, inspired by the primer in 'The Diamond Age', spaced repetition, 'Remembering the Kanji', Rocksmith, Zarf's 'Lists and Lists', Spock's test at the beginning of 'Star Trek IV: The Voyage Home', 'The Little Schemer', Dan Friedman's C311 course, and my experience teaching Scheme over many years.

## Quick Start

### Using the Simple Version (Recommended for Learning)

```bash
# Racket
racket primer-simple.scm

# Chez Scheme  
chez-scheme
> (load "primer-simple.scm")
```

This version includes implemented educational modules for:
- Parentheses practice
- 'cons' practice
- 'car' and 'cdr' practice

### Using the Main Framework

```bash
# Shows the full menu system (modules show "coming soon")
racket primer.scm
```

## Repository Structure

```
scheme-primer/
├── primer.scm              # Main primer framework
├── primer-simple.scm       # Version with basic educational modules
├── modules/                # Advanced educational modules
│   ├── parentheses-practice.scm
│   ├── cons-practice.scm
│   └── car-cdr-practice.scm
├── faster-miniKanren/      # High-performance miniKanren implementation
│   ├── mk.rkt             # Core miniKanren
│   ├── test-all.rktl      # Comprehensive test suite
│   └── examples/          # Usage examples
├── miniKanren-in-miniKanren/  # Meta-circular interpreters
├── cons/                   # miniKanren cons examples
├── LICENSE                 # MIT license
└── README.md              # This file
```

## Educational Content Status

| Module | Status | Description |
|--------|--------|-------------|
| Parentheses Practice | ✅ Basic Implementation | Learn S-expression syntax and balanced parentheses |
| 'cons' Practice | ✅ Basic Implementation | Understand pair construction and list building |
| 'car' and 'cdr' Practice | ✅ Basic Implementation | Navigate list structures and extract elements |
| Box-and-Pointers Practice | ⏸️ Planned | Memory model visualization |
| Conditionals Practice | ⏸️ Planned | Boolean logic and branching |
| 'lambda' and Application Practice | ⏸️ Planned | Function definition and calls |
| Variables, Scope, Binding, and Shadowing Practice | ⏸️ Planned | Lexical scoping concepts |
| Point-wise Programming Practice | ⏸️ Planned | Functional programming patterns |
| Simple Recursion Practice | ⏸️ Planned | Basic recursive algorithms |
| 'quasiquote', 'unquote', and 'unquote-splicing' Practice | ⏸️ Planned | Macro-related concepts |
| Pattern-matching Practice | ⏸️ Planned | Advanced control flow |

## Features

- **Interactive Menu System**: Navigate through educational modules easily
- **Progressive Learning**: Start with basic concepts and advance gradually
- **Hands-on Practice**: Interactive exercises with immediate feedback
- **Self-contained**: Everything runs in standard Scheme implementations

## Testing

### Running miniKanren Tests

```bash
cd faster-miniKanren
racket test-all.rktl
```

All 200+ tests should pass, verifying the miniKanren implementation.

## Requirements

- Racket 8.0+ or Chez Scheme 9.5+
- No external dependencies

## Contributing

This project welcomes contributions! Areas that need work:
- Implementing remaining educational modules
- Adding more exercises to existing modules
- Improving cross-platform compatibility
- Adding adaptive difficulty adjustment
- Creating visualization tools for box-and-pointer diagrams

## License

MIT License - see LICENSE file for details

## Acknowledgments

Special thanks to:
- Dan Friedman for miniKanren and pedagogical inspiration
- The Scheme community for maintaining these beautiful languages
- All the teachers and students who have shaped this approach to education