(defpackage #:cl-unac
  (:use #:cl #:cffi)
  (:export
   #:+UTF-8+
   #:unac-string))

(in-package #:cl-unac)

(if (not (or (cffi:foreign-library-loaded-p 'cl-unac.config::libunac)
	     (cffi:foreign-library-loaded-p 'libunac)))
    (progn
      (cffi:define-foreign-library libunac
	(t (:default "libunac")))
      (cffi:use-foreign-library libunac)))
