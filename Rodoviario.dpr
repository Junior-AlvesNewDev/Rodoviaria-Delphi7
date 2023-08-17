program Rodoviario;

uses
  Forms,
  Unit_Menu in 'Unit_Menu.pas' {Form_Menu},
  Unit_Empresas in 'Unit_Empresas.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Menu, Form_Menu);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
