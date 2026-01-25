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
Sat 07 Sep 2024 07:22:52 AM EDT
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
//
#impltmp
{ t0:t0 }
g_ptcon
<strm(t0)>
( (*void*) ) =
(
pstrn("strm"))
#impltmp
{ t0:t0 }
g_ptype
<strm(t0)>
( (*void*) ) =
(
pstrn("strm(");
g_ptype<t0>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 11:36:58 AM EST 2025
*)
#impltmp
<(*tmp*)>
strm_nil((*0*)) =
$lazy(strmcon_nil(*void*))
//
#impltmp
< a: t0 >
strm_sing(x0) =
(
strm_cons(x0, strm_nil()))
//
#impltmp
< a: t0 >
strm_cons(x0, xs) =
$lazy(strmcon_cons(x0, xs))
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
strm_eval(xs) = $eval( xs )
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 11:43:16 AM EST 2025
*)
//
#impltmp
{ x0:t0 }
gseq_sep
<strm(x0)><x0>() = ","
#impltmp
{ x0:t0 }
gseq_end
<strm(x0)><x0>() = ")"
#impltmp
{ x0:t0 }
gseq_beg
<strm(x0)><x0>() = "strm("
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_print<strm(x0)> =
gseq_print<strm(x0)><x0>(*xs*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 12:27:24 PM EST 2025
*)
//
#impltmp
< x0:t0 >
strm_head
  ( xs ) =
( case- !xs of
| strmcon_cons(x1, xs) => (x1))
//
#impltmp
< x0:t0 >
strm_tail
  ( xs ) =
( case- !xs of
| strmcon_cons(x1, xs) => (xs))
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_head$opt
  ( xs ) =
(
case+ !xs of
|strmcon_nil
( (*void*) ) =>
(
  optn_vt_nil(*0*))
|strmcon_cons
(  x1, xs  ) => optn_vt_cons(x1))
//
#impltmp
< x0:t0 >
strm_tail$opt
  ( xs ) =
(
case+ !xs of
|strmcon_nil
( (*void*) ) =>
(
  optn_vt_nil(*0*))
|strmcon_cons
(  x1, xs  ) => optn_vt_cons(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 01:16:29 PM EST 2025
*)
//
#impltmp
< x0:t0 >
strm_length
  (  xs  ) =
(
  loop(xs, 0)) where
{
//
fun
loop
( xs
: strm(x0), ln: nint): nint =
(
case+ !xs of
|strmcon_nil
(  (*void*)  ) => ( ln )
|strmcon_cons
(   x1 , xs   ) => loop(xs, ln+1))
//
}(*where*)//end-of-[strm_length( xs )]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_append
  (xs, ys) =
(
  auxmain(xs, ys)) where
{
fun
auxmain
( xs: strm(x0)
, ys: strm(x0)): strm(x0) = $lazy
(
case+ !xs of
|
strmcon_nil() => 
(
  strm_eval<x0>(xs))
|
strmcon_cons(x1, xs) =>
(
  strmcon_cons(x1, auxmain(xs, ys))))
}(*where*)//end-of-[strm_append(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_append_vt
  (xs, ys) =
(
  auxmain(xs, ys)) where
{
fun
auxmain
( xs: strm(x0)
, ys: strm(x0)): strm_vt(x0) = $llazy
(
case+ !xs of
|
strmcon_nil() =>
(
! strm_strmize(ys))
|
strmcon_cons(x1, xs) =>
(
  strmcon_vt_cons(x1, auxmain(xs, ys))))
}(*where*)//end-of-[strm_append_vt(xs,ys)]
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
strm_end() = ")"
#impltmp
<>(*tmp*)
strm_sep() = ","
#impltmp
<>(*tmp*)
strm_rst() = "..."
//
#impltmp
<>(*tmp*)
strm_beg() = "$strm("
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strm$print$len() = (10)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_print(xs) =
let
val len = 
strm$print$len<>()
in//let
if
(len < 0)
then strm_all$print<x0>(xs)
else strm_len$print<x0>(xs, len)
end(*let*)//end-of-[strm_print(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_all$print
  (xs) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strm_beg<>())
}
) where
{
#typedef
xs = strm(x0)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
|
strmcon_nil() =>
(
pstrn(strm_end<>()))
|
strmcon_cons(x0, xs) =>
let
//
val () =
if
(i0 > 0)
then
pstrn(strm_sep<>())
//
in
(
  loop(xs, i0+1)) where
{
  val () = g_print<x0>(x0)
}
end // end of [strmcon_cons]
)
}(*where*)//end-of-(strm_all$print(xs))
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_len$print
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strm_beg<>())
}
) where
{
//
#typedef
xs = strm(x0)
//
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
|
strmcon_nil() =>
(
pstrn(strm_vt_end<>()))
|
strmcon_cons(x0, xs) =>
if
(i0 >= n0)
then
let
//
val () =
if
(i0 > 0)
then
(
  pstrn(strm_sep<>()))
//
val () =
(
  pstrn(strm_rst<>()))
//
in
(
  pstrn(strm_end<>()))
end // end of [if-then]
else
let
//
val () =
if
(i0 > 0)
then
(
  pstrn(strm_sep<>()))
//
in//let
(
  loop(xs, i0+1)) where
{
  val () = g_print<x0>(x0)
}
end // end of [if-else]
)(*case+*)//end-of-(loop(xs,i0))
}(*where*)//end-of-(strm_len$print(xs,ln))
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_print<strm(x0)> = strm_print<x0>(*xs*)
#impltmp
{ x0:t0 }
gseq_print<strm(x0)><x0> = strm_print<x0>(*xs*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_strm000.dats] *)
(***********************************************************************)
