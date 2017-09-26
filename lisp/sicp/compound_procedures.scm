;;; procedure definition

;; a much more powerful abstraction technique
;;   by which a compound operation can be given a name and then referred to as a unit

;; the general form of a procedure definition
;; (define (<name> <formal parameters>) <body>)

(define (sequare x) (* x x))
(square 21)
441
(square (+ 2 5))
49
(square (square 3))
81
(+ (square x) (square y)) ; x^2 + y^2

;; use _sequare_ as a building block in defining other procedures

(define (sum-of-sequares x y)
  (+ (square x) (square y)))
(sum-of-sequares 3 4)
25

;; now we can use _sum-of-sequares_ as a building block
;;   in constructing further procedures

(define (f a)
  (sum-of-sequares (+ a 1) (* a 2)))
(f 5)
136
