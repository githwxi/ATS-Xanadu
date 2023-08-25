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
Wed Aug 23 16:53:52 EDT 2023
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
_(*Trtmp3b*) = "./trtmp3b.dats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
//
fun
d3ecl_get_stamp
  (d3cl: d3ecl): stamp =
(
case-
d3cl.node() of
|
D3Cfundclst _ =>
(
  the_stamp_nil )
|
D3Cimplmnt0
( tok0
, stmp
, sqas, tqas
, dimp, t2is
, f3as, sres, body) => stmp
) where
{
(*
val () =
prerrln
("d3ecl_get_stamp: d3cl = ", d3cl)
*)
}(*where*)//end-of-[d3ecl_get_stamp(...)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3eclist
( env0, dcls ) =
(
  list_trtmp3b_fnp(env0, dcls, trtmp3b_d3ecl))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3valdclist
( env0, d3vs ) =
(
  list_trtmp3b_fnp(env0, d3vs, trtmp3b_d3valdcl))
//
#implfun
trtmp3b_d3vardclist
( env0, d3vs ) =
(
  list_trtmp3b_fnp(env0, d3vs, trtmp3b_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3fundclist
( env0, d3fs ) =
(
  list_trtmp3b_fnp(env0, d3fs, trtmp3b_d3fundcl))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3explstopt
  (env0, dopt) =
(
  optn_trtmp3b_fnp(env0, dopt, trtmp3b_d3explst))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3eclistopt
  (env0, dopt) =
(
  optn_trtmp3b_fnp(env0, dopt, trtmp3b_d3eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_decl00.dats] *)
