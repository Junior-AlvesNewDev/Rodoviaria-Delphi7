object Form1: TForm1
  Left = 201
  Top = 155
  Width = 928
  Height = 456
  Caption = 'Form1'
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
    Left = 400
    Top = 232
    Width = 75
    Height = 25
    Caption = 'bnt_fechar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object ADOQuery_Empresas: TADOQuery
    Connection = Form_Menu.ConexaoBDE
    Parameters = <>
    SQL.Strings = (
      'SELECT * FRM ORDER BY NOME')
    Left = 424
    Top = 288
  end
end