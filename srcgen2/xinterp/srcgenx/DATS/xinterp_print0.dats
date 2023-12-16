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
"./../HATS/libxinterp.hats"
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
print("IRVnil(", ")")
//
|IRVint(int) =>
print("IRVint(", int, ")")
//
(*
|IRVptr(ptr) =>
print("IRVptr(", ptr, ")")
*)
//
|IRVbtf(btf) =>
print("IRVbtf(", btf, ")")
|IRVchr(chr) =>
print("IRVchr(", chr, ")")
//
|IRVflt(flt) =>
print("IRVflt(", flt, ")")
|IRVstr(str) =>
print("IRVstr(", str, ")")
//
|IRVfun(fopr) =>
print("IRVfun(", "...", ")")
//
|IRVtup0(irvs) =>
print("IRVtup0(", irvs, ")")
//
|IRVlam0
(farg, body, fenv) =>
print
("IRVlam0(", farg, ";", "...", ")")
|IRVfix0
(fid0, farg, body, fenv) =>
print
("IRVfix0("
, fid0, ";", farg, ";", "...", ")")
|IRVfixs
(fid0, farg, body, ires, fenv) =>
print
("IRVfixs("
, fid0, ";", farg, ";", "...", ")")
//
|IRVnone0(    ) => print("IRVnone0(", ")")
|IRVnone1(ire1) => print("IRVnone1(", ire1, ")")
//
end//let//end-of-[irval_fprint(out, irv0)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xinterp_print0.dats] *)
