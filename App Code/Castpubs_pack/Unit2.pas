unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit_DataModule1;

type
  TForm2 = class(TForm)
    Edit2_au_id: TEdit;
    Edit2_au_lname: TEdit;
    Edit2_au_fname: TEdit;
    Edit2_phone: TEdit;
    Edit2_address: TEdit;
    Edit2_city: TEdit;
    Edit2_state: TEdit;
    Edit2_country: TEdit;
    Edit2_postalcode: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button_Ok: TButton;
    Button_Cancel: TButton;
    procedure Button_CancelClick(Sender: TObject); virtual;
    procedure FormShow(Sender: TObject);
    procedure Button_OkClick(Sender: TObject);
    procedure Edit2_au_idExit(Sender: TObject);
    procedure Edit2_addressExit(Sender: TObject);
    procedure Edit2_au_fnameExit(Sender: TObject);
    procedure Edit2_au_lnameExit(Sender: TObject);
    procedure Edit2_cityExit(Sender: TObject);
    procedure Edit2_countryExit(Sender: TObject);
    procedure Edit2_phoneExit(Sender: TObject);
    procedure Edit2_postalcodeExit(Sender: TObject);
    procedure Edit2_stateExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(ClassReference: Pointer;AOwner: TComponent);
  end;

var
  Form2: TForm2;

implementation
{$R *.dfm}

uses Unit1;

type
   pAuthor= ^Author;
var
   pAuthor_local: pAuthor;

// Prototypes des procédures et fonctions
procedure Update_author_procedure; forward;
procedure Insert_author_procedure; forward;

// Constructeur de la Form
constructor TForm2.Create(ClassReference: Pointer;AOwner: TComponent);
begin;
   inherited Create(AOwner);
   pAuthor_local := ClassReference;
end;

procedure TForm2.Button_CancelClick(Sender: TObject);
begin
   Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
   { valorisation des champs texte de la Form }
   if String(pAuthor_local^.fAu_id) = '' then
     Form2.Caption := 'Insert author'
   else
     Form2.Caption := 'Update author';

   Form2.Edit2_au_id.Text      := String(pAuthor_local^.fAu_id);
   Form2.Edit2_au_lname.Text   := String(pAuthor_local^.fAu_lname);
   Form2.Edit2_au_fname.Text   := String(pAuthor_local^.fAu_fname);
   Form2.Edit2_phone.Text      := String(pAuthor_local^.fPhone);
   Form2.Edit2_address.Text    := String(pAuthor_local^.fAddress);
   Form2.Edit2_city.Text       := String(pAuthor_local^.fCity);
   Form2.Edit2_state.Text      := String(pAuthor_local^.fState);
   Form2.Edit2_country.Text    := String(pAuthor_local^.fCountry);
   Form2.Edit2_postalcode.Text := String(pAuthor_local^.fPostalcode);
end;

procedure TForm2.Button_OkClick(Sender: TObject);
begin
//
// Contrôles de base : champs NOT NULL et l'author doit exister dans la base Authors
//
  { contrôle champs NOT NULL }
  pAuthor_local^.SetAu_id(Form2.Edit2_au_id.Text);
  pAuthor_local^.SetAu_lname(Form2.Edit2_au_lname.Text);
  pAuthor_local^.SetAu_fname(Form2.Edit2_au_fname.Text);
  pAuthor_local^.SetPhone(Form2.Edit2_phone.Text);
  { valorisation des autres champs de l'objet }
  pAuthor_local^.fAddress    := Form2.Edit2_address.Text;
  pAuthor_local^.fCity       := Form2.Edit2_city.Text;
  pAuthor_local^.fState      := Form2.Edit2_state.Text;
  pAuthor_local^.fCountry    := Form2.Edit2_country.Text;
  pAuthor_local^.fPostalcode := Form2.Edit2_postalcode.Text;

  { contrôle existence préalable de l'author }
  with DataModule1 do
     begin
        Find_by_tokens.Close;
        Find_by_tokens.SQL.Clear;
        Find_by_tokens.SQL.Add('Select count(*) from authors where au_id='+''''+
                                String(Form2.Edit2_au_id.Text) +'''');
        try
        { pour debugger uniquement }
          ShowMessage('SQL :'+String(Find_by_tokens.SQL[0]) );
        {}
          Find_by_tokens.Open;
        except
          on Exception do ShowMessage('Error on Select count(*) from authors where au_id=...');
        end;
        { test du nombre de lignes retournées : Si 1, alors c'est une mise à jour
                                                Si 0, alors c'est une création }
        ShowMessage('SQL :'+IntToStr(Find_by_tokens.Fields.Fields[0].AsInteger) );
        if Find_by_tokens.Fields.Fields[0].AsInteger = 0 then
          Insert_author_procedure
        else
          Update_author_procedure;
     end;
   Close;

end;

//
// CREATION D'UN AUTHOR
//
procedure Insert_author_procedure;
begin
//
// Si l'author n'existe pas, alors on le crée
//
 with DataModule1 do
     begin
        New_author.Close;
        New_author.SQL.Clear;
        New_author.SQL.Add('Insert into authors ');
        New_author.SQL.Add('(au_id,au_lname,au_fname,phone,address,city,country,state,postalcode) values');
        New_author.SQL.Add('('''+ Trim(String(Form2.Edit2_au_id.Text))    +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_au_lname.Text))  +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_au_fname.Text))  +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_phone.Text))     +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_address.Text))   +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_city.Text))      +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_country.Text))   +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_state.Text))     +''',');
        New_author.SQL.Add(''''+ Trim(String(Form2.Edit2_postalcode.Text))+''')');
        try
        { pour tester uniquement }
          ShowMessage('au_id:'+IntToStr(Length(String(Form2.Edit2_au_id.Text))));
          ShowMessage('au_lname:'+IntToStr(Length(String(Form2.Edit2_au_lname.Text))));
          ShowMessage('au_fname:'+IntToStr(Length(String(Form2.Edit2_au_fname.Text))));
          ShowMessage('phone:'+IntToStr(Length(String(Form2.Edit2_phone.Text))));
          ShowMessage('address:'+IntToStr(Length(String(Form2.Edit2_address.Text))));
          ShowMessage('city:'+IntToStr(Length(String(Form2.Edit2_city.Text))));
          ShowMessage('country:'+IntToStr(Length(String(Form2.Edit2_country.Text))));
          ShowMessage('state:'+IntToStr(Length(String(Form2.Edit2_state.Text))));
          ShowMessage('postalcode:'+IntToStr(Length(String(Form2.Edit2_postalcode.Text))));
          ShowMessage('SQL: '+String(New_author.SQL[0])
                             +String(New_author.SQL[1])
                             +String(New_author.SQL[2])
                             +String(New_author.SQL[3])
                             +String(New_author.SQL[4])
                             +String(New_author.SQL[5])
                             +String(New_author.SQL[6])
                             +String(New_author.SQL[7])
                             +String(New_author.SQL[8])
                             +String(New_author.SQL[9])
                             +String(New_author.SQL[10]) );
       {}
          New_author.Prepared := True;
          New_author.ExecSQL;
       { pour tester uniquement }
          ShowMessage(' RowsAffected='+ IntToStr(New_author.RowsAffected));
        {}
        except
          on Exception do ShowMessage('Insert author failed !');
        end;

     end;
