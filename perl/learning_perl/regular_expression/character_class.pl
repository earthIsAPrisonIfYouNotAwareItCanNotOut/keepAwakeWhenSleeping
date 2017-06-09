## hyphen

# [0-9] to match a digit ([a-zA-Z] to match any one leter)
$_ = "The HAL-9000 requires authorization to continue.";
if (/HAL-[0-9]+/) {
  print "The string mentions some model of HAL computer.\n";
}

# to match a literal hyphen
# [-a]                         hyphen or an a
# [a-]                         hyphen or an a
# [a\-z]                       hyphen (escape) or an a or an z
# [a-z]                        lowercase letters from a to z


## rules

# inside the character class, a dot is a literal dot
# [5.24]                       matches a literal dot or a 5, 2, or 4
# [\000-\177] matches any seven-bit ASCII character
# the \n and \t are still newlines and tabs

## case insensitive

$_ = "Bamm-Bamm";
if (/Bamm-?[Bb]amm/) {
  print "The string has Bamm-Bamm\n";
}

## not within

# [^def]                        anything not d, e, or f
# [^n-z]                        not a lowercase letter from n to z
# [^n\-z]                       not an n, -, or z
