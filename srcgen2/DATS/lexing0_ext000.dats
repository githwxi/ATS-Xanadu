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
Fri Jan 16 03:41:19 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<obj:vt>
gobj_lexing_tnode'f0_DQUOTE
(  buf: !obj , ci0: sint  ): tnode
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<obj:vt>
gobj_lexing_tnode'f0_DQUOTE
  (buf, ci0) =
let
//
fun
auxloop
( buf: !obj)
: strm_vt(sint) = $llazy
let
//
val ci0 =
gobj_lexing$getc1<obj>(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
case+ 0 of
|
_ when cc0 = '\"' =>
(
  strmcon_vt_sing(ci0))
|
_ when cc0 = '\\' =>
(
  strmcon_vt_cons
  (ci0, auxloop(buf))) where
{
  val
  ci1 = gobj_lexing$getc1(buf) }
//
| _ (* otherwise *) =>
(
if // if
(ci0 < 0)
then
strmcon_vt_sing(ci0)
else
strmcon_vt_cons(ci0, auxloop(buf)))
//
end(*let*)//end-of-[auxloop(buf:!buf)]
//
in//let
//
let
//
val ci0 =
(
strm_vt_foldl0
<  x0  ><  r0  >
(auxloop(buf), 0)) where
{
#typedef x0 = sint
#typedef r0 = sint
#impltmp
foldl$fopr0<x0><r0>(r0, x0) = ( x0 ) }
//
in//let
//
let
//
val ccs =
gobj_lexing$fclst(buf)
val len = length1(ccs)
val str = strn_make_llist(ccs)
//
in//let
(
if (ci0 >= 0)
  then T_STRN1_clsd(str, len)
  else T_STRN2_ncls(str, len)) end//let
//
end//let
//
end(*let*)//end-of-[gobj_lexing_tnode'f0_DQUOTE(buf,ci0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_lexing0_ext000.dats] *)
(***********************************************************************)
