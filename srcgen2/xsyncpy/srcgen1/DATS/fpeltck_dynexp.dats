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
Sat Nov  1 11:44:09 PM EDT 2025
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
//
local
//
#define ERRVL 2
//
fun
auxmain
(
out0: FILR,
d3p0: d3pat1): void =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3p0.node() of
//
|
D3P1dapp
( d3f0
, npf1, d3ps) =>
let
val () =
fpeltck_d3pat1(out0, d3f0)
val () =
fpeltck_d3pat1lst(out0, d3ps)
end//let
//
|
D3P1errck(_, _) =>
let
val () =
(
  fpeltck_d3pat1(out0, d3p0)) end
//
|
_(*otherwise*) =>
let
val loc0 =
d3p0.lctn((*0*))
val (  ) = prerrsln("\
fpeltck_d3pat1:auxmain: loc0 = ", loc0)
val (  ) = prerrsln("\
fpeltck_d3pat1:auxmain: d3p0 = ", d3p0)
endlet
//
end(*let*)//end-of-[auxmain(out0, d3p0)]
//
in//local
//
#implfun
fpeltck_d3pat1
( out0, d3p0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
val () =
let
val loc0 = d3p0.lctn((*0*))
in//let
(*
prerrsln
("fpeltck_d3pat1: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fpeltck_d3pat1: d3p0 = ", d3p0)
*)
//
in//let
//
case+
d3p0.node() of
|
D3P1errck
(lvl0, d3p1) =>
(
auxmain(out0, d3p1); 
if
(lvl0>ERRVL)
then ((*void*)) else
let
val loc0 = d3p0.lctn()
in//let
printsln();
printsln("\
FPELTCK-ERROR:", loc0, ":", d3p0)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fpeltck_d3pat1(out,d3p0))
//
endloc(*local*)//end-of(local(fpeltck_d3pat1))
//
(* ****** ****** *)
//
#implfun
fpeltck_d3pat1lst
  (out0, d3ps) =
(
list_fpeltck_fnp(out0, d3ps, fpeltck_d3pat1))
//
#implfun
fpeltck_d3pat1opt
  (out0, dopt) =
(
optn_fpeltck_fnp(out0, dopt, fpeltck_d3pat1))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#define ERRVL 2
//
fun
auxmain
(
out0: FILR,
d3e0: d3exp1): void =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3e0.node() of
//
|
D3E1dapp
( d3f0
, npf1, d3es) =>
let
val () =
fpeltck_d3exp1(out0, d3f0)
val () =
fpeltck_d3exp1lst(out0, d3es)
end//let
//
|
D3E1errck(_, _) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e0)) end
//
|
_(*otherwise*) =>
let
val loc0 =
d3e0.lctn((*0*))
val (  ) = prerrsln("\
fpeltck_d3exp1:auxmain: loc0 = ", loc0)
val (  ) = prerrsln("\
fpeltck_d3exp1:auxmain: d3e0 = ", d3e0)
endlet
//
end(*let*)//end-of-[auxmain(out0, d3e0)]
//
in//local
//
#implfun
fpeltck_d3exp1
( out0, d3e0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
val () =
let
val loc0 = d3e0.lctn((*0*))
in//let
(*
prerrsln
("fpeltck_d3exp1: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fpeltck_d3exp1: d3e0 = ", d3e0)
*)
//
in//let
//
case+
d3e0.node() of
|
D3E1errck
(lvl0, d3e1) =>
(
auxmain(out0, d3e1); 
if
(lvl0>ERRVL)
then ((*void*)) else
let
val loc0 = d3e0.lctn()
in//let
printsln();
printsln("\
FPELTCK-ERROR:", loc0, ":", d3e0)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fpeltck_d3exp1(out,d3e0))
//
endloc(*local*)//end-of(local(fpeltck_d3exp1))
//
(* ****** ****** *)
//
#implfun
fpeltck_d3exp1lst
  (out0, d3es) =
(
list_fpeltck_fnp(out0, d3es, fpeltck_d3exp1))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_fpeltck_dynexp.dats] *)
(***********************************************************************)
