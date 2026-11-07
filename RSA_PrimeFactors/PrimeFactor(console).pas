//p x q = n, p, q is prime number(use on RSA)
//the problem on given n, what is p & q ?

Program PrimeFactors;


uses Math;

var


 digit_n,sqrt_n,digit_sqn,a,b,jj,i,totPrime,k: qword;
 totCdt,p,q,m,n,o,l,z:qword;
 string_n,sq_n,str_a,str_b,ldig_pq,string_pq: String;
 ldig_n,zero,nine,detail,again:Char ;
 is_prime:array[1..10000000] of boolean;
 prime,c_pq:array[1..10000000] of qword ; //c_pg:candidate pq
 found:Boolean;

function IntToStr(n: Integer): String;
var
  s: String;
begin
  Str(n, s);
  IntToStr := s;
end;

function StrToInt(s: String): Integer;
var
  n, i, sign: Integer;
begin
  n := 0;
  sign := 1;
  i := 1;

  if s[1] = '-' then
  begin
    sign := -1;
    i := 2;
  end;

  while i <= Length(s) do
  begin
    n := n * 10 + Ord(s[i]) - Ord('0');
    i := i + 1;
  end;

  StrToInt := n * sign;
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



 
begin
 again:='Y';
 while(upcase(again)='Y') do
 begin
  writeln('Prime Numbers Factorization');
  writeln('n = p x q, given n, find p & q as Prime number');
  writeln('example n=8633,962261,515573,503807,469559,485869,99400891,9920422243');
  write('n='); ReadLn(n);

 //n can't negative
 if (n<0) then 
 begin
  writeln('n must be positif !');
  break;
 end;
 
 if (n>20) then 
 begin
 if (n mod 2=0) or (n mod 5=0) then 
  begin
   writeln('n not multiply of p & q!');
   break;
  end;
 end;
 
 
 string_n:=IntToStr(n);
 digit_n:=length(string_n);
 {
 if digit_n<2 then 
 begin 
  writeln('Minimum digits n is 2 !');
  break;
 end;
 }
 write('View detail[Y/N]?'); readln(detail);
 writeln();
 writeln('Digits n is:',digit_n);
 
 sqrt_n:=floor(sqrt(n));
 sq_n:=IntToStr(sqrt_n);
 digit_sqn:=length(sq_n); //or digits p or q
 writeln('Digits p or q is:',digit_sqn);
 
 //Prime on range[a,b] e.g. a=100, b=999 on 3digits
 a:=trunc(exp(ln(10)*(digit_sqn-1))); //10^(sqrt(digit_sqn-1)
 b:=trunc(exp(ln(10)*digit_sqn)-1);

 writeln('Prime numbers on ['+inttostr(a)+','+inttostr(b)+']:');

 dosieve(b);
 
 i:=1; 
 for jj:=a to b do
 begin
   if is_prime[jj] then 
   begin
    if upcase(detail)='Y' then write(inttostr(jj)+'  ');
   end;
   if is_prime[jj] then 
   begin
    prime[i]:=jj;
    inc(i);
   end;
   totPrime:=i-1;
 end;
 writeln();
 writeln('Total prime numbers :'+inttostr(totPrime));
 
 //check last digit n
 ldig_n:=string_n[digit_n];
 
 k:=1;
 case ldig_n of //last digit n
 '1':
 begin
  
  for i:=1 to totPrime do
  begin 
   //check last digit candidate p and q
   string_pq:=IntToStr(prime[i]);
   ldig_pq:=string_pq[digit_sqn];
  
   if (ldig_pq='1') or (ldig_pq='3') or (ldig_pq='7') then
   begin
    c_pq[k]:=prime[i];
    inc(k);  
   end;
  end;
  totCdt:=k-1; //total candidate pq
 end;
 
 '3','7': //if last digit n=3, p or q possible 1 and 3
 begin 
  for i:=1 to totPrime do
  begin 
   //check last digit candidate p and q
   string_pq:=IntToStr(prime[i]);
   ldig_pq:=string_pq[digit_sqn];
  
   if (ldig_pq='1') or (ldig_pq='3') 
   or (ldig_pq='7') or (ldig_pq='9') then
   begin
    c_pq[k]:=prime[i];
    inc(k);  
   end;
  end;
  totCdt:=k-1; //total candidate pq
 
 end;
 
 '9':
 begin 
  for i:=1 to totPrime do
  begin 
   //check last digit candidate p and q
   string_pq:=IntToStr(prime[i]);
   ldig_pq:=string_pq[digit_sqn];
  
   if (ldig_pq='1') or (ldig_pq='3') or (ldig_pq='9') then
   begin
    c_pq[k]:=prime[i];
    inc(k);  
   end;
  end;
  totCdt:=k-1; //total candidate pq
  end;
 
 end;
 
 writeln();
 p:=0;
 q:=0;
 if (n>20) then
 begin
  if upcase(detail)='Y' then
  begin
   writeln('Candidates p, q:');
   for k:=1 to totCdt  do
    write(inttostr(c_pq[k])+'  ');
  end;
   writeln();
   writeln('Total candidates p, q:', totCdt);
 end;

 //end;
 
 //if use multiply
 //compare p x q = n(combination p,q)
 {
 m:=1;
 o:=2;

 for k:=1 to totCdt-1 do
 //for k:=1 to totCdt do
 begin
  for l:=1 to totCdt-1  do
//  for l:=1 to totCdt do
  begin
  
    if (c_pq[m]*c_pq[o]=n) then
    begin
     p:=c_pq[m];
     q:=c_pq[o];
     break;
    end;

  inc(o);
 end;
 inc(m);
 o:=k+1;
 end;
 
 }
 
 //Check to find p, q from candidate
// found:=false;
 for k:=1 to totCdt-1 do
 begin
  if n mod c_pq[k]=0 then
  begin
   //found:=true;
   p:=c_pq[k];
   q:=trunc(n/p);
   break;
  end;
 end;
 
 //case n<20
 for k:=1 to 3 do
 begin 
 
  if(n<20) then 
  begin
   if (n mod 2=0) then
   begin
    p:=2;
    q:=trunc(n/p);
    writeln('Candidates p, q:2  '+inttostr(q)); //all possible
    writeln('Total candidates p, q:', inttostr(2));
    break;
   end
   else
   begin
    p:=3;
    q:=5;
    writeln('Candidates p, q:3  5'); //all possible
    writeln('Total candidates p, q:', inttostr(2));
    break;
   end;
  end;
 
 end;

 
 writeln();
 writeln('Final result:');
 writeln('p=',inttostr(p));
 writeln('q=',inttostr(q));
 write('Process again [Y/N]?'); readln(again);
 end;
 
   
end.
