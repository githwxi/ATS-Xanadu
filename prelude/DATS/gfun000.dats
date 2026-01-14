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
Tue 06 Aug 2024 05:59:23 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ r0:vt }
g_ptype
<f0un(r0)>
(  (*void*)  ) =
( pstrn"f0un("
; g_ptype<r0>(); pstrn(")"))
//
#impltmp
{ a1:t0 }
{ r0:vt }
g_ptype
<f1un(a1,r0)>
(  (*void*)  ) =
( pstrn"f1un("
; g_ptype<a1>(); pstrn(";")
; g_ptype<r0>(); pstrn(")"))
//
#impltmp
{ a1:t0
, a2:t0 }
{ r0:vt }
g_ptype
<
f2un(a1,a2,r0)
>
(  (*void*)  ) =
( pstrn"f2un("
; g_ptype<a1>(); pstrn(",")
; g_ptype<a2>(); pstrn(";")
; g_ptype<r0>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a1:t0>
f1un_not
(    f0    ) =
(
  lam(x1:a1) => not(f0(x1)) )
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
f0un_nint$repeat
(f0, times) =
nint_foritm(times) where
{
#impltmp
foritm$work<ni>(_) = f0((*void*))
}(*where*)//end(f0un_nint$repeat(f0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-24:
Sat 24 Aug 2024 06:29:59 PM EDT
*)
//
#impltmp
< r0:vt >
f0un_trace
 (f00, msg) =
lam((*0*)) => let
//
val () =
prints(msg, ":", "\n")
//
val r0 = f00(              )
//
val () = print1s
(msg, ": res0 = ", r0, "\n") in r0 end
//
(* ****** ****** *)
//
#impltmp
< a1:t0 >
< r0:vt >
f1un_trace
 (f00, msg) =
lam(x1:a1) => let
//
val () = prints
(msg, ": arg1 = ", x1, "\n")
//
val r0 = f00(      x1      )
//
val () = print1s
(msg, ": res0 = ", r0, "\n") in r0 end
//
(* ****** ****** *)
//
#impltmp
< a1:t0 >
< a2:t0 >
< r0:vt >
f2un_trace
 (f00, msg) =
lam
(x1:a1,x2:a2) => let
//
val () = prints
(msg, ": arg1 = ", x1, "\n")
val () = prints
(msg, ": arg2 = ", x2, "\n")
//
val r0 = f00(    x1, x2    )
//
val () = print1s
(msg, ": res0 = ", r0, "\n") in r0 end
//
(* ****** ****** *)
//
#impltmp
< a1:t0 >
< a2:t0 >
< a3:t0 >
< r0:vt >
f3un_trace
 (f00, msg) =
lam
(x1:a1
,x2:a2,x3:a3) => let
//
val () = prints
(msg, ": arg1 = ", x1, "\n")
val () = prints
(msg, ": arg2 = ", x2, "\n")
val () = prints
(msg, ": arg3 = ", x3, "\n")
//
val r0 = f00(  x1, x2, x3  )
//
val () = print1s
(msg, ": res0 = ", r0, "\n") in r0 end
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-31:
Sat 31 Aug 2024 10:36:59 AM EDT
*)
//
#impltmp
< a1:t0 >
< a2:t0 >
< a3:t0 >
< a4:t0 >
< r0:vt >
f4un_trace
 (f00, msg) =
lam
(x1:a1,x2:a2
,x3:a3,x4:a4) => let
//
val () = prints
(msg, ": arg1 = ", x1, "\n")
val () = prints
(msg, ": arg2 = ", x2, "\n")
val () = prints
(msg, ": arg3 = ", x3, "\n")
val () = prints
(msg, ": arg4 = ", x4, "\n")
//
val r0 = f00(x1, x2, x3, x4)
//
val () = print1s
(msg, ": res0 = ", r0, "\n") in r0 end
//
(* ****** ****** *)
//
#impltmp
< a1:t0 >
< a2:t0 >
< a3:t0 >
< a4:t0 >
< a5:t0 >
< r0:vt >
f5un_trace
 (f00, msg) =
lam
(x1:a1
,x2:a2,x3:a3
,x4:a4,x5:a5) => let
//
val () = prints
(msg, ": arg1 = ", x1, "\n")
val () = prints
(msg, ": arg2 = ", x2, "\n")
val () = prints
(msg, ": arg3 = ", x3, "\n")
val () = prints
(msg, ": arg4 = ", x4, "\n")
val () = prints
(msg, ": arg5 = ", x5, "\n")
//
val r0 =
(
  f00(x1 , x2 , x3 , x4 , x5))
