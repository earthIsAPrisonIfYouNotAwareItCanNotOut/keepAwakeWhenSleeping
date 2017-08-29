## the scalar truth rules (no coercion)

Any string is true except for "" and "0" .
Any number is true except for 0.
Any reference is true.
Any undefined value is false.

## the scalar truth rules (with coercion)

0              # would become the string "0", so false.
1              # would become the string "1", so true.
10 – 10        # 10 minus 10 is 0, would convert to string "0", so false.
0.00           # equals 0, would convert to string "0", so false.
"0"            # is the string "0", so false.
""             # is a null string, so false.
"0.00"         # is the string "0.00", neither "" nor "0", so true!
"0.00" + 0     # would become the number 0 (coerced by the +), so false.
\$a            # is a reference to $a, so true, even if $a is false.
undef()        # is a function returning the undefined value, so false.
