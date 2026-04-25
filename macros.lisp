(defmacro ketika (kondisi &rest body)
  `(if ,kondisi (progn ,@body)))

(defmacro kecuali (kondisi &rest body)
  `(if (not ,kondisi) (progn ,@body)))

(defmacro cetak (&optional (control-str "") &rest fmt-args)
  `(format t (format nil "~~a~~&") (format nil ,control-str ,@fmt-args)))

(defun dd (symbol) (describe    symbol))
(defun em (macro)  (macroexpand macro))

(defun foo (x)
  (when (> x 10) (print 'big)))

(defun prime? (n)
  (when (> n 1)
    (loop for fac from 2 to (isqrt n)
      never (zerop (mod n fac)))))

(defun next-prime (n)
  (loop for m from n
    when (prime? m) 
      return m))

;; (do ((p (next-prime 0) (next-prime (1+ p))))
;;    ((> p 19))
;;  (format t "~d " p))

(defmacro do-primes ((var start end) &body body)
  (let ((end-val (gensym)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
          (,end-val ,end))
       ((> ,var ,end-val))
       ,@body)))

(do-primes (p 0 19)
  (format t "~d " p))