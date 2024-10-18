
/* Result Sets Interface */
#ifndef SQL_CRSR
#  define SQL_CRSR
  struct sql_cursor
  {
    unsigned int curocn;
    void *ptr1;
    void *ptr2;
    unsigned long magic;
  };
  typedef struct sql_cursor sql_cursor;
  typedef struct sql_cursor SQL_CURSOR;
#endif /* SQL_CRSR */

/* Thread Safety */
typedef void * sql_context;
typedef void * SQL_CONTEXT;

/* Object support */
struct sqltvn
{
  unsigned char *tvnvsn; 
  unsigned short tvnvsnl; 
  unsigned char *tvnnm;
  unsigned short tvnnml; 
  unsigned char *tvnsnm;
  unsigned short tvnsnml;
};
typedef struct sqltvn sqltvn;

struct sqladts
{
  unsigned int adtvsn; 
  unsigned short adtmode; 
  unsigned short adtnum;  
  sqltvn adttvn[1];       
};
typedef struct sqladts sqladts;

static struct sqladts sqladt = {
  1,1,0,
};

/* Binding to PL/SQL Records */
struct sqltdss
{
  unsigned int tdsvsn; 
  unsigned short tdsnum; 
  unsigned char *tdsval[1]; 
};
typedef struct sqltdss sqltdss;
static struct sqltdss sqltds =
{
  1,
  0,
};

/* File name & Package Name */
struct sqlcxp
{
  unsigned short fillen;
           char  filnam[49];
};
static const struct sqlcxp sqlfpn =
{
    48,
    "C:\\Work_in_progress\\C et C++\\ProCfch\\execproc.pc"
};


static unsigned long sqlctx = 69734755;


static struct sqlexd {
   unsigned int   sqlvsn;
   unsigned int   arrsiz;
   unsigned int   iters;
   unsigned int   offset;
   unsigned short selerr;
   unsigned short sqlety;
   unsigned int   occurs;
      const short *cud;
   unsigned char  *sqlest;
      const char  *stmt;
   sqladts *sqladtp;
   sqltdss *sqltdsp;
            void  **sqphsv;
   unsigned int   *sqphsl;
            int   *sqphss;
            void  **sqpind;
            int   *sqpins;
   unsigned int   *sqparm;
   unsigned int   **sqparc;
   unsigned short  *sqpadto;
   unsigned short  *sqptdso;
            void  *sqhstv[4];
   unsigned int   sqhstl[4];
            int   sqhsts[4];
            void  *sqindv[4];
            int   sqinds[4];
   unsigned int   sqharm[4];
   unsigned int   *sqharc[4];
   unsigned short  sqadto[4];
   unsigned short  sqtdso[4];
} sqlstm = {10,4};

/* SQLLIB Prototypes */
extern void sqlcxt (void **, unsigned long *,
                    struct sqlexd *, const struct sqlcxp *);
extern void sqlcx2t(void **, unsigned long *,
                    struct sqlexd *, const struct sqlcxp *);
extern void sqlbuft(void **, char *);
extern void sqlgs2t(void **, char *);
extern void sqlorat(void **, unsigned long *, void *);

/* Forms Interface */
static const int IAPSUCC = 0;
static const int IAPFAIL = 1403;
static const int IAPFTL  = 535;
extern void sqliem(char *, int *);

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* cud (compilation unit data) array */
static const short sqlcud0[] =
{10,4130,0,0,0,
5,0,0,1,0,0,27,47,0,0,4,4,0,1,0,1,1,0,0,1,10,0,0,1,10,0,0,1,10,0,0,
36,0,0,2,0,0,29,49,0,0,0,0,0,1,0,
51,0,0,3,17,0,122,60,0,0,0,0,0,1,0,
66,0,0,4,0,0,30,68,0,0,0,0,0,1,0,
81,0,0,5,0,0,32,90,0,0,0,0,0,1,0,
};


#include <stdio.h>
#include <string.h>
#include <oraca.h>
#include <sqlca.h>
#include <sqlcpr.h>

/* Variables-hotes */

/* EXEC SQL BEGIN DECLARE SECTION; */ 

  char    *userid = "Castpubs/Castpubs";             /* variable de connection */
  int     nb_row = 0;
  int     id;

  /* VARCHAR fname[20]; */ 
struct { unsigned short len; unsigned char arr[20]; } fname;

  /* VARCHAR lname[20]; */ 
