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
Mon 08 Jul 2024 11:37:45 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This one is also
implemented in [gdbg000.dats]:
*)
#impltmp
{ t0:t0 }
g_ptype
<list(t0)>
( (*void*) ) =
(
pstrn("list(");
g_ptype<t0>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< (*0*) >
list_nil_
((*void*)) = list_nil()
#impltmp
< x0:t0 >
list_cons_
( x1, xs ) = list_cons(x1, xs)
//
(* ****** ****** *)
//
#impltmp
< (*0*) >
list_nilq
{a:t0}(xs) =
(
case+ xs of
| list_nil() => true
| list_cons(_, _) => false)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_head(xs) =
(case+ xs of
|list_cons(x0, xs) => x0)
#impltmp
< x0:t0 >
list_tail(xs) =
(case+ xs of
|list_cons(x0, xs) => xs)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_head$opt(xs) =
(
case+ xs of
|list_nil
((*nil*)) => optn_vt_nil()
|list_cons
( x0,xs ) => optn_vt_cons(x0))
#impltmp
< x0:t0 >
list_tail$opt(xs) =
(
case+ xs of
|list_nil
((*nil*)) => optn_vt_nil()
|list_cons
( x0,xs ) => optn_vt_cons(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_nil
<list(x0)><x0>
((*void*)) =
(
  list_nil(*void*))
#impltmp
{ x0:t0 }
gseq_cons
<list(x0)><x0>
( x0, xs ) =
(
  list_cons(x0, xs))
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_nilq
<list(x0)><x0>
 (  xs  ) = list_nilq{x0}(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
$UN.gseq_head$raw
<list(x0)><x0>(xs) =
(case- xs of
|list_cons(x0, xs) => x0)
#impltmp
{ x0:t0 }
$UN.gseq_tail$raw
<list(x0)><x0>(xs) =
(case- xs of
|list_cons(x0, xs) => xs)
//
#impltmp
{ x0:t0 }
$UN.gseq_uncons$raw
<list(x0)><x0>( xs ) =
(case- xs of
|list_cons(x0, xs) => (x0, xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 09:49:09 PM EDT
*)
//
#impltmp
{ x0:t0 }
gseq_sep
<list(x0)><x0>() = ","
#impltmp
{ x0:t0 }
gseq_end
<list(x0)><x0>() = ")"
#impltmp
{ x0:t0 }
gseq_beg
<list(x0)><x0>() = "list("
//
#impltmp
{ x0:t0 }
g_print
<list(x0)>(xs) =
(
gseq_print<list(x0)><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_strqize
  (xs) =
(
  auxmain(xs)) where
{
fun auxmain(xs) = $llazy
(
case+ xs of
|
list_nil() =>
strqcon_vt_nil()
|
list_cons(x1, xs) =>
strqcon_vt_cons(x1, auxmain(xs))
)
}(*where*)//end-of-[list_strqize(xs)]
//
#impltmp
{x0:t0}
gseq_strqize
<list(x0)><x0> = list_strqize<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_length =
gseq_length<list(x0)><x0>
*)
//
#impltmp
< x0:t0 >
list_length
  (xs) =
(
loop(xs, 0(*j0*))) where
{
fun
loop{i,j:i0}
(xs:
 list(x0)
,j0: sint(j)): sint(i+j) =
(
case+ xs of
|
list_nil
((*void*)) => ( j0 )
|
list_cons
( x1, xs ) => loop(xs, j0+1)
)
}
//
#impltmp
{ x0:t0 }
gseq_length
<list(x0)><x0> = list_length<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
there is a trec-implementation
for [list_append]!
Wed 31 Jul 2024 08:13:30 PM EDT
*)
#impltmp
{ x0:t0 }
g_add
<list(x0)> =
g_append<list(x0)>(*void*)
#impltmp
{ x0:t0 }
g_append
<list(x0)>(*x0*) =
gseq_append<list(x0)><x0>(*void*)
//
#impltmp
{ x0:t0 }
gseq_append
<list(x0)><x0> = list_append<x0>
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_extend
(xs, y0) =
(
list_append<a>(xs, ys)
) where
{
  val ys = list_sing<a>(y0)
}(*where*)//end-of-[list_extend]
//
#impltmp
<a>(*tmp*)
list_append
{m,n}
(xs, ys) = let
fnx
loop
{m:nat} .<m>.
( xs
: list(a, m)
, r0:
& (?list(a)>>list(a,m+n))
) : void =
(
case+ xs of
| list_nil() =>
  (r0 := ys)
| list_cons(x0, xs) =>
  let
    val () =
    r0 := list_cons(x0, _)
  in
    loop(xs, r0.1); $fold(r0)
  end
endcas // end of [ case+(xs) ]
)
in
let
var r0: list(a) in loop(xs, r0); r0
end(*let*)
end(*let*)//end-of(list_append(xs,ys))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 06:14:38 PM EDT
*)
//
#impltmp
< x0:t0 >
list_reverse
  ( xs ) =
(
list_vt2t(list_reverse_vt<x0>(xs)))
//
#impltmp
{ x0:t0 }
gseq_reverse
<list(x0)><x0> = list_reverse<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_reverse_vt
  (xs) =
(
list_rappendx0_vt<x0>(xs, list_vt_nil()))
//
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 06:32:33 PM EDT
*)
//
#impltmp
< x0:t0 >
list_rappend_vt
  (xs, ys) =
let
  val ys =
  list_copy_vt<x0>(ys)
in
  list_rappendx0_vt<x0>(xs, ys)
end(*let*)//endof(list_rappend_vt(xs,ys))
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_rappendx0_vt
  (xs, ys) =
(
  loop(xs, ys)) where
{
//
fnx
loop
{m,n:nat}.<m>.
( xs
: list(x0, m)
, ys
: list_vt(x0, n)
) : list_vt(x0,m+n) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  loop(xs, list_vt_cons(x0, ys)))//fnx
//
}(*where*)//end(list_rappendx0_vt(xs,ys))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_make_1val
(x1) =
list_cons(x1, list_nil(*0*))
#impltmp
< x0:t0 >
list_make_2val
(x1, x2) =
list_cons(x1,
list_cons(x2, list_nil(*0*)))
#impltmp
< x0:t0 >
list_make_3val
(x1, x2, x3) =
list_cons(x1,
list_cons(x2,
list_cons(x3, list_nil(*0*))))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-01:
Mon 02 Sep 2024 06:16:45 PM EDT
*)
//
#impltmp
< x0:t0 >
list_make_ncpy
  (n0, x0) =
