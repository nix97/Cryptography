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

## 4. Nix Cryptography(RSA)

Implementation of RSA algorithm using Lazarus 4.8 FPC 3.2.2.

### RSA :

  On the RSA as asymmetric cryptography uses two different keys, e as public key/encrypt key(not secret) & d as private key/decrypt key(secret).
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
- We already have e, p, q.
- d=(1+k phi(n))/e   ; we loop k as integer till satisfied the equation(start with k=1).
- Finally we got d as our private key.
