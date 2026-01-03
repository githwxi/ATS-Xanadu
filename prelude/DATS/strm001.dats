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
Sun Dec 21 01:27:59 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_foritm =
gseq_foritm<strm(x0)><x0>
#impltmp
< x0:t0 >
strm_foritm$f1un =
gseq_foritm$f1un<strm(x0)><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_forall
  ( xs ) =
(
  auxmain(xs)) where
{
fun
auxmain
(xs: strm(x0)): bool =
(
case+ !xs of
|strmcon_nil
( (*void*) ) => (true)
|strmcon_cons
(  x1, xs  ) =>
(
if
forall$test
< x0 >( x1 )
then auxmain(xs) else false)
)(*case+*)//end-of-[auxmain(xs)]
}(*where*)//end-of-[strm_forall(xs)]
//
#impltmp
{ x0:t0 }
gseq_forall
<strm(x0)><x0> = strm_forall<x0>(*0*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_forall$f1un
  (xs, test) =
(
strm_forall
<  x0  >(  xs  )) where
{
#impltmp
forall$test<x0> = test(*x0*)
}(*where*)//end-of-[strm_forall$f1un]
//
#impltmp
{ x0:t0 }
gseq_forall$f1un
<strm(x0)><x0> = strm_forall$f1un<x0>(*0*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_iforall
  ( xs ) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0: sint
, xs: strm(x0)): bool =
(
case+ !xs of
|strmcon_nil
( (*void*) ) => (true)
|strmcon_cons
(  x1, xs  ) =>
(
if
iforall$test
< x0 >(i0, x1)
then auxmain(i0+1, xs) else false)
)(*case+*)//end-of-[auxmain(i0, xs)]
}(*where*)//end-of-[strm_iforall(xs)]
//
#impltmp
{ x0:t0 }
gseq_iforall
<strm(x0)><x0> = strm_iforall<x0>(*0*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_iforall$f2un
  (xs, test) =
(
strm_iforall
<  x0  >(  xs  )) where
{
#impltmp
iforall$test<x0> = test(*ni,x0*)
}(*where*)//end-of-[strm_iforall$f2un]
//
#impltmp
{ x0:t0 }
gseq_iforall$f2un
<strm(x0)><x0> = strm_iforall$f2un<x0>(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-21:
Sun Dec 21 09:32:13 AM EST 2025
*)
//
#impltmp
< x0:t0 >
< y0:t0 >
strm_map(xs) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: strm(x0)
) : strm(y0) = $lazy
(
case+ !xs of
| ~
strmcon_nil() =>
strmcon_nil(*void*)
| ~
strmcon_cons(x1, xs) =>
strmcon_cons(
map$fopr<x0><y0>(x1), auxmain(xs))
)
}(*where*)//end-of-[strm_map( xs )]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:vt >
strm_map_vt
  (  xs  ) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: strm(x0)
) : strm_vt(y0) = $llazy
(
case+ !xs of
| ~
strmcon_nil() =>
strmcon_vt_nil(*void*)
| ~
strmcon_cons(x1, xs) =>
strmcon_vt_cons(
map$fopr<x0><y0>(x1), auxmain(xs))
)
}(*where*)//end-of-[strm_map_vt( xs )]
//
#impltmp
{ x0:t0 }
{ y0:vt }
gseq_map_lstrm
<strm(x0)><x0><y0> = strm_map_vt<x0><y0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
strm_imap(xs) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0
: nint
, xs
: strm(x0)
) : strm(y0) = $lazy
(
case+ !xs of
| ~
strmcon_nil() =>
strmcon_nil(*void*)
| ~
strmcon_cons(x1, xs) =>
let
val y1 =
imap$fopr<x0><y0>(i0, x1)
in//let
strmcon_cons(y1,auxmain(i0+1,xs))
end//let//end-of-[strmcon_cons()]
)
}(*where*)//end-of-[strm_imap( xs )]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
strm_imap_vt
  (  xs  ) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0
