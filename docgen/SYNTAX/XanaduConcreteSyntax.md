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
characters), floats (for floating point numbers), and strings (of
characters).  It is planned to support strings of various unicodes in
the future.

### Ints

Each integer is represented as a non-empty sequence of digits. It is
assumed by default that the base of a representation is 10 unless the
first digit is 0, which indicates that the base is 8. For using base
16, one needs to start a representation with either 0x or 0X. Note
that the hexdecimal digits of values from 10 to 15 are represented as
letters *a*, *b*, *c*, *d*, *e*, and *f*. And the uppercase of each of
these six letters can be used as well. Please find some integer
representations as follows:

- <code>01234567</code>
- <code>123456789</code>
- <code>0xdeadbeef</code>

### Bools

The two boolean values are written as *true* and *false*. In the statics,
one can write *tt* and *ff* for *true* and *false*, respectively.

### Chars

A char-value in Xanadu can essentially be written in the
same way as in C. Please find some examples of char-values
as follows:

- <code>'a'</code>
- <code>'\n'</code>
- <code>'\123'</code>

### Floats

A float-value in Xanadu can essentially be written in the same way as
in C. Please find some examples of float-values as follows:

- <code>0.01</code>
- <code>1E-2</code>
- <code>1000</code>
- <code>1.0E3</code>
- <code>3.1415926</code>
  
### Strings

A string in Xanadu can essentially be written in the same way as in C.
Please find some examples of string constants as follows:

- <code>"abcde"</code>
- <code>"\\"abcde\\""</code>
- <code>"Hello, world!\\n"</code>

Keywords
--------

Xanadu supports a rich set of programming features, making use of
quite a few keywords.

- <code>$addr</code>:
  for taking the address of a left-value
- <code>$fold</code>:
  for folding an unfolded value of some linear datatype (i.e., datavtype)
- <code>$lazy</code>:
  for forming a lazy-value (representing suspended computation)
- <code>$llazy</code>:
  for forming a linear lazy-value (representing suspended computation)
- <code>$raise</code>:
  for raising a run-time exception (which may be caught by a handler)
- <code>$tup</code>: for forming a boxed tuple like $tup_t or $tup_vt
- <code>$tup_t</code>: for forming a boxed tuple containing no linear components
- <code>$tup_vt</code>: for forming a boxed tuple that may contain linear components
  
Identifiers
-----------

Fixity-Delarations
------------------

Stacst-Delarations
------------------

Staexp-Delarations
------------------

Value-Delarations
------------------

Variable-Delarations
--------------------

Function Delarations
--------------------

Implement-Delarations
---------------------