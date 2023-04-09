# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Crypt-glibc.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 5;
BEGIN { use_ok('Crypt::glibc') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

{
	my $type   = 'DES';
	my $key    = 'password';
	my $salt   = 'saltstring';
  	my $hash   = 'sa3tHJ3/KuYvI';
	my $result = Crypt::glibc::crypt($key, $salt);

	ok($hash eq $result, "$type-crypt");
}
{
	my $type   = 'MD5';
	my $key    = 'password';
	my $salt   = '$1$saltstring';
  	my $hash   = '$1$saltstri$qQY4WxjABChYG1ccLpfkz/';
	my $result = Crypt::glibc::crypt($key, $salt);

	ok($hash eq $result, "$type-crypt");
}
{
	my $type   = 'SHA256';
	my $key    = 'password';
	my $salt   = '$5$saltstring';
  	my $hash   = '$5$saltstring$OH4IDuTlsuTYPdED1gsuiRMyTAwNlRWyA6Xr3I4/dQ5';
	my $result = Crypt::glibc::crypt($key, $salt);

	ok($hash eq $result, "$type-crypt");
}
{
	my $type   = 'SHA512';
	my $key    = 'password';
	my $salt   = '$6$saltstring';
  	my $hash   = '$6$saltstring$adDbXsJjcDlq2662QPgd.tkSOVmnG9Tt3oXl4HR60SusC3AGjirnDenVZp3DGwLwqy6iYKCzannhaX9DR72nN1';
	my $result = Crypt::glibc::crypt($key, $salt);

	ok($hash eq $result, "$type-crypt");
}

