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
//
(*
Author: Hongwei Xi
(*
Sat Nov  1 11:44:25 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/fpeltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
local
//
#define ERRLVL 3
//
fun
auxmain
( out0: FILR
, dcl0: d3ecl1): void =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
//
|D3C1static
(tknd, dcl1) =>
let
val () =
(
  fpeltck_d3ecl1(out0, dcl1))
endlet//end-of(D3C1static(_,_))
|D3C1extern
(tknd, dcl1) =>
let
val () =
(
  fpeltck_d3ecl1(out0, dcl1))
endlet//end-of(D3C1extern(_,_))
//
(* ****** ****** *)
//
|D3C1staload _ => (  (*void*)  )
|D3C1include _ => (  (*void*)  )
//
(* ****** ****** *)
//
|D3C1errck
(lvl0,dcl1) => fpeltck_d3ecl1(out0, dcl0)
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val
loc0 = dcl0.lctn()
//
val () = prerrsln("\
fpeltck_d3ecl1: auxmain: loc0 = ", loc0)
val () = prerrsln("\
fpeltck_d3ecl1: auxmain: dcl0 = ", dcl0)
//
endlet
//
(* ****** ****** *)
//
end (*let*) // end-of-[ auxmain(out0,dcl0) ]

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
fpeltck_d3ecl1
( out0, dcl0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
(*
val () =
let
val loc0 = dcl0.lctn()
in//let
prerrsln
("fpeltck_d3ecl1: loc0 = ", loc0)
end//let
val () =
prerrsln
("fpeltck_d3ecl1: dcl0 = ", dcl0)
*)
//
in//let
//
case+
dcl0.node() of
//
|
D3C1errck
(lvl0, dcl1)  =>
(
(
auxmain(out0, dcl1));
if
(lvl0>=ERRLVL)
then ((*void*)) else
let
val loc0 = dcl0.lctn()
in//let
printsln();
printsln("\
FPELTCK-ERROR:", loc0, ":", dcl0)
end//let
)
//
|
_(* otherwise *) => (   (*skipped*)   )
//
end(*let*)//end-of(fpeltck_d3ecl1(out0,dcl0))
//
endloc(*local*)//end-of(local(fpeltck_d3ecl1))
//
(* ****** ****** *)
//
#implfun
fpeltck_d3ecl1lst
  (out0, dcls) =
(
list_fpeltck_fnp(out0, dcls, fpeltck_d3ecl1))
//
#implfun
fpeltck_d3ecl1opt
  (out0, dopt) =
(
optn_fpeltck_fnp(out0, dopt, fpeltck_d3ecl1))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_fpeltck_decl00.dats] *)
(***********************************************************************)
