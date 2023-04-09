# Crypt-glibc

This module for crypt() using MD5/SHA256/SHA512.
Few perl enviroment's crypt() do not implementation these algorithms,
For example Windows.
In such a case, it is possible
perl core crypt() replace to the module's crypt() function.

# Usage

Can be used the same as perl's crypt().
```
use Crypt::glibc();
Crypt::glibc::crypt('secret', '$6$saltString');
```

Easy to use as a replacement for perl's crypt().
```
use Crypt::glibc();
*CORE::GLOBAL::crypt = *Crypt::glibc::crypt;
```

# INSTALLATION

To install this module type the following:

```
perl Makefile.PL
make
make test
make install
```

# LICENCE

 Copyright (C)2018 nabe@abk, licence under LGPL.

 This module made from glibc. Original glibc licence is under.

```
 * Copyright (C) 1991-2018 Free Software Foundation, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; see the file COPYING.LIB.  If not,
 * see <http://www.gnu.org/licenses/>.
```
