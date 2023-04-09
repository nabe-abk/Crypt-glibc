use ExtUtils::MakeMaker;

my $IsWindows = $^O eq 'MSWin32';

my $src_dir   = 'glibc/crypt/';
my @src_files = qw(
	crypt.c
	crypt_util.c
	crypt-entry.c
	explicit_bzero.c
	md5.c
	md5-crypt.c
	sha256.c
	sha256-crypt.c
	sha512.c
	sha512-crypt.c
);
my @ary = map { "$src_dir$_" } @src_files;

WriteMakefile(
	NAME		=> 'Crypt::glibc',
	AUTHOR		=> 'nabe@abk (@nabe_abk)',
	VERSION_FROM	=> 'lib/Crypt/glibc.pm',
	ABSTRACT_FROM	=> 'lib/Crypt/glibc.pm',
	LICENSE		=> 'LGPL',

	OPTIMIZE	=> '-O3',
	INC		=> '-Iglibc/crypt/ -Iglibc/crypt/include/',
	C		=> [ map {"$src_dir$_"} @src_files ],
	OBJECT		=> '$(O_FILES) glibc.o',

	DEFINE		=> '-o $@' . ($IsWindows ? ' -DSTPNCPY -DBCOPY' : ''),
	clean		=> { FILES => 'glibc/crypt/*.o' }
);

