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
HX:
This one is also
implemented in [gdbg000.dats]:
*)
#impltmp
{ vt:vt }
g_ptcon
<strm_vt(vt)>
( (*void*) ) =
(
pstrn("strm_vt"))
//
#impltmp
{ vt:vt }
g_ptype
<strm_vt(vt)>
( (*void*) ) =
(
pstrn("strm_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strm_vt_nil() =
$llazy(
strmcon_vt_nil(*0*))
//
#impltmp
< a: vt >
strm_vt_sing(x0) =
(
strm_vt_cons
(x0, strm_vt_nil()))
#impltmp
< a: vt >
strmcon_vt_sing(x0) =
(
strmcon_vt_cons
(x0, strm_vt_nil()))
//
#impltmp
< a: vt >
strm_vt_cons(x0, xs) =
$llazy(
strmcon_vt_cons(x0, xs))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strq_vt_nil() =
$llazy(
strqcon_vt_nil(*0*))
//
#impltmp
< a: vt >
strq_vt_sing(x0) =
(
strq_vt_cons
(x0, strq_vt_nil()))
#impltmp
< a: vt >
strqcon_vt_sing(x0) =
(
strqcon_vt_cons
(x0, strq_vt_nil()))
//
#impltmp
< a: vt >
strq_vt_cons(x0, xs) =
$llazy(
strqcon_vt_cons(x0, xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
strm_vt_free(xs) = $free(xs)
//
(*
HX-2026-02-28:
During type-checking,
[$eval(xs) -> !xs] is done
*)
#impltmp
< a: vt >
strm_vt_eval(xs) = $eval(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_free//~xs
<strm_vt(a)> = strm_vt_free<a>
#impltmp
{ a: vt }
g_free//~xs
<strq_vt(a)> = strq_vt_free<a>
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
<
strm_vt(x0)><x0>() = ","
#impltmp
{ x0:vt }
gseq$end
<
strm_vt(x0)><x0>() = ")"
#impltmp
{ x0:vt }
gseq$beg
<
strm_vt(x0)><x0>() = "strm_vt("
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0
<strm_vt(x0)> =
gseq_print0
<strm_vt(x0)><x0>(*strm_vt(x0)*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
g_make_lstrm
<strm_vt(x0)>(xs) = (xs)//identity
#impltmp
< x0:vt >
g_make_lstrq
<strq_vt(x0)>(xs) = (xs)//identity
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_make_lstrm
<x0><list_vt(x0)> = strm_vt_listize0<x0>
#impltmp
{ x0:vt }
g_make_lstrq
<x0><list_vt(x0)> = strq_vt_listize0<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_append0 =
strm_vt_append00<x0>(*xs*)
//
#impltmp
< x0:vt >
strm_vt_append00
  (xs, ys) =
(
  auxmain(xs, ys)) where{
//
fun
auxmain
( xs
: strm_vt(x0)
, ys
: strm_vt(x0)): strm_vt(x0) =
$llazy
(
free(xs);
free(ys);
case+ !xs of
| ~
strmcon_vt_nil() => !ys
| ~
strmcon_vt_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs, ys))
)(*case+*)//(*llazy*)//end-of(auxmain)
//
}(*where*)//end-of(strm_vt_append00(xs,ys))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-13:
Fri 13 Sep 2024 02:56:33 PM EDT
*)
//
#impltmp
< x0:vt >
strm_vt_head0
  ( xs ) =
( case- !xs of
| ~
strmcon_vt_cons
(   x1, xs   ) =>
let val () = $free(xs) in x1 end)
//
#impltmp
< x0:vt >
strm_vt_tail0
  ( xs ) =
( case- !xs of
| ~
strmcon_vt_cons
(   x1, xs   ) =>
let
val () = g_free<x0>(x1) in xs end)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_head$opt0
  ( xs ) =
(
case+ !xs of
| ~
strmcon_vt_nil
(  (*void*)  ) =>
(
  optn_vt_nil(*0*))
| ~
strmcon_vt_cons
(   x1, xs   ) =>
let
val () =
$free(xs) in optn_vt_cons(x1) end
)
//
#impltmp
< x0:vt >
strm_vt_tail$opt0
  ( xs ) =
(
case+ !xs of
| ~
strmcon_vt_nil
(  (*void*)  ) =>
(
  optn_vt_nil(*0*))
| ~
strmcon_vt_cons
(   x1, xs   ) =>
let
val () =
g_free<x0>(x1) in optn_vt_cons(xs) end
)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-05:
Thu 05 Sep 2024 07:59:10 PM EDT
HX-2025-12-13
concat0 -> lstrm$concat0
Sat Dec 13 11:42:48 PM EST 2025
*)
#impltmp
< x0:vt >
strm_vt_lstrm$concat0
  ( xss ) =
(
  auxmain(xss)) where
{
fun auxmain(xss) = $llazy
(
case+ !xss of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(xs1, xss) => !
(
 strm_vt_append00<x0>(xs1, auxmain(xss)))
)
}(*where*)//end-of-[strm_vt_lstrm$concat0(xss)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 11:57:32 AM EST 2025
*)
//
#impltmp
< x0:vt >
strm_vt_length0
  (  xs  ) =
(
  loop(xs, 0)) where
{
fun
loop
( xs:
~ strm_vt(x0), ln: nint): nint =
(
case+ !xs of
| ~
strmcon_vt_nil
(  (*void*)  ) => ( ln )
| ~
strmcon_vt_cons
(   x1, xs   ) =>
let
val
( ) = g_free<x0>(x1) in loop(xs, ln+1)
end//let//end-of-[strmcon_vt_cons(x1,xs)]
)
}(*where*)//end-of-[strm_vt_length0( xs )]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-21:
Sun Dec 21 07:20:03 PM EST 2025
*)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strm_vt$end() = ")"
#impltmp
<>(*tmp*)
strm_vt$sep() = ","
#impltmp
<>(*tmp*)
strm_vt$rst() = "..."
//
#impltmp
<>(*tmp*)
strm_vt$beg() = "$strm_vt("
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strm_vt$print$len() = (10)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_print0(xs) =
let
val len = 
strm_vt$print$len<>((*void*))
in//let
if
(len < 0)
then strm_vt_all$print0<x0>(xs)
else strm_vt_len$print0<x0>(xs, len)
end(*let*)//end-of-[strm_vt_print0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_all$print0
  (xs) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strm_vt$beg<>())
}
) where
{
#vwtpdef
xs = strm_vt(x0)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil
(  (*void*)  ) =>
(
pstrn(strm_vt$end<>())
)
| ~
strmcon_vt_cons
(   x0, xs   ) =>
let
//
val () =
if
(i0 > 0)
then
pstrn(strm_vt$sep<>())
//
in
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [strmcon_vt_cons]
)
}(*where*)//end-of-(strm_vt_all$print0(xs))
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_len$print0
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strm_vt$beg<>())
}
) where
{
//
#vwtpdef
xs = strm_vt(x0)
//
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil
(  (*void*)  ) =>
pstrn(strm_vt$end<>())
| ~
strmcon_vt_cons
(   x0, xs   ) =>
if
(i0 >= n0)
then
let
//
val () =
(
g_free<x0>(x0))
val () =
(
strm_vt_free<x0>(xs))
//
val () =
if
(i0 > 0)
then
pstrn(strm_vt$sep<>())
//
val () =
pstrn(strm_vt$rst<>())
//
in
(
pstrn(strm_vt$end<>()))
end // end of [if-then]
else
let
//
val () =
if
(i0 > 0)
then
pstrn(strm_vt$sep<>())
//
in//let
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [if-else]
)(*case+*)//end-of-(loop(xs,i0))
}(*where*)//end-of-(strm_vt_len$print0(xs,ln))
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0<strm_vt(x0)> = strm_vt_print0<x0>(*xs*)
#impltmp
{ x0:vt }
gseq_print0<strm_vt(x0)><x0> = strm_vt_print0<x0>(*xs*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-26:
Fri Dec 26 05:13:01 PM EST 2025
*)
//
#impltmp
< x0:vt >
strm_vt_ndrop
  (xs, n0) =
