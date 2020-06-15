#include <stdio.h>

#define SZ_BUF	32
#define BYTE unsigned char

void main()
{
	int sz, i; 
	BYTE buf[SZ_BUF];

	while (sz = read(0, &buf, SZ_BUF))
	{
#ifdef SOLARIS
		printf("echo \"");
#else
		printf("echo -e \"");
#endif
		for (i = 0; i< sz; i++) 
			printf("\\%04o", buf[i]);

		printf("\\c\"\n");
	}
}
