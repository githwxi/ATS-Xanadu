(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu 11 Jul 2024 01:11:20 PM EDT
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
#impltmp
g_0<strn>
((*void*)) = ("")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strn_lt<> = g_lt<strn>
#impltmp
strn_gt<> = g_gt<strn>
#impltmp
strn_eq<> = g_eq<strn>
//
#impltmp
strn_lte<> = g_lte<strn>
#impltmp
strn_gte<> = g_gte<strn>
#impltmp
strn_neq<> = g_neq<strn>
//
(* ****** ****** *)
//
#impltmp
g_cmp<strn> = strn_cmp<>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This is in [gdbg000.dats]:
#impltmp
g_ptype
< strn >
( (*void*) ) = pstrn("strn")
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<strn> = strn_print<>
//
(*
#impltmp
g_print
<strn>(cs) =
(
strn_print("\"");
strn_print(cs);strn_print("\""))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-10:
This one should definitely
be replaced later!!!
Sat 10 Aug 2024 08:49:55 PM EDT
*)
#impltmp
<(*tmp*)>
strn_cmp
(xs, ys) =
let
#typedef xs = strn
#typedef x0 = cgtz
in//let
gseq_cmp<xs><x0>(xs, ys) end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gasz_length
<strn><char> = strn_length<>(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strn_gmake
<list(cgtz)> = strn_make_list<>
//
#impltmp
strn_gmake0
<list_vt(cgtz)> = strn_make0_llist<>
#impltmp
strn_gmake1
<list_vt(cgtz)> = strn_make1_llist<>
//
#impltmp
strn_gmake0
<strm_vt(cgtz)> = strn_make0_lstrm<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_add
< strn > =
g_append<strn>(*void*)
#impltmp
g_append
< strn > = strn_append<>(*void*)
//
#impltmp
<(*tmp*)>
strn_append
  (xs, ys) =
strn_fmake_fwork<>
(
lam(work) =>
(foritm(xs, work); foritm(ys, work)))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_reverse
  ( xs ) =
strn_fmake_fwork<>
(lam(work) => rforitm(xs, work))
#impltmp
<(*tmp*)>
strn_rappend
  (xs, ys) =
strn_fmake_fwork<>
(
lam(work) =>
(rforitm(xs, work); foritm(ys, work)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
$UN.gasz_get$at$raw
< strn >< cgtz >(cs, i0) =
$UN.strn_get$at$raw<>(cs, i0)
//
#impltmp
$UN.gasz_lget$at$raw
< strn >< cgtz >(cs, i0) =
let
val c0 =
$UN.strn_get$at$raw<>(cs, i0)
prval pf = owed_t0_make{cgtz}() in (pf|c0)
end//let//end($UN.gasz_lget$at$raw<strn><cgtz>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_slice
(cs, i0, j0) =
(
strn_make_nfun<>
(
j0-i0,
lam(k0) =>
$UN.strn_get$at$raw<>(cs,i0+k0)
)
)//end-of-[strn_slice(cs,i0,j0)]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_prefix
  (cs, i0) =
(
  strn_slice<>(cs, 0, i0))
//
#impltmp
<(*tmp*)>
strn_suffix
  (cs, i0) =
let
val n0 =
strn_length<>(cs) in//let
(
  strn_slice<>(cs, i0, n0)) end
//let//end-of-[strn_suffix(cs,i0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 08:32:31 AM EDT
*)
//
#impltmp
<(*tmp*)>
strn_make_ncpy
  (n0, c0) =
strn_fmake_fwork<>
(
lam(work) =>
foritm(n0, //HX:it may not be
  lam(i0) => work(c0)))//efficient!
//
#impltmp
<(*tmp*)>
strn_make_nfun
  (n0, f0) =
strn_fmake_fwork<>
(
lam(work) =>
foritm(n0, //HX:it may not be
  lam(i0) => work(f0(i0))))//efficient!
//
(* ****** ****** *)
//
(*
HX-2024-08-16:
Fri 16 Aug 2024 05:02:22 PM EDT
*)
//
#impltmp
<(*tmp*)>
strn_make_list
  ( cs ) =
(
strn_make_gseq<list(cgtz)>(cs))
//
#impltmp
< cs:t0 >
strn_make_gseq
  ( cs ) =
let
#typedef c0=cgtz
#impltmp
map$fopr<c0><c0>(c0) = c0
in//let
(
  strn_map$make_gseq<cs><c0>(cs))
end//let//end-of-[strn_make_gseq(cs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
strn_map$make_gseq
  ( xs ) =
let
#typedef c0=cgtz
in//let
strn_fmake_fwork<> 
(
lam(work) => // HX: inefficent?
gseq_foritm$f1un<xs><x0>
( xs
, lam(c0)=>work(map$fopr<x0><c0>(c0))))
end//let//end-of-[strn_map$make_gseq(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
$UN.strn_get$at$raw
  (cs, i0) =
(
XATS000_strn_get$at$raw
  (cs, i0)) where
{
#extern
fun
XATS000_strn_get$at$raw
  (cs: strn, i0: nint): cgtz = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
$UN.strn_fset$at$raw
  (cs, i0, c0) =
strn_fmake_fwork<>
(
lam(work) =>
strn_iforitm$f2un(cs,
lam(i1,c1) =>
(if (i0 = i1) then work(c0) else work(c1))))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_make0_llist
  ( cs ) =
let
//
#vwtpdef
env = list_vt(cgtz)
//
fun fwork
( cs: env
, work: cgtz->void) =
(
case+ cs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(c1, cs) =>
(work(c1); fwork(cs, work)))
//
in//let
//
(
strn_fmake0_env$fwork<env>(cs, fwork))
end(*let*)//end-of-[strn_make0_llist(cs)]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_make1_llist
  ( cs ) =
let
//
#vwtpdef
env = list_vt(cgtz)
//
fun fwork
( cs: !env
, work: cgtz->void) =
(
case+ cs of
| !
list_vt_nil() => ()
| !
list_vt_cons(c1, cs) =>
(work(c1); fwork(cs, work)))
//
in//let
//
(
strn_fmake1_env$fwork<env>(cs, fwork))
end(*let*)//end-of-[strn_make1_llist(cs)]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_make0_lstrm
  ( cs ) =
let
//
#vwtpdef
env = strm_vt(cgtz)
//
fun fwork
( cs: env
, work: cgtz->void) =
(
case+ !cs of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(c1, cs) =>
(work(c1); fwork(cs, work)))
//
in//let
//
(
strn_fmake0_env$fwork<env>(cs, fwork))
end(*let*)//end-of-[strn_make0_lstrm(cs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_strn000.dats] *)
