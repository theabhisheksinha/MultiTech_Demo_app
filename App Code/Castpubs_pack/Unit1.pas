unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit_DataModule1, DB, StdCtrls, Grids, DBGrids, Menus, ActnList,
  StdActns;

type
  IisDisplayed = interface
      procedure DisplayMessage;
  end;
{ DEFINITION DE LA CLASSE AUTHOR }
  Author = class(TInterfacedObject,IisDisplayed)
  private
  { Private declarations }
  public
   { Public declarations }
     fAu_id:      String;
     fAu_lname:   String;
     fAu_fname:   String;
     fPhone:      String;
     fAddress:    String;
     fCity:       String;
     fState:      String;
     fCountry:    String;
     fPostalcode: String;

     constructor Create;  virtual;
     destructor  Destroy; override;
     procedure DisplayMessage;
     procedure SetAu_id (valeur: String);
     procedure SetAu_lname (valeur: String);
     procedure SetAu_fname (valeur: String);
     procedure SetPhone (valeur: String);
     property Au_id: String
         read fAu_id
        write SetAu_id;
     property Au_lname: String
         read fAu_lname
        write SetAu_lname;
     property Au_fname: String
         read fAu_fname
        write SetAu_fname;
     property Phone: String
         read fPhone
        write SetPhone;
  end;

{ DEFINITION DE LA FORM }
  TForm1 = class(TForm)
    DataSource_authors: TDataSource;
    DBGrid1: TDBGrid;
    Button_New_author: TButton;
    Button_Update_author: TButton;
    Button_Delete_author: TButton;
    ActionList1: TActionList;
    FileExit1: TFileExit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    Titleview1: TMenuItem;
    Action1: TAction;
    procedure Exit1Click(Sender: TObject);
    procedure Button_New_authorClick(Sender: TObject);
    procedure Button_Update_authorClick(Sender: TObject);
    procedure Button_Delete_authorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Titleview1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    This_Author: Author;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}

{ METHODES DE LA CLASSE AUTHOR }
// Constructeur de l'objet Author
constructor Author.Create;
begin
   inherited;
   fAu_id      := '';
   fAu_lname   := '';
   fAu_fname   := '';
   fPhone      := '';
   fAddress    := '';
   fCity       := '';
   fState      := '';
   fCountry    := '';
   fPostalcode := '';
end;

destructor Author.Destroy;
begin
  inherited;
end;
// Implémentation de l'interface IisDisplayed
procedure Author.DisplayMessage;
begin
   ShowMessage('Message from the interface IisDisplayed');
end;
// Procédures de vérification des champs NOT NULL
//  Au_id is NOT NULL
procedure Author.SetAu_id(valeur: String);
begin
  if valeur <> '' then
    fAu_id := valeur
  else
    begin
      ShowMessage('Une valeur NULL est interdite');
    end;
end;
//  Au_lname is NOT NULL
procedure Author.SetAu_lname(valeur: String);
begin
  if valeur <> '' then
    fAu_lname := valeur
  else
    begin
      ShowMessage('Une valeur NULL est interdite');
    end;
end;
//  Au_fname is NOT NULL
procedure Author.SetAu_fname(valeur: String);
begin
  if valeur <> '' then
    fAu_fname := valeur
  else
    begin
      ShowMessage('Une valeur NULL est interdite');
    end;
end;
//  Au_Phone is NOT NULL
procedure Author.SetPhone(valeur: String);
begin
  if valeur <> '' then
    fPhone := valeur
  else
    begin
      ShowMessage('Une valeur NULL est interdite');
    end;
end;
{Fin des méthodes de la classe AUTHOR }

{ GESTION DE LA FORM }
// Affichage d'une message box lors de la fermeture
//
procedure MYRF(); forward;
procedure TForm1.Exit1Click(Sender: TObject);
begin
// Destruction de l'objet Author
    if Addr(This_Author) <> nil then This_Author.Destroy;

// Gestion de la déconnection - Desactivation des composants d'interface
   Form1.DataSource_authors.Enabled := False;
   DataModule1.Table_authors.Active := False;
   DataModule1.MS2000FCH.Connected := False;
   MYRF;
   Close;

end;

