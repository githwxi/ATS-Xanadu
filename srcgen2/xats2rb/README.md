# [ATS3](http://www.ats-lang.org/)/srcgen2/xats2rb

This directory contains versions of XATS2RB (ATS3-to-RB compiler)
written in ATS3.

## The [xats2rb/srcgen1] subdirectory

This is the place where one finds the first version of XATS2RB written
in ATS3, which can be referred to as xats2rb/srcgen1.

Yes, xats2rb/srcgen1 can be used to bootstrap ATS3. However, this
compiler does not do tail-recursion optimization. As a consequence,
Ruby needs to set a big recursion limit in order for running it to
compile ATS3.

<!--
########################################################################
-->
