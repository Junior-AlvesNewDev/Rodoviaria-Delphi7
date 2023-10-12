object form_empresas: Tform_empresas
  Left = 180
  Top = 289
  Width = 513
  Height = 368
  Caption = 'Empresas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 136
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object BitBtn1: TBitBtn
    Left = 209
    Top = 288
    Width = 78
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object dbgrid_empresas: TDBGrid
    Left = 16
    Top = 80
    Width = 465
    Height = 168
    DataSource = ds_empresas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_cod: TEdit
    Left = 16
    Top = 24
    Width = 81
    Height = 21
    MaxLength = 10
    TabOrder = 2
  end
  object edt_nome: TEdit
    Left = 128
    Top = 24
    Width = 353
    Height = 21
    MaxLength = 30
    TabOrder = 3
  end
  object btn_inserir: TBitBtn
    Left = 176
    Top = 48
    Width = 41
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = btn_inserirClick
  end
  object btn_alterar: TButton
    Left = 232
    Top = 48
    Width = 41
    Height = 25
    Caption = 'Alterar'
    TabOrder = 5
    OnClick = btn_alterarClick
  end
  object btn_salvar: TButton
    Left = 288
    Top = 48
    Width = 97
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 6
    OnClick = btn_salvarClick
  end
  object btn_excluir: TButton
    Left = 408
    Top = 48
    Width = 57
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btn_excluirClick
  end
  object adoquery_empresas: TADOQuery
    Connection = Form_Menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM EMPRESAS'
      'ORDER BY NOME')
    Left = 16
    Top = 288
  end
  object ds_empresas: TDataSource
    DataSet = adoquery_empresas
    Left = 48
    Top = 288
  end
  object adoquery_aux: TADOQuery
    Connection = Form_Menu.ConexaoBD
    Parameters = <>
    Left = 312
    Top = 288
  end
end
