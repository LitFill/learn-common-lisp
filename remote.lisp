(defun main ()
  "Main entry point of this file"
  (dotimes (i 3)
    (format t "~d: line~%" i)))

(main)

(dotimes (x 10)
  (dotimes (y 10)
    (format t "~4d" (* (1+ x) (1+ y))))
  (format t "~%"))