//
val () =
print1s(msg, ": res0 = ", r0, "\n") in r0 end
//
(* ****** ****** *)
//
#impltmp
< a1:t0 >
< a2:t0 >
< a3:t0 >
< a4:t0 >
< a5:t0 >
< a6:t0 >
< r0:vt >
f6un_trace
 (f00, msg) =
lam
(x1:a1,x2:a2
,x3:a3,x4:a4
,x5:a5,x6:a6) => let
//
val () = prints
(msg, ": arg1 = ", x1, "\n")
val () = prints
(msg, ": arg2 = ", x2, "\n")
val () = prints
(msg, ": arg3 = ", x3, "\n")
val () = prints
(msg, ": arg4 = ", x4, "\n")
val () = prints
(msg, ": arg5 = ", x5, "\n")
val () = prints
(msg, ": arg6 = ", x6, "\n")
//
val r0 =
(
  f00(x1, x2, x3, x4, x5, x6))
//
val () =
print1s(msg, ": res0 = ", r0, "\n") in r0 end
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-05-29:
Thu May 29 05:22:09 PM EDT 2025
*)
//
#impltmp
< x0:t0 >
< y0:t0 >
f1un_map$list
  ( fopr ) =
lam(xs) =>
list_map$f1un<x0><y0>(xs, fopr)
//
#impltmp
< x0:t0 >
< y0:t0 >
f1un_map0$llist
  ( fopr ) =
lam(xs) =>
list_vt_map0$f1un<x0><y0>(xs, fopr)
//
#impltmp
< x0:t0 >
< y0:t0 >
f1un_map1$llist
  ( fopr ) =
lam(xs) =>
list_vt_map1$f1un<x0><y0>(xs, fopr)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
f1un_map$optn
  ( fopr ) =
lam(xs) =>
optn_map$f1un<x0><y0>(xs, fopr)
//
#impltmp
< x0:t0 >
< y0:t0 >
f1un_map0$loptn
  ( fopr ) =
lam(xs) =>
optn_vt_map0$f1un<x0><y0>(xs, fopr)
//
#impltmp
< x0:t0 >
< y0:t0 >
f1un_map1$loptn
  ( fopr ) =
lam(xs) =>
optn_vt_map1$f1un<x0><y0>(xs, fopr)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-06-01:
Sun Jun  1 05:34:50 PM EDT 2025
*)
//
#impltmp
< x0:t0 >
< y0:t0 >
< e1:vt >
f1un_map$e1nv$list
  ( fopr ) =
lam(xs, e1) =>
list_map$e1nv$f2un<x0><y0><e1>(xs, e1, fopr)
//
#impltmp
< x0:vt >
< y0:vt >
< e1:vt >
f1un_map$e1nv0$llist
  ( fopr ) =
lam(xs, e1) =>
list_vt_map$e1nv0$f2un<x0><y0><e1>(xs, e1, fopr)
#impltmp
< x0:vt >
< y0:vt >
< e1:vt >
f1un_map$e1nv1$llist
  ( fopr ) =
lam(xs, e1) =>
list_vt_map$e1nv1$f2un<x0><y0><e1>(xs, e1, fopr)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
< e1:vt >
f1un_map$e1nv$optn
  ( fopr ) =
lam(xs, e1) =>
optn_map$e1nv$f2un<x0><y0><e1>(xs, e1, fopr)
//
#impltmp
< x0:vt >
< y0:vt >
< e1:vt >
f1un_map$e1nv0$loptn
  ( fopr ) =
lam(xs, e1) =>
optn_vt_map$e1nv0$f2un<x0><y0><e1>(xs, e1, fopr)
#impltmp
< x0:vt >
< y0:vt >
< e1:vt >
f1un_map$e1nv1$loptn
  ( fopr ) =
lam(xs, e1) =>
optn_vt_map$e1nv1$f2un<x0><y0><e1>(xs, e1, fopr)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-14:
Wed Jan 14 12:44:51 PM EST 2026
*)
//
#impltmp
< r0:vt >
strx_vt_iter$make
  (fopr, r0) =
(
  auxloop(fopr, r0))
where{
//
fun
auxloop
( fopr
: (!r0)->r0, r0: r0) = $llazy
(
let
val r1 = fopr(r0) in//let
strxcon_vt_cons(r0, auxloop(fopr, r1))end)
//
}(*where*)//end-of-[strx_vt_iter$make(fopr,r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_gfun000.dats] *)
(***********************************************************************)
