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
Mon 08 Jul 2024 05:07:13 PM EDT
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
<list_vt(vt)>
( (*void*) ) =
(
pstrn("list_vt"))
//
#impltmp
{ vt:vt }
g_ptype
<list_vt(vt)>
( (*void*) ) =
(
pstrn("list_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
list_vt_nilq1
  ( xs ) =
(
case+ xs of
|list_vt_nil() => true
|list_vt_cons _ => false)
//
#impltmp
<(*tmp*)>
list_vt_consq1
  ( xs ) =
(
case+ xs of
|list_vt_nil() => false
|list_vt_cons _ => (true))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-14:
Sat 14 Sep 2024 11:40:03 AM EDT
*)
//
#impltmp
< a: vt >
list_vt_make_1val
  ( x1 ) =
list_vt_cons(x1, list_vt_nil)
#impltmp
< a: vt >
list_vt_make_2val
  (x1, x2) =
list_vt_cons(x1,
list_vt_cons(x2, list_vt_nil))
#impltmp
< a: vt >
list_vt_make_3val
  (x1, x2, x3) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3, list_vt_nil)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-14:
Sat 14 Sep 2024 11:40:03 AM EDT
*)
//
#impltmp
< a: vt >
list_vt_make_nfun =
nint_map$f1un_llist<a>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 10:06:19 PM EDT
*)
//
#impltmp
{ x0:vt }
gseq$sep
<list_vt(x0)><x0>() = ","
#impltmp
{ x0:vt }
gseq$end
<list_vt(x0)><x0>() = ")"
#impltmp
{ x0:vt }
gseq$beg
<list_vt(x0)><x0>() = "list_vt("
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_print0
<list_vt(x0)>(xs) =
(
gseq_print0<list_vt(x0)><x0>(xs)
)(*let*)//end-[g_print0<list_vt>]
//
#impltmp
{ x0:vt }
g_print1
<list_vt(x0)>(xs) =
(
gseq_print1<list_vt(x0)><x0>(xs)
)(*let*)//end-[g_print1<list_vt>]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_vt_length0 =
gseq_length0<list_vt(x0)><x0>
*)
//
#impltmp
< x0:vt >
list_vt_length0
  (xs) =
(
  loop(xs, 0(*j0*)))
where
{
fun
loop
{i,j:i0}
(xs:
~list_vt
 (x0, i)
,j0: sint(j)): sint(i+j) =
(
case+ xs of
| ~
list_vt_nil() => j0
| ~
list_vt_cons(x1, xs) =>
(
  g_free<x0>(x1); loop(xs, j0+1)))
}
//
#impltmp
{ x0:vt }
gseq_length0
<list_vt(x0)><x0> = list_vt_length0<x0>
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_vt_length1 =
gseq_length1<list_vt(x0)><x0>
*)
//
#impltmp
< x0:vt >
list_vt_length1
  (xs) =
(
  loop(xs, 0(*j0*)))
where
{
fun
loop
{i,j:i0}
(xs:
!list_vt
 (x0, i)
,j0: sint(j)): sint(i+j) =
(
case+ xs of
| !
list_vt_nil() => j0
| !
list_vt_cons(x1, xs) => loop(xs, j0+1))
}
//
#impltmp
{ x0:vt }
gseq_length1
<list_vt(x0)><x0> = list_vt_length1<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-07-02:
Wed Jul  2 07:23:22 PM EDT 2025
*)
//
#impltmp
< x0:vt >
list_vt_free
  {n0}(xs) =
( loop(xs) ) where
{
//
fnx
loop
{n0:n0}.<n0>.
( xs:
~ list_vt(x0, n0)): void =
(
case+ xs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
  val () =
  g_free<x0>(x0) in loop(xs) end)
//
}(*where*)//end-of-[list_vt_free(xs)]
//
#impltmp
{ x0:vt }
g_free<
list_vt(x0)> = list_vt_free<x0>(*void*)
#impltmp
{ x0:vt }
gseq_free<
list_vt(x0)><x0> = list_vt_free<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
Sat 27 Jul 2024 05:56:34 PM EDT
*)
//
#impltmp
< x0:vt >
list_vt_copy
  ( xs ) =
let
//
fnx
loop
{n0:n0}.<n0>.
( xs:
! list_vt(x0, n0)
, r0:
& (?list_vt(x0))>>list_vt(x0, n0)
) : void =
(
//
case+ xs of
| !
list_vt_nil() =>
(r0 := list_vt_nil())
| !
list_vt_cons(x0, xs) =>
let
val x0 = g_copy<x0>(x0)
val () =
(r0 := list_vt_cons(x0, _))
in//let
  loop(xs, r0.1); $fold(r0) end)
//
in//let
let
var r0:
list_vt(x0) in loop(xs, r0); r0 end
end (*let*) // end of [list_vt_copy]
//
#impltmp
{ x0:vt }
g_copy<
list_vt(x0)> = list_vt_copy<x0>(*void*)
#impltmp
{ x0:vt }
gseq_copy<
list_vt(x0)><x0> = list_vt_copy<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
Sat 27 Jul 2024 05:56:34 PM EDT
*)
//
(* ****** ****** *)
//
#impltmp
< a: vt >
list_vt_append0 =
list_vt_append00<a>(*void*)
//
(* ****** ****** *)
//
#impltmp
< a: vt >
list_vt_append00
  (xs, ys) =
let
var xs = xs
val () =
  loop(xs, ys) in (xs)
