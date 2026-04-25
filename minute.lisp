
(defmacro cetak (&optional (control-str "") &rest fmt-args)
  `(format t (format nil "~~a~~&") (format nil ,control-str ,@fmt-args)))

(do ()
    ((> (get-universal-time) 3985764600))
  (cetak "Waiting")
  (sleep 1))

