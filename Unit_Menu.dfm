object Form_Menu: TForm_Menu
  Left = 195
  Top = 146
  Width = 415
  Height = 324
  Caption = 'menu_Rodoviario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Empresa'
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Motorista'
    TabOrder = 1
  end
  object BitBtn3: TBitBtn
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Onibus'
    TabOrder = 2
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object ConexaoBDE: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1devsecnpi;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=Rodoviaria;Data Source=JUNIOR'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 232
  end
end
