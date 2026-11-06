unit unitencrypt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormEncrypt }

  TFormEncrypt = class(TForm)
    ButtonRunEnc: TButton;
    ButtonClearEnc: TButton;
    EditN: TEdit;
    EditE: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemoPlain: TMemo;
    MemoChiper: TMemo;
    procedure ButtonClearEncClick(Sender: TObject);
    procedure ButtonRunEncClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormEncrypt: TFormEncrypt;

implementation

{$R *.lfm}

{ TFormEncrypt }


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

procedure TFormEncrypt.ButtonRunEncClick(Sender: TObject);
var e,n,pj,pjn,z,pjc,pjcb:qword;
  i,k,j:qword;
s,sord,m,chiper,chiperb:ansistring;
sx,cs,c4:array[1..100000] of ansistring;
o,c:array[1..100000] of qword;

begin
 s:=MemoPlain.Text;
 n:=strtoqword(editN.text);
 e:=strtoqword(editE.text);
 pj:=length(s);
 sord:='0'; //test
 for i:=1 to pj do
 begin
  if ord(s[i])<10 then sx[i]:='00'+inttostr(ord(s[i]))
  else if ord(s[i])<100 then sx[i]:='0'+inttostr(ord(s[i]))
  else sx[i]:=inttostr(ord(s[i]));
  sord:=sord+sx[i];
 end;
  pjn:=length(inttostr(n));

  k:=0;
  for i:=1 to pj  do
  begin
   m:='';
    for j:=1 to 3 do
    begin
     m:=m+(sord[j+k]);
    end;
     k:=3*i;
     o[i]:=strtoqword(m);
  end;

 for i:=1 to pj do
 begin
  c[i]:=modular_pow(o[i],e,n);
 end;

 chiper:=''; //modify
 for i:=1 to pj do
 begin
  chiper:=chiper+inttoStr(c[i]);
 end;


 for i:=1 to pj do
 begin
 	z:=pjn-length(inttostr(c[i]));
 	case z of
 	0: cs[i]:=inttostr(c[i]);
 	1: cs[i]:='0'+inttostr(c[i]);
 	2: cs[i]:='00'+inttostr(c[i]);
 	3: cs[i]:='000'+inttostr(c[i]);
 	4: cs[i]:='0000'+inttostr(c[i]);
 	5: cs[i]:='00000'+inttostr(c[i]);
 	6: cs[i]:='000000'+inttostr(c[i]);
 	7: cs[i]:='0000000'+inttostr(c[i]);
 	8: cs[i]:='00000000'+inttostr(c[i]);
 	9: cs[i]:='000000000'+inttostr(c[i]);
       10: cs[i]:='0000000000'+inttostr(c[i]);
       11: cs[i]:='00000000000'+inttostr(c[i]);
       12: cs[i]:='000000000000'+inttostr(c[i]);
       13: cs[i]:='0000000000000'+inttostr(c[i]);
       14: cs[i]:='00000000000000'+inttostr(c[i]);
       15: cs[i]:='000000000000000'+inttostr(c[i]);
       16: cs[i]:='0000000000000000'+inttostr(c[i]);
       17: cs[i]:='00000000000000000'+inttostr(c[i]);
       18: cs[i]:='000000000000000000'+inttostr(c[i]);
       19: cs[i]:='0000000000000000000'+inttostr(c[i]);
       20: cs[i]:='00000000000000000000'+inttostr(c[i]);
       21: cs[i]:='000000000000000000000'+inttostr(c[i]);
       22: cs[i]:='0000000000000000000000'+inttostr(c[i]);
       //23: cs[i]:='00000000000000000000000'+inttostr(c[i]);
       //24: cs[i]:='000000000000000000000000'+inttostr(c[i]);
       //25: cs[i]:='0000000000000000000000000'+inttostr(c[i]);

  end;
 end;

    chiperb:=''; //modify
    for i:=1 to pj do
    begin
     chiperb:=chiperb+(cs[i]);
    end;

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

  memoChiper.Text:='';
  for i:=1 to pjc do
  begin
   memoChiper.Text:=memoChiper.Text+ (c4[i]);
  end;

end;



procedure TFormEncrypt.ButtonClearEncClick(Sender: TObject);
begin
  editn.Clear;
  edite.Clear;
  memoPlain.Clear;
  memoChiper.Clear;


end;

end.

