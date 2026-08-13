(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sun May 31 08:17:09 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xsymbol.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp1.sats"
#staload
"./../../../SATS/dynexp1.sats"
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ_fpprnt
(styp, out0) =
let
//
(*
s2typ_fpprnt: pretty-print!
*)
//
in//let
//
case+
styp.node() of
//
(* ****** ****** *)
//
|T2Pcst _ => f0_cst(styp, out0)
|T2Pvar _ => f0_var(styp, out0)
//
(* ****** ****** *)
//
|T2Papps _ => f0_apps(styp, out0)
//
(* ****** ****** *)
//
|T2Ptext _ => f0_text(styp, out0)
//
(* ****** ****** *)
|
_(*otherwise*) => s2typ_fprint(styp, out0)
//
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
(* ****** ****** *)
//
#impltmp
g_print
<s2typ>
( styp ) =
s2typ_fpprnt
(styp, g_print$out<>((*0*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_cst
( styp: s2typ
, out0: FILR): void =
(
print(sym1.name((*0*))))
where
{
//
val-T2Pcst(s2c1) = styp.node()
val sym1 = s2cst_get_name(s2c1)
//
}(*where*)//end-of-[f0_cst(styp,out0)]
//
(* ****** ****** *)
//
fun
f0_var
( styp: s2typ
, out0: FILR): void =
(
print(sym1.name((*0*))))
where
{
//
val-T2Pvar(s2v1) = styp.node()
val sym1 = s2var_get_name(s2v1)
//
}(*where*)//end-of-[f0_var(styp,out0)]
//
(* ****** ****** *)
//
fun
f0_apps
( styp: s2typ
, out0: FILR): void =
let
//
val-
T2Papps
(t2f0, t2ps) = styp.node()
//
val () = prints(t2f0, "(")
val () = (
  f1_t2ps(0, t2ps); prints(")"))
//
end where
{
//
fun
f1_t2ps
( i0: sint
, t2ps: s2typlst): void =
(
case+ t2ps of
|
list_nil
( (*void*) ) => ((*done*))
|
list_cons
(t2p1, t2ps) =>
let
val () =
(
if // if
(i0 >= 1)
then print(", "))
val () = print(t2p1)
val () = f1_t2ps(i0+1, t2ps)
end(*let*)//end-of-[f1_t2ps(i0,t2ps)]
)
//
}(*where*)//end-of-[f0_dapp(styp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_text
( styp: s2typ
, out0: FILR): void =
let
//
val-
T2Ptext
(name, t2ps) = styp.node()
//
val () =
(
case+ t2ps of
|
list_nil() => prints(name)
|
list_cons _ =>
(
prints(name, "(");
f1_t2ps(0, t2ps); prints(")"))
)
//
end where
{
fun
f1_t2ps
( i0: sint
, t2ps: s2typlst): void =
(
case+ t2ps of
|
list_nil
( (*void*) ) => ((*done*))
|
list_cons
(t2p1, t2ps) =>
let
val () =
(
if // if
(i0 >= 1)
then print(", "))
val () = print(t2p1)
val () = f1_t2ps(i0+1, t2ps)
end(*let*)//end-of-[f1_t2ps(i0,t2ps)]
)
//
}(*where*)//end-of-[f0_text(styp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[s2typ_fpprnt(styp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_trxd3i0_print0.dats] *)
(***********************************************************************)
