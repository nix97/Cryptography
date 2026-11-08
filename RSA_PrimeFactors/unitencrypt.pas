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
var c,e_prime:longint;

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

function QWordToStr(n: QWord ): String;
var
  s: String;
begin
  Str(n, s);
  QWordToStr := s;
end;


procedure TFormEncrypt.ButtonRunEncClick(Sender: TObject);
var e,n,pj,pjn,z,pjc,pjcb:qword;
i,k,j:longint;
s,sord,m,chiper,chiperb:ansistring;
sx,cs,c4:array[1..10000] of ansistring;
o,c:array[1..10000] of qword;

begin
  try
   s:=MemoPlain.Text;
   n:=strtoint(editN.text);
   e:=strtoint(editE.text);
   pj:=length(s);

   sord:=''; //string ordinal
   for i:=1 to pj do
   begin
    if ord(s[i])<10 then sx[i]:='00'+inttostr(ord(s[i]))
    else if ord(s[i])<100 then sx[i]:='0'+inttostr(ord(s[i]))
    else sx[i]:=inttostr(ord(s[i]));
    sord:=sord+sx[i];
   end;

   //pjn:=length(inttostr(n)); //length digit n
   pjn:=length(qwordtostr(n)); //length digit n
   k:=0;
   for i:=1 to pj  do
   begin
     m:='';
     for j:=1 to 3 do
       begin
         m:=m+(sord[j+k]);
       end;
   k:=3*i;
   //o[i]:=strtoint(m);
   o[i]:=strtoqword(m);
   end;

   for i:=1 to pj do
    c[i]:=modular_pow(o[i],e,n);

   chiper:='';
   for i:=1 to pj do
     chiper:=chiper+qwordtostr(c[i]);

    //chiper:=chiper+inttostr(c[i]);

   for i:=1 to pj do
   begin
     z:=pjn-length(qwordtostr(c[i]));
     case z of
       0:cs[i]:=qwordtostr(c[i]);
       1: cs[i]:='0'+qwordtostr(c[i]);
       2: cs[i]:='00'+qwordtostr(c[i]);
       3: cs[i]:='000'+qwordtostr(c[i]);
       4: cs[i]:='0000'+qwordtostr(c[i]);
       5: cs[i]:='00000'+qwordtostr(c[i]);
       6: cs[i]:='000000'+qwordtostr(c[i]);
       7: cs[i]:='0000000'+qwordtostr(c[i]);
       8: cs[i]:='00000000'+qwordtostr(c[i]);
       9: cs[i]:='000000000'+qwordtostr(c[i]);
       10: cs[i]:='0000000000'+qwordtostr(c[i]);

    end;
   end;

   chiperb:='';
   for i:=1 to pj do
    chiperb:=chiperb+(cs[i]);

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

    memoChiper.Text:='';
    for i:=1 to pjc do
     memoChiper.Text:=memoChiper.Text+ (c4[i]);

 except
  showmessage('Something wrong with the input !!!');
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

