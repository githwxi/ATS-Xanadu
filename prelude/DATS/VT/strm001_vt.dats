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
//
(*
Author: Hongwei Xi
(*
Mon 08 Jul 2024 01:04:34 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:vt >
strm_vt_forall0 =
gseq_forall0<strm_vt(x0)><x0>
*)
#impltmp
< x0:vt >
strm_vt_foritm0 =
gseq_foritm0<strm_vt(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_forall0
  ( xs ) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: strm_vt(x0)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() => true
| ~
strmcon_vt_cons(x1, xs) =>
(
if
forall$test0<x0>(x1)
then
auxmain(xs) else (free(xs); false)))
}(*where*)//end-of-[strm_vt_forall0(xs)]
//
#impltmp
{ x0:vt }
gseq_forall0
<strm_vt(x0)><x0> = strm_vt_forall0<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
(*
HX-2024-07-10:
Making use of the most general one
(unless you are sure of a specific one)
*)
#impltmp
< x0:vt >
< y0:vt >
strm_vt_map0 =
gseq_map0_ares<strm_vt(x0)><x0><strm_vt(y0)>
*)
//
#impltmp
< x0:vt >
< y0:vt >
strm_vt_map0
  ( xs ) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: strm_vt(x0)
) : strm_vt(y0) = $llazy
(
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil(*void*)
| ~
strmcon_vt_cons(x1, xs) =>
strmcon_vt_cons(map$fopr0<x0><y0>(x1), auxmain(xs))
)
}(*where*)//end-of-[strm_vt_map0(xs)]
//
(*
HX-2024-07-10:
Implementing the most specific one.
HX-2024-07-13:
This one is already added as the default!
It is not harm to keep it here as a reference.
*)
#impltmp
{ x0:vt }
{ y0:vt }
gseq_map0_lstrm
<strm_vt(x0)><x0><y0> = strm_vt_map0<x0><y0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_filter0
  ( xs ) =
$llazy
(auxloop(!xs)) where
{
(*
HX-2024-07-13:
[auxloop] nees to
be tail-recursive!
*)
fnx
auxloop
( cs
: strmcon_vt(x0)
) : strmcon_vt(x0) =
(
case+ cs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil(*void*)
| ~
strmcon_vt_cons(x1, xs) =>
let
val
test =
filter$test0<x0>(x1)
in//let
if
test
then
strmcon_vt_cons
(x1, $llazy(auxloop(!xs)))
else
(g_free<x0>(x1); auxloop(!xs)) end
)
}(*where*)//end-of-[strm_vt_filter0(xs)]
//
(*
HX-2024-07-10:
Implementing the most specific one.
HX-2024-07-13:
This one is already added as the default!
It is not harm to keep it here as a reference.
*)
#impltmp
{ x0:vt }
gseq_filter0_lstrm
<strm_vt(x0)><x0> = strm_vt_filter0<x0>(*void*)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_strm001_vt.dats] *)
