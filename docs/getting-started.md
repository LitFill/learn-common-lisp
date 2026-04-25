# Getting Started

To get started with this project, you'll need a Common Lisp implementation installed on your system. [SBCL](https://www.sbcl.org/) is highly recommended.

## Installation

On Arch Linux:
```bash
sudo pacman -S sbcl
```

## Running the Code

1.  Start SBCL:
    ```bash
    sbcl
    ```
2.  Load a file:
    ```lisp
    (load "main.lisp")
    ```

## Development Environment

For a better development experience, it's recommended to use Emacs with [SLIME](https://common-lisp.net/project/slime/) or [SLY](https://github.com/joaotavora/sly).

The `lsp.lisp` file is provided to start a Slynk server:
```lisp
(load "lsp.lisp")
```
This will start a server on port 4005, which you can connect to from your editor.
