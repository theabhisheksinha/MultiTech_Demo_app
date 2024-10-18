object Form2: TForm2
  Left = 408
  Top = 178
  Width = 430
  Height = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 16
    Width = 26
    Height = 13
    Caption = 'au_id'
  end
  object Label2: TLabel
    Left = 72
    Top = 58
    Width = 46
    Height = 13
    Caption = 'au_lname'
  end
  object Label3: TLabel
    Left = 72
    Top = 100
    Width = 47
    Height = 13
    Caption = 'au_fname'
  end
  object Label4: TLabel
    Left = 72
    Top = 142
    Width = 30
    Height = 13
    Caption = 'phone'
  end
  object Label5: TLabel
    Left = 72
    Top = 184
    Width = 37
    Height = 13
    Caption = 'address'
  end
  object Label6: TLabel
    Left = 72
    Top = 226
    Width = 16
    Height = 13
    Caption = 'city'
  end
  object Label7: TLabel
    Left = 72
    Top = 268
    Width = 23
    Height = 13
    Caption = 'state'
  end
  object Label8: TLabel
    Left = 72
    Top = 310
    Width = 35
    Height = 13
    Caption = 'country'
  end
  object Label9: TLabel
    Left = 72
    Top = 352
    Width = 52
    Height = 13
    Caption = 'postalcode'
  end
  object Edit2_au_id: TEdit
    Left = 184
    Top = 16
    Width = 121
    Height = 21
    MaxLength = 11
    TabOrder = 0
    OnExit = Edit2_au_idExit
  end
  object Edit2_au_lname: TEdit
    Left = 184
    Top = 57
    Width = 121
    Height = 21
    MaxLength = 40
    TabOrder = 1
    OnExit = Edit2_au_lnameExit
  end
  object Edit2_au_fname: TEdit
    Left = 184
    Top = 98
    Width = 121
    Height = 21
    MaxLength = 20
    TabOrder = 2
    OnExit = Edit2_au_fnameExit
  end
  object Edit2_phone: TEdit
    Left = 184
    Top = 139
    Width = 121
    Height = 21
    MaxLength = 12
    TabOrder = 3
    OnExit = Edit2_phoneExit
  end
  object Edit2_address: TEdit
    Left = 184
    Top = 180
    Width = 121
    Height = 21
    MaxLength = 40
    TabOrder = 4
    OnExit = Edit2_addressExit
  end
  object Edit2_city: TEdit
    Left = 184
    Top = 221
    Width = 121
    Height = 21
    MaxLength = 20
    TabOrder = 5
    OnExit = Edit2_cityExit
  end
  object Edit2_state: TEdit
    Left = 184
    Top = 262
    Width = 121
    Height = 21
    MaxLength = 2
    TabOrder = 6
    OnExit = Edit2_stateExit
  end
  object Edit2_country: TEdit
    Left = 184
    Top = 303
    Width = 121
    Height = 21
    MaxLength = 12
    TabOrder = 7
    OnExit = Edit2_countryExit
  end
  object Edit2_postalcode: TEdit
    Left = 184
    Top = 344
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 8
    OnExit = Edit2_postalcodeExit
  end
  object Button_Ok: TButton
    Left = 112
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 9
    OnClick = Button_OkClick
  end
  object Button_Cancel: TButton
    Left = 229
    Top = 400
    Width = 81
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 10
    OnClick = Button_CancelClick
  end
end
