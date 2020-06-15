#include <stdio.h>

#define SZ_SBUF	65
#define BYTE unsigned char

// hex char to integer 
BYTE HX(char d)
{
	BYTE r =  0; 

	if (d >= '0' && d <= '9') r = d - '0';
	if (d >= 'a' && d <= 'f') r = 10 + d - 'a';
	
	return r;
}

// convierte fichero hex (txt) a bin
void main()
{
	int sz, i; 
	char sbuf[SZ_SBUF];

	while (sz = read(0, &sbuf, SZ_SBUF))
		for (i = 0; i < sz - 1; i++) 
			putchar((HX(sbuf[i++]) << 4) | HX(sbuf[i]));
}
