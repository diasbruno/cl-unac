(asdf:defsystem #:cl-unac
  :description "bindings for lib unac(3)."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.1"
  :serial t
  :depends-on (#:cffi #:cl-unac.config)
  :components ((:file "package")
	       (:file "cl-unac")))
