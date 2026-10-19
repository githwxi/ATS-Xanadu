########################################################################
## Ruby runtime support for booleans.
########################################################################
def XATS2RB_bool_lt(a, b); (!a) && b; end
def XATS2RB_bool_gt(a, b); a && (!b); end
def XATS2RB_bool_eq(a, b); a == b; end
def XATS2RB_bool_lte(a, b); (!a) || b; end
def XATS2RB_bool_gte(a, b); a || (!b); end
def XATS2RB_bool_neq(a, b); a != b; end
$XATS2RB_bool_lt = method(:XATS2RB_bool_lt)
$XATS2RB_bool_gt = method(:XATS2RB_bool_gt)
$XATS2RB_bool_eq = method(:XATS2RB_bool_eq)
$XATS2RB_bool_lte = method(:XATS2RB_bool_lte)
$XATS2RB_bool_gte = method(:XATS2RB_bool_gte)
$XATS2RB_bool_neq = method(:XATS2RB_bool_neq)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/bool000.cats]
########################################################################.
########################################################################.
