Unit unitcrypto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  Menus, base64;

type

  { TFormCrypto }

  TFormCrypto = class(TForm)
    ButCopyChiper: TButton;
    ButCopyKey: TButton;
    ButRunDec: TButton;
    ButClearDec: TButton;
    ButAbout: TButton;
    ButtonExample: TButton;
    ButRunEnc: TButton;
    ButtonClear: TButton;
    EditKey: TEdit;
    EditKeyDec: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MemoChiper: TMemo;
    Memo2: TMemo;
    MemoChiperDec: TMemo;
    MemoMessage: TMemo;
    MemoMessageDec: TMemo;
    PageControl1: TPageControl;
    TSdecrypt: TTabSheet;
    TSencrypt: TTabSheet;
    procedure ButAboutClick(Sender: TObject);
    procedure ButClearDecClick(Sender: TObject);
    procedure ButCopyChiperClick(Sender: TObject);
    procedure ButCopyKeyClick(Sender: TObject);
    procedure ButRunEncClick(Sender: TObject);
    procedure ButRunDecClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonExampleClick(Sender: TObject);
  private

  public

  end;

var
  FormCrypto: TFormCrypto;

implementation

{$R *.lfm}

{ TFormCrypto }

function Pow(x,y:Extended):Extended;
begin
   Pow:=exp(ln(x)*y);
end;

function QWordToStr(n: QWord ): String;
var
  s: String;
begin
  Str(n, s);
  QWordToStr := s;
end;

procedure TFormCrypto.ButtonExampleClick(Sender: TObject);
begin
  editKey.Text:='4957578310536271'; //key
  MemoMessage.Lines.Add('Omni vivum ex ovo, omni ovum ex vivo !!! presented by Lukas Setiawan');
end;


procedure TFormCrypto.ButRunEncClick(Sender: TObject);
var
 i,lengMsg,lm,rm,yMark:qword;
 c1,c2,c3,c4,d1,d2,d3,d4,x:extended;
 key,MarkS,lms,rms,lmlengMsgrm:string;
 mi:array[1..100000] of char; //@ char from m(message)
 mio:array[1..100000] of qword;
 conPoly:array[1..100000] of Extended; //const polynomial
 conPolyR:array[1..100000] of QWord; //round form
 llms,lrms:integer;
 message,chiperB64,conPolyMark,totalChiper:ansistring;
 mark:array[1..100000] of string;

begin

 try

   MemoChiper.Clear;
   key:=EditKey.Text; //16 digit decimal
   message:=MemoMessage.Text;   //message
   lengMsg:=length(message); //total char on message

   if (length(key)<>16) then
    showmessage('Length of the key must be 16 decimal digits !!!');

   for i:=1 to lengMsg do
   begin
    mi[i]:=message[i]; //get each char from message
    mio[i]:=ord(mi[i]); //ordinal from each char
   end;

   //Poly y=c1*x^d1+c2*x^d2+c3*x^d3+c4*x^d4
   //c as coefficient & d as degree(total 16 digits decimal)
   c1:=strtofloat(copy(key,1,3));
   d1:=strtofloat(key[4]);
   c2:=strtofloat(copy(key,5,3)); //for index-5, total digit 3
   d2:=strtofloat(key[8]);
   c3:=strtofloat(copy(key,9,3));
   d3:=strtofloat(key[12]);
   c4:=strtofloat(copy(key,13,3));
   d4:=strtofloat(key[16]);

   for i:=1 to lengMsg do
   begin
    x:=mio[i];
    conPoly[i]:=c1*pow(x,d1)+c2*pow(x,d2)+c3*pow(x,d3)+c4*pow(x,d4);  //const Polynomial
    conPolyR[i]:=round(conPoly[i]); //constPolynomial after round
   end;

 //we conceal total char on message by inserting into chipertxt
 //from menu encrypt got total char, but on decrypt, we never know how big,so this info embedded in chiper
 x:=27+strtoqword(key[5]);//anything you liked
 lm:=round(71*pow(x,3)+98*pow(x,2))-strtoqword(key[5]); //left marker, as you desired

 x:=32+strtoqword(key[5]);
 rm:=round(89*pow(x,3)+67*pow(x,2))-strtoqword(key[5]); //right marker

 lms:=qwordtostr(lm); //left marker as string
 rms:=qwordtostr(rm);
 llms:=length(lms);   //length of left marker
 lrms:=length(rms);
 lmlengMsgrm:=lms+qwordtostr(lengMsg)+rms; //conceal total digit char on lm & rm


 //add marker to know every const on poly when decrypt
 for i:=1 to lengMsg do
 begin
  x:=i+10; //free
  yMark:=round(87*pow(x,5)+97*pow(x,3)-pow(strtoqword(key[5]),3)); //it's define as user liked
  MarkS:=inttostr(yMark);
  mark[i]:=copy(MarkS,1,5);
 end;

 conPolyMark:='';
 for i:=1 to lengMsg do
 begin
  conPolyMark:=conPolyMark+qwordtostr(conPolyR[i])+mark[i];
 end;

  totalChiper:=lmlengMsgrm+conPolyMark; //in string decimaal

  ChiperB64:=EncodeStringBase64(totalChiper); //in Base64
  memoChiper.Lines.add(ChiperB64);

  //as note, no need to use delete func, because get all const poly direct from chiper
  //delete(conPolyMark,positionMark[i]+j,3);

  except
    showmessage('The system running out of capacity (64 bits) or something wrong with the input !!!'+#1310
    +' Try the different key, digit on position 4,8,12 or 16 with 6 or smaller.');
  end;
