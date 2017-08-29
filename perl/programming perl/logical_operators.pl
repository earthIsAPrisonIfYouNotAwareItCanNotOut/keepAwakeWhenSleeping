## short-circuit operators

# $a && $b    And     $a if $a is false, $b otherwise
# $a || $b    Or      $a if $a is true, $b otherwise
# ! $a        Not     True if $a is not true
# $a and $b   And     $a if $a is false, $b otherwise
# $a or $b    Or      $a if $a is true, $b otherwise
# not $a      Not     True if $a is not true
# $a xor $b   Xor     True if $a or $b is true, but not

# you can say "California or bust!" in perl without busting
#   presuming you do get to California

# these operator are often used in perl to conditionally execute code
open(grades, "<:utf8", "grades") || die "Can't open file grades: $!\n";
