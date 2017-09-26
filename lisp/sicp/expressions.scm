;;; a number expression

;; the intepreter will respond by printing 486

486


;;; a compound expression

;; () are called combinations
;; +  is called the operator
;; the other elements are called operands

;; TIP
;; expressions formed by delimiting a list of expressions
;;   within paentheses in order to denote procedure application
;;   are called combinations

(+ 137 349)


;;; prefix notation

;; the convention of placing the operator to the left of the operands
;;   is known as prefix notation
;; prefix notation has several advantages
;;   one of them is that it can accommodate procedures that
;;     may take an arbitrary number of arguments

(+ 21 35 12 7)

;; a second advantage of prefix notation is that
;;   it extends in a straightforward way to allow combinations to be nested
;;   that is, to have combinations whose elements are themselves combinations

(+ (* 3 5) (- 10 6))


;;; pretty-printing

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))

;; we can help ourselves by writing such an expression in the form

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

;; the resulting indentations display clearly the structure of the expression
