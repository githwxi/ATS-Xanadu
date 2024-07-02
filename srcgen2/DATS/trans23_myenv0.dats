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
Sun 19 Feb 2023 12:37:27 PM EST
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload name with s2cst_get_name
#symload styp with s2cst_get_styp
(* ****** ****** *)
(* ****** ****** *)

local
//
(*
#absimpl // s2cst->s2typ
ms2ct2p_tbox = topmap(s2typ)
*)
//
(*
HX-2024-03-01:
Opening exists-types is
to be supported in the future?
*)
datavwtp
tr23env =
TR23ENV of
(stkmap(s2cstlst))
//
#absimpl tr23env_vtbx = tr23env
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
tr23env_make_nil
  ( (*void*) ) = let
//
val
stkmap =
stkmap_make_nil() in TR23ENV(stkmap)
//
end (*let*) // end of [tr23env_make_nil()]
//
(* ****** ****** *)
//
#implfun
tr23env_free_top
  (  env0  ) =
(
case+ env0 of
~TR23ENV(stkmap) =>
let
//
var
stkmap = stkmap
//
val nerr =
stkmap_poptop0(stkmap)
//
val (  ) =
stkmap_free_nil(stkmap) in () end//let
) (*case+*)//end-of-(tr23env_free_top(env0))
//
(* ****** ****** *)
//
#implfun
tr23env_pshlet0
(     env0     ) = let
//
val+
@TR23ENV(!stkmap) = env0
//
in//let
//
stkmap_pshlet0(stkmap); $fold(env0)
//
end (*let*)//end-of-(tr23env_pshlet0(env0))
//
(* ****** ****** *)
//
#implfun
tr23env_poplet0
(     env0     ) = let
//
val+
@TR23ENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(env0)
end (*let*)
//
end (*let*)//end-of-(tr23env_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr23env_pshloc1
(     env0     ) = let
//
val+
@TR23ENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(env0)
end (*let*)
//
end (*let*)//end-of-(tr23env_pshloc1(env0))
//
#implfun
tr23env_pshloc2
(     env0     ) = let
//
val+
@TR23ENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(env0)
end (*let*)
//
end (*let*)//end-of-(tr23env_pshloc2(env0))
//
(* ****** ****** *)
//
#implfun
tr23env_locjoin
(     env0     ) = let
//
val+
@TR23ENV(!stkmap) = env0
//
in//let
//
$fold(env0) where
{
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
val
( (*nil*) ) =
stkmap_insert_kxs(stkmap, kxs) }
//
end (*let*)//end-of-(tr23env_locjoin(env0))
//
(* ****** ****** *)
//
#implfun
tr23env_search_opt
  (env0, s2c0) = let
//
val k0 = s2c0.name()
//
val+
TR23ENV(stkmap) = env0
val opt1 =
stkmap_search_opt(stkmap, k0)
//
(*
val () =
prerrln
("tr23env_search_opt: k0 = ", k0)
*)
//
in//let
//
case+ opt1 of
| ~optn_vt_nil() => list_nil()
| ~optn_vt_cons(s2cs) => ( s2cs )
//
end(*let*)//end-of-(tr23env_search_opt(...))
//
(* ****** ****** *)
//
//
#implfun
tr23env_insert_any
  (env0, s2c0) = let
//
val s2cs =
(
list_cons(s2c0, s2cs)) where
{
val s2cs =
tr23env_search_opt(env0, s2c0) }
//
in//let
//
let
//
val x0 = s2cs
val k0 = s2c0.name()
//
(*
val () =
prerrln
("tr23env_insert_any: k0 = ", k0)
val () =
prerrln
("tr23env_insert_any: x0 = ", x0)
*)
//
val+
@TR23ENV(!stkmap) = env0 in//let
stkmap_insert_any(stkmap, k0, x0) end
//
endlet//end-of(tr23env_insert_any(env0,s2c0))
//
(* ****** ****** *)
//
endloc (*local*) // end of [ local(tr23env...) ]
//
(* ****** ****** *)

#implfun
tr23env_evstyp_cst
  (env0, s2c0) = let
//
val s2cs =
tr23env_search_opt(env0, s2c0)
//
(*
val (  ) =
prerrln
("tr23env_evstyp_cst: s2c0 = ", s2c0)
val (  ) =
prerrln
("tr23env_evstyp_cst: s2cs = ", s2cs)
*)
//
in//let
(
  f0_s2cs(s2cs) ) where
{
fun
f0_s2cs
( s2cs
: s2cstlst): s2typopt_vt =
(
case+ s2cs of
|
list_nil() =>
optn_vt_nil((*void*))
|
list_cons(s2c1, s2cs) =>
if
(s2c0 = s2c1)
then
s2abs_get_styp(s2c0) else f0_s2cs(s2cs))
}
end(*let*) // end of [tr23env_evstyp_cst(...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans23_myenv0.dats] *)
