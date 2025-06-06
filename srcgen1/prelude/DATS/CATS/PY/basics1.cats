##################################################################.
##################################################################.
##
## Basics1 for XATS2PY
##
##################################################################.
##################################################################.
##
## prelude/bool000.sats
##
##################################################################.
##
def XATS2PY_bool_neg(b0):
  return not(b0) ## negation
##
def XATS2PY_bool_add(b1, b2):
  return (True if b1 else b2)
def XATS2PY_bool_mul(b1, b2):
  return (b2 if b1 else False)
##
##################################################################.
##
## prelude/char000.sats
##
##################################################################.
##
def XATS2PY_char_eq(c1, c2):
  return (c1 == c2) ## char=ascii
def XATS2PY_char_neq(c1, c2):
  return (c1 != c2) ## char=ascii
##
##################################################################.
##
def XATS2PY_char_cmp(c1, c2):
  return -1 if (c1 < c2) else (1 if (c1 > c2) else 0)
##
##################################################################.
##
def XATS2PY_char_eqz(c0):
  return (c0 == 0) ## null
def XATS2PY_char_neqz(c0):
  return (c0 != 0) ## non-null
##
##################################################################.
##
def XATS2PY_char_equal(c1, c2):
  return (c1 == c2) ## char=ascii
def XATS2PY_char_noteq(c1, c2):
  return (c1 != c2) ## char=ascii
##
##################################################################.
##
def XATS2PY_char_lowerq(ch):
  a = 97
  z = 122
  return ((a <= ch) and (ch <= z))
def XATS2PY_sint_lowerq(ch):
  a = 97
  z = 122
  return ((a <= ch) and (ch <= z))
##
def XATS2PY_char_upperq(ch):
  A = 65
  Z = 90
  return ((A <= ch) and (ch <= Z))
def XATS2PY_sint_upperq(ch):
  A = 65
  Z = 90
  return ((A <= ch) and (ch <= Z))
##
##################################################################.
##
def XATS2PY_char_isdigit(ch):
  return ((48 <= ch) and (ch <= 57))
def XATS2PY_sint_isdigit(ch):
  return ((48 <= ch) and (ch <= 57))
##
##################################################################.
##
def XATS2PY_char_isalpha(ch):
  return (XATS2PY_char_lowerq(ch) or XATS2PY_char_upperq(ch))
def XATS2PY_sint_isalpha(ch):
  return (XATS2PY_sint_lowerq(ch) or XATS2PY_sint_upperq(ch))
##
##################################################################.
##
def XATS2PY_char_isalnum(ch):
  return (XATS2PY_char_isalpha(ch) or XATS2PY_char_isdigit(ch))
def XATS2PY_sint_isalnum(ch):
  return (XATS2PY_sint_isalpha(ch) or XATS2PY_sint_isdigit(ch))
##
##################################################################.
##
def XATS2PY_char_lohexq(ch):
  a = 97
  f = 102
  return ((a <= ch) and (ch <= f))
def XATS2PY_sint_lohexq(ch):
  a = 97
  f = 102
  return ((a <= ch) and (ch <= f))
##
def XATS2PY_char_uphexq(ch):
  A = 65
  F = 70
  return ((A <= ch) and (ch <= F))
def XATS2PY_sint_lohexq(ch):
  A = 65
  F = 70
  return ((A <= ch) and (ch <= F))
##
##################################################################.
##
def XATS2PY_char_isxdigit(ch):
  return (XATS2PY_char_isdigit(ch) or XATS2PY_char_lohexq(ch) or XATS2PY_char_uphexq(ch))
def XATS2PY_sint_isxdigit(ch):
  return (XATS2PY_sint_isdigit(ch) or XATS2PY_sint_lohexq(ch) or XATS2PY_sint_uphexq(ch))
##
##################################################################.
##
## prelude/gint000.sats
##
##################################################################.
##
def XATS2PY_gint_neg_sint(x0):
  return (-x0) ## sint_neg(x0)
##
def XATS2PY_gint_abs_sint(x0):
  return x0 if (x0 >= 0) else (-x0)
##
##################################################################.
##
def XATS2PY_gint_suc_sint(x0):
  return (x0 + 1) ## plus one
def XATS2PY_gint_suc_uint(x0):
  return (x0 + 1) ## plus one
