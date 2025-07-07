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
Sat Jul  5 02:11:10 PM EDT 2025
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
"./../SATS/trxltck.sats"
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
#implfun
d3ecl1_trxltck
(d3cl, env0) =
let
//
val loc0 = d3cl.lctn()
//
val () =
prerrsln("\
d3ecl_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3ecl_trxltck: d3cl = ", d3cl)
//
in//let
//
case+
d3cl.node() of
//
|D3C1static _ =>
(
  f0_static(d3cl, env0))
|D3C1extern _ =>
(
  f0_extern(d3cl, env0))
//
|D3C1include _ =>
(
  f0_include(d3cl, env0))
//
|_(*otherwise*) =>
d3ecl1(loc0, D3C1errck(0(*lvl*), d3cl))
//
end where
{
//
(* ****** ****** *)
//
val loc0 = d3cl.lctn()
//
(* ****** ****** *)
//
fun
f0_static
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
val-
D3C1static
(tknd, d3c1) = d3c0.node()
in//let
//
(
d3ecl1
(loc0, D3C1static(tknd, d3c1)))
where{
val d3c1 = d3ecl1_trxltck(d3c1, env0)
}(*where*)
//
end//let//end-of-[f0_static(d3c0,env0)]
//
fun
f0_extern
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
val-
D3C1extern
(tknd, d3c1) = d3c0.node()
in//let
//
(
d3ecl1
(loc0, D3C1extern(tknd, d3c1)))
where{
val d3c1 = d3ecl1_trxltck(d3c1, env0)
}(*where*)
//
end//let//end-of-[f0_extern(d3c0,env0)]
//
(* ****** ****** *)
//
fun
f0_include
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
//
val-
D3C1include
(sd01
,tknd, gexp
,fopt, dopt) = d3c0.node()
//
val
dopt =
d3ecl1lstopt_trxltck(dopt, env0)
//
in//let
//
d3ecl1
( loc0
, D3C1include
  (sd01, tknd, gexp, fopt, dopt))
//
end//let
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3ecl1_trxltck(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_decl00.dats] *)
(***********************************************************************)
