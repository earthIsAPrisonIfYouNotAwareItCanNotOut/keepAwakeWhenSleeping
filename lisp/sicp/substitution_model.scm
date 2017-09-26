;;; substitution model

(f 5)                                   ; combination f
(sum-of-squares (+ a 1) (* a 2))        ; retrieving the body f
(sum-of-squares (+ 5 1) (* 5 2))        ; replace argument a to 5
(+ (square 6) (square 10))              ; retrieving the body sum-of-squares
(+ (* 6 6) (* 10 10))                   ; retrieving the body square
(+ 36 100)
136

;;; applicative order versus normal order

(sum-of-squares (+ 5 1) (* 5 2))

正则序求值(完全展开)                                   应用序求值(避免重复求值)

;; normal-order evaluation (fully expand and then reduce)

(+ (square (+ 5 1))   (square (* 5 2))  )
(+ (* (+ 5 1)(+ 5 1)) (* (* 5 1)(* 5 1)))

;; applicative-order evaluation (evaluate the arguments and then apply)

(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))

;; TIP
;; normal-order and applicative-order evaluation produce the same value
;; lisp uses applicative-order evaluation
;;   partly because of the additional efficiency abtained from avoiding multiple
;;   as a example above
;;   use normal-order will evaluate (+ 5 1) and (* 5 1) twice
