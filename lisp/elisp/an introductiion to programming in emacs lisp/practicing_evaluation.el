;;; file

;; a file is information recored permanently in the computer

(buffer-file-name)


;;; buffer

;; a buffer contains information that you have copied from a file
;;   we say the buffer is "visiting" that file
;; change to the buffer do not change the file
;;   until you save the buffer
;; when you save the buffer
;;   the buffer is copied to the file and is thus saved permanently

(buffer-name)


;;; evaluate the result after the expression

;; type 'C-u C-c C-e'

;; if you evaluate 'buffer-name' in *scratch*

(buffer-name)"*scratch*"


;;; get current buffer

(current-buffer)


;;; get other buffer you recently selected

(other-buffer)


;;; switch to buffer you specific

;; switch-to-buffer does two different things
;;   it switches the buffer to which emacs's attention is directed
;;   and it switches the buffer displayed in the window to the new buffer

(switch-to-buffer) ; (C-x b)

;; set-buffer does only one thing
;;   it switches the attention of the computer progra to a different buffer
;;   the buffer on the screen remains unchanged

(set-buffer)


;;; buffer size

;;; buffer-size tells you the size of the current buffer

(buffer-size)


;;; point

;; point returns a number that tells you
;;   where the cursor is located
;;   as a count of the number of characters
;;   from the beginning of the buffer up to a point

(point)

;; minimum and maximum permission value of point in current buffer

(point-max)
(point-min)
