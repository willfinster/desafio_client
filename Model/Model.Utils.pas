unit Model.Utils;

interface

uses
  FMX.Dialogs,
  System.SysUtils,
  REST.Client;

type
  TUtils = record

  public
    class function CreateRequest(AEndPoint : string): TRESTRequest; static;
  end;

implementation

{ TUtils }

class function TUtils.CreateRequest(AEndPoint: string): TRESTRequest;
var
  LRequest : TRESTRequest;
begin
  LRequest          := TRESTRequest.Create(nil);
  LRequest.Client   := TRESTClient.Create(LRequest);
  LRequest.Response := TRESTResponse.Create(LRequest);
  try
    try
      LRequest.Client.Accept              := 'application/json';
      LRequest.Client.AcceptCharset       := 'UTF-8, *;q=0.8';
      LRequest.Client.HandleRedirects     := True;
      LRequest.Client.RaiseExceptionOn500 := False;
      LRequest.Timeout                    := 10000;
      LRequest.Client.BaseURL             := AEndPoint;
      LRequest.SynchronizedEvents         := False;

    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    Result := LRequest;
  end;
end;

end.
