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
Fri Nov 10 13:35:32 EST 2023
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
//
#staload
_(*Trtmp3c*) = "./trtmp3c.dats"
//
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3c.sats"
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
//
#implfun
trtmp3c_d3ecl
( env0, d3cl ) = let
//
(*
val
loc0 = d3cl.lctn()
val () =
prerrln
("trtmp3c_d3ecl: loc0 = ", loc0)
val () =
prerrln
("trtmp3c_d3ecl: d3cl = ", d3cl)
*)
//
in//let
//
case+
d3cl.node() of
//
|D3Cnone0 _ => d3cl
|D3Cnone1 _ => d3cl
|D3Cnone2 _ => d3cl
//
|D3Cd2ecl _ => d3cl
|D3Cerrck _ => d3cl
//
|D3Cstatic _ => d3cl
|D3Cextern _ => d3cl
//
|D3Clocal0 _ =>
(
f0_local0(env0, d3cl))
//
|
D3Cabsopen _ => (d3cl)
|
D3Cabsimpl _ => (d3cl)
//
|
D3Cinclude _ => f0_include(env0, d3cl)
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone2( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_local0
( env0
: !tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Clocal0
(head, body) = d3cl.node()
//
val (  ) =
tr3cenv_pshloc1(env0)
val head =
trtmp3c_d3eclist(env0, head)
//
val (  ) =
tr3cenv_pshloc2(env0)
val body =
trtmp3c_d3eclist(env0, body)
//
in//let
//
let
//
val (  ) = tr3cenv_locjoin(env0)
//
in//let
  d3ecl(loc0, D3Clocal0(head, body))
end(*let*)
//
end(*let*)//end-of-[f0_local0(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_include
( env0
: !tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = d3cl.node()
//
val dopt =
trtmp3c_d3eclistopt(env0, dopt)
//
in//let
d3ecl_make_node
(loc0
,D3Cinclude(knd0,tknd,gsrc,fopt,dopt))
end(*let*)//end-of-[f0_include(env0,d3cl)]
//
(* ****** ****** *)
//
} (*where*)//end-of-[trtmp3c_d3ecl(env0,d3cl)]
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3eclist
( env0, dcls ) =
(
  list_trtmp3c_fnp(env0, dcls, trtmp3c_d3ecl))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3explstopt
  (env0, dopt) =
(
  optn_trtmp3c_fnp(env0, dopt, trtmp3c_d3explst))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3eclistopt
  (env0, dopt) =
(
  optn_trtmp3c_fnp(env0, dopt, trtmp3c_d3eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_decl00.dats] *)
