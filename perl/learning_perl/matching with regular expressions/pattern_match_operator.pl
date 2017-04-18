# /fred/ is actually a shortcut for m// (pattern match operator)
# you can write same expression as m(fred), m<fred>, m[fred] or many other ways using nonpaired delimiters
# you may omit the initial m, you'll see most writtern using slashed as in /fred/

# it's commom to use curly baraces (like {} []) as delimiters

# it's fine to use the delimiter inside the pattern like m(fred(.*)barney) and m{\w{2,}} and m[wilma[\n \t] +betty]
