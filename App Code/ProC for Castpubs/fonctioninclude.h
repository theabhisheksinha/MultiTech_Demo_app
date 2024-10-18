#ifdef MAFONCTION
int mon_include(int var1,int var2);
int MYRF();

int mon_include(int var1,int var2)
{
	if (var1 > var2) return var1;
	else             return var2;
}

int MYRF()
{
	return 1;
}
#endif
