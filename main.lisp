#.(cons 'defun
      (cons 'main
            (cons nil
                  (cons (cons 'format
                              (cons t
                                    (cons "Hello, CL~%"
                                          nil)))
                        nil))))

(main)

(defun hello (name)
  "Greet `name` with hello"
  (format t "Hello, ~a~%" name))

(defun verbose-sum (x y)
  "Sum any two numbers after printing a message."
  (format t "Summing ~d and ~d.~%" x y)
  (+ x y))

(defun add-opt (&optional a b)
  "add 34 and 35 if no arg passed"
  (if a
    (if b
      (+ a b)
      (+ a 35))
    (+ 34 35)))

(defun add-opt-2 (&optional (a 34) (b 35))
  "add 34 and 35 if no arg passed"
  (+ a b))

(defun plot (fn min max step)
  (loop for i from min to max by step do
    (loop repeat (funcall fn i) do (format t "*"))
    (format t "~%")))

(let ((count 0))
  (list
    #'(lambda () (incf count))
    #'(lambda () (decf count))
    #'(lambda () count)))

;;; dynamic binding *x*
(defvar *x* 42)

(defun print-x ()
  (format t "Before SETF~12tX: ~d~%" *x*)
  (incf *x*)
  (format t "After SETF~12tX: ~d~%" *x*))

(defun print-xs ()
  (print-x) ; *x* is 42 here
  (let ((*x* 67)) (print-x)) ; *x* is 67 here
  (print-x)) ; *x* back to be 42 again

; (defun random (: arg int-t) (-> (> int-t n)))

; (defconstant +name+ "LitFill"
;              "This is my name")

(defmacro ketika (kondisi &rest body)
  "Execute `body` if `kondisi` is true. Equivalent to `when`."
  `(if ,kondisi (progn ,@body)))

(defmacro kecuali (kondisi &rest body)
  "Execute `body` if `kondisi` is false. Equivalent to `unless`."
  `(if (not ,kondisi) (progn ,@body)))

(defmacro cetak (&optional (control-str "") &rest fmt-args)
  "Print formatted output to standard output without a newline."
  `(format t ,control-str ,@fmt-args))

(defmacro cetakln (&optional (control-str "") &rest fmt-args)
  "Print formatted output to standard output followed by a newline."
  `(format t (concatenate 'string ,control-str "~%") ,@fmt-args))

(ketika (> 1 0)
        (cetakln "1 > 0")
        (cetakln "TRUE")
        (cetakln "TRUTH NUKE!!1!"))

(kecuali (> 1 2)
         (format t "1 < 2~%")
         (format t "TRUE~%")
         (format t "TRUTH NUKE!!!1!~%"))

(defun dd (symbol)
  "Describe the given `symbol`."
  (describe symbol))

(defun em (macro)
  "Expand the given `macro` form."
  (macroexpand macro))

(dotimes (x 10)
  (dotimes (y 10)
    (format t "~4d" (* (1+ x) (1+ y))))
  (format t "~%"))

(em '(dotimes (a 3) (cetakln "~d:~d" a a)))

(em '(cond (a (do-a))
           (b (do-b))
           (t (do-else))))

(cond ((< 3 1) (cetakln "NO"))
      (t (cetakln "YES")))

(dd 'the)

(dd 'do)

(do ((x 0 (1+ x)))
  ((> x 3) x)
  (cetakln "~d: Hello?" x))

(do ((n 0 (1+ n))
     (cur 0 next)
     (next 1 (+ cur next)))
  ((= 67 n) cur))

(do ((i 0 (1+ i)))
  ((>= i 4))
  (cetakln "~d" i))

; equivalent ~~ to
(dotimes (i 4) (cetakln "~d" i))

(get-universal-time)

(sleep 3)

(do ()
    ((> (get-universal-time) 3985764000))
  (cetakln "Waiting")
  (sleep 10))

(loop
  (when (> (get-universal-time) 3985936800)
    (return))
  (cetakln "Waiting ...")
  (sleep 1))

(defun do-collect-num (n)
  "Collect numbers from 1 to `n` into a list using `do`."
  (do ((nums nil)
       (i 1 (1+ i)))
      ((> i n) (nreverse nums))
    (push i nums)))

(do-collect-num 10)
(dd 'nreverse)

(defun loop-collect-num (n)
  "Collect numbers from 1 to `n` into a list using `loop`."
  (loop :for i :from 1 :to n 
    :collect i))

(cetakln "~d" (loop for x from 1 to 10 summing (expt x 2)))

(defun count-vowels (str)
  "Count the number of vowels in string `str`."
  (loop for c across str
    counting (find c "aiueo")))

(cetakln "~d" (count-vowels "Hello, My name is LitFill!"))

(defun fib-loop (n)
  "Calculate the nth Fibonacci number using `loop`."
  (loop for i below n
        and a = 0 then b
        and b = 1 then (+ b a)
    finally (return a)))

