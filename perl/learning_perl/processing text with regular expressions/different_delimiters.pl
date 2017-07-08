## nonpaired delimiters

# you can use '#' replace '/' as delimiter
s#\Ahttps://#http://#;

## paired delimiters

# two pairs
#   one to hold the pattern
#   and one to hold the replacement string
s{fred}{barney};
s[fred](barney);
s<fred>#barney#;
