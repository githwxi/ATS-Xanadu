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
Tue Mar 31 12:13:33 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funset.sats"
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
{itm:t0}
g_print
<fset(itm)>
(*  set  *) =
funset_print<itm>(*set*)
//
#impltmp
<itm:t0>
funset_print
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
gseq$beg<xs><x0>() = "funset("
//
val xs =
(
funset_strmize
<     itm     >(     set     ))
//
}(*where*)//end(funset_print<itm>(set))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{itm:t0}
gseq_strmize
<fset(itm)><itm> = funset_strmize<itm>
//
#impltmp
<itm:t0>
funset_forall = gseq_forall<fset(itm)><itm>
#impltmp
<itm:t0>
funset_foritm = gseq_foritm<fset(itm)><itm>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_union(xs1, xs2) =
(
gseq_folditm
<xs><x0><r0>(xs2, xs1))
where
{
//
#typedef x0 = itm
#typedef xs = fset(itm)
#typedef r0 = fset(itm)
//
#impltmp
folditm$fopr
< x0 >< r0 >
(  r0, x0  ) = funset_insert$any<x0>(r0, x0)
//
}(*where*)//end-of-[funset_union<itm>(xs1,xs2):fset]
//
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_inter(xs1, xs2) =
(
gseq_folditm
<xs><x0><r0>(xs2, res))
where
{
//
#typedef x0 = itm
#typedef xs = fset(itm)
#typedef r0 = fset(itm)
//
val res = funset_nil<>()
//
#impltmp
folditm$fopr
< x0 >< r0 >
(  r0, x0  ) =
if // if
funset_memberq<x0>(xs1, x0)
then funset_insert$any<x0>(r0, x0) else (r0)
//
}(*where*)//end-of-[funset_inter<itm>(xs1,xs2):fset]
//
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_diffr(xs1, xs2) =
(
gseq_folditm
<xs><x0><r0>(xs2, xs1))
where
{
//
#typedef x0 = itm
#typedef xs = fset(itm)
#typedef r0 = fset(itm)
//
#impltmp
folditm$fopr
< x0 >< r0 >
(  r0, x0  ) = funset_remove$any<x0>(r0, x0)
//
}(*where*)//end-of-[funset_diffr<itm>(xs1,xs2):fset]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_remove$any
  ( set, x0)  =
let
val (set, opt) =
funset_remove$opt<itm>(set, x0) in set end
//
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_remove$old
  ( set, x0)  =
let
val-(set, (true)) =
funset_remove$opt<itm>(set, x0) in set end
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
<itm:t0>
funset_insert$any
  ( set, x0)  =
(
if // if
funset_memberq<itm>(set, x0)
then set else funset_insert$new<itm>(set, x0))
*)
//
#impltmp
<itm:t0>
funset_insert$any
  ( set, x0 )  =
  (   set   ) where
{ val//val
  (set, opt) = funset_insert$opt<itm>(set, x0)
}(*where*)//endof(funset_insert$any<itm>(set,x0))
//
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_insert$new
  ( set, x0 )  =
  (   set   ) where
{ val-//val
  (set, false) = funset_insert$opt<itm>(set, x0)
}(*where*)//endof(funset_insert$new<itm>(set,x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funset.dats] *)
(***********************************************************************)
