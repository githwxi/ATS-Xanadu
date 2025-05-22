# [ATS3-Xanadu](http://www.ats-lang.org/)/xassets

This directory primarily contains some pre-built compilers
and accompanying files that one can use turn ATS3 source code
into a form that can be interpreted or executed.

## XATS2JS

For compiling ATS3 into JS.

### JS/xats2js/xats2js_jsemit00_ats2_opt1.js

This compiler is specifically built for bootstrapping ATS3.
The word `jsemit00` indicates that the compiler emits JS code after
loading (via a call to the function `the_tr12env_pvsl00d` in
`xglobal.dats`) some prelude-files specifically made for
bootstrapping.

## XATS2PY

For compiling ATS3 into Python3.

### JS/xats2py/xats2py_pyemit01_ats3_opt1.js

This compiler ATS3 is built for compiling ATS3 source.
The word `pyemit01` indicates that the compiler emits PY code after loading
(via a call to the function `the_tr12env_pvsl01d` in `xglobal.dats`)
some prelude-files made for general-purpose programming.
