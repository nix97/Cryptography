program projectRSA;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unitMain, unitkey, unitencrypt, unitdecrypt
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormKey, FormKey);
  Application.CreateForm(TFormEncrypt, FormEncrypt);
  Application.CreateForm(TFormDecrypt, FormDecrypt);
  Application.Run;
end.

