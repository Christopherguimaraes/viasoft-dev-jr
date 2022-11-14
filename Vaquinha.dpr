program Vaquinha;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {Principal},
  Model.Interfaces in 'Model.Interfaces.pas',
  Model.Pessoa in 'Model.Pessoa.pas',
  ModelAcao in 'ModelAcao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