##
def XATS2PY_gint_pre_sint(x0):
  return (x0 - 1) ## minus one
def XATS2PY_gint_pre_uint(x0):
  return (x0 - 1) ## minus one
##
##################################################################.
##
def XATS2PY_gint_lnot_uint(x0):
  return (~x0) ## bitwise NEG
def XATS2PY_gint_lor2_uint(x0, y0):
  return (x0 | y0) ## bitwise OR
def XATS2PY_gint_land_uint(x0, y0):
  return (x0 & y0) ## bitwise AND
def XATS2PY_gint_lxor_uint(x0, y0):
  return (x0 ^ y0) ## bitwise XOR
##
##################################################################.
##
def XATS2PY_gint_asrn_sint(x0, n0):
  return (x0 >> n0) ## arith-rshift
def XATS2PY_gint_lsln_uint(x0, n0):
  return (x0 << n0) ## logic-lshift
##
## HX: there is no logic-rshift >>> in PY
##
##################################################################.
##
def XATS2PY_gint_lt_sint_sint(x1, x2):
  return (x1 < x2) ## sint_lt$sint(x1, x2)
def XATS2PY_gint_lt_uint_uint(x1, x2):
  return (x1 < x2) ## uint_lt$uint(x1, x2)
##
def XATS2PY_gint_gt_sint_sint(x1, x2):
  return (x1 > x2) ## sint_gt$sint(x1, x2)
def XATS2PY_gint_gt_uint_uint(x1, x2):
  return (x1 > x2) ## uint_gt$uint(x1, x2)
##
def XATS2PY_gint_eq_sint_sint(x1, x2):
  return (x1 == x2) ## sint_eq$sint(x1, x2)
def XATS2PY_gint_eq_uint_uint(x1, x2):
  return (x1 == x2) ## uint_eq$uint(x1, x2)
##
##################################################################.
##
def XATS2PY_gint_lte_sint_sint(x1, x2):
  return (x1 <= x2) ## sint_lte$sint(x1, x2)
def XATS2PY_gint_lte_uint_uint(x1, x2):
  return (x1 <= x2) ## uint_lte$uint(x1, x2)
##
def XATS2PY_gint_gte_sint_sint(x1, x2):
  return (x1 >= x2) ## sint_gte$sint(x1, x2)
def XATS2PY_gint_gte_uint_uint(x1, x2):
  return (x1 >= x2) ## uint_gte$uint(x1, x2)
##
def XATS2PY_gint_neq_sint_sint(x1, x2):
  return (x1 != x2) ## sint_neq$sint(x1, x2)
def XATS2PY_gint_neq_uint_uint(x1, x2):
  return (x1 != x2) ## uint_neq$uint(x1, x2)
##
##################################################################.
##
def XATS2PY_gint_cmp_sint_sint(x1, x2):
  return -1 if (x1 < x2) else (1 if (x1 > x2) else 0)
def XATS2PY_gint_cmp_uint_uint(x1, x2):
  return -1 if (x1 < x2) else (1 if (x1 > x2) else 0)
##
##################################################################.
##
def XATS2PY_gint_add_sint_sint(x1, x2):
  return (x1 + x2) ## sint_add$sint(x1, x2)
def XATS2PY_gint_sub_sint_sint(x1, x2):
  return (x1 - x2) ## sint_sub$sint(x1, x2)
def XATS2PY_gint_mul_sint_sint(x1, x2):
  return (x1 * x2) ## sint_mul$sint(x1, x2)
def XATS2PY_gint_mod_sint_sint(x1, x2):
  return (x1 % x2) ## sint_mod$sint(x1, x2)
