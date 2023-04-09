#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "crypt.h"

MODULE = Crypt::glibc	PACKAGE = Crypt::glibc

void crypt(...) 
PPCODE:
{
	if (items != 2) {
		croak("Usage crypt(key, salt)");
	}

	char *result = "";
	const char *key  = SvPV_nolen(ST(0));
	const char *salt = SvPV_nolen(ST(1));

	struct crypt_data *buf;
	Newx(buf, 1, struct crypt_data);

	result = crypt_r(key, salt, buf);
	XPUSHs(sv_2mortal(newSVpv(result, 0)));

	Safefree(buf);
	XSRETURN(1);
}

