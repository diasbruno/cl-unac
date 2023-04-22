(asdf:defsystem #:cl-unac.config
  :description "configuration the path to find libunac."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.1"
  :serial t
  :depends-on (#:cffi)
  :components ((:file "config")))
