![License](https://img.shields.io/github/license/nix97/Cryptography)
![Issues](https://img.shields.io/github/issues/nix97/Cryptography)
![Stars](https://img.shields.io/github/stars/nix97/Cryptography)
![Language](https://img.shields.io/badge/Language-C%23-239120?logo=c-sharp&logoColor=white)
![Pascal](https://img.shields.io/badge/language-Pascal-orange?logo=pascal)
![AES](https://img.shields.io/badge/Algorithm-AES-blue)
![RSA](https://img.shields.io/badge/Algorithm-RSA-green)
![SHA](https://img.shields.io/badge/Hash-SHA256-orange)
![Padding](https://img.shields.io/badge/Detail-PKCS7%20Padding-lightgrey)

# Cryptography

## 1. AES(Advance Encryption Standard)

This app is about Cryptography using AES(Advanced Encryption Standard) algorithm.<br>
The Key, IV(Initialization Vector) and Ciphertext in Base64 number system.<br>
The key lengths or key size is 128 bit(AES-128), 192 bit(AES-192) and 256 bit(AES-256).<br>
Using lib : --> using System.Security.Cryptography;

``` c#
using System.Security.Cryptography;
aes.GenerateKey();
aes.GenerateIV();
```

## 2. Nix Hashing(use SHA256, SHA512, MD5 algorithm)

This app to hashing text and file, as the result we got hashing text.<br>
-SHA256 is 256 bits(32 bytes) with hexadecimal characters is 64.<br>
-SHA512 is string with 128 hexadecimal character.<br>
-MD5 got 32 hexadecimal char.<br>
Using lib : --> using System.Security.Cryptography;

``` c#
using System.Security.Cryptography;
```

## 3. RSA Pascal

Implementation of RSA algorithm using Pascal (text base/terminal).