(
auxloop(xs, n0)) where
{
//
#vwtpdef xs = strm_vt(x0)
//
fun
auxloop(xs: xs, n0: ni): xs =
(
if
(n0 <= 0)
then xs else
(
$llazy
(
case+ !xs of
| ~
strmcon_vt_nil
(  (*void*)  ) =>
(
  strmcon_vt_nil())
| ~
strmcon_vt_cons
(   x1 , xs   ) =>
(
  free(x1); !(auxloop(xs, n0-1)))))
)(*endif*)//end-of-[auxloop(xs, n0)]
//
}(*where*)//end-of-[strm_vt_ndrop(xs,n0)]
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
strm_vt_ntake
  (xs, n0) =
(
  auxmain(xs, n0)) where
{
//
#vwtpdef xs = strm_vt(x0)
//
fun
auxmain
(xs: xs, n0: ni): xs = $llazy
(
if
(n0 <= 0)
then
(
free(xs);
strmcon_vt_nil()) else
(
case+ !xs of
| ~
strmcon_vt_nil
(  (*void*)  ) => strmcon_vt_nil()
| ~
strmcon_vt_cons
(   x1, xs   ) =>
strmcon_vt_cons(x1, auxmain(xs, n0-1))))
//
}(*where*)//end-of-[strm_vt_ntake(xs, n0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-08:
Thu Jan  8 12:13:02 PM EST 2026
*)
//
#impltmp
strm_vt$make$len<>() = (10)
//
#impltmp
< a:vt >
strm_vt_make() =
(
nint_map_lstrm<a>(ln)
) where
{
//
val ln = strm_vt$make$len<>((*0*))
//
#impltmp map$fopr<a>(_) = g_make<a>()
//
}(*where*)//end-of-[g_make<strm_vt(a)>()]
//
#impltmp
{ a:t0 }
g_make<strm_vt(a)>(*0*) = strm_vt_make<a>(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_strm000_vt.dats] *)
(***********************************************************************)
