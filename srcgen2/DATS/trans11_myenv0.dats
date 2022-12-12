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
Wed 07 Dec 2022 11:35:48 PM EST
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
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)

local

#typedef key = sym_t

datavwtp
tr11env =
TR11ENV of
(topmap(g1mac), stkmap(g1mac))

#absimpl tr11env_vtbx = tr11env

(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
tr11env_make_nil() =
TR11ENV(topmap, stkmap) where
{
  val topmap = topmap_make_nil()
  val stkmap = stkmap_make_nil()
} (*where*) // end of [tr11env_make_nil()]

(* ****** ****** *)

#implfun
tr11env_free_top
  (  tr11  ) = topmap where
{
  val () =
  stkmap_free_nil(stkmap)} where
{
  val+
  ~TR11ENV(topmap, stkmap) = tr11
} (*where*)//end-of(tr11env_free_top(tr11))

(* ****** ****** *)
//
#implfun
tr11env_poplam0
(     tr11     ) = let
//
val+
@TR11ENV
(topmap, !stkmap) = tr11
//
in//let
//
let
val nerr =
stkmap_poplam0(stkmap) in $fold(tr11)
end (*let*)
//
end (*let*)//end-of-(tr11env_poplam0(tr11))
//
#implfun
tr11env_pshlam0
(     tr11     ) = let
val+
@TR11ENV
(topmap, !stkmap) = tr11
//
in//let
//
let
val nerr =
stkmap_pshlam0(stkmap) in $fold(tr11)
end (*let*)
//
end (*let*)//end-of-(tr11env_pshlam0(tr11))
//
(* ****** ****** *)
//
#implfun
tr11env_poplet0
(     tr11     ) = let
//
val+
@TR11ENV
(topmap, !stkmap) = tr11
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(tr11)
end (*let*)
//
end (*let*)//end-of-(tr11env_poplet0(tr11))
//
#implfun
tr11env_pshlet0
(     tr11     ) = let
//
val+
@TR11ENV
(topmap, !stkmap) = tr11
//
in//let
//
stkmap_pshlet0(stkmap); $fold(tr11)
//
end (*let*)//end-of-(tr11env_pshlet0(tr11))
//
(* ****** ****** *)
//
#implfun
tr11env_pshloc1
(     tr11     ) = let
//
val+
@TR11ENV
(topmap, !stkmap) = tr11
//
in//let
//
let
val nerr =
stkmap_pshloc1(stkmap) in $fold(tr11)
end (*let*)
//
end (*let*)//end-of-(tr11env_pshloc1(tr11))
//
#implfun
tr11env_pshloc2
(     tr11     ) = let
//
val+
@TR11ENV
(topmap, !stkmap) = tr11
//
in//let
//
let
val nerr =
stkmap_pshloc2(stkmap) in $fold(tr11)
end (*let*)
//
end (*let*)//end-of-(tr11env_pshloc2(tr11))
//
(* ****** ****** *)
//
#implfun
tr11env_locjoin
(     tr11     ) = let
//
val+
@TR11ENV
(topmap, !stkmap) = tr11
//
in//let
//
$fold(tr11) where
{
val
(nerr, kxs) =
stkmap_poploc0(stkmap)
val
((*void*)) =
if
stkmap_nilq(stkmap)
then topmap_insert_kxs(topmap, kxs)
else stkmap_insert_kxs(stkmap, kxs) }
//
end (*let*)//end-of-(tr11env_locjoin(tr11))
//
(* ****** ****** *)

#implfun
tr11env_search_opt
  (env0, k0) = let
//
val+
TR11ENV
(topmap, stkmap) = env0
//
val opt =
stkmap_search_opt(stkmap, k0)
//
in//let
//
case+ opt of
| !
optn_vt_cons
(   gmac   ) => opt
| ~
optn_vt_nil() =>
let
val opt =
topmap_search_opt(topmap,k0)
in//let
(
case+ opt of
| !
optn_vt_cons
(   gmac   ) => opt
| ~
optn_vt_nil() => the_gmacenv_pvsfind(k0)
)
end (*let*)//end-of-[optn_nil()]
//
end (*let*)//end-of-[tr11env_search_opt(env0,k0)]

(* ****** ****** *)
//
#implfun
tr11env_insert_any
  (tr11, k0, x0) = let
//
val+
@TR11ENV
(topmap, !stkmap) = tr11
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
end (*let*)//end-of(tr11env_insert_any(tr11,k0,x0))
//
(* ****** ****** *)

end (*local*) // end of [local(tr11env)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans11_myenv0.dats] *)
