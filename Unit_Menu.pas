unit Unit_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, jpeg, ExtCtrls;

type
  TForm_Menu = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ConexaoBD: TADOConnection;
    Plano_de_Fundo: TImage;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ErroBD(msg: string; texto: string): string;
  end;

var
  Form_Menu: TForm_Menu;

implementation

uses Unit_Empresas, Unit_motoristas, Unit_Onibus;

{$R *.dfm}

procedure TForm_Menu.BitBtn4Click(Sender: TObject);
begin
     application.Terminate
end;

procedure TForm_Menu.FormShow(Sender: TObject);
begin
  ConexaoBD.Open;

  //Tentativa
end;

procedure TForm_Menu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConexaoBD.Close;
end;

procedure TForm_Menu.BitBtn1Click(Sender: TObject);
begin
  form_empresas.showmodal;
end;

procedure TForm_Menu.BitBtn2Click(Sender: TObject);
begin
  form_motoristas.showmodal;
end;

procedure TForm_Menu.BitBtn3Click(Sender: TObject);
begin
  form_onibus.showmodal;
end;

//Não sei se está no local correto

function TForm_Menu.ErroBD(msg, texto: string): string;
var
  i, tam_msg, tam_texto : integer;
  pedaco ; string;
begin

  tam_msg := length(msg);
  tam_texto := length(texto);

  for i:=1 to tam_msg do
  begin
    pedaco := copy(msg,i,tam_texto);
    if pedaco = texto then
     begin
      result := 'Sim';
      break;
     end
   else
     result := 'Não';
   end;     
end;

end.
