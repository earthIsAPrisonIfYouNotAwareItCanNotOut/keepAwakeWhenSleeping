## format hash

# people can not determine which is a key or a value
%some_hash = ('foo', 35, 'bar', 12.4, 2.5, 'hello',
              'wilma', 1.72e30, 'betty', "bye\n");

# format hash with big arrow =>
my %last_name = (
  'fred'   =>  'flintstone',
  'dino'   =>  undef,
  'barney' =>  'rubble',
  'betty'  =>  'rubble',
);


## hash key shortcut

# if the keys is string, you can omit the quotes
my %last_name = (
  fred   =>  'flintstone',
  dino   =>  undef,
  barney =>  'rubble',
  betty  =>  'rubble',
);

# but if the keys is special word, like + (addition operator)
#   the quotes should be added
my %last_name = (
  +  =>  'flintstone', # WRONG! Compilation error!
);

# beware, any bareword
#   perl interprets it as a string concatenation
$hash{ bar.foo } = 1; # that's the key 'barfoo'
