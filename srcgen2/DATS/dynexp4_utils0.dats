(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue 27 Feb 2024 09:28:33 AM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload lctn with d4pat_get_lctn
#symload node with d4pat_get_node
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload node with d4exp_get_node
(* ****** ****** *)
#staload _ = "./xsymmap_topmap.dats"
(* ****** ****** *)
(* ****** ****** *)

#implfun
d4pat_freeq
(  d4p0  ) =
(
  loop(d4p0)) where
{
//
fun
loop
(d4p0: d4pat): bool =
(
case+
d4p0.node() of
| D4Pfree _ => ( true )
//
| D4Pannot
( d4p1
, s1e2, s2e2) => loop(d4p1)
//
| _(*otherwise*) => (   false   )
)(*case+*) // end of [ loop(d4p0) ]
//
(* ****** ****** *)
//
val () =
prerrln("d4pat_freeq: d4p0 = ", d4p0)
//
(* ****** ****** *)
//
}(*where*)//end-of-[d4pat_freeq(d4p0)]

(* ****** ****** *)

#implfun
d4exp_foldq
(  d4e0  ) =
(
  loop(d4e0)) where
{
//
fun
loop(d4e0: d4exp): bool =
(
case+
d4e0.node() of
//
| D4Evar _ => (   true   )
//
| _(*otherwise*) => (   false   )
)
//
val () =
prerrln("d4exp_foldq: d4e0 = ", d4e0)
//
}(*where*)//end-of-[d4exp_foldq(d4e0)]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_dynexp4_utils0.dats] *)
