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
Sat Aug 12 16:40:38 EDT 2023
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
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trtmp3b_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr3benv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trtmp3b_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trtmp3b_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr3benv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trtmp3b_fnp(e1,xs,fopr)]
//
(* ****** ****** *)

#implfun
d3parsed_of_trtmp3b
  (dpar) =
let
//
val stadyn =
d3parsed_get_stadyn(dpar)
val nerror =
d3parsed_get_nerror(dpar)
val source =
d3parsed_get_source(dpar)
val t1penv =
d3parsed_get_t1penv(dpar)
val t2penv =
d3parsed_get_t2penv(dpar)
val t3penv =
d3parsed_get_t3penv(dpar)
val parsed =
d3parsed_get_parsed(dpar)
//
val env0 =
  tr3benv_make_nil((*void*))
//
val parsed =
trtmp3b_d3eclistopt(env0, parsed)
//
in//let
let
val (    ) = tr3benv_free_top(env0)
in//let
d3parsed
(stadyn
,nerror,source,t1penv,t2penv,t3penv,parsed)
end
end (*let*) // end of [d3parsed_trtmp3b(dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b.dats] *)