end where // end-of-[let]
{
//
fnx
loop
{m,n:nat} .<m>.
( xs:
& list_vt(a, m  )
  >>
  list_vt(a, m+n)
, ys:
~ list_vt(a, n  )) : void =
(
case+ xs of
| ~
list_vt_nil
 ((*0*)) => (xs := ys)
| @
list_vt_cons
  (_, _) =>
let
  val () = loop(xs.1, ys)
in//let
let
prval () = $fold(xs) in () end
end // end of [list_vt_cons]
) (*case*) // end of [loop(xs, ys)]
//
} (* end of [list_vt_append00(xs,ys)] *)
//
#impltmp
{ x0:vt }
gseq_append00
<list_vt(x0)>
<x0>
<list_vt(x0)> = list_vt_append00<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< a: vt >
list_vt_append10
  (xs, ys) =
(
list_vt_append00<a>(xs, ys))
where
{
  val xs = list_vt_copy<a>(xs)
} (* end of [list_vt_append10(xs,ys)] *)
//
#impltmp
{ x0:vt }
gseq_append10
<list_vt(x0)>
<x0>
<list_vt(x0)> = list_vt_append10<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
list_vt_rappend0 =
list_vt_rappend00<a>(*void*)
//
(* ****** ****** *)
//
#impltmp
< a: vt >
list_vt_rappend00
  (xs, ys) =
(
  loop(xs, ys)) where
{
//
fnx
loop
{m,n:nat} .<m>.
( xs0
: list_vt(a, m)
, ys0
: list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| ~
list_vt_nil
( (*void*) ) => ys0
| @
list_vt_cons(_, _) =>
let
  val xs1 = xs0.1
  val ( ) = xs0.1 := ys0
in//let
(
  $fold(xs0); loop(xs1, xs0) )
end // end of [list_vt_cons(...)]
)(*case+*)//end-of-[loop(xs0, ys0)]
//
}(*where*)//end-of-[list_vt_rappend00(...)]
//
(* ****** ****** *)
//
#impltmp
< a: vt >
list_vt_reverse0(xs) =
list_vt_rappend00<a>(xs, list_vt_nil(*void*))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-09-04:
Thu Sep  4 12:19:19 AM EDT 2025
*)
//
#impltmp
< a: vt >
list_vt_mergesort0
  (xs) = let
//
#vwtpdef
xs = list_vt(a)
//
fnx
amain
( xs: xs
, n0: nint): xs =
if
(n0 <= 1)
then xs else
(
let
  var xs: xs
in
  merge(ys, zs, xs); xs
end
) where
{
  val n2 = n0 / 2
  val n1 = n0 - n2
  var ys = xs
  val zs = split(ys, n1)
  val ys = amain(ys, n1)
  val zs = amain(zs, n2)
} (*where*) // end of [amain(xs, n0)]
//
and
split
( ys:
& xs >> xs
, n1: nint): xs =
(
if
(n1 >= 2)
then
split(ys.1, n1-1)
else
let
val zs = ys.1 in//let
(
ys.1 :=
list_vt_nil<a>(); zs)
endlet // end of [else]
) (* if *) // end of [split(ys, n1)]
//
and
merge
( ys: ~xs
, zs: ~xs
, xs: &(?xs) >> xs): void =
(
case+ ys of
| ~
list_vt_nil() =>
( xs := zs )
| @
list_vt_cons(y0, ys1) =>
(
case+ zs of
| ~
list_vt_nil() =>
($fold(ys); xs := ys)
| @
list_vt_cons(z0, zs1) =>
let
//
val
sgn = g_cmp11<a>(y0, z0)
//
in//let
//
if
(sgn <= 0)
then
let
val nd = ys
val ys = ys1
val () = $fold(zs)
in//let
  xs := nd;
  merge(ys, zs, xs.1); $fold(xs)
end // end-of-[then]
else
let
val nd = zs
val zs = zs1
val () = $fold(ys)
in//let
  xs := nd;
  merge(ys, zs, xs.1); $fold(xs)
end // end-of-[else]
//
end // list_vt_cons(...)
) (*case+*) // list_vt_cons(y0,ys1)]
) (*case+*) // end of [merge(ys,zs,xs)]
//
in//let
(
  amain(xs, list_vt_length1<a>(xs)) )
end(*let*)//end-of-[list_vt_mergesort0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-15:
Mon Dec 15 09:47:13 PM EST 2025
*)
//
#impltmp
< x0:vt >
list_vt_llist$concat0
  (   xz   ) =
list_vt_reverse0
<      x0      >
(
list_vt_folditm0
<xs><r0>(xz, r0)) where
{
//
#vwtpdef xs = list_vt(x0)
#vwtpdef r0 = list_vt(x0)
//
val r0 = (list_vt_nil(): r0)
//
#impltmp
folditm$fopr0
<xs><r0>(r0, xs) =
(
  list_vt_rappend00<x0>(xs, r0))
//
}(*where*)//end-of-[list_vt_llist$concat0(xz)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-15:
Mon Dec 15 04:37:34 PM EST 2025
*)
//
#impltmp
< x0:vt >
list_vt_make_lstrm = strm_vt_listize0<x0>
//endof[impltmp<x0:vt>(list_vt_make_lstrm(xs))]
#impltmp
< x0:vt >
list_vt_make_lstrq = strq_vt_listize0<x0>
//endof[impltmp<x0:vt>(list_vt_make_lstrq(xs))]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-08:
Thu Jan  8 11:32:41 AM EST 2026
*)
//
#impltmp
list_vt$make$len<>() = 10
//
#impltmp
< a:vt >
list_vt_make() =
(
nint_map_llist<a>(ln)
) where
{
//
val ln = list_vt$make$len<>()
//
#impltmp map$fopr<a>(_) = g_make<a>()
//
}(*where*)//end-of-[g_make<list_vt(a)>()]
//
#impltmp
{ a:vt }
g_make<list_vt(a)>(*0*) = list_vt_make<a>(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_list000_vt.dats] *)
(***********************************************************************)
