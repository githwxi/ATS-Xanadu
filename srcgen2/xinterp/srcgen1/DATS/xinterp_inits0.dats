(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Wed Dec 13 01:31:07 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload
node with d2ecl_get_node
#symload
lctn with d2ecl_get_lctn
(* ****** ****** *)
//
#symload
symbl_make_name
with $SYM.symbl_make_name
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
mytop_pvsmrgw_d2eclist
  (dcls: d2eclist): void =
(
  f0_d2eclist(dcls) ) where
{
//
fun
f0_d2ecl
(d2cl: d2ecl): void =
let
//
val () =
prerrln
("f0_d2ecl: d2cl = ", d2cl)
//
in//let
//
case+
d2cl.node() of
//
|
D2Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) =>
(
case+ dopt of
|
S2TALOADnone() => ()
|
S2TALOADfenv(fenv) => ()
|
S2TALOADdpar
(shrd, dpar) => f1_d2parsed(dpar)
)
//
|_(*otherwise*) => (  (*void*)  )
//
end where
{
//
fun
f1_d2parsed
(dpar: d2parsed): void =
let
//
val+
D2TOPENV
(tr11
,tenv,senv,denv) =
(
  d2parsed_get_t2penv(dpar) )
//
val () = the_sortenv_pvsmrgw(tenv)
val () = the_sexpenv_pvsmrgw(senv)
val () = the_dexpenv_pvsmrgw(denv)
//
endlet//end-of-[f1_d2parsed(dpar)]
//
}(*where*)//end-of-[f0_d2ecl(d2cl)]
//
fun
f0_d2eclist
(dcls: d2eclist): void =
(
case+ dcls of
|list_nil() =>
( (*void*) )
|list_cons(dcl1, dcls) =>
(
f0_d2ecl(dcl1); f0_d2eclist(dcls))
)
//
}(*where*)
//end[mytop_pvsmrgw_d2eclist(dcls)]
//
(* ****** ****** *)
//
local
//
#symload ^
with strn_append
//
val
XATSHOME =
the_XATSHOME()
//
val dpar =
d2parsed_from_fpath
(
1//stadyn
,
XATSHOME ^ "/srcgen1/prelude/HATS/CATS/Xint/prelude_dats.hats")
val dopt =
d2parsed_get_parsed(dpar)
//
in // local
//
val (  ) =
(
case+ dopt of
|optn_nil
( (*0*) ) => ( (*void*) )
|optn_cons
(  dcls  ) =>
mytop_pvsmrgw_d2eclist(dcls))
//
end (*local*) // end of [ local ]
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/xinterp.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#extern
fun
the_d2cst_find
(name: string): d2cst
//
#symload d2cst with the_d2cst_find
//
(* ****** ****** *)
#impltmp
the_d2cst_find
  (  name  ) =
let
//
val
sym0 =
symbl_make_name(name)
//
val
opt0 =
the_dexpenv_pvsfind(sym0)
//
in//let
//
case- opt0 of
| ~
optn_vt_cons
 (  d2i0  ) =>
(
case- d2i0 of
|
D2ITMcst(d2cs) =>
let
val-list_cons(d2c0, _) = d2cs in d2c0
end (* end of [D2ITMcst] *)
)
//
end where
{
val () =
prerrln("the_d2cst_find: name = ", name)
} (*where*)//end-of-[the_d2cst_find(...)]
//
(* ****** ****** *)
//
fun
firfun1
(
fopr:
( irval
) -> irval): irfun =
lam(vs) => let
val-
list_cons(v1, vs) = vs in fopr(v1)
end (* let *) // end of [ firfun1(fopr) ]
//
(* ****** ****** *)
//
fun
firfun2
(
fopr:
( irval
, irval
) -> irval): irfun =
lam(vs) => let
val-
list_cons(v1, vs) = vs
val-
list_cons(v2, vs) = vs in fopr(v1, v2)
end (* let *) // end of [ firfun2(fopr) ]
//
(* ****** ****** *)
//
fun
firfun3
(
fopr:
( irval
, irval
, irval
) -> irval): irfun =
lam(vs) => let
val-
list_cons(v1, vs) = vs
val-
list_cons(v2, vs) = vs
val-
list_cons(v3, vs) = vs in fopr(v1,v2,v3)
end (* let *) // end of [ firfun3(fopr) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
fun
xinterp_char_eqz
( x: irval): irval =
let
val-IRVchr(x) = x
in//let
(
  IRVbtf(char_eqz(x)) )
end (*let*) // end-of(xinterp_char_eqz)
//
fun
xinterp_char_cmp
( x: irval
, y: irval): irval =
let
val-IRVchr(x) = x
val-IRVchr(y) = y
in//let
(
  IRVint(char_cmp(x, y)) )
