########################################################################
## Ruby runtime support for references and mutable arrays.
########################################################################
def XATS2RB_a0rf_lget(a); a[0]; end
def XATS2RB_a0rf_lset(a, x); a[0] = x; nil; end
def XATS2RB_a1rf_lget_at(a, i); a[i]; end
def XATS2RB_a1rf_lset_at(a, i, x); a[i] = x; nil; end
def XATS2RB_a0rf_make_1val(x); [x]; end
def XATS2RB_a1rf_make_ncpy(n, x); Array.new(n, x); end
def XATS2RB_a1rf_make_nfun(n, f); Array.new(n) { |i| f.call(i) }; end
$XATS2RB_a0rf_lget = method(:XATS2RB_a0rf_lget)
$XATS2RB_a0rf_lset = method(:XATS2RB_a0rf_lset)
$XATS2RB_a1rf_lget_at = method(:XATS2RB_a1rf_lget_at)
$XATS2RB_a1rf_lset_at = method(:XATS2RB_a1rf_lset_at)
$XATS2RB_a0rf_make_1val = method(:XATS2RB_a0rf_make_1val)
$XATS2RB_a1rf_make_ncpy = method(:XATS2RB_a1rf_make_ncpy)
$XATS2RB_a1rf_make_nfun = method(:XATS2RB_a1rf_make_nfun)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/axrf000.cats]
########################################################################.
########################################################################.
