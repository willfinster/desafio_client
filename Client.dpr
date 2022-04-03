program Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  View in 'View\View.Cep' {FrmCadEndereco},
  Controller.Cep in 'Controller\Controller.Cep.pas',
  Model.Cep in 'Model\Model.Cep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCadEndereco, FrmCadEndereco);
  Application.Run;
end.
