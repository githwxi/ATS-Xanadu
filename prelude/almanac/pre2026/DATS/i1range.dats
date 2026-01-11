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
Sun Jan 11 03:53:42 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/i1range.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_ptype
<i1range>() = pstrn"i1range"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
i1range_make_lbub
  (lb, ub) =
(
  i1range_encd@(lb, ub))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
i1range_lb$get
  (range) =
let
val (lb, ub) =
i1range_decd(range) in lb end
//
#impltmp
<(*tmp*)>
i1range_ub$get
  (range) =
let
val (lb, ub) =
i1range_decd(range) in ub end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<i1range>
( range ) =
(
pstrn"i1range(";
g_print<sint>(lb);pstrn",";
g_print<sint>(ub);pstrn")")
where
{
val
(lb, ub) = i1range_decd(range)
}(*where*)//end(g_print<i1range>)
//
(* ****** ****** *)
//
#impltmp
gasq_length
<i1range><si> = i1range_length<>
#impltmp
gseq_length
<i1range><si> = i1range_length<>
//
#impltmp
<(*tmp*)>
i1rangelength
(    range    ) =
(
if
(lb >= ub)
then (0) else (ub - lb))
where
{
val (lb, ub) = i1range_decd(range)
}(*where*)//endof(i1range_length<>(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gasq_forall
<i1range><sint> = i1range_forall<>
#impltmp
gseq_forall
<i1range><sint> = i1range_forall<>
//
#impltmp
<(*tmp*)>
i1range_forall
(    range    ) =
(
  auxloop(lb, ub)) where
{
//
val
(lb, ub) = i1range_decd(range)
//
fun
auxloop
( lb: si
, ub: si): bool =
if
(lb >= ub)
then (true) else
(
if
forall$test<si>(lb)
then
(
  auxloop(lb+1, ub)) else false)
//
}(*where*)//endof(i1range_forall<>(...))
//
(* ****** ****** *)
//
#impltmp
gseq_rforall
<i1range><sint> = i1range_rforall<>
#impltmp
gasq_rforall
<i1range><sint> = i1range_rforall<>
//
#impltmp
<(*tmp*)>
i1range_rforall
(    range    ) =
(
if
(lb < ub)
then
auxloop
(lb, ub-1) else true)
where
{
//
val
(lb, ub) =
(
  i1range_decd(range))
//
fun
auxloop
( lb: si
, ub: si): bool = // lb <= ub
(
if
rforall$test<si>(ub)
then
(
if
(lb < ub)
then
auxloop
(lb, ub-1) else true) else false)
//
}(*where*)//endof(i1range_rforall<>(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gseq_strmize
<i1range><sint> = i1range_strmize<>
//
#impltmp
<(*tmp*)>
i1range_strmize
(    range    ) =
(
  auxmain(lb, ub))
where
{
//
val
(lb, ub) = i1range_decd(range)
//
fun
auxmain
( lb: si
, ub: si)
: strm_vt(si) = $llazy
(
if lb >= ub
then strmcon_vt_nil() else
strmcon_vt_cons(lb, auxmain(lb+1, ub)))
//
}(*where*)//end-of-[i1range_strmize<>(...)]
//
(* ****** ****** *)
//
#impltmp
gseq_rstrmize
<i1range><sint> = i1range_rstrmize<>
//
#impltmp
<(*tmp*)>
i1range_rstrmize
(    range    ) =
(
  auxmain(lb, ub))
where
{
//
val
(lb, ub) = i1range_decd(range)
//
fun
auxmain
( lb: si
, ub: si)
: strm_vt(si) = $llazy
(
if ub <= lb
then strmcon_vt_nil() else
strmcon_vt_cons(ub-1, auxmain(lb, ub-1)))
//
}(*where*)//end-of-[i1range_rstrmize<>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
list_make_i1range
  ( range ) =
list_vt2t(
list_vt_make_i1range<>(range))
//
#impltmp
<(*tmp*)>
list_vt_make_i1range
  ( range ) =
(
strm_vt_listize0(
  strm_vt_make_i1range(range)))
//
#impltmp
<(*tmp*)>
strm_vt_make_i1range
  ( range ) = i1range_strmize<>(range)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_pre2026_SATS_i1range.dats] *)
(***********************************************************************)
