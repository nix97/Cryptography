(*Windows Free Pascal is developed by dr J.Szymanda under the GPL License*)
(*************************************************************************)
Program RSA;
{$goto on}
uses sysutils,math;

label ketemu_k;
var p,q,e,qn,n,pj,pj2,pj_c,i,k,f,x_i,j,pjn,z,pjc,pjcb:longint;
s,sord,m,chiper,m3,plain,chiperb:string;
d:real;
sx,cs,c4:array[1..1000] of string;
o,c,m2,s_ord,c3:array[1..1000] of longint;
function modular_pow(base,exponent,modulus:longint):longint;
var c,e_prime:longint;

begin
    if modulus = 1 then modular_pow:=0;
    c := 1;
    for e_prime:= 1 to exponent do
        c:=(c*base) mod modulus;
    modular_pow:=c;
end;

begin
	//s:='Makan Minum Tidur';
	write('Pesan:'); readln(s);
	pj:=length(s);
    for i:=1 to pj do
    begin
    
    //	s_ord[i]:=ord(s[i]);
    	if ord(s[i])<10 then sx[i]:='00'+inttostr(ord(s[i]))
    	else if ord(s[i])<100 then sx[i]:='0'+inttostr(ord(s[i]))
    	else sx[i]:=inttostr(ord(s[i]));
    //	sord:=sord+inttostr(s_ord[i]);
    	sord:=sord+sx[i];
    end;
	writeln(sord);
	
	writeln('isikan p,q,e dg bil prima minimal 2 digit');
	write('p:=');readln(p); //47
	write('q:=');readln(q); //71
	
	write('e:=');readln(e); //79
	//e:=17;
	n:=p*q;
	qn:=(p-1)*(q-1);
	writeln('n=',n);
	pjn:=length(inttostr(n));
//	d:=2753;
	k:=1;
  for k:=1 to 10000 do
  begin
   d:=(1+k*Qn)/e;
   if frac(d) =0 then goto ketemu_k;
  end;

  ketemu_k:

  d:=(1+k*Qn)/e;
  f:=trunc(d);
 writeln('d=',f);
	
//	x_i:=ceil(pj);

  k:=0;
  for i:=1 to pj  do
  begin
   m:='';
    for j:=1 to 3 do
    begin
     m:=m+(sord[j+k]);
    end;
     k:=3*i;
     o[i]:=strtoint(m);
  end;	
	
for i:=1 to pj do
 c[i]:=modular_pow(o[i],e,n);
 

 
 
 for i:=1 to pj do
  writeln('c',i,'=',c[i]);
 
 
 
 for i:=1 to pj do
  chiper:=chiper+inttostr(c[i]);
 writeln('chiper:',chiper);
 writeln('pj chip:',length(chiper));
 
 pj_c:=length(chiper);
 pj2:=ceil(pj_c/pj);
 
 
 for i:=1 to pj do
 begin
 	z:=pjn-length(inttostr(c[i]));
 	case z of
 	0:cs[i]:=inttostr(c[i]);
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
 	
  end;	
 end;
//chiper:='';
    for i:=1 to pj do
  chiperb:=chiperb+(cs[i]);
 writeln('chiper baru:',chiperb);
 
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
  writeln('cb',i,'=',c4[i]);
 
  for i:=1 to pjc do
   c3[i]:=strtoint(c4[i]);
 
 for i:=1 to pjc do
 m2[i]:=modular_pow(c3[i],f,n);
 
  for i:=1 to pjc do
   writeln('m',i,':',m2[i]);
 
 for i:=1 to pjc do
  m3[i]:=char(m2[i]);
  
  for i:=1 to pj do
  plain:=plain+m3[i];
 
 writeln('m:',plain);
 readln;
 
 						
end.