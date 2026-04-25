# Common Lisp Learning Project

This repository contains various Common Lisp snippets, experiments, and learning materials. It covers basic syntax, functions, macros, loops, and more.

## Files

- `main.lisp`: A collection of various Lisp examples including:
    - Basic function definitions (`hello`, `verbose-sum`, `add-opt`, `add-opt-2`).
    - Loops and iterations (`plot`, `dotimes`, `do`, `loop`).
    - Dynamic binding examples (`*x*`, `print-x`, `print-xs`).
    - Custom macros (`ketika`, `kecuali`, `cetak`).
    - Fibonacci sequence implementation (`fib-loop`).
    - Universal time and sleep examples.
- `macros.lisp`: Focuses on macro definitions and practical usage:
    - `ketika` (when), `kecuali` (unless), `cetak` (print) macros.
    - Prime number utilities (`prime?`, `next-prime`).
    - `do-primes` macro for iterating over prime numbers.
- `minute.lisp`: A simple script that waits for a specific universal time.
- `remote.lisp`: Contains a simple main entry point and a multiplication table example.
- `lsp.lisp`: Configuration for setting up a Slynk server (likely for SLIME/SLY integration).
- `lsp.lisp`: Sets up a Slynk server for remote development.

## How to Run

Most files can be loaded into a Common Lisp REPL (like SBCL) using `(load "filename.lisp")`.

For example:
```lisp
(load "main.lisp")
```

## Custom Macros

This project defines several Indonesian-named macros for better readability (or just for fun):
- `ketika` (when): Executes the body if the condition is true.
- `kecuali` (unless): Executes the body if the condition is false.
- `cetak` (print): Prints a formatted string without a newline.
- `cetakln` (print line): Prints a formatted string followed by a newline.
