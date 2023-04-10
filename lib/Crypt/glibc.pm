#
# Crypt::glibc.pm - glibc crypt module
#
#	more information: https://github.com/nabe-abk/Crypt-glibc
#
package Crypt::glibc;

use 5.8.1;
use strict;
use warnings;

our $VERSION = '0.01';

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Crypt::glibc ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(crypt) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = ();

require XSLoader;
XSLoader::load('Crypt::glibc', $VERSION);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Crypt::glibc - Perl extension for glibc crypt

=head1 SYNOPSIS

  use Crypt::glibc;
  $hash = Crypt::glibc::crypt($key, $salt);

(example)

	DES	Crypt::glibc::crypt($key, "sa");
	MD5	Crypt::glibc::crypt($key, "$1$saltsalt");
	SHA256	Crypt::glibc::crypt($key, "$5$saltstring");
	SHA512	Crypt::glibc::crypt($key, "$6$saltstring");

=head1 DESCRIPTION

Perl has crypt function, dependent to system API.
Windows do not have crypt() function.
The crypt() function is implementation DES only,
not implementation MD5, SHA256, SHA512 on Windows.

This module have these crypt implementation.

=head1 AUTHOR

The original C<Crypt> source was written by Free Software Foundation, Inc.

The C<Crypt::glibc> module is written by nabe@abk <@nabe_abk>.

=head1 COPYRIGHT AND LICENCE

C<Crypt::glibc> module's Copyright (C) 2018 by nabe@abk.

Original Crypt source from glibc-2.28.
The module's licence is same as Original is under text.

Copyright (C) 1991-2018 Free Software Foundation, Inc.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; see the file COPYING.LIB.  If not,
see <http://www.gnu.org/licenses/>.

=cut
