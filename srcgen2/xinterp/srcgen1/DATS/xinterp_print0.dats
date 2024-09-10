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
(*
Tue Nov 28 11:12:09 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
//
#include
"./../HATS/xinterp_dats.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/xinterp.sats"
//
(* ****** ****** *)
//
#implfun
irval_fprint
(out, irv0) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+ irv0 of
|
IRVnil() =>
prints("IRVnil(", ")")
//
|IRVint(int) =>
prints("IRVint(", int, ")")
//
|IRVbtf(btf) =>
prints("IRVbtf(", btf, ")")
|IRVchr(chr) =>
prints("IRVchr(", chr, ")")
//
|IRVflt(flt) =>
prints("IRVflt(", flt, ")")
|IRVstr(str) =>
prints("IRVstr(", str, ")")
//
(* ****** ****** *)
//
|IRVcon(d2c) =>
prints("IRVcon(", d2c, ")")
//
(* ****** ****** *)
//
|IRVlft(lval) =>
prints("IRVlft(", lval, ")")
//
(* ****** ****** *)
//
|IRVcapp
( d2c1 , irvs ) =>
prints
("IRVcapp(", d2c1, ";", irvs, ")")
//
(* ****** ****** *)
//
|IRVptr(ptr) =>
prints("IRVptr(", "...", ")")
//
(* ****** ****** *)
//
|IRVfun(fopr) =>
prints("IRVfun(", "...", ")")
//
(* ****** ****** *)
//
|IRVtup0(irvs) =>
prints("IRVtup0(", irvs, ")")
//
|IRVtup1
( tknd , irvs ) =>
prints
("IRVtup1(", tknd, ";", irvs, ")")
//
|IRVrcd2
( tknd , livs ) =>
prints
("IRVrcd2(", tknd, ";", "...", ")")
//
(* ****** ****** *)
//
|IRVlam0
(farg, body, fenv) =>
prints
("IRVlam0(", farg, ";", "...", ")")
|IRVfix0
(fid0, farg, body, fenv) =>
prints
("IRVfix0("
, fid0, ";", farg, ";", "...", ")")
|IRVfixs
(fid0, farg, body, irvs, fenv) =>
prints
("IRVfixs("
, fid0, ";"
, farg, ";", irvs, ";", "...", ")")
//
(* ****** ****** *)
//
|IRVl0azy
( body , fenv ) =>
(
  prints( "IRVl0azy(", "...", ")") )
//
|IRVl1azy
(body, ires, fenv) =>
prints
("IRVl1azy(", "...", ";", "...", ")")
//
(* ****** ****** *)
//
|IRVnone0(    ) => prints("IRVnone0(", ")")
|IRVnone1(ire1) => prints("IRVnone1(", ire1, ")")
//
(* ****** ****** *)
//
end//let//end-of-[irval_fprint(out, irv0)]
//
(* ****** ****** *)
//
#implfun
irlft_fprint
(out, lval) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+ lval of
|
IRLFTref0(ropt) =>
prints("IRLFTref0(", ropt, ")")
|
IRLFTpcon
(tknd, lab1, irv1) =>
prints
("IRLFTpcon("
, tknd, ";", lab1, ";", irv1, ")")
//
end//let//end-of-[irlft_fprint(out, lval)]
//
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xinterp_print0.dats] *)
(***********************************************************************)
