unit unitkey;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormKey }

  TFormKey = class(TForm)
    Button1: TButton;
    ButExample: TButton;
    ButtonRunKeys: TButton;
    ButtonRunPrime: TButton;
    ButtonClearPrime: TButton;
    Edit_a: TEdit;
    Edit_b: TEdit;
    EditD: TEdit;
    EditE: TEdit;
    EditN: TEdit;
    EditP: TEdit;
    EditQ: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MemoGenerate: TMemo;
    Memo2: TMemo;
    procedure ButExampleClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonClearPrimeClick(Sender: TObject);
    procedure ButtonRunKeysClick(Sender: TObject);
    procedure ButtonRunPrimeClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormKey: TFormKey;
  is_prime:array[1..1000000000] of boolean;

implementation

{$R *.lfm}

{ TFormKey }

function QWordToStr(n: QWord ): String;
var
  s: String;
begin
  Str(n, s);
  QWordToStr := s;
end;

procedure dosieve(limit : qword);
var i,k,x,y:qword; n:qword;
begin
  for i:=5 to limit do
    is_prime[i]:=false;

  for x:=1 to trunc(sqrt(limit)) do
    for y:=1 to trunc(sqrt(limit)) do
    begin
      n:=4*sqr(x)+sqr(y);
      if (n<=limit) and ((n mod 12 = 1) or (n mod 12 = 5)) then
        is_prime[n]:=not is_prime[n];
      n:=n-sqr(x);
      if (n<=limit) and (n mod 12 = 7) then
        is_prime[n]:=not is_prime[n];
      n:=n-2*sqr(y);
      if (x>y) and (n<=limit) and (n mod 12 = 11) then
        is_prime[n]:=not is_prime[n];
    end;
  for i:=5 to trunc(sqrt(limit)) do
  begin
    if is_prime[i] then
    begin
      k:=sqr(i);
      n:=k;
      while n<=limit do
      begin
        is_prime[n]:=false;
        n:=n+k;
      end;
    end;
  end;
  is_prime[2]:=true;
  is_prime[3]:=true;
end;

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

procedure TFormKey.ButtonRunPrimeClick(Sender: TObject);
var
  a,b,jj:qword;

begin
 try
   a:=strtoqword(Edit_a.text);
   b:=strtoqword(Edit_b.text);
   dosieve(b); //to find prime
   MemoGenerate.text:='';
   for jj:=a to b do
   begin
     if is_prime[jj] then MemoGenerate.Text:=MemoGenerate.text+qwordtostr(jj)+'  ';
   end;

 except
   showmessage('Something wrong with the input !!!');
 end;
end;

procedure TFormKey.ButtonClearPrimeClick(Sender: TObject);
begin
   Edit_a.Clear;
   Edit_b.clear;
   MemoGenerate.clear;
end;

procedure TFormKey.Button1Click(Sender: TObject);
begin
  editP.clear;  //P=p non case sensitive
  editQ.clear;
  editN.clear;
  editE.clear;
  editD.clear;

end;

procedure TFormKey.ButExampleClick(Sender: TObject);
begin
  Edit_a.Text:='1000';
  Edit_b.Text:='2000';

  editP.Text:='1931';  //P=p non sensitive case
  editQ.Text:='1997';
  editE.Text:='1051';

end;


procedure TFormKey.ButtonRunKeysClick(Sender: TObject);
label finish;
var p,q,e,Qn,n,pk,k:qword;
    d:extended;
begin

try
  p:=strtoqword(editp.Text);
  q:=strtoqword(editq.Text);
  e:=strtoqword(edite.Text);

  if (p<10) or (q<10) or (e<10) then
  begin
    showmessage ('p,q,e is prime number minimum 2 decimal digit');
    goto finish;
  end;

  n:=p*q;
  Qn:=(p-1)*(q-1);

  for k:=1 to 1000000000 do
  begin
    d:=(1+k*Qn)/e;
    if frac(d)=0 then break;
  end;

  //value k got from (for k:=1 to 1000000000, that respect to frac(d)=0)
  d:=(1+k*Qn)/e;
  pk:=trunc(d);

  editN.text:=qwordtostr(n);
  editD.text:=qwordtostr(pk); //pk=d, pk:integer, d:extended (trunc: ext-->int)

  finish:

 except
   showmessage('Something wrong with the input !!!');
 end;

end;

end.

