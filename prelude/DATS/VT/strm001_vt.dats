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
#impltmp
< x0:vt >
strm_vt_forall0$f1un =
gseq_forall0$f1un<strm_vt(x0)><x0>
//
#impltmp
< x0:vt >
strm_vt_iforall0 =
gseq_iforall0<strm_vt(x0)><x0>
#impltmp
< x0:vt >
strm_vt_iforall0$f2un =
gseq_iforall0$f2un<strm_vt(x0)><x0>
*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_foritm0 =
gseq_foritm0<strm_vt(x0)><x0>
#impltmp
< x0:vt >
strm_vt_foritm0$f1un =
gseq_foritm0$f1un<strm_vt(x0)><x0>
//
(*
#impltmp
< x0:vt >
strm_vt_iforitm0 =
gseq_iforitm0<strm_vt(x0)><x0>
#impltmp
< x0:vt >
strm_vt_iforitm0$f2un =
gseq_iforitm0$f2un<strm_vt(x0)><x0>
*)
//
(* ****** ****** *)
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
forall$test0
< x0 >( x1 )
then auxmain(xs)
else (free(xs); false)))//end-of-[if]
}(*where*)//end-of-[strm_vt_forall0(xs)]
//
#impltmp
{ x0:vt }
gseq_forall0
<strm_vt(x0)><x0> = strm_vt_forall0<x0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_vt_forall0$f1un
  (xs, test) =
(
strm_vt_forall0
<  x0  >(  xs  )) where
{
#impltmp
forall$test0<x0>(x0) = test(x0)
}(*where*)//end-of-[strm_vt_forall0$f1un]
//
#impltmp
{ x0:vt }
gseq_forall0$f1un
<strm_vt(x0)><x0> = strm_vt_forall0$f1un<x0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_iforall0
  ( xs ) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0: nint
, xs
: strm_vt(x0)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil
  ((*void*)) => true
| ~
strmcon_vt_cons
  ( x1, xs ) =>
(
if
iforall$test0
<x0>( i0, x1 )
then auxmain(i0+1, xs)
else (free(xs); false)))//end-of-[if]
}(*where*)//end-of-[strm_vt_iforall0(xs)]
//
#impltmp
< x0:vt >
strm_vt_iforall0$f2un
  (xs, test) =
(
strm_vt_iforall0<x0>(xs))
where
{
#impltmp
iforall$test0<x0>(i0, x0) = test(i0, x0)
}
//
#impltmp
{ x0:vt }
gseq_iforall0
<strm_vt(x0)><x0> = strm_vt_iforall0<x0>
#impltmp
{ x0:vt }
gseq_iforall0$f2un
<strm_vt(x0)><x0> = strm_vt_iforall0$f2un<x0>
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
strmcon_vt_cons
(map$fopr0<x0><y0>(x1), auxmain(xs))
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
//
#impltmp
< x0:vt >
< y0:vt >
strm_vt_imap0
  ( xs ) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0: nint
, xs
: strm_vt(x0)
) : strm_vt(y0) = $llazy
(
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil(*void*)
| ~
strmcon_vt_cons(x1, xs) =>
let
val y1 =
imap$fopr0<x0><y0>(i0, x1)
in//let
strmcon_vt_cons(y1,auxmain(i0+1,xs))
end//let
)
}(*where*)//end-of-[strm_vt_imap0(xs)]
//
#impltmp
{ x0:vt }
{ y0:vt }
gseq_imap0_lstrm
<strm_vt(x0)><x0><y0> = strm_vt_imap0<x0><y0>(*void*)
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
[auxloop] needs to
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
filter$test1<x0>(x1)
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
#impltmp
< x0:vt >
strm_vt_filter0$f1un
  (xs, test) =
(
strm_vt_filter0<x0>(xs))
where
{
#impltmp filter$test1<x0>(x0) = test(x0)
}
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
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_ifilter0
  ( xs ) =
$llazy
(auxloop(0, !xs)) where
{
(*
HX-2024-07-13:
[auxloop] nees to
be tail-recursive!
*)
fnx
auxloop
( i0: nint
, xs
: strmcon_vt(x0)
) : strmcon_vt(x0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil(*void*)
| ~
strmcon_vt_cons(x1, xs) =>
let
val
test =
ifilter$test1<x0>(i0, x1)
in//let
if
test
then
strmcon_vt_cons
(x1, $llazy(auxloop(i0+1, !xs)))
else
(
g_free<x0>(x1); auxloop(i0+1, !xs)) end
)
}(*where*)//end-of-[strm_vt_ifilter0(xs)]
//
#impltmp
< x0:vt >
strm_vt_ifilter0$f2un
  (xs, test) =
(
strm_vt_ifilter0<x0>(xs))
where
{
#impltmp
ifilter$test1<x0>(i0, x0) = test(i0, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_listize0
  ( xs ) =
list_vt_reverse0<x0>
(strm_vt_rlistize0<x0>(xs))
//
#impltmp
< x0:vt >
strm_vt_rlistize0
  ( xs ) =
(
  loop(xs, r0)) where
{
//
val r0 = list_vt_nil()
//
fun loop
( xs: strm_vt(x0)
, r0: list_vt(x0)): list_vt(x0) =
(
case+ !xs of
| ~
strmcon_vt_nil
  ((*0*)) => (r0)
| ~
strmcon_vt_cons
  (x1,xs) =>loop(xs,list_vt_cons(x1,r0)))
}(*where*)//end-of-[strm_vt_rlistize0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
(*
HX-2025-01-12:
Sun Jan 12 09:30:32 AM EST 2025
*)
//
#impltmp
< x0:vt >
< r0:vt >
strm_vt_folditm0 =
gseq_folditm0<strm_vt(x0)><x0><r0>
#impltmp
< x0:vt >
< r0:vt >
strm_vt_ifolditm0 =
gseq_ifolditm0<strm_vt(x0)><x0><r0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
< r0:vt >
strm_vt_folditm0$f2un =
gseq_folditm0$f2un<strm_vt(x0)><x0><r0>
#impltmp
< x0:vt >
< r0:vt >
strm_vt_ifolditm0$f3un =
gseq_ifolditm0$f3un<strm_vt(x0)><x0><r0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_strm001_vt.dats] *)
