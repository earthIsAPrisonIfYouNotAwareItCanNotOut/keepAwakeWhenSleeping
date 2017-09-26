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


;;; how lisp interpreter works

;; we now start to figure out what the lisp interpreter does
;;   when we command it to evalute a list
;;   first, it looks to see whether there is a quote before the list
;;     if there is , the interpreter just gives us the list
;;   on the other hand, if there is no quote
;;     the interpreter looks at the first element in the list and
;;       sees whether it has a function definition
;;   otherwise, the interpreter prints an error message

;;; special forms, macros, ordinary function

;; the special forms are used for special jobs, like defining a function
;; a macro is a construct defined in lisp
;;   which differs from a function in that
;;     it translates a lisp expression into another expression that
;;       is to be evaluated in place of the original expression

;;; byte compiled code and humanly readable code

;; the lisp interpreter is able to interpret two kinds of entity
;;   humanly readable code ends with ".el" extension
;;   byte compiled code ends with ".elc" extension
;;   byte compiled code runs faster than humanly readable code


;;; evaluating inner lists

;; if we put the cursor after a number, type 'C-x C-e'
;;   we will get the number itself
;; if we put the cursor after (+ 3 3)
;;   we will evaluate this expression
;; if we evaluate a symbol like '+'
;;   the computer carring out the
;;     instructions in the function definition
;;     attached to that name

(+ 2 (+ 3 3))


;;; a value attached to a symbol

;; to find the value of this symbol, evaluate it by itself
;;   after evaluating, emacs printed the number in your echo area

fill-column

;;; 1. error meaage for a symbol without a function

;; when we evaluated 'fill-column' to find its value as a variable
;;   we did not place parentheses around the word
;;   this because we did not intend to use it as a function name

;; if 'fill-column' were the first or only element of a list
;;   the lisp interpreter would attempt to find the function definition attached to it
;;   but 'fill-column' has no function definition

(fill-column)

;;; 2. error message for a symbol without a value

;; if you attempt to evaluate a symbol that does not have a value bound to it
;;   you will receive an error message

;; put the cursor right after the '+', before the first number 2
;;   then evaluate it

(+ 2 2)

;;; more detail for 1 and 2

;; if we want to see whether a symbol with a value attached to it
;;   just like 2
;;   put the cursor right after the symbol and evaluate it
;; if we want to see whether a symbol with a function definition
;;   just like 1
;;   put the cursor after parentheses of encloding list and evaluate it


;;; types of data passed to a function

;; the arguments to a function such as '+' must have values that are numbers

;; the 'concat' function links together or
;;   unites two or more string of text to produce a string
;;   the arguments are strings

(concat "abc" "def")

;; a function such as 'substring' uses both a string and numbers as arguments

(substring "the quick brown fox jumped." 16 19)

;;; an argument as the value of a vairable or list

;; an argument as a variable
;; when the symbol 'fill-column' by itself is evaluated
;;   it returns a number which can be used in an addition

(+ 2 fill-column)

;; an argument as list
;; the function 'concat' are the string "the"
;;   and "red foxes" and the list (number-to-string (+ 2 fill-column))

(concat "The" (number-to-number (+ 2 fill-column)) " red foxes.")


;;; take any number of arguments

;; some functions, such as 'concat', '+' or '*'
;;   can take any number of arguments

;; take no argument
(+)
(*)
;; take one arguemnt
(+ 3)
(* 3)
;; take three arguments
(+ 3 4 5)
(* 3 4 5)


;;; add string to number

;; the '+' function expects the values of its arguments to be number
;; as an experiment we pass it the quoted symbol 'hello'

(+ 2 'hello)

;; as usual, the error message tries to be helpful and
;;   makes sense after you learn how to read it

;; ---------- Buffer: *Backtrace* ----------
;; Debugger entered--Lisp error:
;; (wrong-type-argument number-or-marker-p hello)

;; the first part of the error message is straightforward
;;   it says 'wrong type argument'

;; next comes the jargon word 'number-or-marker-p'
;;   this word is trying to tell you what kind of argument the '+' expected
;;   what it does is test to see whether
;;     the '+' is given a number or
;;     a marker (a special object representing a buffer position)
;;   the 'p' stands for "predicate"
;;     a predicate refers to a function to
;;       determine whether some property is true or false

;;; print message in the echo area

(message "this message appears in the echo area!")

;;; quoted string

;; the function 'buffer-name' returns the name of the buffer as a string
;;   which the 'message' function inserts in place of '%s'

(message "the name of this buffer is: %s." (buffer-name))

;; use %d quoted string

(message "the value of fill-column is %d." fill-column)

;; the most complex one

(message "he saw %d %s"
         (- fill-column 3)
         (concat "red "
                 (substring
                  "the quick brown foxes jumped." 16 21)
                 " leaping."))

;; TIP
;; actually, you can use '%s' to print a number
;;   it is non-specific
;; '%d' prints only the part of a number left of a decimal point
;;   and not anything that is not a number


;;; set

;; set the value of symbol 'flowers' to a list

(set 'flowers '(rose violet daisy buttercup))

;; you can evaluate the symbol 'flowers' and it will return the value you just set

flowers

;; if you evaluate ''flowers', the variable with a quote in front of it
;; what you will see in the echo area is the symbol itself

'flowers

;;; setq

(setq carnivores '(lion tiger leopard))

;; like the 'set' as

(set 'carnivores '(lion tiger leopard))

;;; multiple assignments

;; 'setq' can be used to assign different values to different variables
;; the first argument is bound to the value of the second argument
;; the third argument is bound to the value of the forth argument

(setq trees '(pine fir oak maple)
      herbivores '(gazelle antelope zebra))

;;; using setq to count

(setq counter 0)                ; Let’s call this the initializer.
(setq counter (+ counter 1))    ; This is the incrementer.
counter                         ; This is the counter.
