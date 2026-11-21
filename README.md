![License](https://img.shields.io/github/license/nix97/Cryptography)
![Issues](https://img.shields.io/github/issues/nix97/Cryptography)
![Stars](https://img.shields.io/github/stars/nix97/Cryptography)
![Language](https://img.shields.io/badge/Language-C%23-239120?logo=c-sharp&logoColor=white)
![Pascal](https://img.shields.io/badge/language-Pascal-orange?logo=pascal)
![AES](https://img.shields.io/badge/Algorithm-AES-blue)
![RSA](https://img.shields.io/badge/Algorithm-RSA-green)
![SHA](https://img.shields.io/badge/Hash-MD5|SHA256|512-orange)

# Cryptography

## 1. AES(Advance Encryption Standard)
   This app is about Cryptography using AES(Advanced Encryption Standard) algorithm, build in Microsoft Visual Studio 2022.
<br>
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

## 4. Nix Cryptography(RSA)

> Implementation of RSA algorithm using Lazarus 4.8 FPC 3.2.2.

### RSA :

> On the RSA as asymmetric cryptography uses two different keys, e as public key/encrypt key(not secret) & d as private key/decrypt key(secret).
### Formula:

### p . q = n ;
p, q is prime number
### $\phi(n)=(p-1)(q-1)$
### $d=\frac{1+k\ \phi(n)}{e}$ 
k:integer
### Encryption:
### $m^e\ mod\ n$
m:integer
### Decryption:
### $c^d\ mod\ n$
c:integer\
The public keys is (n,e)<br>
The private key represent as (n,d) and p, q is secret also.
 
### SLIMMING BRUTE FORCE :

   The idea is to find p first as one of the prime factors, then get q using q=n/p.\
The method as follows :
- On this app, the lower boundary required a minimum 3 digits decimal.
- Check n, Eliminate if last digit n is 2 or 5(because there is no composite number as a product of multiply two prime numbers.
- On a 3 digit or higher of prime number, the last digit must be 1 or 3 or 7 or 9 and so with p.
- First find a length digits of n(e.g 11 digits).
- Find digit p using: ceil(digit n/2),  e.g, ceil(11/2)=6 digits.
- This method is called the "Slimming Brute Force", where it covers all possibilities to find p.
- After length digits of p or q found, we find all prime numbers(or candidates p) on [a,b], where a= 10^(m-1), b=(10^m)-1, where m is length digit of p. Example m=3, so p on the [100,999] with assume p & q got the same length digit.
- If two factors have different length digit then we use the 2nd scenario where we decrease a as the left boundary to find candidates of p where a becomes a= 10^(m-1-g), g start from 1. Now a=10(2 digit), [a,b] becomes [10,99],and so on.  
- We can use the Sieve of Atkin algorithm to find all prime numbers on a given interval.
- We try the first scenario with assume p, q got the same length digit(it's usually used, because if one of the factor got shorter digit, easier to break), and try others scenarios till found p(automatically found q also). We got all candidates for p.
- Check the right candidate use: if (n mod p)=0 then p found & find q using q=n/p.
- We already had e, p, q.
- d=(1+k phi(n))/e   ; we loop k as integer till satisfied the equation(start with k=1).
- Finally we got d as our private key.

## 5.Cryptography using Newton-Raphson method as Finding Root of Polynomial 

- Using single key 16 digits decimal.
- Polynomial with 4 terms as follows:
$F(x) = c_1(x)^{d1}+c_1(x)^{d1}+  c_1(x)^{d1}+c_1(x)^{d1}$
where c : coefficient ; d : degree  ------ Position of digit decimal on key, from 1 to 16, coefficient 1 (digit 1-3), degree 1 (digit 4), coef 2 (digit 5-7), deg 2 (digit 8),
coef 3 (digit 9-11), deg 3 (digit 12) and coef 4 (digit ,13-15), deg 4 (digit 16).  - Can use 16 digit decimal, e.g key = 4957578310536271.
- So, equation becomes
- Input ordinal number from character in ASCII to Polynomial F(x), so we got value as constant. Example ordinal(A)=65, so got
value of constant on a given ordinal of char.
- Thus 
- Or
- Now we have a Finding-Root problem.  In this case, I use Newton-Raphson method to solve the problem.
- As the final result we had the root in the ordinal number after using Newton-Raphson method.  In the example above the root is 65 (char ‘A’ ).
- The same way, we can apply to the message which is the string of chars.  The others are just String operations..  To view purposes, decimal string encoded to Base64 on menu Encryption.  Next step chipertext Base64 format reverse back to decimal string on menu Decryption, and find all the roots as constant of
each characters.
- Finally every single constant convert to characters again & we got the message.  -- That’s it, that’s all.
  <br>
Build on  Lazarus 4.8 FPC 3.2.2.

