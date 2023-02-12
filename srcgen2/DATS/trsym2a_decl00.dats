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
Sun 12 Feb 2023 12:17:13 PM EST
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
_(*TRSYM2A*) = "./trsym2a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2a.sats"
(* ****** ****** *)

local

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
trsym2a_d2ecl
( env0, dcl0 ) =
let
//
val () =
prerrln
("trsym2a_d2ecl: dcl0 = ", dcl0)
//
in//let
case+
dcl0.node() of
//
|
D2Cstatic(tknd,dcl1) =>
let
val () =
trsym2a_d2ecl(env0, dcl1)
endlet//end-of(D2Cstatic(_,_))
|
D2Cextern(tknd,dcl1) =>
let
val () =
trsym2a_d2ecl(env0, dcl1)
endlet//end-of(D2Cextern(_,_))
//
|
D2Clocal0(dcs1,dcs2) =>
let
val () =
trsym2a_d2eclist(env0, dcs1)
val () =
trsym2a_d2eclist(env0, dcs2)
endlet // end of [D2Clocal0(...)]
//
|
D2Cvaldclst
(tknd, d2vs) => let
val () =
  trsym2a_d2valdclist(env0, d2vs)
endlet // end-of-(D2Cvaldclst(_,_,_))
|
D2Cvardclst
(tknd, d2vs) => let
val () =
  trsym2a_d2vardclist(env0, d2vs)
endlet // end-of-(D2Cvardclst(_,_,_))
//
|
D2Cfundclst
( tknd
, tqas, d2fs) => let
(*
val () =
  trsym2a_t2qaglst(out, tqas)
*)
val () =
  trsym2a_d2fundclist(env0, d2fs)
endlet // end-of-(D2Cfundclst(_,_,_))
//
| D2Cnone0() => ( (*void*) )
| D2Cnone1(d1cl) => ( (*void*) )
//
| _(* otherwise *) => (   (*skipped*)   )
//
end(*let*)//end-of(trsym2a_d2ecl(env0,dcl0))
//
endloc(*local*)//end-of(local(trsym2a_d2ecl))

(* ****** ****** *)
//
#implfun
trsym2a_d2eclist
( env0, d2cs ) =
list_trsym2a_fnp(env0, d2cs, trsym2a_d2ecl)
//
(* ****** ****** *)
//
#implfun
trsym2a_d2valdclist
( env0, d2vs ) =
list_trsym2a_fnp(env0, d2vs, trsym2a_d2valdcl)
//
#implfun
trsym2a_d2vardclist
( env0, d2vs ) =
list_trsym2a_fnp(env0, d2vs, trsym2a_d2vardcl)
//
(* ****** ****** *)
//
#implfun
trsym2a_d2fundclist
( env0, d2fs ) =
list_trsym2a_fnp(env0, d2fs, trsym2a_d2fundcl)
//
(* ****** ****** *)
//
#implfun
trsym2a_d2eclistopt
( env0, dopt ) =
optn_trsym2a_fnp(env0, dopt, trsym2a_d2eclist)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trsym2a.dats] *)
