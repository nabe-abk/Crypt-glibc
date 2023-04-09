//
// all type crypt test
//

#include "crypt.h"
#include <stdio.h>
#include <string.h>
// ----------------------------------------------------------------------------
static const struct
{
	const char *type;
	const char *input;
	const char *salt;
	const char *expected;
} tests[] = {
	{
		"DES",
		"Hello world!",
		"sa",
		"saszt8mUri4AI"
	},
	{
		"MD5",
		"Hello world!",
		"$1$saltstring",
		"$1$saltstri$YMyguxXMBpd2TEZ.vS/3q1"
	},
	{
		"SHA256",
		"Hello world!",
		"$5$saltstring",
		"$5$saltstring$5B8vYYiY.CVt1RlTTf8KbXBH3hsxY/GNooZaBBGWEc5"
	},
	{
		"SHA256",
		"Hello world!",
		"$6$saltstring",
		"$6$saltstring$svn8UoSVapNtMuq1ukKS4tPQd8iKwSMHWjl/O817G3uBnIFNjnQJu"
		"esI68u4OTLiBFdcbYEdFCoEOfaS35inz1"
	},
};
#define NTESTS (sizeof (tests) / sizeof (tests[0]))

// ----------------------------------------------------------------------------

int main (void)
{
	int result = 0;
	for (int i=0; i < NTESTS; ++i) {
		printf("Try %s crypt()\n", tests[i].type);

		char *cp = crypt(tests[i].input, tests[i].salt);
		printf("\tcrypted: %s\n", cp);

		int flag = (strcmp(cp, tests[i].expected) != 0) ? 0 : 1;
		printf("\tresult:  %s\n", flag ? "OK" : "NG");
		result += (flag ? 0 : 1);
	}
	return result;
}

