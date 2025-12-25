(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Dec 25 10:43:54 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This one is also
implemented in [gdbg000.dats]:
*)
#impltmp
{ t0:t0 }
g_ptcon
<lsrt(t0)>
( (*void*) ) =
(
pstrn("lsrt"))
#impltmp
{ t0:t0 }
g_ptype
<lsrt(t0)>
( (*void*) ) =
(
pstrn("lsrt(");
g_ptype<t0>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
lsrt_nil
{a:t0}((*0*)) =
(
UN_lsrt_encd
(list_nil<a>(*0*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
lsrt_nilq
  (  xs  ) =
(
  list_nilq(lsrt_decd(xs)))
#impltmp
<(*tmp*)>
lsrt_consq
  (  xs  ) =
(
  list_consq(lsrt_decd(xs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
lsrt_make_1val
  (  x0  ) =
(
UN_lsrt_encd(
list_make_1val<a>(x0)))
//
#impltmp
< a: t0 >
lsrt_make_2val
  ( x1, x2 ) =
(
if
g_lte<a>(x1, x2)
then
UN_lsrt_encd(
list_make_2val<a>(x1, x2))
else
UN_lsrt_encd(
list_make_2val<a>(x2, x1)))
//
#impltmp
< a: t0 >
lsrt_make_3val
( x1, x2, x3 ) =
(
if // if1
g_lte<a>(x1, x2)
then // 1
(
if // if2
g_lte<a>(x2, x3)
then // 2
UN_lsrt_encd(
list_make_3val<a>(x1, x2, x3))
else // 2
(
if // if3
g_lte<a>(x1, x3)
then // 3
UN_lsrt_encd(
list_make_3val<a>(x1, x3, x2))
else // 3
UN_lsrt_encd(
list_make_3val<a>(x3, x1, x2))))
else // 1
(
if // if2
g_lte<a>(x1, x3)
then // 2
UN_lsrt_encd(
list_make_3val<a>(x2, x1, x3))
else // 2
(
if // if3
g_lte<a>(x2, x3)
then // 3
UN_lsrt_encd(
list_make_3val<a>(x2, x3, x1))
else // 3
UN_lsrt_encd(
list_make_3val<a>(x3, x2, x1)))))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
lsrt_head
  (  xs  ) =
(
  list_head<a>(lsrt_decd(xs)))
#impltmp
< a: t0 >
lsrt_tail
  (  xs  ) =
(
UN_lsrt_encd(
  list_tail<a>(lsrt_decd(xs))))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
lsrt_length
  (  xs  ) =
(
  list_length<a>(lsrt_decd(xs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_forall
<lsrt(x0)><x0>
  (  xs  ) =
(
  list_forall<x0>(lsrt_decd(xs)))
#impltmp
{ x0:t0 }
gseq_iforall
<lsrt(x0)><x0>
  (  xs  ) =
(
  list_iforall<x0>(lsrt_decd(xs)))
//
#impltmp
{ x0:t0 }
gseq_strmize
<lsrt(x0)><x0>
  (  xs  ) =
(
  list_strmize<x0>(lsrt_decd(xs)))
#impltmp
{ x0:t0 }
gseq_listize
<lsrt(x0)><x0>
  (  xs  ) =
(
  list_listize<x0>(lsrt_decd(xs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_sep
<lsrt(x0)><x0>() = ","
#impltmp
{ x0:t0 }
gseq_end
<lsrt(x0)><x0>() = ")"
#impltmp
{ x0:t0 }
gseq_beg
<lsrt(x0)><x0>() = "lsrt("
//
#impltmp
{ x0:t0 }
g_print
<lsrt(x0)>(xs) =
(
gseq_print<lsrt(x0)><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-15:
Thu Dec 25 01:32:21 PM EST 2025
*)
//
#impltmp
< x0:t0 >
lsrt_insert
( xs , x0 ) =
let
//
val xs =
(
  lsrt_decd(xs))
//
in//let
UN_lsrt_encd
(
loop
(xs, list_vt_nil(*0*)))
end where // end-of-(let)
{
//
#typedef xs = list(x0)
#vwtpdef rs = list_vt(x0)
//
fun
rappend0x
( rs: rs
, xs: xs): list(x0) =
(
list_vt_folditm0
<x0><xs>(rs, xs)) where
{
//
#impltmp
folditm$fopr0
<x0><xs>(xs, x0) =
(
  list_cons<x0>(x0, xs)) }
//
fnx
loop
( xs: xs
, rs: rs): list(x0) =
(
case+ xs of
|
list_nil
( (*0*) ) =>
(
rappend0x(rs, list_sing(x0)))
|
list_cons
( x1, ys ) =>
if
(
g_lte<x0>(x0, x1))
then
(
rappend0x
(rs, list_cons(x0, xs)))
else
(
loop(ys, list_vt_cons(x1, rs))))//if
//
}(*where*)//end-of-[lsrt_insert(xs, x0))]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_lsrt000.dats] *)
(***********************************************************************)
