program Rodoviario;

uses
  Forms,
  Unit_Menu in 'Unit_Menu.pas' {Form_Menu},
  Unit_Empresas in 'Unit_Empresas.pas' {form_empresas},
  Unit_motoristas in 'Unit_motoristas.pas' {Form_motoristas},
  Unit_Onibus in 'Unit_Onibus.pas' {Form_onibus};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Menu, Form_Menu);
  Application.CreateForm(Tform_empresas, form_empresas);
  Application.CreateForm(TForm_motoristas, Form_motoristas);
  Application.CreateForm(TForm_onibus, Form_onibus);
  Application.Run;
end.
