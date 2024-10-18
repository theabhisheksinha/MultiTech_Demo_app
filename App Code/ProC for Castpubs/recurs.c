/* Sample Pro*C/C++ : fonction récursive */
#include <stdio.h>

int pgcd_de_deux_entiers (int var1,int var2);

void main()
{
	int var1,var2;
	var1 = 180;
	var2 = 135;
	printf("pgcd de %d, %d = %d\n",var1,var2,pgcd_de_deux_entiers (var1,var2)); 
}


int pgcd_de_deux_entiers (int var1,int var2)
{
	if (var1 == var2)
	{
		return var1;
	}
	else
	{
			if ( var1 > var2)
			{
				pgcd_de_deux_entiers (var1 - var2,var2);
				return 0;
			}
			else
			{
				pgcd_de_deux_entiers (var1,var2 - var1);
				return 0;
			}
	}

}

