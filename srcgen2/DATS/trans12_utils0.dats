(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun Apr 20 12:56:21 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload
SYM = "./../SATS/xsymbol.sats"
#staload
LAM = "./../SATS/xlabel0.sats"
#staload
MAP = "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/gmacro1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype g1val =
//
| G1Vint of (sint)
| G1Vbtf of (bool)
| G1Vchr of (char)
| G1Vflt of (dflt)
| G1Vstr of (strn)
//
| G1Vid0 of (sym_t)
//
| G1Vnone of ((*void*))
//
(* ****** ****** *)
(* ****** ****** *)
(*
#typedef
gmacenv = $MAP.topmap(g1mac)
*)
(* ****** ****** *)
//
#extern
fun
g1val_fprint
(gval: g1val, out0: FILR): void
//
#implfun
g1val_fprint
(gval, out0) =
(
case+ gval of
//
|G1Vint
( int ) =>
prints("G1Vint(", int, ")")
|G1Vbtf
( btf ) =>
prints("G1Vbtf(", btf, ")")
|G1Vchr
( chr ) =>
prints("G1Vchr(", chr, ")")
|G1Vflt
( flt ) =>
prints("G1Vflt(", flt, ")")
|G1Vstr
( str ) =>
prints("G1Vstr(", str, ")")
//
|G1Vid0
( sym ) =>
prints("G1Vid0(", sym, ")")
//
|G1Vnone//HX: for non-values
( (*none*) ) => prints("G1Vnone()")
) where
{
#impltmp g_print$out<>() = ( out0 )
}(*where*)//end-of-[g1val_fprint(...)]
//
(* ****** ****** *)
//
#impltmp
g_print
<g1val>(gval) =
g1val_fprint(gval, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
g1mac_eval // HX: first-order!
(tenv: !tr12env, gmac: g1mac): g1val
//
#extern
fun
g1exp_eval // HX: first-order!
(tenv: !tr12env, gexp: g1exp): g1val
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
g1mac_eval
(tenv, gmac) =
(
case+ gmac of
//
|G1Mid0(sym) =>
(
  f0_id0(tenv, gmac))
//
(* ****** ****** *)
//
|G1Mint(int) => G1Vint(int)
|G1Mbtf(btf) => G1Vbtf(btf)
|G1Mchr(chr) => G1Vchr(chr)
|G1Mflt(flt) => G1Vflt(flt)
|G1Mstr(str) => G1Vstr(str)
//
(* ****** ****** *)
//
|_(*otherwise*) => G1Vnone((*void*))
//
) where
{
//
fun
f0_id0
( tenv:
! tr12env
, gmac: g1mac): g1val =
let
//
val-G1Mid0(sym0) = gmac
//
val
opt0 =
tr12env_find_g1mac(tenv, sym0)
//
in//let
case+ opt0 of
| ~
optn_vt_nil
( (*void*) ) => G1Vnone((*void*))
| ~
optn_vt_cons
(   gmac   ) => g1mac_eval(tenv, gmac)
end // let // end-of-[f0_id0(tenv,gmac)]
//
(* ****** ****** *)
//
(*
val () =
(
  prerrsln("g1mac_eval: gmac = ", gmac))
*)
//
}(*where*)//end-of-[g1mac_eval(tenv,gmac)]
//
(* ****** ****** *)
//
#implfun
g1exp_eval
(tenv, gexp) =
(
case+
gexp.node() of
//
|G1Eid0(sym0) =>
(
  f0_id0(tenv, gexp))
//
|G1Eint(tint) =>
(
  G1Vint(token2sint(tint)))
(*
|G1Ebtf(tbtf) =>
(
  G1Vbtf(token2sbtf(tbtf)))
*)
|G1Echr(tchr) =>
(
  G1Vchr(token2schr(tchr)))
|G1Eflt(tflt) =>
(
  G1Vflt(token2sflt(tflt)))
|G1Estr(tstr) =>
(
  G1Vstr(token2sstr(tstr)))
//
|G1Ea1pp
( gfun, g1e1) =>
if
ISDFQ(gfun)
then
(
  g1exp_defq(tenv, g1e1)
)
else
(
  g1val_a1pp(gfun, g1v1)
) where
{
//
val
g1v1 = g1exp_eval(tenv, g1e1)
//
}(*where*)//end-of-[G1Ea1pp(...)]
//
|G1Ea2pp
( gfun
, g1e1, g1e2) =>
(
g1val_a2pp
(gfun, g1v1, g1v2)) where
{
//
val
g1v1 = g1exp_eval(tenv, g1e1)
val
g1v2 = g1exp_eval(tenv, g1e2)
//
}(*where*)//end-of-[G1Ea2pp(...)]
//
|G1Elist(g1es) =>
(
case+ g1es of
|list_nil((*0*)) =>
(
  G1Vnone((*void*)))
|list_cons(g1e1, ges2) =>
(
case+ ges2 of
|list_nil() =>
(g1exp_eval(tenv, g1e1))
|list_cons _ => G1Vnone((*0*)))
)(*case+*)//end-of-[G1Elist(g1es)]
//
|
_(*otherwise*) => G1Vnone((*none*))
//
) where
{
//
(* ****** ****** *)
//
#symload
name
with
$SYM.symbl_get_name
//
(* ****** ****** *)
//
fun
ISDFQ
(gfun: g1exp): bool =
(
case+
gfun.node() of
| G1Eid0(sym0) =>
(
case+
sym0.name() of
| "defq" => true
| _(*else*) => false)
//
| _(*non-G1Eid0*) => false
)
//
(* ****** ****** *)
//
fun
g1exp_defq
( tenv:
! tr12env
, gexp: g1exp): g1val =
(
case+
gexp.node() of
//
|
G1Eid0(sym0) =>
(
case+ opt0 of
| ~
optn_vt_nil _ => G1Vbtf(false)
| ~
optn_vt_cons _ => G1Vbtf(true))
where
{
  val
  opt0 =
  tr12env_find_g1mac(tenv,sym0) }
//
| _(*non-G1Eid0*) => G1Vbtf(false)
)(*case+*)//end-of-[g1exp_defq(...)]
//
(* ****** ****** *)
//
fun
g1val_a1pp
( gfun: g1exp
, g1v1: g1val): g1val =
(
case+
gfun.node() of
//
|
G1Eid0(sym0) =>
let
//
val opnm = sym0.name()
//
in//let
//
case+ opnm of
//
|"!" => f0_not(g1v1)
|"~" => f0_not(g1v1)
|"-" => f0_neg(g1v1)
(*
|"not" => f0_not(g1v1)
*)
//
|_(*unknown*) => G1Vnone((*0*))
//
end(*let*)//end-of-[G1Eid0(sym0)]
|
_(*otherwise*) => G1Vnone(*void*)
) where
{
//
fun
f0_not
(g1v1: g1val): g1val =
(
case+ g1v1 of
|G1Vbtf(btf1) => G1Vbtf(~btf1)
|G1Vint(int1) => G1Vbtf(int1!=0)
|_(*non-G1Vbtf*) => G1Vnone((*0*)))
//
fun
f0_neg
(g1v1: g1val): g1val =
(
case+ g1v1 of
|G1Vint(int1) => G1Vint(-int1)
|_(*non-G1Vbtf*) => G1Vnone((*0*)))
//
(*
val () =
prerrsln
("g1val_a1pp: gfun = ", gfun)
val () =
prerrsln("g1val_a1pp: g1v1 = ", g1v1)
*)
//
}(*where*)//end-of-[g1val_a1pp(gfun,...)]
//
(* ****** ****** *)
//
fun
g1val_a2pp
( gfun: g1exp
, g1v1: g1val
, g1v2: g1val): g1val =
(
case+
gfun.node() of
//
|
G1Eid0(sym0) =>
let
//
val opnm = sym0.name()
//
in//let
//
case+ opnm of
//
|"==" => f0_eq2(g1v1, g1v2)
|"!=" => f0_neq(g1v1, g1v2)
//
// HX: no short-cuts!
|"&&" => f0_conj(g1v1, g1v2)
|"||" => f0_disj(g1v1, g1v2)
//
|_(*unknown*) => G1Vnone((*0*))
//
end(*let*)//end-of-[G1Eid0(sym0)]
//
|
_(*otherwise*) => G1Vnone((*void*))
) where
{
//
fun
f0_eq2
( g1v1: g1val
, g1v2: g1val): g1val =
(
case+ g1v1 of
//
|G1Vint(int1) =>
(
case+ g1v2 of
|G1Vint(int2) =>
(
  G1Vbtf(int1=int2))
|_(*otherwise*) => G1Vnone((*0*)))
//
|G1Vbtf(btf1) =>
(
case+ g1v2 of
|G1Vbtf(btf2) =>
(
  G1Vbtf(btf1=btf2))
|_(*otherwise*) => G1Vnone((*0*)))
//
|G1Vchr(chr1) =>
(
case+ g1v2 of
|G1Vchr(chr2) =>
(
  G1Vbtf(chr1=chr2))
|_(*otherwise*) => G1Vnone((*0*)))
//
|G1Vflt(flt1) =>
(
case+ g1v2 of
|G1Vflt(flt2) =>
(
  G1Vbtf(flt1=flt2))
|_(*otherwise*) => G1Vnone((*0*)))
//
|G1Vstr(str1) =>
(
case+ g1v2 of
|G1Vstr(str2) =>
(
  G1Vbtf(str1=str2))
|_(*otherwise*) => G1Vnone((*0*)))
//
|_(*otherwise*) => G1Vnone((*void*))
//
)(*case+*)//end-of-[f0_eq2(g1v1,g1v2)]
//
(* ****** ****** *)
//
fun
f0_neq
( g1v1: g1val
, g1v2: g1val): g1val =
let
//
val gres =
f0_eq2(g1v1, g1v2)
//
in//let
//
case+ gres of
|G1Vbtf(btf0) => G1Vbtf(~btf0)
|_(*non-G1Vbtf*) => G1Vnone((*0*))
//
end(*let*)//end-of-[f0_neq(g1v1,g1v2)]
//
(* ****** ****** *)
//
fun
f0_conj
( g1v1: g1val
, g1v2: g1val): g1val =
(
case+ g1v1 of
|G1Vbtf(btf1) =>
(if btf1 then g1v2 else g1v1)
|_(*non-G1Vbtf*) => G1Vnone((*0*)))
//
fun
f0_disj
( g1v1: g1val
, g1v2: g1val): g1val =
(
case+ g1v1 of
|G1Vbtf(btf1) =>
(if btf1 then g1v1 else g1v2)
|_(*non-G1Vbtf*) => G1Vnone((*0*)))
//
(* ****** ****** *)
//
(*
val () =
(
prerrsln//gfun:g1exp
("g1val_a2pp: gfun = ", gfun))//val
//
val () =
(
prerrsln("g1val_a2pp: g1v1 = ", g1v1))
val () =
(
prerrsln("g1val_a2pp: g1v2 = ", g1v2))
*)
//
(* ****** ****** *)
//
}(*where*)//end-of-[g1val_a2pp(gfun,...)]
//
(* ****** ****** *)
//
fun
f0_id0
( tenv:
! tr12env
, gexp: g1exp): g1val =
let
//
val-
G1Eid0(sym0) = gexp.node()
//
val
opt0 =
tr12env_find_g1mac(tenv, sym0)
//
in//let
case+ opt0 of
| ~
optn_vt_nil
( (*void*) ) => G1Vnone((*void*))
| ~
optn_vt_cons
(   gmac   ) => g1mac_eval(tenv, gmac)
end // let // end-of-[f0_id0(tenv,gmac)]
//
(* ****** ****** *)
//
(*
val () =
prerrsln("g1exp_eval: gexp = ", gexp)
*)
//
}(*where*)//end-of-[g1exp_eval(tenv,gexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr12env_eval_ifexp
(  tenv, gexp  ) =
let
//
val gval =
g1exp_eval(tenv, gexp)
//
(*
val (  ) =
prerrsln("\
tr12env_eval_ifexp: gexp = ", gexp)
val (  ) =
prerrsln("\
tr12env_eval_ifexp: gval = ", gval)
*)
//
in//let
//
case+ gval of
//
|G1Vbtf(btf) => btf
|G1Vint(int) =>
(if int != 0 then true else false)
|G1Vstr(str) =>
(if str != "" then true else false)
//
|_(*otherwise*) => (     false     )
//
end//let//end-of-[tr12env_eval_ifexp(tenv,gexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans12_utils0.dats] *)
