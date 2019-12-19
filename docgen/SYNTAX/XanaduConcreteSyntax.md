The Concrete Syntax of Xanadu
=============================

### Author: Hongwei Xi (gmhwxi@gmail.com)

___________________

Xanadu is a programming language in the ATS family.  It is sometimes
referred to as ATS/Xanadu or simply ATS3.

Xanadu is designed to be both a source language and a target language;
it is a source for manual program construction (by humans), and it is
also a target for automated code generation (by compilers). It is
expected that various extensions to Xanadu will be built in the future
that compile back to Xanadu itself.

The concrete syntax of Xanadu has its root in ML, and its design is
also influenced by C and Lisp. In this document, please find an informal
presentation of the concrete syntax of Xanadu, which primarily relies on
code examples for illustration.

Primitive Constants
-------------------

There are currently in Xanadu the following kinds of primitive
constants: ints (for intergers), bools (for booleans), chars (for
characters), floating point numbers, and strings (of characters).
It is planned to support strings of various unicodes in the future.

### Ints

Each integer is represented as a non-empty sequence of digits. It is
assumed by default that the base of a representation is 10 unless the
first digit is 0, which indicates that the base is 8. For using base
16, one need to start a representation with either 0x or 0X. Note that
the hexdecimal digits of values from 10 to 15 are represented as
letters *a*, *b*, *c*, *d*, *e*, and *f*. And the uppercase of each of
these six letters can be used as well.

### Bools

The two boolean values are written as *true* and *false*. In the statics,
one can write *tt* and *ff* for *true* and *false*, respectively.

### Chars

### Floats

A floating point number in Xanadu can essentially be written in the
same way as in C.

### Strings

A string in Xanadu can essentially be written in the same was as in C.
For instance, here are some examples of string constants:

- <code>"abcde"</code>
- <code>"\"abcde\""</code>
- <code>"Hello, world!\n"</code>

Identifiers and Keywords
------------------------


