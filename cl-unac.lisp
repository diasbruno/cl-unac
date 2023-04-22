(in-package #:cl-unac)

;; input encoding options
(defvar +UTF-8+ "UTF-8")

(defparameter *default-encoding* +UTF-8+)

(defctype unac-input-string :pointer)
(defctype unac-input-string-size :long)
(defctype unac-output-string :pointer)
(defctype unac-output-string-size-ref :pointer)

(defcfun ("strlen" cstrlen) :long
  (str :pointer))

(defcfun ("unac_version" unac-version) :string)

(defcfun (unac-string-fn "unac_string") :int
  (input-encoding :string)
  (input-string unac-input-string)
  (input-size unac-input-string-size)
  (output-string unac-output-string)
  (output-string-size-ref unac-output-string-size-ref))

(defun unac-string (str &key (default-encoding *default-encoding*))
  (cffi:with-foreign-string (encoding default-encoding)
    (cffi:with-foreign-string (input-string str)
      (let* ((input-string-size (cstrlen input-string))
	     (output-string-size (* 2 input-string-size)))
	(cffi:with-foreign-pointer-as-string (output-string output-string-size)
	  (cffi:with-foreign-object (out :pointer)
	    (setf (mem-aref out :pointer) output-string)
	    (cffi:with-foreign-object (output-string-size-ref :long)
	      (unac-string-fn encoding
			      input-string
			      input-string-size
			      out
			      output-string-size-ref))))))))
