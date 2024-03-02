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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Mon Nov 27 23:40:18 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxinterp.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/xinterp.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#dynload "./../DATS/intrep0.dats"
#dynload "./../DATS/intrep0_print0.dats"
#dynload "./../DATS/intrep0_dynexp.dats"
#dynload "./../DATS/intrep0_decl00.dats"
*)
//
(*
#dynload "./../DATS/xinterp.dats"
#dynload "./../DATS/xinterp_print0.dats"
#dynload "./../DATS/xinterp_myenv0.dats"
#dynload "./../DATS/xinterp_dynexp.dats"
#dynload "./../DATS/xinterp_decl00.dats"
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irparsed
  (dpar) = let
//
val stadyn =
irparsed_get_stadyn(dpar)
val nerror =
irparsed_get_nerror(dpar)
val source =
irparsed_get_source(dpar)
val parsed =
irparsed_get_parsed(dpar)
//
val env0 = xintenv_make_nil()
//
in//let
(
  xintenv_free_top(env0)) where
{ val () =
  xinterp_irdclistopt(env0, parsed) }
end (*let*) // end of [d3parsed_trans3a(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_xinterp_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = xintenv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_xinterp_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_xinterp_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = xintenv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_xinterp_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep.dats] *)
(***********************************************************************)
