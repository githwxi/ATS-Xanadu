########################################################################
## Ruby runtime support for sized arrays.
########################################################################
def XATS2RB_a1sz_length(a); a.length; end
def XATS2RB_a1sz_lget_at(a, i); a[i]; end
def XATS2RB_a1sz_lset_at(a, i, x); a[i] = x; nil; end
def XATS2RB_a1sz_make_ncpy(n, x); Array.new(n, x); end
def XATS2RB_a1sz_make_nfun(n, f); Array.new(n) { |i| f.call(i) }; end
def XATS2RB_a1sz_make_fwork(f)
  a = []
  f.call(->(x) { a << x })
  a
end
$XATS2RB_a1sz_length = method(:XATS2RB_a1sz_length)
$XATS2RB_a1sz_lget_at = method(:XATS2RB_a1sz_lget_at)
$XATS2RB_a1sz_lset_at = method(:XATS2RB_a1sz_lset_at)
$XATS2RB_a1sz_make_ncpy = method(:XATS2RB_a1sz_make_ncpy)
$XATS2RB_a1sz_make_nfun = method(:XATS2RB_a1sz_make_nfun)
$XATS2RB_a1sz_make_fwork = method(:XATS2RB_a1sz_make_fwork)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/axsz000.cats]
########################################################################.
########################################################################.
