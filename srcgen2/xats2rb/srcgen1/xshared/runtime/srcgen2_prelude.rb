## Sun Oct 18 07:33:50 PM EDT 2026
########################################################################.
##                                                                    ##.
##                         Applied Type System                        ##.
##                                                                    ##.
########################################################################.

##
## ATS/Xanadu - Unleashing the Potential of Types!
## Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
## All rights reserved
##
## ATS is free software;  you can  redistribute it and/or modify it under
## the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
## Free Software Foundation; either version 3, or (at  your  option)  any
## later version.
## 
## ATS is distributed in the hope that it will be useful, but WITHOUT ANY
## WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
## for more details.
## 
## You  should  have  received  a  copy of the GNU General Public License
## along  with  ATS;  see the  file COPYING.  If not, please write to the
## Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.
##

########################################################################.
########################################################################.
##
## Author: Hongwei Xi
## Sun Sep  6 12:00:01 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
##
## HX-2026-09-06: Nothing yet!
##
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/xtop000.cats]
########################################################################.
########################################################################.
########################################################################.
##                                                                    ##.
##                         Applied Type System                        ##.
##                                                                    ##.
########################################################################.

##
## ATS/Xanadu - Unleashing the Potential of Types!
## Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
## All rights reserved
##
## ATS is free software;  you can  redistribute it and/or modify it under
## the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
## Free Software Foundation; either version 3, or (at  your  option)  any
## later version.
## 
## ATS is distributed in the hope that it will be useful, but WITHOUT ANY
## WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
## for more details.
## 
## You  should  have  received  a  copy of the GNU General Public License
## along  with  ATS;  see the  file COPYING.  If not, please write to the
## Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.
##

########################################################################.
########################################################################.
##
## Author: Hongwei Xi
## Sun Sep  6 11:33:33 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
##
## HX-2026-09-06: Nothing yet!
##
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/gbas000.cats]
########################################################################.
########################################################################.
########################################################################
def XATS2RB_bool_assert_errmsg(cond, msg)
  raise "XATS2RB_bool_assert_errmsg: emsg = #{msg}" unless cond
  nil
end
$XATS2RB_bool_assert_errmsg = method(:XATS2RB_bool_assert_errmsg)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/gdbg000.cats]
########################################################################.
########################################################################.
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
########################################################################
def XATS2RB_sint_lt_sint(a, b); a < b; end
def XATS2RB_sint_gt_sint(a, b); a > b; end
def XATS2RB_sint_eq_sint(a, b); a == b; end
def XATS2RB_sint_lte_sint(a, b); a <= b; end
def XATS2RB_sint_gte_sint(a, b); a >= b; end
def XATS2RB_sint_neq_sint(a, b); a != b; end
def XATS2RB_sint_neg(a); -a; end
def XATS2RB_sint_abs(a); a.abs; end
def XATS2RB_sint_add_sint(a, b); a + b; end
def XATS2RB_sint_sub_sint(a, b); a - b; end
def XATS2RB_sint_mul_sint(a, b); a * b; end
def XATS2RB_sint_mod_sint(a, b); a % b; end
def XATS2RB_sint_div_sint(a, b); a.div(b); end
def XATS2RB_sint_print(a); print(a); nil; end
$XATS2RB_sint_lt_sint = method(:XATS2RB_sint_lt_sint)
$XATS2RB_sint_gt_sint = method(:XATS2RB_sint_gt_sint)
$XATS2RB_sint_eq_sint = method(:XATS2RB_sint_eq_sint)
$XATS2RB_sint_lte_sint = method(:XATS2RB_sint_lte_sint)
$XATS2RB_sint_gte_sint = method(:XATS2RB_sint_gte_sint)
$XATS2RB_sint_neq_sint = method(:XATS2RB_sint_neq_sint)
$XATS2RB_sint_neg = method(:XATS2RB_sint_neg)
$XATS2RB_sint_abs = method(:XATS2RB_sint_abs)
$XATS2RB_sint_add_sint = method(:XATS2RB_sint_add_sint)
$XATS2RB_sint_sub_sint = method(:XATS2RB_sint_sub_sint)
$XATS2RB_sint_mul_sint = method(:XATS2RB_sint_mul_sint)
$XATS2RB_sint_mod_sint = method(:XATS2RB_sint_mod_sint)
$XATS2RB_sint_div_sint = method(:XATS2RB_sint_div_sint)
$XATS2RB_sint_print = method(:XATS2RB_sint_print)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/gint000.cats]
########################################################################.
########################################################################.
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
########################################################################
def XATS2RB_strn_cmp(a, b); a <=> b; end
def XATS2RB_strn_print(s); print(s); nil; end
def XATS2RB_strn_length(s); s.length; end
def XATS2RB_strn_get_at_raw(s, i); s[i].ord; end
def XATS2RB_strn_make_fwork(work)
  out = +''
  work.call(->(code) { out << code.chr(Encoding::UTF_8) })
  out
