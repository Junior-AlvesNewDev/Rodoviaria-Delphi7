object Form_motoristas: TForm_motoristas
  Left = 179
  Top = 267
  Width = 510
  Height = 397
  Caption = 'Motoristas'
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
    Left = 89
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 337
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Idade'
  end
  object Label4: TLabel
    Left = 377
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object Label5: TLabel
    Left = 409
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Sal'#225'rio'
  end
  object btm_fechar: TBitBtn
    Left = 200
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btm_fecharClick
  end
  object dbgrid_motoristas: TDBGrid
    Left = 16
    Top = 96
    Width = 457
    Height = 177
    DataSource = ds_motoristas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_num: TEdit
    Left = 16
    Top = 24
    Width = 57
    Height = 21
    MaxLength = 10
    TabOrder = 2
  end
  object edt_nome: TEdit
    Left = 81
    Top = 24
    Width = 248
    Height = 21
    MaxLength = 30
    TabOrder = 3
  end
  object btn_inserir: TBitBtn
    Left = 16
    Top = 56
    Width = 49
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
    OnClick = btn_inserirClick
  end
  object edt_idade: TEdit
    Left = 336
    Top = 24
    Width = 33
    Height = 21
    MaxLength = 10
    TabOrder = 5
  end
  object edt_sexo: TEdit
    Left = 376
    Top = 24
    Width = 25
    Height = 21
    MaxLength = 10
    TabOrder = 6
  end
  object edt_salario: TEdit
    Left = 408
    Top = 24
    Width = 65
    Height = 21
    MaxLength = 10
    TabOrder = 7
  end
  object btn_alterar: TButton
    Left = 80
    Top = 56
    Width = 65
    Height = 25
    Caption = 'Alterar'
    TabOrder = 8
    OnClick = btn_alterarClick
  end
  object btn_salvar: TButton
    Left = 160
    Top = 56
    Width = 97
    Height = 25
    Caption = 'Salvar Altera'#231#227'o'
    TabOrder = 9
    OnClick = btn_salvarClick
  end
  object btn_excluir: TButton
    Left = 280
    Top = 56
    Width = 57
    Height = 25
    Caption = 'Excluir'
    TabOrder = 10
    OnClick = btn_excluirClick
  end
  object adoquery_motoristas: TADOQuery
    Connection = Form_Menu.ConexaoBD
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM MOTORISTAS'
      'ORDER BY NOME')
    Left = 8
    Top = 320
  end
  object ds_motoristas: TDataSource
    DataSet = adoquery_motoristas
    Left = 48
    Top = 320
  end
  object adoquery_aux: TADOQuery
    Connection = Form_Menu.ConexaoBD
    Parameters = <>
    SQL.Strings = (
      'SELECT COD_MOTORISTA AS Codigo,'
      '       NOME AS Nome,'
      #9'IDADE AS Idade,'
      #9'SEXO AS Sexo,'
      #9'SALARIO AS Sal'#225'rio'
      'FROM MOTORISTAS'
      'ORDER BY NOME')
    Left = 296
    Top = 320
  end
end
