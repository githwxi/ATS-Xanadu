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
Wed May  7 09:54:52 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_strmize0
  ( xs ) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: strx_vt(x0)
) : strm_vt(x0) = $llazy
(
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs))
)
}(*where*)//end-of-[strx_vt_strmize0]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
< y0:vt >
strx_vt_map0
  ( xs ) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: strx_vt(x0)
) : strx_vt(y0) = $llazy
(
case+ !xs of
| ~
strxcon_vt_cons(x1, xs) =>
strxcon_vt_cons(map$fopr0<x0><y0>(x1), auxmain(xs))
)
}(*where*)//end-of-[strx_vt_map0(xs)]
//
#impltmp
< x0:vt >
< y0:vt >
strx_vt_map0$f1un
  (xs, fopr) =
(
strx_vt_map0<x0><y0>(xs))
where
{
#impltmp map$fopr0<x0><y0>(x0) = fopr(x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
< y0:vt >
strx_vt_imap0
  ( xs ) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0: nint
, xs
: strx_vt(x0)
) : strx_vt(y0) = $llazy
(
case+ !xs of
| ~
strxcon_vt_cons(x1, xs) =>
let
val y1 =
imap$fopr0<x0><y0>(i0, x1)
in//let
strxcon_vt_cons(y1,auxmain(i0+1,xs))
end//let
)
}(*where*)//end-of-[strx_vt_imap0(xs)]
//
#impltmp
< x0:vt >
< y0:vt >
strx_vt_imap0$f1un
  (xs, fopr) =
(
strx_vt_imap0<x0><y0>(xs))
where
{
#impltmp
imap$fopr0<x0><y0>(ni, x0) = fopr(ni, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_filter0
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
: strxcon_vt(x0)
) : strxcon_vt(x0) =
(
case+ cs of
| ~
strxcon_vt_cons(x1, xs) =>
let
val
test =
filter$test1<x0>(x1)
in//let
if
test
then
strxcon_vt_cons
(x1, $llazy(auxloop(!xs)))
else
(g_free<x0>(x1); auxloop(!xs)) end
)
}(*where*)//end-of-[strx_vt_filter0(xs)]
//
#impltmp
< x0:vt >
strx_vt_filter0$f1un
  (xs, test) =
(
strx_vt_filter0<x0>(xs))
where
{
#impltmp
filter$test1<x0>(x0) = test(x0)}//where
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_ifilter0
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
: strxcon_vt(x0)
) : strxcon_vt(x0) =
(
case+ xs of
| ~
strxcon_vt_cons(x1, xs) =>
let
val
test =
ifilter$test1<x0>(i0, x1)
in//let
if
test
then
strxcon_vt_cons
(x1, $llazy(auxloop(i0+1, !xs)))
else
(
g_free<x0>(x1); auxloop(i0+1, !xs)) end
)
}(*where*)//end-of-[strx_vt_ifilter0(xs)]
//
#impltmp
< x0:vt >
strx_vt_ifilter0$f2un
  (xs, test) =
(
strx_vt_ifilter0<x0>(xs))
where
{
#impltmp
ifilter$test1<x0>(i0, x0) = test(i0, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_strx001_vt.dats] *)
(***********************************************************************)
