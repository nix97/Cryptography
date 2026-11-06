unit unitfactors;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls,Math,unitformula;

type

  { TFormFactors }

  TFormFactors = class(TForm)
    ButRunReveal: TButton;
    ButExample: TButton;
    ButClear: TButton;
    ButRSA: TButton;
    EditD: TEdit;
    EditE: TEdit;
    EditN: TEdit;
    EditP: TEdit;
    EditQ: TEdit;
    GBPublic: TGroupBox;
    GBPrivate: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    processTime: TLabel;
    MemoDescription: TMemo;
    MemoDetails: TMemo;
    RGView: TRadioGroup;
    procedure ButClearClick(Sender: TObject);
    procedure ButExampleClick(Sender: TObject);
    procedure ButRSAClick(Sender: TObject);
    procedure ButRunRevealClick(Sender: TObject);
  private

  public

  end;

var
  FormFactors: TFormFactors;
  is_prime:array[1..10000000] of boolean;

implementation

{$R *.lfm}

{ TFormFactors }

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

procedure dosieve(limit : qword);
var
 i,k,x,y:longint; n:qword;

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


procedure TFormFactors.ButRunRevealClick(Sender: TObject);
label
  final,Scenario;
var
 digit_n,digit_p,a,b,a2,jj,i,totPrime,n,k,g : qword;
 totCdt,p,q,Qn,e,pk,ldq : qword;
 string_n,string_p,PrimeNum,Candidates,Qns,ds : string;
 Strld_p,interval_prime : String;

 ldig_n,ldig_p : Char;
 c_p,prime:array[1..1000000] of qword ; //c_pg:candidate pq
 d : extended;
 start_time, stop_time, elapsed : TDateTime;
 found:boolean;

