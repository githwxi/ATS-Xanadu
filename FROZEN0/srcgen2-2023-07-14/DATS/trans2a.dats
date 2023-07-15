(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 19 Nov 2022 01:59:01 PM EST
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
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
#symload lctn with d2var_get_lctn
(* ****** ****** *)
//
#implfun
x2t2p_make_dvar
  (  d2v0  ) =
x2t2p_make_lctn(d2v0.lctn())
//
(* ****** ****** *)

#impltmp
<x0><y0>
list_trans2a_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr2aenv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trans2a_fnp(e1,xs,fopr)]

(* ****** ****** *)

#impltmp
<x0><y0>
optn_trans2a_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr2aenv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trans2a_fnp(e1,xs,fopr)]

(* ****** ****** *)

#implfun
d2parsed_of_trans2a
  (dpar) =
let
//
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
val env0 = tr2aenv_make_nil()
//
val parsed =
trans2a_d2eclistopt(env0, parsed)
//
in//let
let
val d2cenv = tr2aenv_free_top(env0)
in//let
d2parsed
(stadyn,nerror,source,t1penv,t2penv,parsed)
end
end (*let*) // end of [d2parsed_trans2a(dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a.dats] *)
