;;; function definition

;; when lisp interpreter evaluate a list
;;   it looks to see whether the symbol points to a function definition


;;; primitive functions

;; all functions are defined in terms of other functions
;; except for a "primitive" functions that are written in C
;; these C code can easily run emacs on any computer


;;; defun

;; the choice of a name is up to the programmer
;;   and should be chosen to make the meaning of the function clear

;; you can use 'C-h f' to see the documentation

(defun FUNCTION-NAME (ARGUMENTS...)
  "OPTIONAL-DOCUMENTATION..."
  (interactive ARGUMENT-PASSING-INFO)   ; optional
  BODY...)

;; a function that multiples its arguments by 7

(defun multiply-by-seven (number)
  "Multiply NUMBER by seven."
  (* 7 number))

(multiply-by-seven 3)

;; change a function definition

;; a second version to multiple items seven times
;; you can install this version by evaluating it

(defun multiply-by-seven (number)       ; Second version.
  "Multiply NUMBER by seven."
  (+ number number number number number number number))


;;; make a function interactive

;; use the special form 'interactive'
;;   and call it with 'M-x multiply-by-seven'
;; the 'p' tells emacs to
;;   pass the prefix argument to the function
;;   and use its value for the argument of the function

(defun multiply-by-seven (number)       ; Interactive version.
  "Multiply NUMBER by seven."
  (interactive "p")
  (message "The result is %d" (* 7 number)))


;;; message function

;; a message is printed in the echo area

(message "This message appears in the echo area!")
(message "The name of this buffer is: %s." (buffer-name))
(message "The value of fill-column is %d." fill-column)
(message "There are %d %s in the office!"
         (- fill-column 14) "pink elephants")
(message "He saw %d %s"
         (- fill-column 32)
         (concat "red "
                 (substring
                  "The quick brown foxes jumped." 16 21)
                 " leaping."))