end (*let*) // end-of(xinterp_char_cmp)
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_char_eqz"),
IRVfun(firfun1(xinterp_char_eqz)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_char_cmp"),
IRVfun(firfun2(xinterp_char_cmp)))//val
//
(* ****** ****** *)
end (*local*) // end-of- [local(char_operations)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
fun
gint_lt_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x < y) end
fun
gint_gt_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x > y) end
fun
gint_eq_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x = y) end
//
(* ****** ****** *)
//
fun
gint_lte_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x <= y) end
fun
gint_gte_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x >= y) end
fun
gint_neq_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x != y) end
//
fun
gint_cmp_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x\cmp(y)) end
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_lt_sint_sint"),
IRVfun(firfun2(gint_lt_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_gt_sint_sint"),
IRVfun(firfun2(gint_gt_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_eq_sint_sint"),
IRVfun(firfun2(gint_eq_sint_sint)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_lte_sint_sint"),
IRVfun(firfun2(gint_lte_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_gte_sint_sint"),
IRVfun(firfun2(gint_gte_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_neq_sint_sint"),
IRVfun(firfun2(gint_neq_sint_sint)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_cmp_sint_sint"),
IRVfun(firfun2(gint_cmp_sint_sint)))//val
//
(* ****** ****** *)
end (*local*) // end-[local(gint_cmp_sint_sint)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
fun
gint_succ_sint
( x: irval): irval =
let
val-IRVint(x) = x in IRVint(x+1) end
fun
gint_pred_sint
( x: irval): irval =
let
val-IRVint(x) = x in IRVint(x-1) end
//
fun
gint_add_sint_sint
( x: irval
, y: irval): irval =
let
//
(*
val () =
prerrln
("gint_add_sint_sint: x = ", x)
val () =
prerrln
("gint_add_sint_sint: y = ", y)
*)
//
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x + y) end
fun
gint_sub_sint_sint
( x: irval
, y: irval): irval =
let
//
(*
val () =
prerrln
("gint_sub_sint_sint: x = ", x)
val () =
prerrln
("gint_sub_sint_sint: y = ", y)
*)
//
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x - y) end
fun
gint_mul_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x * y) end
fun
gint_div_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x / y) end
fun
gint_mod_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x % y) end
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_succ_sint"),
IRVfun(firfun1(gint_succ_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_pred_sint"),
IRVfun(firfun1(gint_pred_sint)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_add_sint_sint"),
IRVfun(firfun2(gint_add_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_sub_sint_sint"),
IRVfun(firfun2(gint_sub_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_mul_sint_sint"),
IRVfun(firfun2(gint_mul_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_div_sint_sint"),
IRVfun(firfun2(gint_div_sint_sint)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_gint_mod_sint_sint"),
IRVfun(firfun2(gint_mod_sint_sint)))//val
//
(* ****** ****** *)
end (*local*) // end-[local(gint_aop_sint_sint)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
fun
xinterp_strn_vt2t
  (x: irval): irval =
let
val-IRVptr(p) = x in//let
IRVstr
(
strn_vt2t<>
(
$UN.castlin10{strn_vt}(p))
)
end (*let*) // end-of(xinterp_strn_vt2t)
//
(* ****** ****** *)
//
fun
xinterp_strn_get_at
  (x: irval
  ,i: irval): irval =
let
val-IRVstr(x) = x
val-IRVint(i) = i in//let
IRVchr(strn_get_at<>(x, i))
end (*let*) // end-of(xinterp_strn_get_at)
//
fun
xinterp_strn_head_opt
  (x: irval): irval =
let
val-IRVstr(x) = x in//let
IRVchr(strn_head_opt<>(x))
end (*let*) // end-of(xinterp_strn_get_at)
//
fun
xinterp_strn_head_raw
  (x: irval): irval =
let
val-IRVstr(x) = x in//let
IRVchr(strn_head_raw<>(x))
end (*let*) // end-of(xinterp_strn_get_at)
//
fun
xinterp_strn_tail_raw
  (x: irval): irval =
let
val-IRVstr(x) = x in//let
IRVstr(strn_tail_raw<>(x))
end (*let*) // end-of(xinterp_strn_get_at)
//
(* ****** ****** *)
//
fun
xinterp_strtmp_vt_alloc
  (x: irval): irval =
let
val-IRVint(x) = x in
IRVptr
(
$UN.castlin10
{p0tr}(strtmp_vt_alloc<>(x)))
end (*let*) // end-of(xinterp_strtmp_vt_alloc)
//
(* ****** ****** *)
//
fun
xinterp_strtmp_vt_set_at
  (x: irval
  ,i: irval
  ,c: irval): irval =
let
val-IRVptr(x) = x
val-IRVint(i) = i
val-IRVchr(c) = c in
let
val x =
$UN.castlin10{strtmp_vt}(x)
in//let
strtmp_vt_set_at<>(x, i, c); IRVnil() end
end (*let*) // end-of(xinterp_strtmp_vt_set_at)
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_strn_vt2t"),
IRVfun(firfun1(xinterp_strn_vt2t)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_strn_get_at"),
IRVfun(firfun2(xinterp_strn_get_at)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_strn_head_opt"),
IRVfun(firfun1(xinterp_strn_head_opt)))//val
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_strn_head_raw"),
IRVfun(firfun1(xinterp_strn_head_raw)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_strn_tail_raw"),
IRVfun(firfun1(xinterp_strn_tail_raw)))//val
//
(* ****** ****** *)
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_strtmp_vt_alloc"),
IRVfun(firfun1(xinterp_strtmp_vt_alloc)))//val
//
val () =
the_ircst_insval
(
the_d2cst_find
("XINTERP_strtmp_vt_set_at"),
IRVfun(firfun3(xinterp_strtmp_vt_set_at)))//val
//
(* ****** ****** *)
end (*local*) // end-of- [local(strn_operations)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xinterp_inits0.dats] *)
(***********************************************************************)
