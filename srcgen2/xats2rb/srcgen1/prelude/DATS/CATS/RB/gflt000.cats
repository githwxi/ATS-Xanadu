########################################################################
def XATS2RB_dflt_lt_dflt(a, b); a < b; end
def XATS2RB_dflt_gt_dflt(a, b); a > b; end
def XATS2RB_dflt_eq_dflt(a, b); a == b; end
def XATS2RB_dflt_lte_dflt(a, b); a <= b; end
def XATS2RB_dflt_gte_dflt(a, b); a >= b; end
def XATS2RB_dflt_neq_dflt(a, b); a != b; end
def XATS2RB_dflt_neg(a); -a; end
def XATS2RB_dflt_abs(a); a.abs; end
def XATS2RB_dflt_add_dflt(a, b); a + b; end
def XATS2RB_dflt_sub_dflt(a, b); a - b; end
def XATS2RB_dflt_mul_dflt(a, b); a * b; end
def XATS2RB_dflt_div_dflt(a, b); a.to_f / b; end
def XATS2RB_dflt_mod_dflt(a, b); a % b; end
def XATS2RB_dflt_sqrt(a); Math.sqrt(a); end
def XATS2RB_dflt_cbrt(a); a < 0 ? -((-a) ** (1.0 / 3.0)) : a ** (1.0 / 3.0); end
def XATS2RB_dflt_ceil(a); a.ceil; end
def XATS2RB_dflt_floor(a); a.floor; end
def XATS2RB_dflt_trunc(a); a.truncate; end
def XATS2RB_dflt_round(a); a.round(half: :even); end
$XATS2RB_dflt_lt_dflt = method(:XATS2RB_dflt_lt_dflt)
$XATS2RB_dflt_gt_dflt = method(:XATS2RB_dflt_gt_dflt)
$XATS2RB_dflt_eq_dflt = method(:XATS2RB_dflt_eq_dflt)
$XATS2RB_dflt_lte_dflt = method(:XATS2RB_dflt_lte_dflt)
$XATS2RB_dflt_gte_dflt = method(:XATS2RB_dflt_gte_dflt)
$XATS2RB_dflt_neq_dflt = method(:XATS2RB_dflt_neq_dflt)
$XATS2RB_dflt_neg = method(:XATS2RB_dflt_neg)
$XATS2RB_dflt_abs = method(:XATS2RB_dflt_abs)
$XATS2RB_dflt_add_dflt = method(:XATS2RB_dflt_add_dflt)
$XATS2RB_dflt_sub_dflt = method(:XATS2RB_dflt_sub_dflt)
$XATS2RB_dflt_mul_dflt = method(:XATS2RB_dflt_mul_dflt)
$XATS2RB_dflt_div_dflt = method(:XATS2RB_dflt_div_dflt)
$XATS2RB_dflt_mod_dflt = method(:XATS2RB_dflt_mod_dflt)
$XATS2RB_dflt_sqrt = method(:XATS2RB_dflt_sqrt)
$XATS2RB_dflt_cbrt = method(:XATS2RB_dflt_cbrt)
$XATS2RB_dflt_ceil = method(:XATS2RB_dflt_ceil)
$XATS2RB_dflt_floor = method(:XATS2RB_dflt_floor)
$XATS2RB_dflt_trunc = method(:XATS2RB_dflt_trunc)
$XATS2RB_dflt_round = method(:XATS2RB_dflt_round)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/gflt000.cats]
########################################################################.
########################################################################.
