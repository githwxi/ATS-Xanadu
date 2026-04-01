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
Wed Apr  1 10:49:34 AM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funmset.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
equal_itm_itm
(x1, x2) = g_equal<itm>(x1, x2)
//
#impltmp
<itm:t0>
compare_itm_itm
( x1, x2 ) = g_cmp<itm>( x1, x2 )
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmset_nil
{itm:t0}((*nil*)) =
(
funmset_make_nil<>{itm}((*nil*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
funmset_nilq
{itm:t0}(set) =
(
not(funmset_consq<>{itm}(set)))
//
#impltmp
<(*tmp*)>
funmset_consq
{itm:t0}(set) =
(
  not(funmset_nilq<>{itm}(set)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-03-29:
This one is O(n) time!!!
*)
#impltmp
<itm:t0>
funmset_size
(     set     ) =
(
strm_vt_length0(
  funmset_strmize<itm>(set)))
#impltmp
<itm:t0>
funmset_set$size
(     set     ) =
(
strm_vt_length0(
  funmset_set$strmize<itm>(set)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{itm:t0}
g_print
<fmset(itm)>
(*  set  *) =
funmset_print<itm>(*set*)
//
#impltmp
<itm:t0>
funmset_print
(   set   ) =
(
strm_vt_print0<x0>(xs))
where
{
//
#typedef x0 = itm
#vwtpdef xs = strm_vt(x0)
//
#impltmp
gseq$beg<xs><x0>() = "funmset("
//
val xs =
(
funmset_strmize
<     itm     >(     set     ))
//
}(*where*)//end(funmset_print<itm>(set))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_set$strmize(set) =
strm_vt_dedup0(funmset_strmize<itm>(set))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_remove$any
  ( set, x0)  =
let
val (set, opt) =
funmset_remove$opt<itm>(set, x0) in set end
//
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_remove$old
  ( set, x0)  =
let
val-(set, (true)) =
funmset_remove$opt<itm>(set, x0) in set end
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmset.dats] *)
(***********************************************************************)
