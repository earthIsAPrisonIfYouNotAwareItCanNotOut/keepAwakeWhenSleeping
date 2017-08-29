;;; four different flowers

;; the elements of this list are the names of the four different flowers

'(rose violet daisy buttercup)

;;; numbers list

(+ 2 2)

;;; lists inside of lists

;; the components of this list are the words "this", "list", "has",
;;   and the list '(a list inside of it)

'(this list has (a list inside of it))


;;; empty list

()

;;; quoted text

;; this kind if atom is called a "string" and is the sort of thing
;;   that is used for message that a computer can print for a human to read

'(this list includes "text between quotation marks.")

;;; C-x C-e

;; here is how you can evaluate such a list
;;   place your cursor immediately
;;     after the right hand parenthesis of the following list and then type 'C-x C-e'

;; you will see the number '4' appear in the echo area

(+ 2 2)

;; now try the same thing with quoted list
;; you will see '(this is a quoted list)

'(this is a quoted list)

;;; debugger

;; position the cursor right after it and type 'C-x C-e'
;; a 'Backtrace*' window will open up and you should see (to quit debugger type q)

;; at the top of the it, you see the line
;;   Debugger entered-Lisp error: (void-function this)
;; 'void-funtion this'
;;   the function (that is, the word 'this')
;;   does not have a definition of any set of instructions for the computer to carry out
;;   the slightly odd word
;;     'void-function' is designed to cover the way emacs lisp is implemented

;; it is possible to prevent emacs entering the debugger in case like this
;;   we do not explain how to do that here
;;   but we will mention what the result looks like
;;   Symbol's function definition is void: this

(this is an unquoted list)