end;

//
// UPDATE D'UN AUTHOR
//
procedure Update_author_procedure;
begin
//
// Si l'author existe bien, on peut le mettre à jour
//
  with DataModule1 do
     begin
        Update_author.Close;
        Update_author.SQL.Clear;
        Update_author.SQL.Add('Update authors set ');
        Update_author.SQL.Add('au_id='      +''''+ Trim(String(Form2.Edit2_au_id.Text))     +''',');
        Update_author.SQL.Add('au_lname='   +''''+ Trim(String(Form2.Edit2_au_lname.Text))  +''',');
        Update_author.SQL.Add('au_fname='   +''''+ Trim(String(Form2.Edit2_au_fname.Text))  +''',');
        Update_author.SQL.Add('phone='      +''''+ Trim(String(Form2.Edit2_phone.Text))     +''',');
        Update_author.SQL.Add('address='    +''''+ Trim(String(Form2.Edit2_address.Text))   +''',');
        Update_author.SQL.Add('city='       +''''+ Trim(String(Form2.Edit2_city.Text))      +''',');
        Update_author.SQL.Add('country='    +''''+ Trim(String(Form2.Edit2_country.Text))   +''',');
        Update_author.SQL.Add('state='      +''''+ Trim(String(Form2.Edit2_state.Text))     +''',');
        Update_author.SQL.Add('postalcode=' +''''+ Trim(String(Form2.Edit2_postalcode.Text))+''' ');
        Update_author.SQL.Add('where au_id='+''''+ Trim(String(Form2.Edit2_au_id.Text))     +'''');
        try
        { pour debugger uniquement
          ShowMessage('au_id:'+IntToStr(Length(String(Form2.Edit2_au_id.Text))));
          ShowMessage('au_lname:'+IntToStr(Length(String(Form2.Edit2_au_lname.Text))));
          ShowMessage('au_fname:'+IntToStr(Length(String(Form2.Edit2_au_fname.Text))));
          ShowMessage('phone:'+IntToStr(Length(String(Form2.Edit2_phone.Text))));
          ShowMessage('address:'+IntToStr(Length(String(Form2.Edit2_address.Text))));
          ShowMessage('city:'+IntToStr(Length(String(Form2.Edit2_city.Text))));
          ShowMessage('country:'+IntToStr(Length(String(Form2.Edit2_country.Text))));
          ShowMessage('state:'+IntToStr(Length(String(Form2.Edit2_state.Text))));
          ShowMessage('postalcode:'+IntToStr(Length(String(Form2.Edit2_postalcode.Text))));
          ShowMessage('SQL: '+String(Update_author.SQL[0])
                             +String(Update_author.SQL[1])
                             +String(Update_author.SQL[2])
                             +String(Update_author.SQL[3])
                             +String(Update_author.SQL[4])
                             +String(Update_author.SQL[5])
                             +String(Update_author.SQL[6])
                             +String(Update_author.SQL[7])
                             +String(Update_author.SQL[8])
                             +String(Update_author.SQL[9])
                             +String(Update_author.SQL[10]) );
       }
          Update_author.Prepared := True;
          Update_author.ExecSQL;
       { pour debugger uniquement }
          ShowMessage(' RowsAffected='+ IntToStr(Update_author.RowsAffected));
        {}
        except
          on Exception do ShowMessage('Update author failed !');
        end;

     end;
end;

procedure TForm2.Edit2_au_idExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_addressExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_au_fnameExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_au_lnameExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_cityExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_countryExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_phoneExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_postalcodeExit(Sender: TObject);
begin
    Refresh;
end;

procedure TForm2.Edit2_stateExit(Sender: TObject);
begin
    Refresh;
end;

end.
