(if (> 5 4)                             ; if-part
    (message "5 is greater than 4!"))   ; then-part

(defun type-of-animal (characteristic)
  "Print message in echo area depending on CHARACTERISTIC.
     If the CHARACTERISTIC is the string \"fierce\",
     then warn of a tiger."
  (if (equal characteristic "fierce")
      (message "It is a tiger!")))