struct { unsigned short len; unsigned char arr[20]; } lname;


/* EXEC SQL END DECLARE SECTION; */ 


/* EXEC SQL DECLARE authors TABLE                /o ...a cause du PL/SQL   o/
   (AU_ID     NUMBER(16,0)  NOT NULL ,        /o si l'option USERID= de o/
    AU_FNAME  VARCHAR2(20)  NOT NULL ,        /o pre-comp est omise     o/
    AU_LNAME  VARCHAR2(20)  NOT NULL ,
    ADDRESS   VARCHAR2(40)           ,
    CITY      VARCHAR2(20)           ,
    STATE        CHAR(2)             ,
    COUNTRY   VARCHAR2(12)           ,   
    POSTALCODE CHAR(10)              
    ); */ 


/* Variables diverses      */
	char    *chaine;
	int     return_code;       
/* Prototype des fonctions */

void sqlglm(char         *message_buffer,
            unsigned int *buffer_size,
            unsigned int *message_length);
void sql_error();

/* ------------------------------------------------------------------*/
/* Appel d'une function stockée PL/SQL                              */
/* ------------------------------------------------------------------*/

void main()
{
    /* EXEC SQL WHENEVER SQLERROR DO sql_error(); */ 

    /* EXEC SQL CONNECT :userid; */ 

{
    struct sqlexd sqlstm;
    sqlorat((void **)0, &sqlctx, &oraca);
    sqlstm.sqlvsn = 10;
    sqlstm.arrsiz = 4;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.iters = (unsigned int  )10;
    sqlstm.offset = (unsigned int  )5;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)256;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (         void  *)userid;
    sqlstm.sqhstl[0] = (unsigned int  )0;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         void  *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned int  )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqphsv = sqlstm.sqhstv;
    sqlstm.sqphsl = sqlstm.sqhstl;
    sqlstm.sqphss = sqlstm.sqhsts;
    sqlstm.sqpind = sqlstm.sqindv;
    sqlstm.sqpins = sqlstm.sqinds;
    sqlstm.sqparm = sqlstm.sqharm;
    sqlstm.sqparc = sqlstm.sqharc;
    sqlstm.sqpadto = sqlstm.sqadto;
    sqlstm.sqptdso = sqlstm.sqtdso;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
    if (sqlca.sqlcode < 0) sql_error();
}

 

	/* EXEC SQL COMMIT; */ 

{
 struct sqlexd sqlstm;
 sqlorat((void **)0, &sqlctx, &oraca);
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )36;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
 if (sqlca.sqlcode < 0) sql_error();
}


/*
	EXEC SQL EXECUTE
	    	DECLARE
		search VARCHAR2(40) := 'Unknown';
		BEGIN
		   SELECT count(*) INTO :nb_row FROM authors
		   WHERE address = search; 
		END;
	END-EXEC;
*/
	/* EXEC SQL CALL getauthors(); */ 

{
 struct sqlexd sqlstm;
 sqlorat((void **)0, &sqlctx, &oraca);
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "call getauthors()";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )51;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
 if (sqlca.sqlcode < 0) sql_error();
}


/*
	EXEC SQL EXECUTE
           BEGIN
                getauthors();
           END;
      END-EXEC;
*/
	/* EXEC SQL COMMIT RELEASE; */ 

{
 struct sqlexd sqlstm;
 sqlorat((void **)0, &sqlctx, &oraca);
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )66;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
 if (sqlca.sqlcode < 0) sql_error();
}



	printf("count(*)= %d \n",nb_row);
      printf("lname = %.*s \n",lname.len,lname.arr);
}

/* --------------------------------------------------------------------- */
/* Appel de la fonction Oracle qui retourne le message d'erreur integral */
/* --------------------------------------------------------------------- */
void sql_error()
{
	char         msg_buf[200];
	unsigned int msg_buf_len,msg_actual_len;

	msg_buf_len = sizeof (msg_buf);

	sqlglm(msg_buf,&msg_buf_len,&msg_actual_len);                
	
	printf("sqlcode = %d \n",sqlca.sqlcode);
	printf("%.*s \n",msg_buf_len,msg_buf);

	/* EXEC SQL WHENEVER SQLERROR CONTINUE; */ 

	/* EXEC SQL ROLLBACK RELEASE; */ 

{
 struct sqlexd sqlstm;
 sqlorat((void **)0, &sqlctx, &oraca);
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )81;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



} 