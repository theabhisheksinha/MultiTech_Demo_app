VERSION 5.00
Begin {C0E45035-5775-11D0-B388-00A0C9055D8E} CASTPubs_DataEnvironment 
   ClientHeight    =   5955
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10215
   _ExtentX        =   18018
   _ExtentY        =   10504
   FolderFlags     =   7
   TypeLibGuid     =   "{96271E88-A80C-11D3-B7E3-0010A4FDDF0A}"
   TypeInfoGuid    =   "{96271E89-A80C-11D3-B7E3-0010A4FDDF0A}"
   TypeInfoCookie  =   0
   Version         =   4
   NumConnections  =   3
   BeginProperty Connection1 
      ConnectionName  =   "ConnectionMicrosoft"
      ConnDispId      =   1001
      SourceOfData    =   3
      ConnectionSource=   "Provider=SQLOLEDB.1;Persist Security Info=False"
      Expanded        =   -1  'True
      IsSQL           =   -1  'True
      QuoteChar       =   34
      SeparatorChar   =   46
   EndProperty
   BeginProperty Connection2 
      ConnectionName  =   "ConnectionOracle"
      ConnDispId      =   1044
      SourceOfData    =   3
      ConnectionSource=   "Provider=MSDAORA.1;Persist Security Info=False"
      QuoteChar       =   34
      SeparatorChar   =   46
   EndProperty
   BeginProperty Connection3 
      ConnectionName  =   "ConnectionSybase"
      ConnDispId      =   1048
      SourceOfData    =   3
      ConnectionSource=   "Provider=MSDASQL.1;Persist Security Info=False"
      QuoteChar       =   34
      SeparatorChar   =   46
   EndProperty
   NumRecordsets   =   3
   BeginProperty Recordset1 
      CommandName     =   "LstAuthorsMicrosoft"
      CommDispId      =   1036
      RsDispId        =   1082
      CommandText     =   "Select t1.AU_LNAME ""Last Name"", t1.AU_FNAME ""First Name"" From   AUTHORS t1 Order By  t1.AU_LNAME  Asc, t1.AU_FNAME  Asc "
      ActiveConnectionName=   "ConnectionMicrosoft"
      CommandType     =   1
      GrandTotal      =   "rsLstAuthors"
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset2 
      CommandName     =   "LstAuthorsOracle"
      CommDispId      =   1041
      RsDispId        =   1045
      CommandText     =   "Select t1.AU_LNAME ""Last Name"", t1.AU_FNAME ""First Name"" From   AUTHORS t1 Order By  t1.AU_LNAME  Asc, t1.AU_FNAME  Asc "
      ActiveConnectionName=   "ConnectionOracle"
      CommandType     =   1
      GrandTotal      =   "rsLstAuthorsOracle"
      Expanded        =   -1  'True
      IsRSReturning   =   -1  'True
      NumFields       =   2
      BeginProperty Field1 
         Precision       =   0
         Size            =   40
         Scale           =   0
         Type            =   200
         Name            =   "Last Name"
         Caption         =   "Last Name"
      EndProperty
      BeginProperty Field2 
         Precision       =   0
         Size            =   20
         Scale           =   0
         Type            =   200
         Name            =   "First Name"
         Caption         =   "First Name"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset3 
      CommandName     =   "LstAuthorsSybase"
      CommDispId      =   1049
      RsDispId        =   1052
      CommandText     =   "SELECT au_lname ""Last Name"", au_fname ""First Name""  FROM authors ORDER BY au_lname, au_fname"
      ActiveConnectionName=   "ConnectionSybase"
      CommandType     =   1
      IsRSReturning   =   -1  'True
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
End
Attribute VB_Name = "CASTPubs_DataEnvironment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