: nint
, xs
: strm(x0)
) : strm_vt(y0) = $llazy
(
case+ !xs of
| ~
strmcon_nil() =>
strmcon_vt_nil(*void*)
| ~
strmcon_cons(x1, xs) =>
let
val y1 =
imap$fopr<x0><y0>(i0, x1)
in//let
strmcon_vt_cons(y1,auxmain(i0+1,xs))
end//let//end-of-[strmcon_cons(x1,xs)]
)
}(*where*)//end-of-[strm_imap_vt( xs )]
//
#impltmp
{ x0:t0 }
{ y0:vt }
gseq_imap_lstrm
<strm(x0)><x0><y0> = strm_imap_vt<x0><y0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-21:
Sun Dec 21 10:16:58 AM EST 2025
*)
//
#impltmp
< x0:t0 >
strm_filter
  (  xs  ) =
$lazy(
auxloop
(
strm_eval<x0>(xs)))
where
{
fnx
auxloop
( cs
: strmcon(x0)
) : strmcon(x0) =
(
case+ cs of
|
strmcon_nil
( (*void*) ) =>
(
  strmcon_nil(*void*))
|
strmcon_cons
(  x1, xs  ) =>
let
//
val
test =
filter$test<x0>(x1)
//
in//let
(
if
test
then
strmcon_cons
(
x1,
$lazy
(auxloop(!xs))) else auxloop(!xs))
end//let//end-of(strmcon_cons(...))
)(*case+*)//end-of-[auxloop(  cs  )]
}(*where*)//end-of-[strm_filter(xs)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_filter$f1un
  (xs, test) =
(
strm_filter<x0>(xs))
where
{
#impltmp
filter$test<x0> = test(*x0*)
}(*where*)//end-of-[strm_filter$f1un]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_filter_vt
  (  xs  ) =
$llazy(
auxloop
(
strm_eval<x0>(xs)))
where
{
fnx
auxloop
( cs
: strmcon(x0)
) : strmcon_vt(x0) =
(
case+ cs of
|
strmcon_nil
( (*void*) ) =>
(
strmcon_vt_nil(*void*))
|
strmcon_cons
(  x1, xs  ) =>
let
//
val
test =
filter$test<x0>(x1)
//
in//let
if
test
then
strmcon_vt_cons
(
x1,
$llazy
(auxloop(!xs)))
else auxloop(!xs) end//let
)(*case+*)//end-of-[auxloop(cs)]
}(*where*)//end-of-[strm_filter(xs)]
//
#impltmp
{ x0:t0 }
gseq_filter_lstrm
<strm(x0)><x0> = strm_filter_vt<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_ifilter
  (  xs  ) =
$lazy(
auxloop(0,
strm_eval<x0>(xs)))
where
{
fnx
auxloop
( i0
: nint
, xs
: strmcon(x0)
) : strmcon(x0) =
(
case+ xs of
| ~
strmcon_nil() =>
(
  strmcon_nil(*void*))
| ~
strmcon_cons(x1, xs) =>
let
val
test =
ifilter$test<x0>(i0, x1)
in//let
if
test
then
strmcon_cons
(
x1,
$lazy
(auxloop(i0+1, !xs)))
else auxloop(i0+1, !xs) end//let
)(*case+*)//end-of-[auxloop(i0,cs)]
}(*where*)//end-of-[strm_ifilter(xs)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_ifilter$f2un
  (xs, test) =
(
strm_ifilter<x0>(xs))
where
{
#impltmp
ifilter$test<x0> = test(*ni,x0*)
}(*where*)//end-of-[strm_ifilter$f2un]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_ifilter_vt
  (  xs  ) =
$llazy(
auxloop(0,
strm_eval<x0>(xs)))
where
{
fnx
auxloop
( i0
: nint
, xs
: strmcon(x0)
) : strmcon_vt(x0) =
(
case+ xs of
| ~
strmcon_nil() =>
(
strmcon_vt_nil(*void*))
| ~
strmcon_cons(x1, xs) =>
let
val
test =
ifilter$test<x0>(i0, x1)
in//let
if
test
then
strmcon_vt_cons
(
x1,
$llazy
(auxloop(i0+1, !xs)))
else auxloop(i0+1, !xs) end//let
)(*case+*)//end-of-[auxloop(i0,cs)]
}(*where*)//end-of-[strm_ifilter_vt(xs)]
//
(*
HX-2025-12-21:
This one is not yet declared:
#impltmp
{ x0:t0 }
gseq_ifilter_lstrm
<strm(x0)><x0> = strm_ifilter_vt<x0>(*void*)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_strmize
  (  xs  ) =
(
  auxmain(xs)) where
{
fun
auxmain
(xs: strm(x0)): strm_vt(x0) =
$llazy(
//
case+ !xs of
|
strmcon_nil
(  (*0*)  ) =>
(
  strmcon_vt_nil(*void*))
|
strmcon_cons
(  x1, xs  ) =>
(
  strmcon_vt_cons(x1, auxmain(xs))))
}(*where*)//end-of-[strm_strmize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-21:
Sun Dec 21 10:36:35 AM EST 2025
*)
//
#impltmp
< x0:t0 >
strm_listize
  (  xs  ) =
