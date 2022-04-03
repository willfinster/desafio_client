unit Controller.Cep;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON,
  FMX.Dialogs,
  REST.Client,
  REST.Json,
  Model.Cep,
  Model.Utils;

type
  TControllerCep = class

  public class
    function GetCep(ACep : string): TCep;
  end;

implementation

{ TControllerCep }

class function TControllerCep.GetCep(ACep: string): TCep;
var
  LRequest  : TRESTRequest;
  LCep      : TCep;
  LResponse : TStringList;
begin
  LRequest := TUtils.CreateRequest('http://localhost:9000/cep/'+ACep);
  try
    try
      LRequest.Execute;
      if LRequest.Response.StatusCode = 200 then
      begin
        LCep := TJson.JSonToObject<TCep>(LRequest.Response.JSONValue as TJSonObject);
        Result := LCep;
      end
      else if LRequest.Response.StatusCode = 404 then
      begin
        ShowMessage('O Cep informado não existe. Verifique!');
        Result := default(TCep);
      end
      else if LRequest.Response.StatusCode = 500 then
      begin
        ShowMessage('Servidores Offline, digite manualmente!');
        Result := default(TCep);
      end;
    except on E: Exception do
      ShowMessage(E.Message);
    end;
  finally
    LRequest.Free;
  end;
end;

end.
