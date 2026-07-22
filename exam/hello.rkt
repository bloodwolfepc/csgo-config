#lang racket

;; Gets a dirname from cmdline, stores in outdir
(define outdir ;; Create var named outdir
  (command-line ;; Read args passed, expect 1.how to interpret 2.what to return
    #:args (dir) ;; Program expects ONE positional arg, is stored in dir
    dir)) ;; The value retuned by command-line, becomes outdir

(define (write-hello filename) ;; write-hello takes filename
  ;; Open file named by filename for writing
  ;; Pass open file stream to a function
  ;; Write to file
  (call-with-output-file filename
    ;; Anon funcion takes i/o stream (open output file)
    (lambda (port)
      (display "Hello World!" port))
    #:exists 'replace)) ;; Replace if already there

(write-hello (build-path outdir "file1.txt"))
(write-hello (build-path outdir "file2.txt"))