let
val xs =
strm_rlistize<x0>(xs)
in//let
list_vt_reverse0<x0>(xs) end
//
#impltmp
< x0:t0 >
strm_rlistize
  (  xs  ) =
(
  loop(xs, rs)) where
{
//
val rs = list_vt_nil()
//
fun loop
( xs: strm(x0)
, rs: list_vt(x0)): list_vt(x0) =
(
case+ !xs of
|
strmcon_nil
(  (*0*)  ) => (rs)
|
strmcon_cons
(  x1, xs  ) =>
(
  loop(xs, list_vt_cons(x1,rs))))
}(*where*)//end-of-[strm_rlistize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-21:
Sun Dec 21 10:39:48 AM EST 2025
*)
//
#impltmp
< x0:t0 >
< y0:t0 >
< e1:vt >
strm_map$e1nv
  ( xs, e1 ) =
(
strm_map
<x0><y0>(xs)) where
{
#impltmp
map$fopr<x0><y0>(x0) =
(
  map$e1nv$fopr<x0><y0><e1>(x0, e1))
}(*where*)//end-of-[strm_map$e1nv(xs,e1)]
//
#impltmp
< x0:t0 >
< y0:t0 >
< e1:vt >
strq_map$e1nv
  ( xs, e1 ) =
(
strq_map
<x0><y0>(xs)) where
{
#impltmp
map$fopr<x0><y0>(x0) =
(
  map$e1nv$fopr<x0><y0><e1>(x0, e1))
}(*where*)//end-of-[strq_map$e1nv(xs,e1)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:vt >
< e1:vt >
strm_map$e1nv_vt
  ( xs, e1 ) =
(
strm_map_vt
<x0><y0>(xs)) where
{
#impltmp
map$fopr<x0><y0>(x0) =
(
  map$e1nv$fopr<x0><y0><e1>(x0, e1))
}(*where*)//end-of-[strm_map$e1nv_vt(xs,e1)]
//
#impltmp
< x0:t0 >
< y0:vt >
< e1:vt >
strq_map$e1nv_vt
  ( xs, e1 ) =
(
strq_map_vt
<x0><y0>(xs)) where
{
#impltmp
map$fopr<x0><y0>(x0) =
(
  map$e1nv$fopr<x0><y0><e1>(x0, e1))
}(*where*)//end-of-[strq_map$e1nv_vt(xs,e1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-03:
Sat Jan  3 01:43:58 PM EST 2026
*)
//
#impltmp
< x0:t0 >
< y0:t0 >
< e1:vt >
strm_map$e0nv
  (xs, e1) =
(
  auxmain(xs, e1)) where
{
fun
auxmain
( xs
: strm(x0)
, e1: (~e1)
) : strm(y0) = $lazy
(
case+ !xs of
| ~
strmcon_nil() =>
(
g_free<e1>(e1);
strmcon_nil(*void*))
| ~
strmcon_cons(x1, xs) =>
let
val y1 =
map$e1nv$fopr<x0><y0>(x1, e1)
in//let
strmcon_cons(y1, auxmain(xs, e1))
end//let
)
}(*where*)//end-of-[strm_map$e0nv(xs,e1)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
< e1:vt >
strm_map$e0nv_vt
  (xs, e1) =
(
  auxmain(xs, e1)) where
{
fun
auxmain
( xs
: strm(x0)
, e1: (~e1)
) : strm_vt(y0) = $llazy
(
case+ !xs of
| ~
strmcon_nil() =>
(
g_free<e1>(e1);
strmcon_vt_nil(*void*))
| ~
strmcon_cons(x1, xs) =>
let
val y1 =
map$e1nv$fopr<x0><y0>(x1, e1)
in//let
strmcon_vt_cons(y1, auxmain(xs, e1))
end//let
)
}(*where*)//end-of-[strm_map$e0nv_vt(xs,e1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_strm001.dats] *)
(***********************************************************************)
