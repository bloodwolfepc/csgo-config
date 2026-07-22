#lang racket
(require racket/cmdline)
(define (mkHeader header)
  (string-join
    (for/list ([line (string-split header "\n")])
      (string-append "echo |" line))
    "\n"))

(define header (mkHeader
#<<TXT
    _                                        __       
   (_) __ _ _ __         ___ ___        ___ / _| __ _ 
   | |/ _` | '_ \ _____ / __/ __|_____ / __| |_ / _` |
   | | (_| | | | |_____| (__\__ \_____| (__|  _| (_| |
  _/ |\__,_|_| |_|      \___|___/      \___|_|  \__, |
 |__/                                           |___/ 
TXT
))

(define result (string-join (list "hello" header) "\n"))
(displayln result)


;;https://gist.github.com/AlexSoulEdge/7698a61dfe4003d1947babc766a666b8


;; log_color "Console" "AA99ff"
;;
;; echo |    _                                        __
;; echo |   (_) __ _ _ __         ___ ___        ___ / _| __ _
;; echo |   | |/ _` | '_ \ _____ / __/ __|_____ / __| |_ / _` |
;; echo |   | | (_| | | | |_____| (__\__ \_____| (__|  _| (_| |
;; echo |  _/ |\__,_|_| |_|      \___|___/      \___|_|  \__, |
;; echo | |__/                                           |___/
;;
;; unbindall
;; exec januarycfg/settings.cfg
;; exec januarycfg/audio.cfg
;; exec januarycfg/definitions.cfg
;; exec januarycfg/maps.cfg
;; exec januarycfg/extra.cfg
;; exec januarycfg/crosshairs_viewmodels.cfg
;; host_writeconfig
