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
#symload name with s2var_get_name
(* ****** ****** *)

local

datavwtp
tr3aenv =
TR3AENV of
(stkmap(s2varlst))
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
tr3aenv_poplam0
(     env0     ) = let
//
val+
@TR3AENV(!stkmap) = env0
//
in//let
//
(
  $fold(env0) ) where
{
val
nerr = stkmap_poplam0(stkmap) }
//
end(*let*)//end-of-(tr3aenv_poplam0(env0))
//
(* ****** ****** *)
//
#implfun
tr3aenv_pshlam0
(     env0     ) = let
//
val+
@TR3AENV(!stkmap) = env0
//
in//let
//
(
  $fold(env0) ) where
{
val () = stkmap_pshlam0(stkmap) }
//
end(*let*)//end-of-(tr3aenv_pshlam0(env0))
//
(* ****** ****** *)
//
#implfun
tr3aenv_s2vrch_opt
  (env0, s2v0) = let
//
val k0 = s2v0.name()
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
case+ opt1 of
| ~optn_vt_nil() => list_nil()
| ~optn_vt_cons(s2vs) => ( s2vs )
//
end(*let*)//end-of-(tr3aenv_s2vrch_opt(...))
//
(* ****** ****** *)
//
#implfun
tr3aenv_s2vins_any
  (env0, s2v0) = let
//
val s2vs =
(
list_cons(s2v0, s2vs)) where
{
val s2vs =
tr3aenv_s2vrch_opt(env0, s2v0) }
//
in//let
//
let
//
val x0 = s2vs
val k0 = s2v0.name()
//
(*
val () =
prerrln
("tr3aenv_s2vins_any: k0 = ", k0)
val () =
prerrln
("tr3aenv_s2vins_any: x0 = ", x0)
*)
//
val+
@TR3AENV(!stkmap) = env0 in//let
stkmap_insert_any(stkmap, k0, x0) end
//
endlet//end-of(tr3aenv_s2vins_any(env0,s2v0))
//
(* ****** ****** *)

endloc (*local*) // end of [local(tr3aenv...)]

(* ****** ****** *)
//
#implfun
tr3aenv_s2vrch_btf
  ( env0, s2v0 ) =
(
  list_exists(s2vs)) where
{
//
val s2vs =
tr3aenv_s2vrch_opt(env0, s2v0)
//
#typedef x0 = s2var
#impltmp
exists$test<x0>(s2v1) = (s2v0 = s2v1)
//
} (*where*) // end of [tr3aenv_s2vrch_btf(...)]
//
(* ****** ****** *)
//
#implfun
tr3aenv_s2vins_s2vs
  ( env0, s2vs ) =
(
case+ s2vs of
|list_nil
( (*void*) ) => ( (*void*) )
|list_cons
(s2v1, s2vs) =>
( tr3aenv_s2vins_any(env0, s2v1)
; tr3aenv_s2vins_s2vs(env0, s2vs))
) (*case+*) // end of [tr3aenv_s2vins_s2vs(...)]
//
(* ****** ****** *)
//
#implfun
tr3aenv_s2vins_sqas
  ( env0, sqas ) =
(
case+ sqas of
|list_nil
( (*void*) ) => ( (*void*) )
|list_cons
(sqa1, sqas) =>
let
val s2vs = s2qag_get_s2vs(sqa1)
in//let
  tr3aenv_s2vins_s2vs(env0, s2vs)
; tr3aenv_s2vins_sqas(env0, sqas) end
) (*case+*) // end of [tr3aenv_s2vins_s2vs(...)]
//
(* ****** ****** *)
//
#implfun
tr3aenv_s2vins_tqas
  ( env0, tqas ) =
(
case+ tqas of
|list_nil
( (*void*) ) => ( (*void*) )
|list_cons
(tqa1, tqas) =>
let
val s2vs = t2qag_get_s2vs(tqa1)
in//let
  tr3aenv_s2vins_s2vs(env0, s2vs)
; tr3aenv_s2vins_tqas(env0, tqas) end
) (*case+*) // end of [tr3aenv_s2vins_s2vs(...)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a_myenv0.dats] *)
