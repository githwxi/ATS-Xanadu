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
Tue 14 Feb 2023 12:14:54 PM EST
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2b.sats"
#staload "./../SATS/tread22.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
//
#implfun
d3parsed_from_fpath
  (stadyn, source) =
(
  d3parsed_of_trans23(dpar)) where
{
//
val dpar =
d2parsed_from_fpath(stadyn, source)
//
val dpar = d2parsed_of_tread12(dpar)
//
val dpar = d2parsed_of_trans2a(dpar)
//
val (  ) = d2parsed_at_trsym2b(dpar)
//
val dpar = d2parsed_of_tread22(dpar)
//
(*
val (  ) =
prerrln("d3parsed_from_fpath: dpar = ", dpar)
*)
//
} (*where*)//end-of-[d3parsed_from_fpath(...)]
//
(* ****** ****** *)

#implfun
d3parsed_of_trans23
  (dpar) =
let
val stadyn =
d2parsed_get_stadyn(dpar)
val nerror =
d2parsed_get_nerror(dpar)
val source =
d2parsed_get_source(dpar)
val t1penv =
d2parsed_get_t1penv(dpar)
val t2penv =
d2parsed_get_t2penv(dpar)
val parsed =
d2parsed_get_parsed(dpar)
//
val env0 = tr23env_make_nil()
//
val t3penv = D3TOPENVnone((*0*))
//
val parsed =
trans23_d2eclistopt(env0, parsed)
//
in//let
let
val ((*0*)) = tr23env_free_top(env0)
in//let
d3parsed
(stadyn
,nerror,source,t1penv,t2penv,t3penv,parsed)
end//let
end (*let*) // end of [d3parsed_trans23(dpar)]

(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trans23_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr23env
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trans23_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trans23_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr23env
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trans23_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23.dats] *)
