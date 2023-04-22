(asdf:defsystem #:cl-unac.tests
  :description "unit testing for cl-unac."
  :author "Bruno Dias"
  :license  "unlicense"
  :version "0.0.1"
  :serial t
  :depends-on (#:fiveam #:cl-unac)
  :components ((:file "tests")))
