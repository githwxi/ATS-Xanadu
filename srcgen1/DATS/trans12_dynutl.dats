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
(*
// HX-2025-04-23:
// For if-guarded declarations!
*)
(* ****** ****** *)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Wed Apr 23 04:38:44 PM EDT 2025
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
SYM = "./../SATS/xsymbol.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/mylib00.sats"
#staload "./../DATS/mylib00.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/xbasics.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)

#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/lexing0.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)
(* ****** ****** *)
//
fun
ISDEFQ
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
)(*case+*)//end-of-[ISDEFQ(gfun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
implement
g1exp_defq
(  gexp  ) =
(
case+
gexp.node() of
//
|
G1Eid0(sym0) =>
(
case+ opt0 of
| ~
None_vt _ => G1Vbtf(false)
| ~
Some_vt _ => G1Vbtf( true )
)
where
{
val
opt0 = the_gmacenv_find(sym0)
}(*where*)//end-of-[G1Eid0(...)]
//
|
G1Elist(g1es) =>
(
case+ g1es of
|
list_nil
((*void*)) =>
(
  G1Vbtf(false))
|
list_cons
(g1e1, g1es) =>
(
if
list_is_nil(g1es)
then
g1exp_defq
(  g1e1  ) else G1Vbtf(false))
)(*case+*)//end-of-[G1Elist(...)]
//
|
_(* otherwise *) => G1Vbtf(false)
//
)
where
{
(*
val () =
println!("g1exp_defq: gexp = ",gexp)
*)
}(*where*)//end-of-[g1exp_defq(gexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
g1val_app1
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
|G1Vint(int1) => G1Vbtf(int1 != 0)
|_(*non-G1Vbtf*) => G1Vnone((*0*)))
//
fun
f0_neg
(g1v1: g1val): g1val =
(
case+ g1v1 of
|G1Vint(int1) => G1Vint(~int1)
|_(*non-G1Vbtf*) => G1Vnone((*0*)))
//
(*
val () =
prerrsln
("g1val_app1: gfun = ", gfun)
val () =
prerrsln("g1val_app1: g1v1 = ", g1v1)
*)
//
}(*where*)//end-of-[g1val_app1(gfun,...)]
//
(* ****** ****** *)
//
fun
g1val_app2
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
(* ****** ****** *)
//
implement
g1exp_eval(gexp) =
(
//
case+
gexp.node() of
//
|G1Eid0(sym0) =>
(
case+ opt0 of
| ~
None_vt() =>
G1Vnone((*void*))
| ~
Some_vt(gmac) =>
(
  g1mac_eval(gmac))
) where
{
val
opt0 =
the_gmacenv_find(sym0) }
//
|G1Eint(tint) =>
(
  G1Vint(token2sint(tint)))
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
|G1Eapp1
( gfun, g1e1) =>
if
ISDEFQ(gfun)
then
(
  g1exp_defq(g1e1)
)
else
(
  g1val_app1(gfun, g1v1)
) where
{
//
val g1v1 = g1exp_eval(g1e1)
//
}(*where*)//end-of-[G1Ea1pp(...)]
//
(* ****** ****** *)
//
|G1Eapp2
( gfun
, g1e1, g1e2) =>
(
g1val_app2
(gfun, g1v1, g1v2)) where
{
//
val g1v1 = g1exp_eval(g1e1)
val g1v2 = g1exp_eval(g1e2)
//
}(*where*)//end-of-[G1Eapp2(...)]
//
(* ****** ****** *)
//
| _(* otherwise *) => G1Vbtf(false)
//
(* ****** ****** *)
//
)(*case+*)//end-of-[g1exp_eval(...)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [xats_trans12_dynutl.dats] *)
