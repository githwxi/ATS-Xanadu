########################################################################
## Ruby runtime support for characters represented as integer codepoints.
########################################################################
def XATS2RB_char_lt(a, b); a < b; end
def XATS2RB_char_gt(a, b); a > b; end
def XATS2RB_char_eq(a, b); a == b; end
def XATS2RB_char_lte(a, b); a <= b; end
def XATS2RB_char_gte(a, b); a >= b; end
def XATS2RB_char_neq(a, b); a != b; end
def XATS2RB_char_sub_char(a, b); a - b; end
def XATS2RB_char_add_sint(a, i); (a + i) % 256; end
def XATS2RB_char_make_sint(i); i; end
def XATS2RB_sint_make_char(c); c; end
def XATS2RB_char_print(c); print(c.chr(Encoding::UTF_8)); nil; end
$XATS2RB_char_lt = method(:XATS2RB_char_lt)
$XATS2RB_char_gt = method(:XATS2RB_char_gt)
$XATS2RB_char_eq = method(:XATS2RB_char_eq)
$XATS2RB_char_lte = method(:XATS2RB_char_lte)
$XATS2RB_char_gte = method(:XATS2RB_char_gte)
$XATS2RB_char_neq = method(:XATS2RB_char_neq)
$XATS2RB_char_sub_char = method(:XATS2RB_char_sub_char)
$XATS2RB_char_add_sint = method(:XATS2RB_char_add_sint)
$XATS2RB_char_make_sint = method(:XATS2RB_char_make_sint)
$XATS2RB_sint_make_char = method(:XATS2RB_sint_make_char)
$XATS2RB_char_print = method(:XATS2RB_char_print)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/char000.cats]
########################################################################.
########################################################################.
