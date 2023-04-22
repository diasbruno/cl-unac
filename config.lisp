(defpackage #:cl-unac.config
  (:use #:cl)
  (:export
   #:load-from-custom-path))

(in-package #:cl-unac.config)

(defmacro load-from-custom-path (path)
  "Define the path where libunac is to be found:
    (ql:quickload :cl-libunac.config)
    (cl-unac.config:load-from-custom-path \"/opt/local/lib/libunac\")
    (ql:quickload :cl-libunac)"
  `(progn
     (cffi:define-foreign-library libunac (t (:default ,path)))
     (cffi:use-foreign-library libunac)))