def XATS2PY_gint_div_sint_sint(x1, x2):
  return (x1 // x2) ## sint_div$sint(x1, x2)
##
##################################################################.
##
## HX-2025-01-20:
##
##
def XATS2PY_gint_add_uint_uint(x1, x2):
  return (x1 + x2) ## uint_add$uint(x1, x2)
def XATS2PY_gint_sub_uint_uint(x1, x2):
  return (x1 - x2) ## uint_sub$uint(x1, x2)
##
##################################################################.
##
## HX-2022-06-06:
##
def XATS2PY_gint_sint2uint(x0): return x0
def XATS2PY_gint_uint2sint(x0): return x0
##
##################################################################.
##
## HX-2022-06-16:
##
def XATS2PY_gint_parse_sint(rep):
  bas = 10; return int(rep, bas)
def XATS2PY_gint_parse_uint(rep):
  exn = 0
  res = XATS2PY_gint_parse_sint(rep)
  return (res if (res >= 0) else exn)
##
##################################################################.
##
## prelude/gflt000.sats
##
##################################################################.
##
def XATS2PY_gflt_si_dflt(x0):
  return (x0) ## = g_si<dflt>(x0)
def XATS2PY_gflt_neg_dflt(x0):
  return (-x0) ## = g_neg<dflt>(x0)
##
def XATS2PY_gflt_abs_dflt(x0):
  return (x0 if (x0 >= 0.0) else (-x0))
##
##################################################################.
##
def XATS2PY_gflt_suc_dflt(x0):
  return (x0 + 1) ## plus one
def XATS2PY_gflt_pre_dflt(x0):
  return (x0 - 1) ## minus one
##
##################################################################.
##
def XATS2PY_gflt_lt_dflt_dflt(x1, x2):
  return (x1 < x2) ## dflt_lt$dflt(x1, x2)
def XATS2PY_gflt_gt_dflt_dflt(x1, x2):
  return (x1 > x2) ## dflt_gt$dflt(x1, x2)
def XATS2PY_gflt_eq_dflt_dflt(x1, x2):
  return (x1 == x2) ## dflt_eq$dflt(x1, x2)
##
def XATS2PY_gflt_lte_dflt_dflt(x1, x2):
  return (x1 <= x2) ## dflt_lte$dflt(x1, x2)
def XATS2PY_gflt_gte_dflt_dflt(x1, x2):
  return (x1 >= x2) ## dflt_gte$dflt(x1, x2)
def XATS2PY_gflt_neq_dflt_dflt(x1, x2):
  return (x1 != x2) ## dflt_neq$dflt(x1, x2)
##
def XATS2PY_gflt_cmp_dflt_dflt(x1, x2):
  return -1 if (x1 < x2) else (1 if (x1 > x2) else 0)
##
##################################################################.
##
def XATS2PY_gflt_add_dflt_dflt(x1, x2):
  return (x1 + x2) ## dflt_add$dflt(x1, x2)
def XATS2PY_gflt_sub_dflt_dflt(x1, x2):
  return (x1 - x2) ## dflt_sub$dflt(x1, x2)
##
def XATS2PY_gflt_mul_dflt_dflt(x1, x2):
  return (x1 * x2) ## dflt_mul$dflt(x1, x2)
def XATS2PY_gflt_div_dflt_dflt(x1, x2):
  return (x1 / x2) ## dflt_div$dflt(x1, x2)
##
##################################################################.
##
## prelude/strn000.sats
##
## HX-2020-09-28:
## Please note that:
## A (strn)-val is a PY-string
## A (lstrn)-val is a PY-array
##
##################################################################.
##
def XATS2PY_strn_nilq(cs):
  return len(cs) == 0 ## len is O(1)
def XATS2PY_strn_consq(cs):
  return (len(cs) > 0) ## len is O(1)
##
def XATS2PY_strn_vt2t(cs):
  cs.pop() ## pop the last null
  return "".join([chr(c0) for c0 in cs])
##
def XATS2PY_stropt_nilq(opt):
  return (opt is None) ## stropt_none
def XATS2PY_stropt_consq(opt):
  return not(opt is None) ## stropt_some
##
##################################################################.
##
def \
XATS2PY_strn_lt(x1, x2): return (x1 < x2)
def \
XATS2PY_strn_gt(x1, x2): return (x1 > x2)
def \
XATS2PY_strn_eq(x1, x2): return (x1 == x2)
##
def \
XATS2PY_strn_lte(x1, x2): return (x1 <= x2)
def \
XATS2PY_strn_gte(x1, x2): return (x1 >= x2)
def \
XATS2PY_strn_neq(x1, x2): return (x1 != x2)
##
##################################################################.
##
def XATS2PY_strn_cmp(x1, x2):
  return -1 if (x1 < x2) else (1 if x1 > x2 else 0)
##
##################################################################.
##
def XATS2PY_strn_head_raw(cs):
  return ord(cs[0]) ## char=ascii
##
def XATS2PY_strn_head_opt(cs):
  if (len(cs) == 0):
    return 0 ## HX: 0 for '\0'
  else:
    return ord(cs[0]) ## char=ascii
##
def XATS2PY_strn_tail_raw(cs): return cs[1:]
##
##################################################################.
##
def \
XATS2PY_strn_length(cs): return len(cs)
##
## HX: The ending null is not counted!
def \
XATS2PY_strn_vt_length0(cs): return len(cs)-1
def \
XATS2PY_strn_vt_length1(cs): return len(cs)-1
##
##################################################################.
##
def XATS2PY_strn_get_at(cs, i0):
  return ord(cs[i0]) ## char=ascii
##
def XATS2PY_strn_vt_get_at(cs, i0):
  return cs[i0] ## HX: cs is char-array
def XATS2PY_strn_vt_set_at(cs, i0, c0):
  cs[i0] = c0; return ## HX: c0 is ascii
##
##################################################################.
##
def XATS2PY_strtmp_vt_alloc(bsz):
  return [0]*(bsz+1) # HX: trailing null
##
def XATS2PY_strtmp_vt_set_at(cs, i0, c0):
  cs[i0] = c0; return ## HX: c0 is ascii code
##
##################################################################.
##
def XATS2PY_strn_forall_f1un(cs, test):
  c0 = 0
  i0 = 0
  ln = len(cs)
  while (i0 < ln):
    c0 = ord(cs[i0]); i0 = i0 + 1
    if not(test(c0)): return False
  return True ## test passes for every c0
##
def XATS2PY_strn_rforall_f1un(cs, test):
  c0 = 0
  i0 = len(cs)
  while (i0 > 0):
    i0 = i0 - 1; c0 = ord(cs[i0])
    if not(test(c0)): return False
  return True ## test passes for every c0
##
##################################################################.
##
def XATS2PY_strn_vt_forall_f1un(cs, test):
  c0 = 0
  i0 = 0
  ln1 = len(cs)-1
  while (i0 < ln1):
    c0 = cs[i0]; i0 = i0 + 1
    if not(test(c0)): return False
  return True ## test passes for every c0
##
def XATS2PY_strn_vt_rforall_f1un(cs, test):
  c0 = 0
  ln = len(cs)
  i0 = ln - 1
  while (i0 > 0):
    i0 = i0 - 1; c0 = cs[i0]
    if not(test(c0)): return False
  return True ## test passes for every c0
##
##################################################################.
##################################################################.
##
## HX-2025-04-11:
## For bridging [srcgen1] and [srcgen2]
##
##################################################################.
##################################################################.
def XATS2PY_sint_neg(x0):
  return XATS2PY_gint_neg_sint(x0)
def XATS2PY_sint_abs(x0):
  return XATS2PY_gint_abs_sint(x0)
##
def XATS2PY_sint_lt_sint(x0, y0):
  return XATS2PY_gint_lt_sint_sint(x0, y0)
def XATS2PY_sint_gt_sint(x0, y0):
  return XATS2PY_gint_gt_sint_sint(x0, y0)
def XATS2PY_sint_eq_sint(x0, y0):
  return XATS2PY_gint_eq_sint_sint(x0, y0)
##
def XATS2PY_sint_lte_sint(x0, y0):
  return XATS2PY_gint_lte_sint_sint(x0, y0)
def XATS2PY_sint_gte_sint(x0, y0):
  return XATS2PY_gint_gte_sint_sint(x0, y0)
def XATS2PY_sint_neq_sint(x0, y0):
  return XATS2PY_gint_neq_sint_sint(x0, y0)
##
def XATS2PY_sint_add_sint(x0, y0):
  return XATS2PY_gint_add_sint_sint(x0, y0)
def XATS2PY_sint_sub_sint(x0, y0):
  return XATS2PY_gint_sub_sint_sint(x0, y0)
def XATS2PY_sint_mul_sint(x0, y0):
  return XATS2PY_gint_mul_sint_sint(x0, y0)
def XATS2PY_sint_div_sint(x0, y0):
  return XATS2PY_gint_div_sint_sint(x0, y0)
##
##################################################################.
##################################################################.
## end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_PY_basics1.cats]
##################################################################.
##################################################################.
