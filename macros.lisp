(defmacro ketika (kondisi &rest body)
  "Execute BODY if KONDISI is true. Equivalent to WHEN."
  `(if ,kondisi (progn ,@body)))

(defmacro kecuali (kondisi &rest body)
  "Execute BODY if KONDISI is false. Equivalent to UNLESS."
  `(if (not ,kondisi) (progn ,@body)))

(defmacro cetak (&optional (control-str "") &rest fmt-args)
  "Print formatted output to standard output without a newline."
  `(format t ,control-str ,@fmt-args))

(defmacro cetakln (&optional (control-str "") &rest fmt-args)
  "Print formatted output to standard output followed by a newline."
  `(format t (concatenate 'string ,control-str "~%") ,@fmt-args))

(defun dd (symbol)
  "Describe the given `SYMBOL`."
  (describe    symbol))

(defun em (macro)
  "Expand the given `MACRO` form."
  (macroexpand macro))

(defun foo (x)
  "Print 'BIG if `X` is greater than 10."
  (when (> x 10) (print 'big)))

(defun prime? (n)
  "Return true if `N` is a prime number."
  (when (> n 1)
    (loop for fac from 2 to (isqrt n)
      never (zerop (mod n fac)))))

(defun next-prime (n)
  "Return the next prime number greater than or equal to `N`."
  (loop for m from n
    when (prime? m)
      return m))

;; (do ((p (next-prime 0) (next-prime (1+ p))))
;;    ((> p 19))
;;  (format t "~d " p))

(defmacro do-primes ((var start end) &body body)
  "Iterate over primes from `START` to `END`, binding each to `VAR` and executing `BODY`."
  (let ((end-val (gensym)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
          (,end-val ,end))
       ((> ,var ,end-val))
       ,@body)))

(do-primes (p 0 19)
  (cetak "~d " p))
