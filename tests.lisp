(defpackage #:cl-unac.tests
  (:use #:cl #:fiveam #:cl-unac))

(in-package #:cl-unac.tests)

(5am:def-suite cl-unac-suite)

(5am:in-suite cl-unac-suite)

(5am:def-test no-crash-with-empty-string ()
  (5am:is (equal (cl-unac:unac-string "")
		 "")))

(5am:def-test simple-string-with-no-accents ()
  (5am:is (equal (cl-unac:unac-string "ok")
		 "ok")))

(5am:def-test simple-string-with-accents ()
  (5am:is (equal (cl-unac:unac-string "été")
		 "ete")))

(5am:def-test character-that-expands-into-2-chars ()
  (5am:is (equal (cl-unac:unac-string "æ")
		 "ae")))

(5am:run-all-tests)
