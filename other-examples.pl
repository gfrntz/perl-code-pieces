#!/usr/bin/perl

# search user uid in freebsd jail

open(MPASS, "<", "/usr/jail/etc/master.passwd") or die("Can't open file master.passwd. $!");

while(<MPASS>) {
	if (/.*\:.*:$uid_acc_name\:/) {
		return 0;
	}
}

close(MPASS);


# generate password

sub generate_password {
        my @chars = ("a" .. "z", 0 .. 9); 
        my $rand32 = join("", @chars[ map { rand @chars } (0 .. 10) ]); 
        my $password = $rand32;
}

# write to file

open(SESSION, ">","$uid.ses");
print SESSION "$operator_name\n";
print SESSION "$old_server\n";
print SESSION "$old_home\n";
print SESSION "$uhome\n";
close(SESSION);

