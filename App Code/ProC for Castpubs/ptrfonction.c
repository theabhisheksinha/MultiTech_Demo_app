/* Sample C/Pro*C : appel d'une fonction par un pointeur */
#include <stdio.h>

int affiche_UN();
int affiche_DEUX();

main()
{
	int (*ptr_de_fonction)();

	ptr_de_fonction = affiche_UN;
	ptr_de_fonction();
	printf("%d\n",ptr_de_fonction());

	ptr_de_fonction = affiche_DEUX;
	ptr_de_fonction();
	printf("%d\n",ptr_de_fonction());
}

int affiche_UN()
{
	printf("Fonction affiche_UN.Retourne 1\n");
	return 1;
}

int affiche_DEUX()
{
	printf("Fonction affiche_DEUX.Retourne 2\n");
	return 2;
}