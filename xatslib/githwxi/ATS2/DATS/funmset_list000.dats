(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
(*
Author: Hongwei Xi
Sat Apr  4 01:17:40 AM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funmset.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#absimpl
fmset_tbox(itm:t0) = list(itm)
// end of [fmset_tbox]
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*00*)>
funmset_nil() = list_nil()
#impltmp
<(*00*)>
funmset_make_nil() = list_nil()
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_size
  (* set *) = list_length<itm>(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_strmize
  (* set *) = list_strmize<itm>(*0*)
//
#impltmp
<itm:t0>
funmset_set$strmize
  (  set  ) =
(
strm_vt_dedup0<itm>(
  funmset_strmize<itm>(set)))
where
{
#impltmp
dedup$equal
<   itm   > = equal_itm_itm<itm>
}(*where*)//endof(funmset_set$strmize)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_memberq
  ( set, x0 ) =
(
  list_memberq<itm>(set, x0))
where
{
#impltmp
g_equal<itm> = equal_itm_itm<itm>
}(*where*)//endof(funmset_memberq(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_insert$any
  ( set, x0 ) = list_cons( x0, set )
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_remove$opt
  ( set, x0 ) =
(
loop(
set, list_vt_nil())
) where
{
fnx loop
( xs: list(itm)
, ys: list_vt(itm))
: (list(itm), bool) =
(
case+ xs of
|
list_nil
( (*0*) ) =>
(
  set, false)
|
list_cons
( x1, xs ) =>
if // if
equal_itm_itm
<    itm    >(x0, x1)
then//then
(set, (true)) where
{
val set =
list_prependrx0<itm>(xs, ys)}
else//else
loop(xs, list_vt_cons(x1, ys))
)(*case+*)//endof(loop(xs,ys))
}(*where*)//endof[funmset_remove$opt(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_getout$opt
  ( set, x0 ) =
(
loop(
set, list_vt_nil())
) where
{
fnx loop
( xs: list(itm)
, ys: list_vt(itm))
: (list(itm), optn_vt(itm)) =
(
case+ xs of
|
list_nil
( (*0*) ) =>
(
set, optn_vt_nil())
|
list_cons
( x1, xs ) =>
if // if
equal_itm_itm
<    itm    >(x0, x1)
then//then
(
set, optn_vt_cons(x1)) where
{
val set =
list_prependrx0<itm>(xs, ys)}
else//else
loop(xs, list_vt_cons(x1, ys))
)(*case+*)//endof(loop(xs,ys))
}(*where*)//endof[funmset_getout$opt(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmset_list000.dats] *)
(***********************************************************************)
