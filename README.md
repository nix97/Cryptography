![License](https://img.shields.io/github/license/nix97/Cryptography)
![Issues](https://img.shields.io/github/issues/nix97/Cryptography)
![Stars](https://img.shields.io/github/stars/nix97/Cryptography)
![Language](https://img.shields.io/badge/Language-C%23-239120?logo=c-sharp&logoColor=white)
![Pascal](https://img.shields.io/badge/language-Pascal-orange?logo=pascal)
![AES](https://img.shields.io/badge/Algorithm-AES-blue)
![RSA](https://img.shields.io/badge/Algorithm-RSA-green)
![SHA](https://img.shields.io/badge/Hash-SHA256-orange)
![SHA](https://img.shields.io/badge/Hash-SHA512-red)

# Cryptography

## 1. AES(Advance Encryption Standard)

This app is about Cryptography using AES(Advanced Encryption Standard) algorithm, build in Microsoft Visual Studio 2022.<br>
The Key, IV(Initialization Vector) and Ciphertext in Base64 number system.<br>
The key lengths or key size is 128 bit(AES-128), 192 bit(AES-192) and 256 bit(AES-256).<br>
Using lib : --> using System.Security.Cryptography;

``` c#
using System.Security.Cryptography;
aes.GenerateKey();
aes.GenerateIV();
```

## 2. Nix Hashing(use SHA256, SHA512, MD5 algorithm)

This app to hashing text and file, as the result we got hashing text. Build in Microsoft Visual Studio 2022<br>
-SHA256 is 256 bits(32 bytes) with hexadecimal characters is 64.<br>
-SHA512 is string with 128 hexadecimal character.<br>
-MD5 got 32 hexadecimal char.<br>
Using lib : --> using System.Security.Cryptography;

``` c#
using System.Security.Cryptography;
```

## 3. RSA Pascal

Implementation of RSA algorithm using Pascal (text base/terminal).

## 4. RSA Lazarus (GUI)

Implementation of RSA algorithm using Lazarus 4.8 FPC 3.2.2.

### RSA :

  On the RSA as asymmetric cryptography uses two different keys, e as public key/encrypt key(not secret) & d as private key/decrypt key(secret).
### Formula:

### p . q = n ;
p, q is prime number
### $\phi(n)=(p-1)(q-1)$
### $d=\frac{1+k \phi(n)}{e}$ 
k:integer
### Encryption:
### $ \m^{e} \, mod \,n \:$; \:\:m:integer$
<b>Decryption:</b><br>
\[c^d \, mod \,n \:; \:\:c:integer \]<br>
   
The public keys is (n,e)<br>
The private key represent as (n,d) and p, q kept secret also.
<br>So the parameters: e,n is public and d,p,q is private(secret).
-p.q=n 
where p, q is prime number.
 n is not secret(public), otherwise p, q is secret(private), here p & q hidden on n. If we can reveal p, q from n, we get d as a private key.
- ø(n)=(p-1)(q-1)
- d=(1+k ø(n))/e   
 where k is integer from 1,2,3,...... till fulfill equation.\
 

### SLIMMING BRUTE FORCE :

  The idea is to find p first as one of the prime factors, then get q using q=n/p.\
The method as follows :
-On this app, the lower boundary required a minimum 3 digits decimal.\
-On a 3 digit or higher prime number, the last digit must be 1 or 3 or 7 or 9. From this possibility, the last digit of n, can be used to find p.\
-First find a length digit of n(e.g 11 digits).\
-Length digit of p or q(same length digits usually).\
Find digit p using q=ceil(digit n/2),  e.g, ceil(11/2)=6.\
-Last digit of n can determine the last digit of p.\
-Probability:\
-If n=xxxxx1 (p=xx1, q=xx1)
 or (p=xx3, q=xx7, because 3*7=21, last digit=1 like n),\
 so last digit p,q is 1, 3 ,7
-The same way if last digit n is 3 or 7
 then last digit p, q is 1, 3 ,7, 9\
-So if last digit n is 9
 must be last digit p, q is 1, 3 , 9\
-This method is called the "Slimming Brute Force", where it covers all possibilities to find p and so q but eliminate non candidates prime.
-After length digits of p or q found, we find all prime numbers on [a,b], where a= 10^(m-1), b=(10^m)-1, e.g m=3, so [100,999] with assume p, q got same length digit that usually used.\
If two factors have different length digits then we use the 2nd scenario where we decrease a as the left boundary to find a candidate of p where a= 10^(m-1-g), g start from 1. Now a=10(2 digit), [a,b] becomes [10,99],and so on.  
-We can use the Sieve of Atkin algorithm to find all prime numbers on a given interval.\
-We try the first scenario with assume p, q got the same length digit, and try others scenarios till found p(automatically found q also). We got all candidates for p.\
-Check the right candidate use: if (n mod p=0) then p found. So q=n/p.\
-We already have e, p, q.\
-d=(1+k phi(n))/e   ; we loop k as integer till satisfied with the equation(start with 1).\
-Finally we got d as our private key.
 
