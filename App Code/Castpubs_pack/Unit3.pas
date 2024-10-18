unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, StdCtrls, Db, Unit_DataModule1;

type
  TForm3 = class(TForm2)
    procedure FormShow(Sender: TObject);
    procedure Button_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(ClassReference: Pointer;AOwner: TComponent); 
  end;

var
  Form3: TForm3;

implementation
{$R *.dfm}

uses Unit1;

type
   pAuthor= ^Author;
var
   pAuthor_local: pAuthor;

// Constructeur de la Form
constructor TForm3.Create(ClassReference: Pointer;AOwner: TComponent);
begin;
   inherited Create(ClassReference,AOwner);
   pAuthor_local := ClassReference;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  { valorisation des champs texte de la Form }
  Form3.Caption := 'GetTitleAuthors : if no, then delete this author';

  { protection des champs texte }
  Form3.Edit2_au_id.Enabled      := False;
  Form3.Edit2_au_lname.Enabled   := False;
  Form3.Edit2_au_fname.Enabled   := False;
  Form3.Edit2_phone.Enabled      := False;
  Form3.Edit2_address.Enabled    := False;
  Form3.Edit2_city.Enabled       := False;
  Form3.Edit2_city.Enabled       := False;
  Form3.Edit2_state.Enabled      := False;
  Form3.Edit2_country.Enabled    := False;
  Form3.Edit2_postalcode.Enabled := False;

  Form3.Edit2_au_id.Text      := String(pAuthor_local^.fAu_id);
  Form3.Edit2_au_lname.Text   := String(pAuthor_local^.fAu_lname);
  Form3.Edit2_au_fname.Text   := String(pAuthor_local^.fAu_fname);
  Form3.Edit2_phone.Text      := String(pAuthor_local^.fPhone);
  Form3.Edit2_address.Text    := String(pAuthor_local^.fAddress);
  Form3.Edit2_city.Text       := String(pAuthor_local^.fCity);
  Form3.Edit2_state.Text      := String(pAuthor_local^.fState);
  Form3.Edit2_country.Text    := String(pAuthor_local^.fCountry);
  Form3.Edit2_postalcode.Text := String(pAuthor_local^.fPostalcode);
end;

procedure TForm3.Button_OkClick(Sender: TObject);
var
   i: integer;

begin
   { formattage de l'appel de la stored procedure }
   with DataModule1 do
      begin
//      Delete_author.StoredProcName := 'GetAuthors'; {jeux d'essai Oracle uniquement}
        Delete_author.StoredProcName := 'GetTitleAuthors';
        Delete_author.ParamByName('@RETURN_VALUE').AsInteger := 0;
        Delete_author.ParamByName('@au_lname').AsString := Form3.Edit2_au_lname.Text;
        Delete_author.ParamByName('@au_fname').AsString := Form3.Edit2_au_fname.Text;

        try
          Delete_author.Prepare;
          Delete_author.ExecProc;
        except
          on Exception do ShowMessage('Stored proc GetTitleAuthors failed : You must manualy delete this author !');
        end;

   { delete réel de l'auteur }
        Find_by_tokens.Close;
        Find_by_tokens.SQL.Clear;
        Find_by_tokens.SQL.Add('Delete from authors ');
        Find_by_tokens.SQL.Add('where au_id = ');
        Find_by_tokens.SQL.Add(''''+ Trim(String(Form3.Edit2_au_id.Text)) +''' and ');
        Find_by_tokens.SQL.Add('au_lname = ');
        Find_by_tokens.SQL.Add(''''+ Trim(String(Form3.Edit2_au_lname.Text)) +''' and ');
        Find_by_tokens.SQL.Add('au_fname = ');
        Find_by_tokens.SQL.Add(''''+ Trim(String(Form3.Edit2_au_fname.Text))  +''';');

        try
        { pour tester uniquement }
          ShowMessage('SQL: '+String(Find_by_tokens.SQL[0])
                             +String(Find_by_tokens.SQL[1])
                             +String(Find_by_tokens.SQL[2])
                             +String(Find_by_tokens.SQL[3])
                             +String(Find_by_tokens.SQL[4])
                             +String(Find_by_tokens.SQL[5])
                             +String(Find_by_tokens.SQL[6]));
       {}
          Find_by_tokens.Prepared := True;
          Find_by_tokens.ExecSQL;
       { pour tester uniquement }
          ShowMessage(' RowsAffected='+ IntToStr(New_author.RowsAffected));
        {}
        except
          on Exception do ShowMessage('Delete author failed !');
        end;

      end;

   Close;
end;

end.