end
def XATS2RB_strn_make_env_fwork(env, work)
  out = +''
  work.call(env, ->(code) { out << code.chr(Encoding::UTF_8) })
  out
end
def XATS2RB_strn_make1_env_fwork(env, work); XATS2RB_strn_make_env_fwork(env, work); end
$XATS2RB_strn_cmp = method(:XATS2RB_strn_cmp)
$XATS2RB_strn_print = method(:XATS2RB_strn_print)
$XATS000_strn_print = method(:XATS2RB_strn_print)
$XATS2RB_strn_length = method(:XATS2RB_strn_length)
$XATS000_strn_length = method(:XATS2RB_strn_length)
$XATS2RB_strn_get_at_raw = method(:XATS2RB_strn_get_at_raw)
$XATS000_strn_get_at_raw = method(:XATS2RB_strn_get_at_raw)
$XATS2RB_strn_make_fwork = method(:XATS2RB_strn_make_fwork)
$XATS000_strn_make_fwork = method(:XATS2RB_strn_make_fwork)
$XATS2RB_strn_make_env_fwork = method(:XATS2RB_strn_make_env_fwork)
$XATS000_strn_make_env_fwork = method(:XATS2RB_strn_make_env_fwork)
$XATS2RB_strn_make1_env_fwork = method(:XATS2RB_strn_make1_env_fwork)
$XATS000_strn_make1_env_fwork = method(:XATS2RB_strn_make1_env_fwork)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/strn000.cats]
########################################################################.
########################################################################.
########################################################################
def XATS2RB_list_vt_foritm0_f1un(xs, work)
  until XATS2RB_list_vt_nilq1(xs)
    work.call(XATS2RB_list_vt_head_raw1(xs))
    xs = XATS2RB_list_vt_tail_raw0(xs)
  end
  nil
end
def XATS2RB_list_vt_forall0_f1un(xs, test, free)
  until XATS2RB_list_vt_nilq1(xs)
    x = XATS2RB_list_vt_head_raw1(xs)
    xs = XATS2RB_list_vt_tail_raw0(xs)
    unless test.call(x)
      XATS2RB_list_vt_foritm0_f1un(xs, free)
      return false
    end
  end
  true
end
$XATS2RB_list_vt_foritm0_f1un = method(:XATS2RB_list_vt_foritm0_f1un)
$XATS2RB_list_vt_forall0_f1un = method(:XATS2RB_list_vt_forall0_f1un)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/list000.cats]
########################################################################.
########################################################################.
########################################################################.
##                                                                    ##.
##                         Applied Type System                        ##.
##                                                                    ##.
########################################################################.

##
## ATS/Xanadu - Unleashing the Potential of Types!
## Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
## All rights reserved
##
## ATS is free software;  you can  redistribute it and/or modify it under
## the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
## Free Software Foundation; either version 3, or (at  your  option)  any
## later version.
## 
## ATS is distributed in the hope that it will be useful, but WITHOUT ANY
## WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
## for more details.
## 
## You  should  have  received  a  copy of the GNU General Public License
## along  with  ATS;  see the  file COPYING.  If not, please write to the
## Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.
##