end;

procedure TFormCrypto.ButClearDecClick(Sender: TObject);
begin
  EditKeyDec.clear;
  MemoChiperDec.clear;
  MemoMessageDec.clear;
end;

procedure TFormCrypto.ButCopyChiperClick(Sender: TObject);
begin
  MemoChiper.SelectAll;
  MemoChiper.CopyToClipboard;
  MemoChiper.SelLength := 0;
end;

procedure TFormCrypto.ButCopyKeyClick(Sender: TObject);
begin
  EditKey.SelectAll;
  EditKey.CopyToClipboard;
end;

procedure TFormCrypto.ButAboutClick(Sender: TObject);
const
sAbout = '|======== Nix Cryptography ========|' + #13#10 +#13#10 + #13#10 +
         'Version 1. - Build Nov 21, 2026'+ #13#10 +
         'Created by Lukas Setiawan' + #13#10 +
         'Copyright (c) 2026. All Rights Reserved.' + #13#10 +
         'lukassetiawan@yahoo.com' + #13#10 +
         '' + #13#10 +
         'MyWork :'+ #13#10 +
         '<> Repositories: https://github.com/nix97' + #13#10+
         '<> FB: search Metode-Numerik-Plus-Programnya'+#13#10+
         '<> Web: https://nix97.github.io/numericalmethods/'+#13#10+#13#10+
         'Accepting donations for software development.'+ #13#10;
begin
 MessageDlg( sAbout, mtInformation, [mbOK], 0);

end;

procedure TFormCrypto.ButRunDecClick(Sender: TObject);
const
 maxIter=200;
 {use this if trully find root
 delta=1e-6;
 eps=1e-6;
 small=1e-6;
 }
var

 p1,y0:Extended;
 i,lengChip,lm,rm,lenchipDecimal,yMark:qword;
 totChr:qword;
 c1,c2,c3,c4,d1,d2,d3,d4:extended;
 llms,lrms,FirstPositionC1:Integer;
 RevealMessage:ansistring;
 conPolyR:array[1..100000] of QWord;
 x,y1,df,dp,p0:Extended;
 k,cond,j,positionRM:integer;
 ClearChar,mark,conPolyS:array[1..100000] of string;
 ClearOrd,positionM:array[1..100000] of qword;
 chipDecimal,totalChiper:ansistring;
 key,MarkS,lms,rms,totCharMsg:string;

begin

