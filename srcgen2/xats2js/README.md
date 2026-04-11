# [ATS3](http://www.ats-lang.org/)/srcgen2/xats2js

This directory contains versions of XATS2JS (ATS3-to-JS compiler)
written in ATS3.

## The [xats2js/srcgen1] subdirectory

This is the place where one finds the first version of XATS2JS written
in ATS3, which can be referred to as xats2js/srcgen1.

(Note that the first version of XATS2jS was written earlier in ATS2,
which played a pivotal role in bootstrapping ATS3.)

Yes, xats2js/srcgen1 can be used to bootstrap ATS3. However, this
compiler does not do tail-recursion optimization. As a consequence,
`node` (or `nodejs`) needs the flag `--stack-size=8000` (where 8000 is
just a ballpark number) when running it to compile ATS3.
  
## The [xats2js/srcgen2] subdirectory

This is the place where one finds another version of XATS2JS written
in ATS3, which can be referred to as xats2js/srcgen2. This version
makes use of the IR designed for the first version of xats2cc,
consequently serving as a `guinea pig` for testing the IR. Also, this
version performs tail-recursion optimization (i.e., it translates a
tail-recursive call into a jump, eliminating the need for allocating a
new frame on the call stack), which makes it suitable for generating
JS code that runs inside a browser (where the call stack size is often
greatly limited).

<!--
########################################################################
-->
