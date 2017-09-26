;;; using name identifies a variable

;; in scheme, we name things with _define_

(define size 2)

;; causes the interpreter to associate the value 2 with the name size
size
2
(* 5 size)

;; further examples

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
314.159
(define circumference (* 2 pi radius))
circumference
62.8318

;; TIP
;; a lisp program usually consists of a large number of relatively simple procedures
