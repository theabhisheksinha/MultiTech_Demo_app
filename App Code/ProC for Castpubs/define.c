#include <stdio.h>

#define MADEFFONCTION(arg1,arg2) quel_est_le_plus_grand(int arg1,int arg2)
#define MAFONCTION(arg1,arg2) quel_est_le_plus_grand(arg1,arg2)

#define TROIS 3
#define VINGTCINQ 25

MADEFFONCTION(var1,var2);

void main()
{
	int var1 = TROIS;
	int var2 = VINGTCINQ;

	MAFONCTION(var1,var2);
}

MADEFFONCTION(var1,var2)
{
	if (var1 > var2)
		(void)printf("le plus grand de : %d,%d est : %d",var1,var2,var1);
	else
		(void)printf("le plus grand de : %d,%d est : %d",var1,var2,var2);
}