# Copyright (C) 1996-2018 Free Software Foundation, Inc.
# This file is part of the GNU C Library.

# The GNU C Library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

# The GNU C Library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public
# License along with the GNU C Library; if not, see
# <http://www.gnu.org/licenses/>.

CC      = gcc -O3 -c -I. -Iinclude/ -Wincompatible-pointer-types
LD      = gcc -O3
headers = crypt.h
objs    = md5.o md5-crypt.o sha256.o sha256-crypt.o sha512.o sha512-crypt.o crypt.o crypt_util.o crypt-entry.o explicit_bzero.o
TESTS   = md5c-test sha256c-test sha512c-test md5test sha256test sha512test

all:  test
tests: $(TESTS)

clean:
	rm -f *.o test $(TESTS)

md5.o: md5.c md5.h $(headers)
	$(CC) $<
sha256.o: sha256.c md5.h $(headers)
	$(CC) $<
sha512.o: sha512.c md5.h $(headers)
	$(CC) $<

md5-crypt.o: md5-crypt.c md5.h $(headers)
	$(CC) $<
sha256-crypt.o: sha256-crypt.c md5.h $(headers)
	$(CC) $<
sha512-crypt.o: sha512-crypt.c md5.h $(headers)
	$(CC) $<

crypt.o: crypt.c $(headers)
	$(CC) $<
crypt_util.o: crypt_util.c $(headers)
	$(CC) $<
crypt-entry.o:crypt-entry.c $(headers)
	$(CC) $<
explicit_bzero.o: explicit_bzero.c
	$(CC) $<

md5test: md5test.c md5.h $(headers)
	$(LD) -o $@ $< $(objs)
sha256test: sha256test.c sha256.h $(headers)
	$(LD) -o $@ $< $(objs)
sha512test: sha512test.c sha512.h $(headers)
	$(LD) -o $@ $< $(objs)

md5c-test: md5c-test.c md5.h $(headers) $(objs)
	$(LD) -o $@ $< $(objs)
sha256c-test: sha256c-test.c sha256.h $(headers) $(objs)
	$(LD) -o $@ $< $(objs)
sha512c-test: sha512c-test.c sha512.h $(headers) $(objs)
	$(LD) -o $@ $< $(objs)

test: test.c $(headers) $(objs)
	$(LD) -o $@ $< $(objs)
