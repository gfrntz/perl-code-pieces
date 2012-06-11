#!/usr/bin/perl

# Some dbi perl examples


# connect to db
my $my_host = "some.host";
my $my_port = 3306; 
my $my_user = "username";
my $my_pass = "password"; 
my $my_db = "some_db";
my $my_dsn = "DBI:mysql:database=$my_db;host=$my_host;port=$my_port";
my $dbh = DBI->connect($my_dsn, $my_user, $my_pass) || die "Cannot connect to billing database\n";

# select from db

my $acc_b_test = $dbh->prepare(sprintf("SELECT id FROM account WHERE uid = %u", $uid_acc_name)) or die("Can't prepare query\n");

$acc_b_test->execute() or die("Error in query. " . $DBI::errstr);
$acc_b_test->finish();



sub some_sub {
        my ($i,$c);
        $b = $dbh->do("USE base_name");

        $b = $dbh->prepare ("SELECT id FROM domains WHERE uid = '$uid'") or die ("Cannot prepare query!\n");
        $b->execute() or die ("Error in query\n");
        my $row_count = $b->rows;

        for ($i=0;$i<$row_count;$i++) {
                my $domain_id = $b-> fetchrow_array;
                $c = $dbh->prepare ("UPDATE records SET content = '$srv_proxy' WHERE domain_id = '$domain_id'
                AND type = 'A' AND (content LIKE '1.1.1.%' OR content LIKE '2.2.2.%' OR content LIKE '3.3.3.%' OR content LIKE '4.4.4.%')
                AND name NOT LIKE 'mail.%'
                AND name NOT LIKE 'pop3.%'
                AND name NOT LIKE 'smtp.%'") or die ("Cannot prepare query pdns change $srv_proxy $domain_id  \n");
                $c->execute() or die ("Error in query\n");
        }
        $b->finish();
}