try

 key:=EditKeyDec.Text; //key encryp=decrypt (single key)
 totalChiper:=MemoChiperDec.Text; //all chiper on Base64 form
 chipDecimal:=DecodeStringBase64(totalChiper); //Base64 to decimal convert(decode)
 lengChip:=length(chipDecimal);
 MemoMessageDec.clear;

 if (length(key)<>16) then
  showmessage('Length of the key must be 16 decimal digits !!!');

 //const & degree polynomial as defined
 c1:=strtofloat(copy(key,1,3));
 d1:=strtofloat(key[4]);
 c2:=strtofloat(copy(key,5,3)); //get coefficient on position index(digit)-5 on key(total 16), with length digits 3
 d2:=strtofloat(key[8]);        // get degree 2 on position 8 , so on....
 c3:=strtofloat(copy(key,9,3));
 d3:=strtofloat(key[12]);
 c4:=strtofloat(copy(key,13,3));
 d4:=strtofloat(key[16]);


 //we conceal total char on message insert into chipertxt
 //from menu encrypt got total char, but on decrypt, we never know how big,so this info embeded on chiper
 x:=27+strtoqword(key[5]);//arbitrary, you can define this func
 lm:=round(71*pow(x,3)+98*pow(x,2))-strtoqword(key[5]); //left marker

 x:=32+strtoqword(key[5]);//free
 rm:=round(89*pow(x,3)+67*pow(x,2))-strtoqword(key[5]); //right marker, free

 lms:=qwordtostr(lm); //left marker as string
 rms:=qwordtostr(rm);
 llms:=length(lms);   //length of left marker
 lrms:=length(rms);


 //to reveal tot char that conceal
 k:=1;
 for i:=1 to 50 do
 begin
  if copy(chipDecimal,k,lrms)=rms then
 begin
  positionRM:=k; // position right mark
  break;
 end;
  k:=i+1;
 end;

 totCharMsg:=copy(chipDecimal,llms+1,positionRM-llms-1);
 totChr:=strtoqword(totCharMsg);

 //after add marker on encrypt, reveal each const between two marker on menu dec
 for i:=1 to totChr do
 begin
  x:=i+10;
  yMark:=round(87*pow(x,5)+97*pow(x,3)-pow(strtoqword(key[5]),3)); //it's define as user liked
  MarkS:=qwordtostr(yMark);
  mark[i]:=copy(MarkS,1,5);
 end;

 //position marker
 lenchipDecimal:=length(chipDecimal);
 k:=1;
 for j:=1 to totChr do
 begin
  for i:=1 to lenchipDecimal do
  begin
   if copy(chipDecimal,k,5)=mark[j] then
   begin
    positionM[j]:=k; // position mark
    break;
   end;
      k:=i+1;
  end;
 end;


 FirstPositionC1:=llms+length(totCharMsg)+lrms+1; //const 1
 conPolyS[1]:=copy(chipDecimal,FirstPositionC1,positionM[1]-FirstPositionC1); //first const poly, positionM as marker'position

 for i:= 2 to totChr  do //const 2 to last
 begin
  conPolyS[i]:=copy(chipDecimal,positionM[i-1]+5,positionM[i]-positionM[i-1]-5);
 end;

 for i:= 1 to totChr  do
 begin
  conPolyR[i]:=strtoqword(conPolyS[i]);
 end;

  //Finding-Root using Newton-Raphson
  //(because this method not realy finding accuracy(just root as ordinal of char, some algo not too strict)

  p0:=50;
  y0:=0;
  y1:=0;
  p1:=0;

  //Cond:=0; no need, use if trully find root with accuracy
  i:=1;
  for j:=1 to totChr do
  begin
  p0:=50;
  x:=p0;
  y0:=c1*(pow(x,d1))+c2*(pow(x,d2))+c3*(pow(x,d3))+c4*(pow(x,d4))-conPolyR[i];
  Cond:=0;
  for k:=1 to maxIter do
  begin
   x:=p0;

   //df is y'
   df:=d1*c1*(pow(x,(d1-1)))+d2*c2*(pow(x,(d2-1)))+d3*c3*(pow(x,(d3-1)))+d4*c4*(pow(x,(d4-1)));

   if (df=0) then
   begin
    Cond:=1;
    dp:=0;
   end
   else
    dp:=y0/df;

   p1:=p0-dp;
   x:=p1;
   y1:=c1*(pow(x,d1))+c2*(pow(x,d2))+c3*(pow(x,d3))+c4*(pow(x,d4))-conPolyR[i];

   //RellErr:= 2*abs(dp)/(abs(p1)+small); no need, use if trully find root with accuracy

   {no need use this part except find high accuracy in real root finder
   if (RellErr<delta) and (abs(y1)<eps) then
   begin
    if (Cond<>1) then Cond:=2;
   end;
   }
   p0:=p1;
   y0:=y1;

   if (Cond<>0) then break;

  end;

   //no need
   //if (Cond=0) then showmessage('The maximum number of  iterations was exceeded');
   //if (Cond=1) then showmessage('Division by zero was encounter');
   //if (Cond=2) then showmessage('The root was found with desired tolerances');

   ClearOrd[i]:=round(p1);//root, clear txt in ordinal
   ClearChar[i]:=chr(ClearOrd[i]);
   inc(i);

  end;

  RevealMessage:='';
  for i:=1 to totChr do
    RevealMessage:=RevealMessage+ClearChar[i];

  MemoMessageDec.Lines.Add(RevealMessage);

except
  showmessage('Something wrong with the input !!!'+#13#10+
  'Try the different key, digit on position 4,8,12 or 16 with 6 or smaller due to 64 bits capacity.');

end;

end;

procedure TFormCrypto.ButtonClearClick(Sender: TObject);
begin
  EditKey.Clear;
  MemoMessage.Clear;
  MemoChiper.Clear;
end;

End.

