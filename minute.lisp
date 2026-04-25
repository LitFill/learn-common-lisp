
(defmacro cetak (&optional (control-str "") &rest fmt-args)
  "Print formatted output to standard output without a newline."
  `(format t ,control-str ,@fmt-args))

(defmacro cetakln (&optional (control-str "") &rest fmt-args)
  "Print formatted output to standard output followed by a newline."
  `(format t (concatenate 'string ,control-str "~%") ,@fmt-args))

(do ()
    ((> (get-universal-time) 3985764600))
  (cetakln "Waiting")
  (sleep 1))