########################################################################.
########################################################################.
##
## Author: Hongwei Xi
## Sat Jan  3 05:24:14 PM EST 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
##
## HX-2026-09-06: Nothing yet!
##
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/optn000.cats]
########################################################################.
########################################################################.
########################################################################
def XATS2RB_strm_vt_forall0_f1un(fxs, test)
  loop do
    cxs = XATS2RB_lazy_vt_eval(fxs)
    return true if XATS2RB_strmcon_vt_nilq1(cxs)
    x = XATS2RB_strmcon_vt_head_raw1(cxs)
    fxs = XATS2RB_strmcon_vt_tail_raw0(cxs)
    unless test.call(x)
      XATS2RB_lazy_vt_free(fxs)
      return false
    end
  end
end
def XATS2RB_strm_vt_filter0_f1un(fxs, test, free)
  XATS2RB_lazy_vt_make_f0un(-> { XATS2RB_strmcon_vt_filter0_f1un(XATS2RB_lazy_vt_eval(fxs), test, free) })
end
def XATS2RB_strmcon_vt_filter0_f1un(cxs, test, free)
  loop do
    return XATS2RB_strmcon_vt_nil if XATS2RB_strmcon_vt_nilq1(cxs)
    x = XATS2RB_strmcon_vt_head_raw1(cxs)
    fxs = XATS2RB_strmcon_vt_tail_raw0(cxs)
    return XATS2RB_strmcon_vt_cons(x, XATS2RB_strm_vt_filter0_f1un(fxs, test, free)) if test.call(x)
    free.call(x)
    cxs = XATS2RB_lazy_vt_eval(fxs)
  end
end
$XATS2RB_strm_vt_forall0_f1un = method(:XATS2RB_strm_vt_forall0_f1un)
$XATS2RB_strm_vt_filter0_f1un = method(:XATS2RB_strm_vt_filter0_f1un)
$XATS2RB_strmcon_vt_filter0_f1un = method(:XATS2RB_strmcon_vt_filter0_f1un)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/strm000.cats]
########################################################################.
########################################################################.
########################################################################
def XATS2RB_strx_vt_forall0_f1un(fxs, test)
  loop do
    cxs = XATS2RB_lazy_vt_eval(fxs)
    x = XATS2RB_strxcon_vt_head_raw1(cxs)
    fxs = XATS2RB_strxcon_vt_tail_raw0(cxs)
    unless test.call(x)
      XATS2RB_lazy_vt_free(fxs)
      return false
    end
  end
end
def XATS2RB_strx_vt_filter0_f1un(fxs, test, free)
  XATS2RB_lazy_vt_make_f0un(-> { XATS2RB_strxcon_vt_filter0_f1un(XATS2RB_lazy_vt_eval(fxs), test, free) })
end
def XATS2RB_strxcon_vt_filter0_f1un(cxs, test, free)
  loop do
    x = XATS2RB_strxcon_vt_head_raw1(cxs)
    fxs = XATS2RB_strxcon_vt_tail_raw0(cxs)
    return XATS2RB_strxcon_vt_cons(x, XATS2RB_strx_vt_filter0_f1un(fxs, test, free)) if test.call(x)
    free.call(x)
    cxs = XATS2RB_lazy_vt_eval(fxs)
  end
end
$XATS2RB_strx_vt_forall0_f1un = method(:XATS2RB_strx_vt_forall0_f1un)
$XATS2RB_strx_vt_filter0_f1un = method(:XATS2RB_strx_vt_filter0_f1un)
$XATS2RB_strxcon_vt_filter0_f1un = method(:XATS2RB_strxcon_vt_filter0_f1un)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/strx000.cats]
########################################################################.
########################################################################.
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
