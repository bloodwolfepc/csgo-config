#lang racket

;; Hash tables
(define maps
  (hash
    'foo "bar" ;; Can also be 2 strs
    'apple "pear"
    ))

(for ([(k v) (in-hash maps)])
  (printf "~a => ~a\n" k v))

;; Pretty print
(for ([(k v) (in-hash maps)])
  (write k)
  (display " => ")
  (write v)
  (newline))

;; Association list
(define maps1
  '((name . "Ava")
    (age . 20)
    ))

(for ([pair maps1])
  (printf "~a => ~a\n" (car pair) (cdr pair))) ;;car gets key, cdr gets value
