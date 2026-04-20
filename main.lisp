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
  (setf *x* (1+ *x*))
  (format t "After SETF~12tX: ~d~%" *x*))

(defun print-xs ()
  (print-x) ; *x* is 42 here
  (let ((*x* 67)) (print-x)) ; *x* is 67 here
  (print-x)) ; *x* back to be 42 again

; (defun random (: arg int-t) (-> (> int-t n)))

(defconstant +name+ "LitFill"
             "This is my name")

