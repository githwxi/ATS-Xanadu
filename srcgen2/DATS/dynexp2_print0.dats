(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 27 Aug 2022 02:44:07 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
(*
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
*)
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)

#implfun
d2pat_fprint
(out, d2p0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2p0.node() of
//
|
D2Pnone0() => print("D2Pnone0(",")")
|
D2Pnone1(d1p1) => print("D2Pnone1(",d1p1,")")
//
end (*let*) // end of [d2pat_fprint(out, d2p0)]

(* ****** ****** *)

#implfun
d2exp_fprint
(out, d2e0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2e0.node() of
//
|D2Eint(int) =>
print("D2Eint(",int,")")
|D2Ebtf(btf) =>
print("D2Ebtf(",btf,")")
|D2Echr(chr) =>
print("D2Echr(",chr,")")
|D2Estr(str) =>
print("D2Estr(",str,")")
//
|D2Ei00(int) =>
print("D2Ei00(",int,")")
|D2Eb00(btf) =>
print("D2Eb00(",btf,")")
|D2Ec00(chr) =>
print("D2Ec00(",chr,")")
|D2Es00(str) =>
print("D2Es00(",str,")")
//
|
D2Eexist1
(s2es, d2e1) =>
print("D2Eexist1(",s2es,";",d2e1,")")
//
|
D2Enone0() => print( "D2Enone0(",")" )
|
D2Enone1(d1e1) => print("D2Enone1(",d1e1,")")
//
end (*let*) // end of [d2exp_fprint(out, d2e0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp2_print0.dats] *)
