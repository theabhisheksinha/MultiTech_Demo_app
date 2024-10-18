//******************************************************************************
//** JL10: DEVELOPPEMENT DES CARTES JOB,JCLLIB,JOBLIB,OUTPUT,STEPLIB          **
//**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-***
//** ! UN COMMENTAIRE D'INSTRUCTION= X-COMMENT-X  A PARFOIS ETE AJOUTE        **
//******************************************************************************
//* REGLE DE FORMATTAGE A UTILISER:
//*+-----+-+---+------------------------------------------------------++-------+
//*4    1012  16                                                     71       80
//*
//CLIA     JOB (12A75,'CASTFR\R&D'),FCH,ADDRSPC=VIRT,CLASS=A,
//             MSGCLASS=Z,MSGLEVEL=(1,0),COND=((0,GE),(30,LT)),
//             REGION=64M,TIME=1440,RESTART=*,NOTIFY=FCH,TYPRUN=SCAN
//*
//* JCLLIB
//CLIALIB  JCLLIB ORDER=(FIRST.INCLIB,SECOND.INCLIB) X-COMMENT-X
//*
//* JOBLIB
//JOBLIB   DD DSN=PROD.JOBLIB,DISP=SHR               X-COMMENT-X
//         DD DSN=TEST.JOBLIB,DISP=SHR               X-COMMENT-X
//*
//* OUTPUT: IMPRESSION SYSOUT
//OUTCLIA  OUTPUT ADDRESS=('CAST 3 r M. Allegot'),BUILDING=('chateau'),
//             DEPT='R&D',CHARS=GT12,CLASS=*,CONTROL=PROGRAM,
//             DEST=LOCAL,COPIES=(,(8,25,18,83)),FORMDEF=STDREPORT,
//             FORMS=MYREPORT,OUTDISP=(,PURGE),OVERLAYB=MYOVERLY
//*
//* EXEC TEST0
//TEST0STP EXEC PGM=TEST0                            
//*
//* STEPLIB
//STEPLIB  DD DSN=PROD.STEPLIB,DISP=SHR              X-COMMENT-X
//*
//* CARTES DD PARTICULIERES
//*
//*
//TEST1STP EXEC PGM=TEST1                            
//*
//* STEPLIB
//STEPLIB  DD DSN=PROD.STEPLIB,DISP=SHR              X-COMMENT-X
//*
//TEST2STP EXEC PGM=TEST2                            
//*
//* STEPLIB
//STEPLIB  DD DSN=PROD.STEPLIB,DISP=SHR              X-COMMENT-X
//*
//MYRF     EXEC PGM=MYRF2,PARM=CLIA
//* CARTES DD PARTICULIERES
//* END OF JOB
//
