#lang racket
(require racket/cmdline)

;; Get env vars
(define host (or (getenv "APP_HOST") "127.0.0.1"))
(define port (or (getenv "APP_PORT") "8000"))

;; Override with flags
(command-line
  #:program "my-app"
  #:once-each
  [("-H" "--host") h "Host name" (set! host h)]
  [("-p" "--port") p "Port number" (set! port p)]
  )

;; Type conversion
(define port-num (string->number port))
(unless port-num
  (error 'my-app "port must be a anumber: ~a" port))

(printf "host=~a port=~a\n" host port-num)
