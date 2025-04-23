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
// Author: Hongwei Xi
// Wed Apr 23 01:09:27 PM EDT 2025
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-04-23:
For if-guarded declarations!
*)
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
#staload
MAP = "./../SATS/xsymmap.sats"
#staload
ENV = "./../SATS/xsymenv.sats"
#staload
NMS = "./../SATS/nmspace.sats"
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
implement
g1exp_edfq(gexp) =
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
Some_vt _ => G1Vbtf( true ))
where
{
val
opt0 = the_gmacenv_find(sym0) }
//
| _(*non-G1Eid0*) => G1Vbtf(false)
//
)(*case+*)//end-of-[g1exp_edfq(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
implement
g1mac_eval(gmac) =
(
//
case+ gmac of
| _(* otherwise *) => G1Vbtf(false)
//
)(*case+*)//end-of-[g1mac_eval(...)]
//
(* ****** ****** *)
//
implement
g1exp_eval(gexp) =
(
//
case+
gexp.node() of
| _(* otherwise *) => G1Vbtf(false)
//
)(*case+*)//end-of-[g1exp_eval(...)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [xats_trans12_dynutl.dats] *)
