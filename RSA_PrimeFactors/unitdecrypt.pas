unit unitdecrypt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TFormDecrypt }

  TFormDecrypt = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Editn: TEdit;
    Editd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemoEncrypt: TMemo;
    MemoDecrypt: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormDecrypt: TFormDecrypt;

implementation

{$R *.lfm}

{ TFormDecrypt }



function modular_pow(base,exponent,modulus:qword):qword;
var c,e_prime:qword;

begin
    if modulus = 1 then modular_pow:=0
    else
    begin
    c := 1;
    for e_prime:= 1 to exponent do
        c:=(c*base) mod modulus;
    modular_pow:=c;
    end;
end;

procedure TFormDecrypt.Button1Click(Sender: TObject);
var
  d,n,pjn,pjc,pjcb:qword;
  i,k,j:qword;
  m,chiperb:ansistring;
  c4,m3:array[1..100000] of ansistring;
  m2,c3:array[1..100000] of qword;

begin
  n:=strtoqword(editn.Text);
  d:=strtoqword(editd.Text);

 chiperb:=memoEncrypt.text;

 pjcb:=length(chiperb);
 pjc:=trunc(pjcb/length(inttostr(n)));
 pjn:=length(inttostr(n));

  k:=0;
  for i:=1 to pjc  do
  begin
   m:='';
    for j:=1 to pjn do
    begin
     m:=m+(chiperb[j+k]);
    end;
     k:=pjn*i;
     c4[i]:=(m);
  end;

  for i:=1 to pjc do
  begin
   c3[i]:=strtoqword(c4[i]);
  end;

 for i:=1 to pjc do
 begin
  m2[i]:=modular_pow(c3[i],d,n);
 end;

 for i:=1 to pjc do
 begin
  m3[i]:=char(m2[i]);
 end;

  for i:=1 to pjc do
  begin
   memoDecrypt.Text:=memoDecrypt.Text+m3[i];
  end;
end;

procedure TFormDecrypt.Button2Click(Sender: TObject);
begin
  editn.clear;
  editd.clear;
  memoEncrypt.clear;
  memoDecrypt.clear;
end;

end.

