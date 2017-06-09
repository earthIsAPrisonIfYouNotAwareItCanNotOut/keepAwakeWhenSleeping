## connect

use DBI;

$dbh = DBI->connect($data_source, $username, $password);


## DBD information

my $data_source = "dbi:Pg:dbname=name_of_database";


## query

my $sth = $dbh->prepare("SELECT * FROM foo WHERE bla");
$sth->execute();
my @row_ary  = $sth->fetchrow_array;
$sth->finish;


## disconnect

$dbh->disconnect();
