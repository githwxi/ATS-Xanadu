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
Fri Aug  5 14:13:00 EDT 2022
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
#staload "./../SATS/xfixity.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)

fun
mix_fixty_fixty
(x0: fixty, x1: fixty): fixty =
(
case+ x0 of
|
FIXTYpre(p0) =>
( case+ x1 of
  | FIXTYinf
    (p1, a1) =>
    FIXTYpreinf(p0, p1, a1) | _ => x0
) (* end of [FIXTYinf] *)
|
FIXTYinf(p0, a0) =>
( case+ x1 of
  | FIXTYpre(p1) =>
    FIXTYpreinf(p1, p0, a0) | _ => x0
) (* end of [FIXTYinf] *)
| _ (* non-FIXTYpre-FIXTYinf *) => x0
)

(* ****** ****** *)

local

#typedef key = sym_t

datavwtp
tr01env =
TR01ENV of
(topmap(fixty), stkmap(fixty))

#absimpl tr01env_vtbx = tr01env

in//local

(* ****** ****** *)

(*
fun
tr01env_make_nil((*void*)): tr01env
*)
#implfun
tr01env_make_nil() =
TR01ENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [tr01env_make_nil()]

(* ****** ****** *)

#implfun
tr01env_free_top
  (  tenv  ) =
(
stkmap_free_nil(stkmap)) where
{
val+
~TR01ENV(topmap, stkmap) = tenv
} (*where*)//end-of(tr01env_free_top(tenv))

(* ****** ****** *)
//
#implfun
tr01env_poplet0
(     tenv     ) = let
//
val+
@TR01ENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(tr01env_poplet0(tenv))
//
(* ****** ****** *)
//
#implfun
tr01env_pshlet0
(     tenv     ) = let
//
val+
@TR01ENV
(topmap, !stkmap) = tenv
//
in//let
//
stkmap_pshlet0(stkmap); $fold(tenv)
//
end (*let*)//end-of-(tr01env_pshlet0(tenv))
//
(* ****** ****** *)
//
#implfun
tr01env_pshloc1
(     tenv     ) = let
//
val+
@TR01ENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(tr01env_pshloc1(tenv))
//
(* ****** ****** *)
//
#implfun
tr01env_pshloc2
(     tenv     ) = let
//
val+
@TR01ENV
(topmap, !stkmap) = tenv
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(tenv)
end (*let*)
//
end (*let*)//end-of-(tr01env_pshloc2(tenv))
//
(* ****** ****** *)
//
#implfun
tr01env_locjoin
(     tenv     ) = let
//
val+
@TR01ENV
(topmap, !stkmap) = tenv
//
val mix = mix_fixty_fixty
//
in//let
//
$fold(tenv) where
{
val
(nerr,kxs) =
stkmap_poploc0(stkmap)
val
((*void*)) =
if
stkmap_nilq(stkmap)
then
topmap_insmix_kxs(topmap, kxs, mix)
else
stkmap_insmix_kxs(stkmap, kxs, mix) }
//
end (*let*)//end-of-(tr01env_pshloc2(tenv))
//
(* ****** ****** *)

#implfun
tr01env_search_opt
  (tenv, k0) = let
//
val+
TR01ENV
(topmap, stkmap) = tenv
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons _ => opt
| ~
optn_vt_nil( ) => topmap_search_opt(topmap,k0)
//
end (*let*)//end-of-[tr01env_search_opt(tenv,k0)]

(* ****** ****** *)
//
#implfun
tr01env_insert_any
  (tenv, k0, x0) = let
//
val+
@TR01ENV
(topmap, !stkmap) = tenv
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insert_any(topmap, k0, x0)//top
else
stkmap_insert_any(stkmap, k0, x0)//inner
//
end (*let*)//end-of(tr01env_insert_any(tenv,k0,x0))
//
(* ****** ****** *)
//
#implfun
tr01env_insmix_any
  (tenv, k0, x0) = let
//
val+
@TR01ENV
(topmap, !stkmap) = tenv
//
val mix = mix_fixty_fixty
//
in//let
//
if
stkmap_nilq(stkmap)
then
topmap_insmix_any(topmap, k0, x0, mix)//top
else
stkmap_insmix_any(stkmap, k0, x0, mix)//inner
//
end (*let*)//end-of(tr01env_insmix_any(tenv,k0,x0))
//
(* ****** ****** *)

endloc (*local*) // end of [ local(tr01env) ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_myenv0.dats] *)
