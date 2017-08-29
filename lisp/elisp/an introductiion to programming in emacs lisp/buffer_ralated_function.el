(buffer-name)
(buffer-file-name)
(current-buffer)
(other-buffer)
(switch-to-buffer (other-buffer))
(switch-to-buffer (other-buffer (current-buffer) t))

(defun simplified-beginning-of-buffer ()       ;; the name, the argument
  "Move point to the beginning of the buffer;  ;; document
     leave mark at previous position."
  (interactive)                                ;; interactive expression
  (push-mark)                                  ;; body  set cursor position mark
  (goto-char (point-min)))                     ;;       move to beginning of buffer

(defun mark-whole-buffer ()
  "Put point at beginning and mark at end of buffer.
     You probably should not use this function in Lisp programs;
     it is usually a mistake for a Lisp function to use any subroutine
     that uses or sets the mark."
  (interactive)
  (push-mark (point))
  (push-mark (point-max) nil t)
  (goto-char (point-min)))