begin
 try
   start_time := now; //start to counting Process time

   memoDetails.Clear;
   n:=strtoQWord(editN.Text); //n,e is public(not secret)
   e:=strtoQWord(editE.Text);
   string_n:=QWordToStr(n);
   digit_n:=length(editN.Text);

   if (digit_n<3) then
   begin
    showmessage('Minimum digit n is 3 !!!');
    goto final;
   end;

   if (n mod 2=0) or (n mod 5=0)  then
   begin
    showmessage('n is not multiply of two prime numbers !!!');
    goto final;
   end;

   if ((digit_n)>14) then
   begin
    showmessage('Maximum digit n is 14 !!!');
    goto final;
   end;

   //assume same length digit p, q(scenario 1)
   digit_p:=0;
   digit_p:=ceil(digit_n/2);
   a:=trunc(exp(ln(10)*(digit_p-1))); //10^(sqrt(digit_sqn-1), asume length digit p=q(Scenario 1)
   b:=trunc(exp(ln(10)*digit_p)-1);

   g:=1;
   Repeat
     Scenario:
     dosieve(b);
     PrimeNum:='';
     i:=1;
     for jj:=a to b do
     begin
          if is_prime[jj] then
           begin
                PrimeNum:=PrimeNum+inttostr(jj)+'  ';
           end;
     if is_prime[jj] then
     begin
        prime[i]:=jj;
         inc(i);
     end;
         totPrime:=i-1;
     end;

   //check last digit n
   ldig_n:=string_n[digit_n];

   k:=1;
   case ldig_n of //last digit n
   '1':
   begin
    for i:=1 to totPrime do
    begin
     //check last digit candidate p
     string_p:=IntToStr(prime[i]);
     ldig_p:=string_p[digit_p];
     if (ldig_p='1') or (ldig_p='3') or (ldig_p='7') then
     begin
      c_p[k]:=prime[i];
      inc(k);
     end;
    end;
    totCdt:=k-1; //total candidate p
    Strld_p:='1, 3, 7'; //string last digit p='1, 3, 7' ; coz 1*1=1, 3*7=21;
   end;

   '3','7': //if last digit n=3, p possibly 1,3,7,9
   begin
     for i:=1 to totPrime do
       begin
       string_p:=QWordToStr(prime[i]);
       ldig_p:=string_p[digit_p];
       if (ldig_p='1') or (ldig_p='3')or (ldig_p='7')
       or (ldig_p='9') then
       begin
         c_p[k]:=prime[i];
         inc(k);
       end;
     end;
      totCdt:=k-1; //total candidate p
      Strld_p:='1, 3, 7, 9';
   end;

   '9':
   begin
     for i:=1 to totPrime do
     begin
       string_p:=QWordToStr(prime[i]);
       ldig_p:=string_p[digit_p];
       if (ldig_p='1') or (ldig_p='3') or (ldig_p='9') then
       begin
         c_p[k]:=prime[i];
         inc(k);
       end;
     end;
     totCdt:=k-1; //total candidate pq
     Strld_p:='1, 3, 9';
   end;
 end;

   p:=0; //initiate
   q:=0;
   Candidates:='';
   if (n>100) then
   begin
     for k:=1 to totCdt  do
      Candidates:=Candidates+inttostr(c_p[k])+'  ';
   end;

   //Check to find p, q from candidate
   for k:=1 to totCdt-1 do
   begin
    if n mod c_p[k]=0 then
    begin
     p:=c_p[k];
     q:=trunc(n/p);
     break;
    end;
   end;
   interval_prime:='['+QWordtostr(a)+','+QWordtostr(b)+']';

   if (p<>0) then found:=true //same length digit p & q
   else //diff length (from diff 2,3,.. digit)
   begin
    a:=trunc(exp(ln(10)*((digit_p)-1-g))); //10^(sqrt(digit_sqn-1)
    a2:=trunc(exp(ln(10)*(digit_p-g))-1);
    digit_p:=digit_p-g;
    b:=a2;
    inc(g);
    interval_prime:='['+QWordtostr(a)+','+QWordtostr(a2)+']';
    goto Scenario;
   end;
  Until found;

  n:=p*q;
  q:=trunc(n/p); //get int from float
  ldq:=length(QWordtostr(q)); //length digit q
  Qn:=(p-1)*(q-1); //Qn is ø(n) on RSA formula
  QnS:=qwordtostr(Qn); //val ø(n) as string
  for k:=1 to high(qword) do //highest qword=18446744073709551615
  begin
    d:=(1+k*Qn)/e;
    if frac(d)=0 then break; //check fraction of d (if 0 then k found)
  end;

  d:=(1+k*Qn)/e; //k from >>for k:=1 to high(qword) till found the right int
  pk:=trunc(d);
  ds:=QWordtostr(pk);//val d as string

  memoDetails.Clear;
  if RGView.ItemIndex=0 then //final result only
  begin
    editP.text:=inttostr(p);
    editQ.text:=inttostr(q);
    editD.text:=QWordtostr(pk);
  end
  else //index 1 detail steps
  begin
    //final
    editP.text:=inttostr(p);
    editQ.text:=inttostr(q);
    editD.text:=QWordtostr(pk);

    //steps
    memoDetails.lines.add('Digits n is : '+QWordtostr(digit_n)+'  ;');
    memoDetails.lines.add('Digits p is : '+QWordtostr(digit_p)+' ;'+ ' digits q is : ' +QWordtostr(ldq)+'  ;');
    memoDetails.lines.add('Last digit n is : '+ldig_n+'  ;');
    memoDetails.lines.add('Last digit p could be : '+Strld_p+'  ;'+#13#10); //just check p, because if got p, so got q
    memoDetails.lines.add('Prime numbers on '+interval_prime+':  ');
    memoDetails.Lines.Add(PrimeNum);
    memoDetails.Lines.Add('Total prime numbers : '+inttostr(totPrime)+'  ;'+#13#10);
    memoDetails.Lines.Add('Candidates p :');
    memoDetails.Lines.Add(Candidates);
    memoDetails.Lines.Add('Total candidates p : '+inttostr(totCdt)+'  ;'+#13#10);
    memoDetails.Lines.Add('RSA :'+#13#10);
    memoDetails.Lines.Add('p.q = n  ; (if got p then got q also);');
    memoDetails.Lines.Add('Check from all candidates p above,if (n mod p)=0 then we got p, other factor is q  ;');
    memoDetails.Lines.Add('n mod p = 0  ;  '+Qwordtostr(n)+' mod '+Qwordtostr(p)+' = 0, So p = '+Qwordtostr(p)+'  ;');
    memoDetails.Lines.Add('q = n / p = '+Qwordtostr(n)+' / '+Qwordtostr(p)+' = '+Qwordtostr(q)+'  ;');
    memoDetails.Lines.Add('ø(n) = (p-1)*(q-1) =('+Qwordtostr(p)+'-1)*('+Qwordtostr(q)+'-1) =  '+QnS+'  ;');
    memoDetails.Lines.Add('Value of k as integer is : '+Qwordtostr(k)+'  ;');
    memoDetails.Lines.Add('d =(1+k*ø(n))/e = '+'(1+'+Qwordtostr(k)+' * '+Qwordtostr(Qn)+')/'+Qwordtostr(e)+' =  '+ds+'  ;');
    memoDetails.Lines.Add('');
    memoDetails.Lines.Add('Result :');
    memoDetails.Lines.Add('p = '+inttostr(p)+'   (as first of the Prime factor)  ;');
    memoDetails.Lines.Add('q = '+inttostr(q)+'   (as the second factor or vice versa !)  ;');
    memoDetails.Lines.Add('d = '+QWordtostr(pk)+'   (as Private key - Secret reveal !!!)  ;'); //pk(int)=d(extend)
  end;

  final:

  except
    showmessage('Something wrong with the input !!!');
  end;

  stop_time := Now;
  elapsed := stop_time - start_time;
  processTime.Caption:='Process time : '+timetostr(elapsed)+' (hh:mm:ss)';

end;

procedure TFormFactors.ButExampleClick(Sender: TObject);
begin
  editN.Text:=inttostr(715260631); //(n=N) nonsensitive case
  //editE.Text:=inttostr();
  editE.Text:=inttostr(90023);     //e
end;

procedure TFormFactors.ButRSAClick(Sender: TObject);
begin
  FormFormula.Show;
end;


procedure TFormFactors.ButClearClick(Sender: TObject);
begin
  EditN.Clear;
  EditE.Clear;
  EditP.Clear;
  EditQ.Clear;
  EditD.Clear;
  MemoDetails.Clear;
end;

end.

