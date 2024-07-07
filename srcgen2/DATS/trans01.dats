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
Sat Jul 30 21:17:58 EDT 2022
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
SYM = "./../SATS/xsymbol.sats"
#staload
LAM = "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
(* ****** ****** *)

#implfun
the_drpth_push_lcsrc
(  source  ) =
(
case+ source of
//
|LCSRCnone0() => ()
//
|LCSRCsome1(name) =>
let
val
dir1 = fpath_dpart(name)
val
(  ) =
the_drpth_push(dir1) where
{
val
dir1 = drpth_make_name(dir1)
}
endlet // end of [LCSRCsome1(name)]
//
|LCSRCfpath(fpth) =>
let
val
fnm1 =
fpath_get_fnm1(fpth)
val
dir1 = fpath_dpart(fnm1)
val
(  ) =
the_drpth_push(dir1) where
{
val
dir1 = drpth_make_name(dir1)
}
endlet // end of [LCSRCfpath(fpth)]
//
) where
{
val () =
prerrln
("the_drpth_push_lcsrc: source = ", source)
} (*where*) // end-of-(the_drpth_push_lcsrc)

(* ****** ****** *)

#implfun
the_drpth_pop0_lcsrc
(  source  ) =
(
case+ source of
|
LCSRCnone0 _ => ()
|
LCSRCsome1(name) => the_drpth_pop0()
|
LCSRCfpath(fpth) => the_drpth_pop0()
) where
{
val () =
prerrln
("the_drpth_pop0_lcsrc: source = ", source)
} (*where*) // end-of-(the_drpth_pop0_lcsrc)

(* ****** ****** *)

#implfun
d1parsed_of_trans01
  (dpar) =
let
val stadyn =
d0parsed_get_stadyn(dpar)
val nerror =
d0parsed_get_nerror(dpar)
val source =
d0parsed_get_source(dpar)
val parsed =
d0parsed_get_parsed(dpar)
//
val (   ) =
the_drpth_push_lcsrc(source)
//
val env0 = tr01env_make_nil()
val parsed =
trans01_d0eclistopt(env0, parsed)
//
val (   ) =
the_drpth_pop0_lcsrc(source)
//
in//let
//
let
val
topenv = tr01env_free_top(env0)
in//let
d1parsed
(stadyn,nerror,source,topenv,parsed) end
//
end(*let*)//end-of-[d1parsed_trans01(dpar)]

(* ****** ****** *)
//
#implfun
trans01_from_fpath
  (stadyn, source) =
(
d1parsed_of_trans01(dpar)) where
{
//
val dpar =
d0parsed_from_fpath(stadyn, source)
//
val dpar = d0parsed_of_preadx0(dpar)
}(*where*)//end-of-[d1parsed_from_fpath(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trans01_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr01env
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
}(*where*)//end of [list_trans01_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trans01_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = tr01env
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
}(*where*)//end of [optn_trans01_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans01.dats] *)
