# Caesar cipher in Swift

An implementation of the Caesar cipher in Swift using a functional programming style.

![alt text](https://ijoshsmith.files.wordpress.com/2015/04/caesar.gif "Caeser cipher in use")

Refer to the [CaesarCipher](/caesar/CaesarCipher.swift) class to see how text can be enciphered, via the `encipher` method, using the same encryption technique used to protect Julius Caesar's personal correspondence. The class also contains a `decipher` method which uses statistical analysis to attempt to decrypt a message.

Review the test coverage in [CaesarCipherTests](/caesarTests/CaesarCipherTests.swift) to get a sense of what the code can, and cannot, do.

## Related links
This page on Wikipedia explains the Caesar cipher, and how to crack it, in detail:
http://en.wikipedia.org/wiki/Caesar_cipher

For an introduction to the chi-squared statistic used to crack an encrypted message, refer to:
http://www.ling.upenn.edu/~clight/chisquared.htm
