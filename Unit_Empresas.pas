unit Unit_Empresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids;

type
  Tform_empresas = class(TForm)
    BitBtn1: TBitBtn;
    adoquery_empresas: TADOQuery;
    dbgrid_empresas: TDBGrid;
    ds_empresas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    edt_cod: TEdit;
    edt_nome: TEdit;
    adoquery_aux: TADOQuery;
    btn_inserir: TBitBtn;
    btn_alterar: TButton;
    btn_salvar: TButton;
    btn_excluir: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_empresas: Tform_empresas;
  cod_empresa : string;
  deu_erro : boolean;

implementation

uses Unit_Menu;

{$R *.dfm}

procedure Tform_empresas.BitBtn1Click(Sender: TObject);
begin
    close;
end;

procedure Tform_empresas.FormShow(Sender: TObject);
begin
  adoquery_empresas.Open;
end;

procedure Tform_empresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoquery_empresas.close;
end;

procedure Tform_empresas.btn_inserirClick(Sender: TObject);
begin
 if (trim(edt_cod.Text)='') or (trim(edt_nome.Text)='') then
  begin
    Showmessage('Preencha todos os campos!');
  end
 else
  begin
   Form_menu.ConexaoBD.BeginTrans;
   adoquery_aux.SQL.Text:=' INSERT INTO EMPRESAS VALUES(' +
                            edt_cod.Text + ',' + QuotedStr(edt_nome.Text) + ')';
   try
     adoquery_aux.ExecSQL;
     deu_erro := false;
   except
     on E : Exception do
     begin
       deu_erro := true;
       if Form_menu.ErroBD(E.message, 'PK_Empresas') = 'Sim' then
         Showmessage('Codigo já cadastrado!');
       else
         Showmessage('Ocorreu o seguinte erro: ' + E.Message);
       end;
     end;

     if deu_erro = false then
      begin
        Form_menu.ConexaoBD.CommitTrans;
        ADOQuery_empresas.Close;
        ADOQuery_empresas.Open;
        Showmessage('Operação execuatada com sucesso!');
        edt_cod.Clear;
        edt_nome.Clear;
      end
     else
      begin
        Form_menu.ConexaoBD.RollbackTrans;
      end;
 end;

end;

procedure Tform_empresas.btn_alterarClick(Sender: TObject);
begin
   cod_empresa := dbgrid_empresas.Columns.Items[0].field.text;
  edt_cod.Text := cod_empresa;
  edt_nome.Text := dbgrid_empresas.Columns.Items[1].field.text;
end;

procedure Tform_empresas.btn_salvarClick(Sender: TObject);
begin
  Form_menu.ConexaoBD.BeginTrans;

adoquery_aux.SQL.Text :=' UPDATE EMPRESAS SET ' +
					              ' COD_EMPRESA = ' + edt_cod.Text + ',' +
				          		  ' NOME = ' + QuotedStr(edt_nome.Text) +
				            		' WHERE COD_EMPRESA = ' + cod_empresa;

adoquery_aux.ExecSQL;
Form_menu.ConexaoBD.CommitTrans;
ADOQuery_Empresas.Close;
ADOQuery_Empresas.Open; 
showmessage('Informações atualizadas com sucesso !');
edt_cod.Clear;
edt_nome.Clear;
end;

procedure Tform_empresas.btn_excluirClick(Sender: TObject);
begin
  cod_empresa:= adoquery_empresas.fieldbyname('cod_empresa').AsString;
  Form_menu.ConexaoBD.BeginTrans;
  adoquery_aux.SQL.Text:=' DELETE FROM EMPRESAS ' +
                         ' WHERE COD_EMPRESA = ' + cod_empresa;
  adoquery_aux.ExecSQL;
  Form_menu.ConexaoBD.CommitTrans;
  adoquery_empresas.Close;
  adoquery_empresas.Open;
  showmessage('Empresa excluída com sucesso !');
end;

end.
