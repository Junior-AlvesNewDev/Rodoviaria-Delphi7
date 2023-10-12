object Form_onibus: TForm_onibus
  Left = 195
  Top = 304
  Width = 545
  Height = 395
  Caption = #212'nibus'
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
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel
    Left = 152
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Trajeto'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 43
    Height = 13
    Caption = 'Motorista'
  end
  object Label4: TLabel
    Left = 184
    Top = 48
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object btn_fechar: TBitBtn
    Left = 200
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 0
    OnClick = btn_fecharClick
  end
  object dbgrid_onibus: TDBGrid
    Left = 16
    Top = 128
    Width = 497
    Height = 177
    DataSource = ds_onibus
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_num: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edt_trajeto: TEdit
    Left = 152
    Top = 24
    Width = 305
    Height = 21
    TabOrder = 3
  end
  object cb_motorista: TComboBox
    Left = 8
    Top = 64
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = cb_motoristaChange
  end
  object cb_empresa: TComboBox
    Left = 184
    Top = 64
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = cb_empresaChange
  end
  object Inserir: TButton
    Left = 8
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 6
    OnClick = InserirClick
  end
  object btn_alterar: TButton
    Left = 96
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 7
    OnClick = btn_alterarClick
  end
  object btn_salvar: TButton
    Left = 184
    Top = 96
    Width = 97
    Height = 25
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 8
    OnClick = btn_salvarClick
  end
  object btn_excluir: TButton
    Left = 304
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 9
    OnClick = btn_excluirClick
  end
  object adoquery_onibus: TADOQuery
    Connection = Form_Menu.ConexaoBD
    Parameters = <>
    SQL.Strings = (
      'SELECT  O.COD_ONIBUS AS ONIBUS,'
      #9#9'E.NOME AS EMPRESA,'
      #9#9'M.NOME AS MOTORISTA,'
      #9#9'O.TRAJETO AS TRAJETO'
      'FROM ONIBUS O'
      ' INNER JOIN EMPRESAS E'
      '  ON E.COD_EMPRESA = O.COD_EMPRESA '
      ' INNER JOIN MOTORISTAS M'
      '  ON M.COD_MOTORISTA = O.COD_MOTORISTA')
    Left = 8
    Top = 320
  end
  object ds_onibus: TDataSource
    DataSet = adoquery_onibus
    Left = 48
    Top = 320
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_Menu.ConexaoBD
    Parameters = <>
    Left = 328
    Top = 312
  end
end
