program proRSA;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unitMain, unitdecrypt, unitkey, unitencrypt, unitfactors, unitFormula;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDecrypt, FormDecrypt);
  Application.CreateForm(TFormKey, FormKey);
  Application.CreateForm(TFormEncrypt, FormEncrypt);
  Application.CreateForm(TFormFactors, FormFactors);
  Application.CreateForm(TFormFormula, FormFormula);
  Application.Run;
end.

