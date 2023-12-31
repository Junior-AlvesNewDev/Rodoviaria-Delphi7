unit Unit_Onibus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_onibus = class(TForm)
    btn_fechar: TBitBtn;
    dbgrid_onibus: TDBGrid;
    adoquery_onibus: TADOQuery;
    ds_onibus: TDataSource;
    edt_num: TEdit;
    edt_trajeto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cb_motorista: TComboBox;
    cb_empresa: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ADOQuery_aux: TADOQuery;
    Inserir: TButton;
    btn_alterar: TButton;
    btn_salvar: TButton;
    btn_excluir: TButton;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_motoristaChange(Sender: TObject);
    procedure cb_empresaChange(Sender: TObject);
    procedure InserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_onibus: TForm_onibus;
  num_motorista, cod_empresa : integer;
  cod_onibus : string;
  deu_erro : boolean;

implementation

uses Unit_Menu;

{$R *.dfm}

procedure TForm_onibus.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_onibus.FormShow(Sender: TObject);
begin
  adoquery_onibus.Open;

  cb_motorista.Clear;

  adoquery_aux.SQL.Text:= 'SELECT NOME FROM MOTORISTAS ORDER BY NOME';
  adoquery_aux.Open;
  While Not ADOQuery_aux.Eof do
  Begin
    cb_motorista.Items.Add(adoquery_aux.fieldbyname('NOME').AsString);
    adoquery_aux.Next;
  end;   

  cb_motorista.ItemIndex := 0;   

  adoquery_aux.close;

  cb_empresa.Clear;
  adoquery_aux.SQL.Text:= 'SELECT NOME FROM EMPRESAS ORDER BY NOME';
  adoquery_aux.Open;
  While Not ADOQuery_aux.Eof do
  Begin
    cb_empresa.Items.Add(adoquery_aux.fieldbyname('NOME').AsString);
    adoquery_aux.Next;
  end;

  cb_empresa.ItemIndex := 0;

  adoquery_aux.Close;
end;

procedure TForm_onibus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  adoquery_onibus.Close;
end;


procedure TForm_onibus.cb_motoristaChange(Sender: TObject);
begin

  adoquery_aux.SQL.Text:= 'SELECT cod_motorista FROM MOTORISTAS '+
                          ' WHERE NOME = ' + QuotedStr(cb_motorista.Text);
  adoquery_aux.Open;
  num_motorista := adoquery_aux.fieldbyname('cod_motorista').AsInteger;
  adoquery_aux.Close;                         

end;

procedure TForm_onibus.cb_empresaChange(Sender: TObject);
begin

  adoquery_aux.SQL.Text:='SELECT COD_EMPRESA FROM EMPRESAS '+
                         ' WHERE NOME = '+ QuotedStr(cb_empresa.Text);
  adoquery_aux.Open;
  cod_empresa := adoquery_aux.fieldbyname('COD_EMPRESA').AsInteger;
  adoquery_aux.Close;                        

end;

procedure TForm_onibus.InserirClick(Sender: TObject);
begin

  if (trim(edt_num.Text)='') or (trim(edt_trajeto.Text)='') or
     (trim(cb_motorista.Text)='') or (trim(cb_empresa.Text)='') then
  begin
    Showmessage('Preencha todos os campos !');
  end
 else
  begin
    Form_menu.ConexaoBD.BeginTrans;
    adoquery_aux.SQL.Text:='INSERT INTO ONIBUS VALUES('+
                           edt_num.Text + ',' + intToStr(cod_empresa) + ',' +
                           IntToStr(num_motorista) + ',' + QuotedStr(edt_trajeto.Text) + ')';
    try
      adoquery_aux.ExecSQL;
      deu_erro := false;
    except
      on E: Exception do
      begin
        deu_erro := true;
        if Form_menu.ErroBD(E.Message, 'PK_Onibus') = 'Sim' then
          ShowMessage('C�digo j� cadastrado!')
        else
          ShowMessage('Ocorreu o seguinte erro' + E.Message);
      end;
  end;
    if deu_erro = false then
     begin
      Form_menu.ConexaoBD.commitTrans;
      ADOQuery_onibus.Close;
      ADOQuery_onibus.Open;
      Showmessage('Opera��o executada com sucesso !');
      edt_num.Clear;
      edt_trajeto.Clear;
      cb_motorista.ItemIndex := -1;
      cb_empresa.ItemIndex := -1;
     end
   else
    begin
     Form_menu.ConexaoBD.RollbackTrans;
    end;
