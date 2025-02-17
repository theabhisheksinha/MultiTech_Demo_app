object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 495
  Top = 136
  Height = 241
  Width = 465
  object MS2000FCH: TDatabase
    AliasName = 'MS2000FCH'
    Connected = True
    DatabaseName = 'Castpubs'
    Params.Strings = (
      'DATABASE NAME=Castpubs'
      'USER NAME=sa'
      'ODBC DSN=MS2000FCH'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLQRYMODE='
      'LANGDRIVER='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'PASSWORD=')
    SessionName = 'Default'
    Left = 40
    Top = 16
  end
  object Find_by_tokens: TQuery
    DatabaseName = 'Castpubs'
    Left = 114
    Top = 16
  end
  object New_author: TQuery
    DatabaseName = 'Castpubs'
    Left = 189
    Top = 16
  end
  object Delete_author: TStoredProc
    DatabaseName = 'Castpubs'
    StoredProcName = 'GetAuthors;1'
    Left = 336
    Top = 16
  end
  object Update_author: TQuery
    DatabaseName = 'Castpubs'
    Left = 264
    Top = 16
  end
  object Table_authors: TTable
    Active = True
    DatabaseName = 'Castpubs'
    IndexName = 'auidind'
    TableName = 'authors'
    Left = 40
    Top = 72
  end
  object Table_titleview: TTable
    DatabaseName = 'Castpubs'
    TableName = 'titleview'
    Left = 112
    Top = 72
  end
  object Session1: TSession
    SessionName = 'Session1'
    OnStartup = Session1Startup
    Left = 192
    Top = 72
  end
end
