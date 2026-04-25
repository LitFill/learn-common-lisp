# Custom Macros

This project implements several custom macros to experiment with Common Lisp's metaprogramming capabilities.

## `ketika`

Equivalent to `when` in standard Common Lisp.

```lisp
(defmacro ketika (kondisi &rest body)
  `(if ,kondisi (progn ,@body)))
```

Example usage:
```lisp
(ketika (> 1 0)
        (cetak "1 > 0"))
```

## `kecuali`

Equivalent to `unless` in standard Common Lisp.

```lisp
(defmacro kecuali (kondisi &rest body)
  `(if (not ,kondisi) (progn ,@body)))
```

Example usage:
```lisp
(kecuali (> 1 2)
         (format t "1 < 2~%"))
```

## `cetak`

A wrapper around `format` to print without a newline.

```lisp
(defmacro cetak (&optional (control-str "") &rest fmt-args)
  `(format t ,control-str ,@fmt-args))
```

Example usage:
```lisp
(cetak "Hello") ; Outputs "Hello" without newline
```

## `cetakln`

A wrapper around `format` to print with a newline.

```lisp
(defmacro cetakln (&optional (control-str "") &rest fmt-args)
  `(format t (concatenate 'string ,control-str "~%") ,@fmt-args))
```

Example usage:
```lisp
(cetakln "Hello, ~a" "World") ; Outputs "Hello, World" with newline
```

## `do-primes`

Iterates over prime numbers within a range.

```lisp
(defmacro do-primes ((var start end) &body body)
  (let ((end-val (gensym)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
          (,end-val ,end))
       ((> ,var ,end-val))
       ,@body)))
```

This macro uses `gensym` to avoid variable capture of the `end` value.