list_fmake_fwork<>
(
lam(work) =>
foritm(n0, //HX:it may not be
  lam(i0) => work(x0)))//efficient!
//
#impltmp
< x0:t0 >
list_make_nfun
  (n0, f0) =
list_fmake_fwork<>
(
lam(work) =>
foritm(n0, //HX:it may not be
  lam(i0) => work(f0(i0))))//efficient!
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-16:
Note that
[list_fmake] and list_fmake_fwork]
are both implemented in [list001.dats]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
HX-2024-08-04:
This is not needed for now as
[GSEQ_make_list] is defined as a [fcast]
Sun 04 Aug 2024 10:05:15 AM EDT
//
#impltmp
{ a: t0 }
GSEQ_make<list(a)><a> = GSEQ_make_list<>{a}
//
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
list_make_gseq
  ( xs ) =
list_vt2t{x0}
(
gseq_listize<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
list_map$make_gseq
  ( xs ) =
(
gseq_map_list<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-05:
Thu 05 Sep 2024 05:21:51 PM EDT
*)
//
#impltmp
< x0:t0 >
list_make_t0up1(xs) =
(
  list_make_1val<x0>(xs.0))
//
#impltmp
< x0:t0 >
list_make_t0up2(xs) =
(
  list_make_2val<x0>(x0, x1))
where
{
  val x0 = xs.0 and x1 = xs.1 }
//
#impltmp
< x0:t0 >
list_make_t0up3(xs) =
let
val @(x0, x1, x2) = xs in
(
  list_make_3val<x0>(x0, x1, x2))
end//let//end-of-[list_make_t0up3]
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_make_t0up4 =
list_make_gseq<t0up(x0,x0,x0,x0)><x0>
*)
#impltmp
< x0:t0 >
list_make_t0up4(xs) =
let
val
@(x0, x1, x2, x3) = xs in
(
list_cons(x0,
  list_make_3val<x0>(x1, x2, x3)))
end//let//end-of-[list_make_t0up4(xs)]
//
(*
#impltmp
< x0:t0 >
list_make_t0up5 =
list_make_gseq<t0up(x0,x0,x0,x0,x0)><x0>
*)
#impltmp
< x0:t0 >
list_make_t0up5(xs) =
let
//
val
@(x0, x1, x2, x3, x4) = xs in
(
list_cons(x0,
list_cons(x1,
  list_make_3val<x0>(x2, x3, x4))))
end//let//end-of-[list_make_t0up5(xs)]
//
(*
#impltmp
< x0:t0 >
list_make_t0up6 =
list_make_gseq<t0up(x0,x0,x0,x0,x0,x0)><x0>
*)
#impltmp
< x0:t0 >
list_make_t0up6(xs) =
let
//
val
@(x0, x1, x2, x3, x4, x5) = xs
//
in//let
(
list_cons(x0,
list_cons(x1,
list_cons(x2,
  list_make_3val<x0>(x3, x4, x5)))))
end//let//end-of-[list_make_t0up6(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_list000.dats] *)
