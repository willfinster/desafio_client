program Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  Controller.Cep in 'Controller\Controller.Cep.pas',
  Model.Cep in 'Model\Model.Cep.pas',
  View.Cep in 'View\View.Cep.pas' {FrmCadEndereco},
  Model.Utils in 'Model\Model.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCadEndereco, FrmCadEndereco);
  Application.Run;
end.
