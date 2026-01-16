(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Jan 15 10:31:07 AM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../SATS/VT/trec000_vt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<
state:vt>
g_state$trans0
  ( st0 ) =
let
//
val sts =
(
  auxloop(st0))
//
#impltmp
search$test1<state> =
state$trans$test1<state>
//
in//let
strx_vt_search0<state>(sts)
end where // end-of-(let...)
{
//
fun
auxloop
( st0
: state)
: strx_vt(state) = $llazy
let
val st1 =
(
state$trans$fupdt1<state>(st0))
in//let
(
  strxcon_vt_cons(st0, auxloop(st1)))
end//let//end-of-[auxloop(st0)]
//
}(*where*)//end-of-[g_state$trans0<state>(st0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
<
state:vt>
g_state$trans1x
  ( st0 ) =
let
//
val sts =
(
  auxloop(st0))
//
#impltmp
search$test1
< bool >( btf ) = (btf)
//
in//let
g_void(
strx_vt_search0<bool>(sts))
end where // end-of-(let...)
{
//
fun
auxloop
( st0
: &state)
: strx_vt(bool) = $llazy
let
//
val () =
(
state$trans$updt1x<state>(st0))
val btf =
(
state$trans$test1x<state>(st0))
//
in//let
(
  strxcon_vt_cons(btf, auxloop(st0)))
end//let//end-of-[auxloop(st0)]
//
}(*where*)//end-of-[g_state$trans1x<state>(st0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_pre2026_DATS_VT_trec000_vt.dats] *)
(***********************************************************************)
