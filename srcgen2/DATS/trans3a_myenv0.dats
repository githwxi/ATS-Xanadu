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
Wed 26 Jul 2023 03:12:31 PM EDT
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
#symload name with d2cst_get_name
(* ****** ****** *)

local

datavwtp
tr3aenv =
TR3AENV of
(stkmap(d3eclist))
#absimpl tr3aenv_vtbx = tr3aenv

in//local

(* ****** ****** *)
//
#implfun
tr3aenv_make_nil
  ( (*void*) ) = let
//
val
stkmap =
stkmap_make_nil() in TR3AENV(stkmap)
//
end(*let*) // end of [tr3aenv_make_nil()]
//
(* ****** ****** *)
//
#implfun
tr3aenv_free_top
  (  env0  ) =
(
case+ env0 of
| ~
TR3AENV(stkmap) =>
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
)(*case+*)//end-of-(tr3aenv_free_top(env0))
//
(* ****** ****** *)
//
#implfun
tr3aenv_poplet0
(     env0     ) = let
//
val+
@TR3AENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(tr3aenv_poplet0(env0))
//
(* ****** ****** *)
//
#implfun
tr3aenv_pshlet0
(     env0     ) = let
//
val+
@TR3AENV(!stkmap) = env0
//
in//let
//
stkmap_pshlet0(stkmap); $fold(env0)
//
end(*let*)//end-of-(tr3aenv_pshlet0(env0))
//
(* ****** ****** *)
//
#implfun
tr3aenv_pshloc1
(     env0     ) = let
//
val+
@TR3AENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(env0)
end (*let*)
//
end(*let*)//end-of-(tr3aenv_pshloc1(env0))
//
#implfun
tr3aenv_pshloc2
(     env0     ) = let
//
val+
@TR3AENV(!stkmap) = env0
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(env0)
end (*let*)
//
end(*let*)//end-of-(tr3aenv_pshloc2(env0))
//
(* ****** ****** *)
//
#implfun
tr3aenv_locjoin
(     env0     ) = let
//
val+
@TR3AENV(!stkmap) = env0
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
end(*let*)//end-of-(tr3aenv_locjoin(env0))
//
(* ****** ****** *)
//
#implfun
tr3aenv_d2crch_opt
  (env0, d2c0) = let
//
val k0 = d2c0.name()
//
val+
TR3AENV(stkmap) = env0
val opt1 =
stkmap_search_opt(stkmap, k0)
//
(*
val () =
prerrln
("tr3aenv_search_opt: k0 = ", k0)
*)
//
in//let
//
(
case+ opt1 of
| ~ optn_vt_nil() => list_nil(*0*)
| ~ optn_vt_cons(dcls) => (  dcls  ))
//
end(*let*)//end-of-(tr3aenv_d2crch_opt(...))
//
(* ****** ****** *)
//
#implfun
tr3aenv_d2cins_any
(env0, d2c0, d3cl) = let
//
val dcls =
(
list_cons(d3cl, dcls)) where
{
val dcls =
tr3aenv_d2crch_opt(env0, d2c0) }
//
in//let
//
let
//
val x0 = dcls//d3eclist
val k0 = d2c0.name((*0*))
//
(*
val () =
prerrln
("tr3aenv_d2cins_any: k0 = ", k0)
val () =
prerrln
("tr3aenv_d2cins_any: x0 = ", x0)
*)
//
val+
@TR3AENV(!stkmap) = env0 in//let
stkmap_insert_any(stkmap, k0, x0) end
//
endlet//end-of(tr3aenv_d2cins_any(env0,d2c0))
//
(* ****** ****** *)

endloc (*local*) // end of [local(tr3aenv...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a_myenv0.dats] *)
