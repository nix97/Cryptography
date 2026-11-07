unit unitMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  Buttons, Menus, unitdecrypt, unitencrypt, unitkey,unitfactors,unitformula;

type

  { TFormMain }

  TFormMain = class(TForm)
    BitBtnGenerate: TBitBtn;
    BitBtnEncryption: TBitBtn;
    BitBtnDecryption: TBitBtn;
    BitBtnReveal: TBitBtn;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    procedure BitBtnDecryptionClick(Sender: TObject);
    procedure BitBtnGenerateClick(Sender: TObject);
    procedure BitBtnEncryptionClick(Sender: TObject);
    procedure BitBtnRevealClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

{ TFormMain }

procedure TFormMain.BitBtnGenerateClick(Sender: TObject);
begin
  FormKey.show;
end;

procedure TFormMain.BitBtnDecryptionClick(Sender: TObject);
begin
  FormDecrypt.show;
end;

procedure TFormMain.BitBtnEncryptionClick(Sender: TObject);
begin
  formEncrypt.show;
end;

procedure TFormMain.BitBtnRevealClick(Sender: TObject);
begin
  FormFactors.show;
end;

procedure TFormMain.MenuItem1Click(Sender: TObject);
begin

end;

procedure TFormMain.MenuItem3Click(Sender: TObject);
begin
  formkey.show;
end;

procedure TFormMain.MenuItem4Click(Sender: TObject);
begin
  formEncrypt.Show;
end;

procedure TFormMain.MenuItem5Click(Sender: TObject);
begin
  formDecrypt.show;
end;

procedure TFormMain.MenuItem7Click(Sender: TObject);
begin
 formFormula.show;
end;

procedure TFormMain.MenuItem8Click(Sender: TObject);
const
sAbout = '|======== Nix Cryptography ========|' + #13#10 +
         '' + #13#10 +
         'Version 3.0 - Build Nov 7, 2026'+ #13#10 +
         'Created by Lukas Setiawan' + #13#10 +
         'Copyright (c) 2026. All Rights Reserved.' + #13#10 +
         'lukassetiawan@yahoo.com' + #13#10 +
         '' + #13#10 +
         'My Work :'+ #13#10 +
         '<> Repositories: https://github.com/nix97' + #13#10+
         '<> FB: search Metode-Numerik-Plus-Programnya'+#13#10+
         '<> Web: https://nix97.github.io/numericalmethods/'+#13#10+#13#10+
         'Accepting donations for software development.'+ #13#10;
begin
 MessageDlg( sAbout, mtInformation, [mbOK], 0);

end;

end.

