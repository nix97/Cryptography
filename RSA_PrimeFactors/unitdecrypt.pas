unit unitdecrypt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TFormDecrypt }

  TFormDecrypt = class(TForm)
    ButDecrypt: TButton;
    ButClear: TButton;
    Editn: TEdit;
    Editd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemoEncrypt: TMemo;
    MemoDecrypt: TMemo;
    procedure ButDecryptClick(Sender: TObject);
    procedure ButClearClick(Sender: TObject);
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


function QWordToStr(n: QWord ): String;
var
  s: String;
begin
  Str(n, s);
  QWordToStr := s;
end;

function StrToQWord(s: String): QWord;
var
  n, i, sign: QWord;
begin
  n := 0;
  sign := 1;
  i := 1;

  if s[1] = '-' then
  begin
    //sign := -1;
    sign := 0;
    i := 2;
  end;

  while i <= Length(s) do
  begin
    n := n * 10 + Ord(s[i]) - Ord('0');
    i := i + 1;
  end;

  StrToQWord := n * sign;
end;


function modular_pow(base,exponent,modulus:qword):qword;
var
 c,e_prime : qword;
 //c,e_prime:longint;

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

procedure TFormDecrypt.ButDecryptClick(Sender: TObject);
var
  d,n,pjn,pjc,pjcb:qword;
  i,k,j:longint;
  m,chiperb:ansistring;
  c4,m3:array[1..10000] of ansistring;
  m2,c3:array[1..10000] of qword;

begin
 try
  n:=strtoqword(editn.Text);
  d:=strtoqword(editd.Text);

  chiperb:=memoEncrypt.text;

  pjcb:=length(chiperb);
  pjc:=trunc(pjcb/length(qwordtostr(n)));
  pjn:=length(qwordtostr(n));

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
   c3[i]:=strtoqword(c4[i]);

 for i:=1 to pjc do
  m2[i]:=modular_pow(c3[i],d,n);

 for i:=1 to pjc do
  m3[i]:=char(m2[i]);

 memoDecrypt.clear;
 for i:=1 to pjc do
   memoDecrypt.Text:=memoDecrypt.Text+m3[i];

 except
  showmessage('Something wrong with the input !!!');
 end;

end;

procedure TFormDecrypt.ButClearClick(Sender: TObject);
begin
  editn.clear;
  editd.clear;
  memoEncrypt.clear;
  memoDecrypt.clear;
end;

end.

