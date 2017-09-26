;;; evaluate a combination

;; to evaluate a combination, do the following
;;   evaluate the subexpressions of the combination
;;   apply the procedure that
;;     is the value of the leftmost subexpressions (the operator)
;;     to the arguments that
;;     are the values of the other subexpressions (the operands)

(* (+ 2 (* 4 6))
   (+ 3 5 7))

;; evaluation rule is known as _tree accumulation_

;; 390
;; * 26      15
;; + 2 24    + 3 5 7
;;     * 4 6

;; in computer

;; the values of numberals are the numbers that they name
;; the values of build-in operators are the machine instruction sequences
;;   that carry out the corresponding operations, and
;; the values of other names are the objects
;;   associated with those names in the environment
