object Form1: TForm1
  Left = 270
  Top = 106
  Width = 696
  Height = 461
  Caption = 'Castpubs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 96
    Top = 48
    Width = 441
    Height = 273
    DataSource = DataSource_authors
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button_New_author: TButton
    Left = 120
    Top = 344
    Width = 75
    Height = 25
    Caption = 'New author'
    TabOrder = 1
    OnClick = Button_New_authorClick
  end
  object Button_Update_author: TButton
    Left = 288
    Top = 344
    Width = 81
    Height = 25
    Caption = 'Update author'
    TabOrder = 2
    OnClick = Button_Update_authorClick
  end
  object Button_Delete_author: TButton
    Left = 448
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Delete author'
    TabOrder = 3
    OnClick = Button_Delete_authorClick
  end
  object DataSource_authors: TDataSource
    AutoEdit = False
    DataSet = DataModule1.Table_authors
    Left = 568
    Top = 72
  end
  object ActionList1: TActionList
    Left = 16
    Top = 48
    object FileExit1: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 43
    end
    object Action1: TAction
      Caption = 'Action1'
      OnExecute = Titleview1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Action = FileExit1
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object Titleview1: TMenuItem
        Action = Action1
        Caption = 'Titleview'
      end
    end
  end
end
