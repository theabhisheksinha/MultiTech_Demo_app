unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit_DataModule1, StdCtrls, dbcgrids, Mask, DBCtrls, DB;

type
  TForm4 = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    Button_OK: TButton;
    DataSource2: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure Button_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  constructor Create(ClassReference: Pointer;AOwner: TComponent); 
  end;

var
  Form4: TForm4;

implementation
{$R *.dfm}

uses Unit1;

type
   pAuthor= ^Author;
var
   pAuthor_local: pAuthor;

// Constructeur de la Form
constructor TForm4.Create(ClassReference: Pointer;AOwner: TComponent);
begin;
   inherited Create(AOwner);
   pAuthor_local := ClassReference;
end;
procedure TForm4.Button_OKClick(Sender: TObject);
begin
   Close;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  DataModule1.Table_titleview.Active := True;
  Form4.DataSource2.Enabled          := True;
  Form4.DBCtrlGrid1.Enabled          := True;

  { valorisation des champs texte de la Form }
  Form4.Caption := 'Titleview';

  Form4.DBEdit1.DataField := 'title';
  Form4.DBEdit2.DataField := 'au_ord';
  Form4.DBEdit3.DataField := 'au_lname';
  Form4.DBEdit4.DataField := 'price';
  Form4.DBEdit1.Enabled   := True;
  Form4.DBEdit2.Enabled   := True;
  Form4.DBEdit3.Enabled   := True;
  Form4.DBEdit4.Enabled   := True;
end;

end.
