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
f0un_repeat$nint
(f0, times) =
nint_foritm(times) where
{
#impltmp
foritm$work<ni>(_) = f0((*void*))
}(*where*)//end(f0un_repeat$nint(f0))
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
f_trace$f0un
 (msg, f00) =
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
f_trace$f1un
 (msg, f00) =
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
f_trace$f2un
 (msg, f00) =
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
f_trace$f3un
 (msg, f00) =
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
f_trace$f4un
 (msg, f00) =
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
f_trace$f5un
 (msg, f00) =
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
f_trace$f6un
 (msg, f00) =
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
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gfun000.dats] *)
