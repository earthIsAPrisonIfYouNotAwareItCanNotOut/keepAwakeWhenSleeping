## unwinding the hash

# assign the whole value of hash
%some_hash = ('foo', 35, 'bar', 12.4, 2.5, 'hello',
'wilma', 1.72e30, 'betty', "bye\n");

# convert hash to a list
@any_array = %some_hash;

print "@any_array\n";
# might give something like this:
# betty bye (and a newline) wilma 1.72e+30 foo 35 2.5 hello bar 12.4