procedure TForm1.Button_New_authorClick(Sender: TObject);
begin
   { instanciation de la classe Author }
   This_Author := Author.Create;

   { appel de la Form2 }
   Form2 := TForm2.Create(Addr(This_Author),Form1);
   Form2.ModalResult := mrNone;
   Form2.ShowModal;
   Form2.Free;

   { Mise à jour de la Grid }
   if DataModule1.Table_authors.State <> dsBrowse then
     begin
        DataModule1.Table_authors.Active := True;
        Form1.DataSource_authors.Enabled := True;
     end;
   DataModule1.Table_authors.Refresh;
   DBGrid1.Refresh;
end;

procedure TForm1.Button_Update_authorClick(Sender: TObject);
var
  i      : Integer;
  s      : String;
begin
//
// Détermination de la ligne sélectionnée -
// Passage d'un pointeur sur la classe Author à la Form suivante
//
   if Form1.DBGrid1.SelectedRows.Count > 0 then
     if Form1.DBGrid1.SelectedRows.Count = 1 then
       begin
         { positionnement sur le dataset
         à partir de la ligne sélectionnée sur la DBGrid }
         with DBGrid1.DataSource.DataSet do
           begin
              Bookmark := DBGrid1.SelectedRows.Items[0];
           end;

         { instanciation de la classe Author }
         This_Author := Author.Create;

        { pour tester uniquement ....
         for i:= 0 to DBGrid1.DataSource.DataSet.FieldCount - 1 do
           begin
              s := s + DBGrid1.DataSource.DataSet.Fields[i].AsString;
           end;
          ShowMessage(s);
         }

         { valorisation des champs de la classe Author }
         This_Author.fAu_id      := DBGrid1.DataSource.DataSet.Fields[0].AsString;
         This_Author.fAu_lname   := DBGrid1.DataSource.DataSet.Fields[1].AsString;
         This_Author.fAu_fname   := DBGrid1.DataSource.DataSet.Fields[2].AsString;
         This_Author.fPhone      := DBGrid1.DataSource.DataSet.Fields[3].AsString;
         This_Author.fAddress    := DBGrid1.DataSource.DataSet.Fields[4].AsString;
         This_Author.fCity       := DBGrid1.DataSource.DataSet.Fields[5].AsString;
         This_Author.fState      := DBGrid1.DataSource.DataSet.Fields[6].AsString;
         This_Author.fCountry    := DBGrid1.DataSource.DataSet.Fields[7].AsString;
         This_Author.fPostalcode := DBGrid1.DataSource.DataSet.Fields[8].AsString;

         { appel de la Form2 }
         This_Author.DisplayMessage ;
         Form2 := TForm2.Create(Addr(This_Author),Form1);
         Form2.ModalResult := mrNone;
         Form2.ShowModal;
         Form2.Free;

         { Mise à jour de la Grid }
         if DataModule1.Table_authors.State <> dsBrowse then
         begin
            DataModule1.Table_authors.Active := True;
            Form1.DataSource_authors.Enabled := True;
         end;
         DataModule1.Table_authors.Refresh;
         DBGrid1.Refresh;
       end
     else
       Application.MessageBox('Too much selection performed !','Warning',MB_OK)
   else
     Application.MessageBox('No selection performed !','Warning',MB_OK);
end;

procedure TForm1.Button_Delete_authorClick(Sender: TObject);
var
  i      : Integer;
  s      : String;
