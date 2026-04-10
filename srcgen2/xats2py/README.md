# [ATS3](http://www.ats-lang.org/)/srcgen2/xats2py

This directory contains versions of XATS2PY (ATS3-to-PY compiler)
written in ATS3.

## The [xats2py/srcgen1] subdirectory

This is the place where one finds the first version of XATS2PY written
in ATS3, which can be referred to as xats2py/srcgen1.

Yes, xats2py/srcgen1 can be used to bootstrap ATS3. However, this
compiler does not do tail-recursion optimization. As a consequence,
Python~3 needs to set a big recursion limit (e.g., 66000) in order for
running it to compile ATS3.

<!--
########################################################################
-->
