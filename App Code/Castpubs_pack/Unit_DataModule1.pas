unit Unit_DataModule1;

interface

uses
  SysUtils, Classes, DBTables, DB;

type
  TDataModule1 = class(TDataModule)
    MS2000FCH: TDatabase;
    Find_by_tokens: TQuery;
    New_author: TQuery;
    Delete_author: TStoredProc;
    Update_author: TQuery;
    Table_authors: TTable;
    Table_titleview: TTable;
    Session1: TSession;
    procedure Session1Startup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure End_of_Session;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.Session1Startup(Sender: TObject);
begin
   Session1.OpenDatabase('database_fch');
   DataModule1.End_of_Session;
end;
procedure TDataModule1.End_of_Session;
begin
   Session1.CloseDatabase(DataModule1.MS2000FCH);
end;

end.
