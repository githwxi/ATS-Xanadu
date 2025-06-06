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
Sun Jun  1 10:05:49 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trx3cpy.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
#symload lctn with d3exp_get_lctn
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
d3exp_trx3cpy
(d3e0, env0) =
(
case+
d3e0.node() of
|
_(*otherwise*) =>
(
  d3exp1(loc0, D3E1d3exp(d3e0)))
) where
{
//
val loc0 = d3e0.lctn()
//
(*
val (  ) =
printsln("d3exp_trx3cpy: loc0 = ", loc0)
val (  ) =
printsln("d3exp_trx3cpy: d3e0 = ", d3e0)
*)
//
}(*where*)//end-of-[d3exp_trx3cpy(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_dynexp.dats] *)
(***********************************************************************)