begin
//
// Détermination de la ligne sélectionnée -
// Passage d'un pointeur sur la classe Author à la Form suivante
//
   if Form1.DBGrid1.SelectedRows.Count > 0 then
     if Form1.DBGrid1.SelectedRows.Count = 1 then
       begin
         { positionnement sur le dataset
         à partir de la ligne sélectionnée sur la DBGrid }
         with DBGrid1.DataSource.DataSet do
           begin
              Bookmark := DBGrid1.SelectedRows.Items[0];
           end;

         { instanciation de la classe Author }
         This_Author := Author.Create;

        { pour tester uniquement ....
         for i:= 0 to DBGrid1.DataSource.DataSet.FieldCount - 1 do
           begin
              s := s + DBGrid1.DataSource.DataSet.Fields[i].AsString;
           end;
          ShowMessage(s);
         }

         { valorisation des champs de la classe Author }
         This_Author.fAu_id      := DBGrid1.DataSource.DataSet.Fields[0].AsString;
         This_Author.fAu_lname   := DBGrid1.DataSource.DataSet.Fields[1].AsString;
         This_Author.fAu_fname   := DBGrid1.DataSource.DataSet.Fields[2].AsString;
         This_Author.fPhone      := DBGrid1.DataSource.DataSet.Fields[3].AsString;
         This_Author.fAddress    := DBGrid1.DataSource.DataSet.Fields[4].AsString;
         This_Author.fCity       := DBGrid1.DataSource.DataSet.Fields[5].AsString;
         This_Author.fState      := DBGrid1.DataSource.DataSet.Fields[6].AsString;
         This_Author.fCountry    := DBGrid1.DataSource.DataSet.Fields[7].AsString;
         This_Author.fPostalcode := DBGrid1.DataSource.DataSet.Fields[8].AsString;

         { appel de la Form3 }
         Form3 := TForm3.Create(Addr(This_Author),Form1);
         Form3.ModalResult := mrNone;
         Form3.ShowModal;
         Form3.Free;

         { Mise à jour de la Grid }
         if DataModule1.Table_authors.State <> dsBrowse then
           begin
             DataModule1.Table_authors.Active := True;
             Form1.DataSource_authors.Enabled := True;
           end;
         DataModule1.Table_authors.Refresh;
         DBGrid1.Refresh;
       end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
// Gestion de la connection - Activation des composants d'interface
   DataModule1.Table_authors.Active := True;
   Form1.DataSource_authors.Enabled := True;
end;

procedure TForm1.Titleview1Click(Sender: TObject);
var
  i      : Integer;
  s      : String;
begin
//
// Détermination de la ligne sélectionnée -
// Passage d'un pointeur sur la classe Author à la Form suivante
//
   if Form1.DBGrid1.SelectedRows.Count > 0 then
     if Form1.DBGrid1.SelectedRows.Count = 1 then
       begin
         { positionnement sur le dataset
         à partir de la ligne sélectionnée sur la DBGrid }
         with DBGrid1.DataSource.DataSet do
           begin
              Bookmark := DBGrid1.SelectedRows.Items[0];
           end;

         { instanciation de la classe Author }
         This_Author := Author.Create;

        { pour tester uniquement ....
         for i:= 0 to DBGrid1.DataSource.DataSet.FieldCount - 1 do
           begin
              s := s + DBGrid1.DataSource.DataSet.Fields[i].AsString;
           end;
          ShowMessage(s);
         }

         { valorisation des champs de la classe Author }
         This_Author.fAu_id      := DBGrid1.DataSource.DataSet.Fields[0].AsString;
         This_Author.fAu_lname   := DBGrid1.DataSource.DataSet.Fields[1].AsString;
         This_Author.fAu_fname   := DBGrid1.DataSource.DataSet.Fields[2].AsString;
         This_Author.fPhone      := DBGrid1.DataSource.DataSet.Fields[3].AsString;
         This_Author.fAddress    := DBGrid1.DataSource.DataSet.Fields[4].AsString;
         This_Author.fCity       := DBGrid1.DataSource.DataSet.Fields[5].AsString;
         This_Author.fState      := DBGrid1.DataSource.DataSet.Fields[6].AsString;
         This_Author.fCountry    := DBGrid1.DataSource.DataSet.Fields[7].AsString;
         This_Author.fPostalcode := DBGrid1.DataSource.DataSet.Fields[8].AsString;

         { appel de la Form4 }
         Form4 := TForm4.Create(Addr(This_Author),Form1);
         Form4.ModalResult := mrNone;
         Form4.ShowModal;
         Form4.Free;

         { Mise à jour de la Grid }
         if DataModule1.Table_authors.State <> dsBrowse then
           begin
             DataModule1.Table_authors.Active := True;
             Form1.DataSource_authors.Enabled := True;
           end;
         DataModule1.Table_authors.Refresh;
         DBGrid1.Refresh;
       end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    MYRF;
end;

procedure MYRF();
var
    MYRF_v: String;
begin
    MYRF_v := 'MYRF';
    ShowMessage(MYRF_v);
end;
end.
