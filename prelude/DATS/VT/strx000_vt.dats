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
Wed May  7 09:33:41 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This one is also
implemented in [gdbg000.dats]:
*)
#impltmp
{ vt:vt }
g_ptcon
<strx_vt(vt)>
( (*void*) ) =
(
pstrn("strx_vt"))
//
#impltmp
{ vt:vt }
g_ptype
<strx_vt(vt)>
( (*void*) ) =
(
pstrn("strx_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
strx_vt_cons(x0, xs) =
$llazy
(
free(x0);
free(xs);
strxcon_vt_cons(x0, xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_free//~xs
<strx_vt(x0)>(xs) = $free(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 10:27:26 PM EDT
*)
//
#impltmp
{ x0:vt }
gseq$sep
<strx_vt(x0)><x0>() = ","
#impltmp
{ x0:vt }
gseq$end
<strx_vt(x0)><x0>() = ")"
#impltmp
{ x0:vt }
gseq$beg
<strx_vt(x0)><x0>() = "strx_vt("
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0
<strx_vt(x0)>(xs) =
(
gseq_print0<strx_vt(x0)><x0>(xs)
)(*let*)//end-[g_print0<strx_vt>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_free(xs) = $free(xs)
#impltmp
< x0:vt >
strx_vt_eval(xs) = $eval(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_head0
  ( xs ) =
( case+ !xs of
| ~
strxcon_vt_cons(x1, xs) =>
let val () = $free(xs) in x1 end)
//
#impltmp
< x0:vt >
strx_vt_tail0
  ( xs ) =
( case+ !xs of
| ~
strxcon_vt_cons(x1, xs) =>
let val () = g_free<x0>(x1) in xs end)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 02:45:54 AM EST 2026
*)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strx_vt$end() = ")"
#impltmp
<>(*tmp*)
strx_vt$sep() = ","
#impltmp
<>(*tmp*)
strx_vt$rst() = "..."
//
#impltmp
<>(*tmp*)
strx_vt$beg() = "$strx_vt("
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strx_vt$print$len() = (10)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strx_vt_print0(xs) =
let
val len = 
strx_vt$print$len<>((*void*))
in//let
if
(len < 0)
then strx_vt_all$print0<x0>(xs)
else strx_vt_len$print0<x0>(xs, len)
end(*let*)//end-of-[strx_vt_print0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strx_vt_all$print0
  (xs) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strx_vt$beg<>())
}
) where
{
#vwtpdef
xs = strx_vt(x0)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strxcon_vt_cons
(   x0 , xs   ) =>
let
//
val () =
if // if
(i0 > 0)
then//then
pstrn(strx_vt$sep<>())
//
in//let
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [strxcon_vt_cons]
)
}(*where*)//end-of-(strx_vt_all$print0(xs))
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strx_vt_len$print0
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strx_vt$beg<>())
}
) where
{
//
#vwtpdef
xs = strx_vt(x0)
//
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strxcon_vt_cons
(   x0 , xs   ) =>
if
(i0 >= n0)
then
let
//
val () =
g_free<x0>(x0)
val () =
strx_vt_free<x0>(xs)
//
val () =
if
(i0 > 0)
then
pstrn(strx_vt$sep<>())
//
val () =
pstrn(strx_vt$rst<>())
//
in//let//then
(
pstrn(strx_vt$end<>()))
end // end of [if-then]
else
let
//
val () =
if // if
(i0 > 0)
then//then
pstrn(strx_vt$sep<>())
//
in//let//else
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [if-else]
)(*case+*)//end-of-(loop(xs,i0))
}(*where*)//end-of-(strx_vt_len$print0(xs,ln))
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0<strx_vt(x0)> = strx_vt_print0<x0>(*xs*)
#impltmp
{ x0:vt }
gseq_print0<strx_vt(x0)><x0> = strx_vt_print0<x0>(*xs*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_strx000_vt.dats] *)
(***********************************************************************)
