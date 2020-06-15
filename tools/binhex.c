#include <stdio.h>

#define SZ_BUF	32
#define BYTE unsigned char

void main()
{
	int sz, i; 
	BYTE buf[SZ_BUF];

	while (sz = read(0, &buf, SZ_BUF))
	{
		for (i = 0; i< sz; i++) printf("%02x", buf[i]);
		putchar('\n');
	}
}
