## copy

# copy a hash to another
my %new_hash = %old_hash;


## reverse

# unwind hash into list
#   making list like (key, value, key, value, ...)
# then reverse list
#   making a list like (value, key, value, key, ...)
my %inverse_hash = reverse %any_hash;

# tha case for IP address and hostname
%ip_address = reverse %host_name;
