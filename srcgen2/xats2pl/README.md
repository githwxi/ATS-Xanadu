# [ATS3](http://www.ats-lang.org/)/srcgen2/xats2pl

This directory contains versions of XATS2PL (ATS3-to-PL compiler)
written in ATS3.

## The [xats2pl/srcgen1] subdirectory

This is the place where one finds the first version of XATS2PL written
in ATS3, which can be referred to as xats2pl/srcgen1.

Yes, xats2pl/srcgen1 can be used to bootstrap ATS3. However, this
compiler does not do tail-recursion optimization. As a consequence,
Perl~5 needs to set a big recursion limit in order for running it to
compile ATS3.

<!--
########################################################################
-->