end;
end;

procedure TForm_onibus.btn_alterarClick(Sender: TObject);
begin
  cod_onibus := dbgrid_onibus.Columns.Items[0].field.text;
  edt_num.Text := cod_onibus;
  edt_trajeto.Text := dbgrid_onibus.Columns.Items[3].field.text;
  cb_motorista.Text := dbgrid_onibus.Columns.Items[2].field.text;
  cb_motoristaChange(sender);
  cb_empresa.Text := dbgrid_onibus.Columns.Items[1].field.text;
  cb_empresaChange(sender);
end;

procedure TForm_onibus.btn_salvarClick(Sender: TObject);
begin
  Form_menu.ConexaoBD.BeginTrans;
  adoquery_aux.SQL.Text:=' UPDATE ONIBUS SET ' +
                         ' COD_ONIBUS = ' + edt_num.Text + ',' +
                         ' COD_EMPRESA = ' + inttostr(cod_empresa) + ',' +
                         ' COD_MOTORISTA = ' + inttostr(num_motorista) + ',' +
                         ' TRAJETO = ' + QuotedStr(edt_trajeto.Text) +
                         ' WHERE COD_ONIBUS = ' + cod_onibus;
  try
    adoquery_aux.ExecSQL;
    deu_erro := false;
  except
    on E : Exception do
    begin
     deu_erro := true;
     if Form_menu.ErroBD(E.Message, 'FK_Onibus_Empresa') = 'Sim' then
       ShowMessage('Imposs�vel atualizar o c�digo pois existem Empresas ligados a este trajeto!')
     else if Form_menu.ErroBD(E.Message, 'PK__Onibus__19B9E860E1C5BA3C') = 'Sim' then
       ShowMessage('C�digo j� cadastrado!')
     else
       ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
     end;
  end;

  if deu_erro = false then
  begin
    Form_menu.ConexaoBD.CommitTrans;
    ADOQuery_onibus.Close;
    ADOQuery_onibus.Open;
    showmessage('Informa��es atualizadas com sucesso !');
    edt_num.Clear;
    edt_trajeto.Clear;
    cb_motorista.ItemIndex := -1;
    cb_empresa.ItemIndex := -1;
  end
 else
   begin
     Form_menu.ConexaoBD.RollbackTrans;
   end;
end;

procedure TForm_onibus.btn_excluirClick(Sender: TObject);
begin
  cod_onibus:= adoquery_onibus.fieldbyname('onibus').AsString;
  Form_menu.ConexaoBD.BeginTrans;
  adoquery_aux.SQL.Text:=' DELETE FROM ONIBUS ' +
                         ' WHERE COD_ONIBUS = ' + cod_onibus;
  deu_erro := false;
  try
    adoquery_aux.ExecSQL;
  except
    on E : Exception do
    begin
      deu_erro := true;
      if Form_menu.ErroBD(E.Message, 'FK_Onibus_Empresa')  = 'Sim' then
        ShowMessage('Imposs�vel excluir pois existem �nibus ligados a esta empresa!')
      else
        ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
      end;
    end;

  if deu_erro = true then
    Form_menu.ConexaoBD.RollbackTrans
  else
   Begin
    Form_menu.ConexaoBD.CommitTrans;
    adoquery_onibus.Close;
    adoquery_onibus.Open;
    showmessage('Onibus exclu�da com sucesso !');
    edt_num.Clear;
    edt_trajeto.Clear;
    cb_motorista.ItemIndex := -1;
    cb_empresa.ItemIndex := -1;
   end; 
end;

end.
