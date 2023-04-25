(defpackage #:cl-unac
  (:use #:cl #:cffi)
  (:export
   #:+UTF-8+
   #:unac-string))

(in-package #:cl-unac)

(handler-case
    (cffi:foreign-library-loaded-p 'cl-unac.config::libunac)
  (error ()
    (handler-case
        (cffi:foreign-library-loaded-p 'libunac)
      (error ()
        (progn
          (cffi:define-foreign-library libunac
            (:unix (:or #+X86-64 "/usr/lib/x86_64-linux-gnu/libunac.so"
                        "libunac"))
            (t (:default "libunac")))
          (cffi:use-foreign-library libunac))))))
