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
  (  tenv  ) = topmap where
{
  val () =
  stkmap_free_nil(stkmap)} where
{
  val+
  ~TR11ENV(topmap, stkmap) = tenv
} (*where*)//end-of(tr11env_free_top(tenv))

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

end (*local*) // end of [local(tr11env)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans11_myenv0.dats] *)
