(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
** HX: For lists
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// (Some time in 2019)
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
(*
#staload
"./../SATS/list000.sats"
#staload
"./../SATS/gseq000.sats" *)
//
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
list_nil_
((*0*)) = list_nil()
#impltmp
<a>(*tmp*)
list_cons_
(x0,xs) = list_cons(x0,xs)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_sing(x0) =
list_cons(x0, list_nil(*0*))
#impltmp
<a>(*tmp*)
list_pair(x1,x2) =
list_cons(x1, list_sing<a>(x2))

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_btw(s1,f2) =
list_vt2t(list_btw_vt<a>(s1,f2))
#impltmp
<a>(*tmp*)
list_btwe(s1,f2) =
list_vt2t(list_btwe_vt<a>(s1,f2))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_btw_vt(s1,f2) =
let
//
#vwtpdef
tres = list_vt( a )
//
fnx
loop
( i0: sint
, r0: tres): tres =
if
(i0 = f2)
then r0 else
loop(i0+1, r0) where
{
val x0 = g_si<a>(i0)
val r0 = list_vt_cons(x0, r0)
} (*where*) // end-of(loop(i0,r0))
//
in//let
if s1 > f2
then list_vt_nil() else
list_vt_reverse0<a>(loop(s1,list_vt_nil))
end(*let*) // end-of-[list_btw_vt(s1,f2)]
//
#impltmp
<a>(*tmp*)
list_btwe_vt(s1,f2) =
let
//
#vwtpdef
tres = list_vt( a )
//
fnx
loop
( i0: sint
, r0: tres): tres =
let
val x0 = g_si<a>(i0)
val r0 = list_vt_cons(x0, r0)
in//let
if
(i0 = f2) then r0 else loop(i0+1, r0)
endlet(* end of [loop(i0,r0)] *)
//
in//let
if s1 > f2
then list_vt_nil() else
list_vt_reverse0<a>(loop(s1,list_vt_nil))
end(*let*) // end-of-[list_btwe_vt(s1,f2)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_make_ncpy
  (n0, x0) =
(
list_vt2t
(list_make_ncpy_vt<a>(n0, x0))
)
//
#impltmp
<a>(*tmp*)
list_make_ncpy_vt
  (n0, x0) =
(
loop(n0, list_vt_nil())
) where
{
fnx
loop
{i,j:nat}.<i>.
( i0
: sint(i)
, xs
: list_vt(a, j))
: list_vt(a, i+j) =
(
if
(i0 > 0)
then
loop
( pre(i0)
, list_vt_cons(x0, xs)) else xs
)
} (* end of [list_make_ncpy_vt] *)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_make_strm(xs) =
list_vt2t
(list_make_strm_vt<a>(xs))
#impltmp
<a>(*tmp*)
list_make_strm_vt(xs) =
(list_vt_make_strm<a>(xs))
//
#impltmp
<a>(*tmp*)
list_make0_lstrm(xs) =
list_vt2t
(list_make0_lstrm_vt<a>(xs))
#impltmp
<a>(*tmp*)
list_make0_lstrm_vt(xs) =
(list_vt_make0_lstrm<a>(xs))
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
list_nilq
  (xs) =
(
case+ xs of
|list_nil() => true
|list_cons(_, _) => false
) (*case+*)//end-of-[list_nilq(xs)]
#impltmp
<>(*tmp*)
list_consq
  (xs) =
(
case+ xs of
|list_nil() => false
|list_cons(_, _) => (true)
) (*case+*)//end-of-[list_consq(xs)]
//
(* ****** ****** *)
//
#impltmp
<a:type>
list_singq
  (xs) =
(
case+ xs of
|
list_nil
((*void*)) => false
|
list_cons
( x1, xs ) => list_nilq<>(xs)
)
//
#impltmp
<a:type>
list_pairq
  (xs) =
(
case+ xs of
|
list_nil
((*void*)) => false
|
list_cons
( x1, xs ) => list_singq<a>(xs)
)
(* ****** ****** *)
//
#impltmp
<a:type>
list_head(xs) =
let
val+
list_cons
(x0 , xs) = xs in x0 end
#impltmp
<a:type>
list_tail(xs) =
let
val+
list_cons
(x0 , xs) = xs in xs end
//
(* ****** ****** *)
//
(*
#impltmp
<a:type>
list_head_raw(xs) = (xs.0)
(* end of [list_head_raw(xs)] *)
*)
//
(*
#impltmp
<a:type>
list_tail_raw(xs) = (xs.1)
(* end of [list_tail_raw(xs)] *)
*)
//
(* ****** ****** *)
//
#impltmp
<a:type>
list_head$opt(xs) =
(
case+ xs of
|
list_nil
((*nil*)) => optn_vt_nil()
|
list_cons
(x0 , xs) => optn_vt_cons(x0))
(* end of [list_head$opt(xs)] *)
//
#impltmp
<a:type>
list_tail$opt(xs) =
(
case+ xs of
|
list_nil
((*nil*)) => optn_vt_nil()
|
list_cons
(x0 , xs) => optn_vt_cons(xs))
(* end of [list_tail$opt(xs)] *)
//
(* ****** ****** *)
//
#impltmp
<a:type>
list_last(xs) =
(
list_last_ini<a>(x0, xs)
) where
{
val+list_cons(x0, xs) = xs
} (*where*)//end-of-(list_last)
//
#impltmp
<a>(*tmp*)
list_last_ini
(x0, xs) =
(
loop(x0, xs)) where
{
fnx
loop
( x0: a
, xs: list(a)): a =
(
case+ xs of
|
list_nil() => x0
|
list_cons(x1, xs) => loop(x1, xs)
)
} (*where*)//end-of-(list_last_ini)
//
(* ****** ****** *)
//
#impltmp
<a:type>
list_cmp(xs, ys) =
(
loop(xs, ys)) where
{
fnx
loop
( xs: list(a)
, ys: list(a)): sint =
(
case+ xs of
//
|
list_nil() =>
(
case+ ys of
|
list_nil() => (0)
|
list_cons _ => (-1))
//
|
list_cons(x1, xs) =>
(
case+ ys of
|
list_nil() => (1)
|
list_cons(y1, ys) =>
let
  val
  sgn = g_cmp<a>(x1, y1)
in // let
  if
  (sgn = 0)
  then loop(xs, ys) else sgn
end(*let*)//end-of-[list_cons]
)(*case+*)//end-of-[list_cons]
//
)(*case+*)//end-of-[loop(xs,ys)]
}(*where*)//end-of-[list_cmp(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_length
  (xs) =
(
  loop(xs, 0) ) where
{
fnx
loop
{i,j:int}
( xs
: list(a,i)
, j0
: sint( j )): sint(i+j) =
(
case+ xs of
|
list_nil
((*nil*)) => j0
|
list_cons
( _, xs ) => loop(xs, j0+1)
)(*case+*)//end-of-(loop(xs, j0))
}(*where*)//end-of-(list_length(xs))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_get$at
  (xs, i0) =
(
  loop(xs, i0)
) where
{
fnx
loop
{n:int}
( xs
: list(a,n)
, i0
: nintlt(n)): (a) =
(
case+ xs of
|
list_cons(x0, xs) =>
if
(i0 > 0)
then
loop(xs, pre(i0)) else x0
endif // end-of-(list_cons)
)(*case+*)//end-(loop(xs,i0))
}(*where*)//end-(list_get$at(xs,i0))
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_fset$at
(xs, i0, x0) =
(
auxmain
(xs, i0, list_vt_nil())
) where
{
fun
auxmain
{m,n:int}
{i:nat|i<m}
( xs: list(a,m)
, i0: sint( i )
, ys: list_vt(a,n)): list(a,m+n) =
let
val+
list_cons(x1, xs) = xs
in//let
//
if
(i0 = 0)
then
list_rappend0x<a>
(ys, list_cons(x0, xs))
else
let
val i0 = pre(i0)
val ys =
list_vt_cons(x1,ys) in auxmain(xs,i0,ys)
end // end of [else]
//
end // end of [auxmain(xs,i0,ys) ]
}(*where*)//end-of-[list_fset$at(xs,i0,x0)]

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_extend
(xs, x0) =
(
list_append<a>(xs, ys)
) where
{
  val ys = list_sing<a>(x0)
} (*where*)//end-of-[list_extend]
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
& (?list(a)>>list(a,m+n))): void =
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
end(* let *)
end(* let *)//end-of(list_append(xs,ys))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_concat
  (xss) =
(
list_vt2t
(list_concat_vt<a>(xss))
)
//
#impltmp
<a>(*tmp*)
list_concat_vt
  (xss) =
(
let
val
res = list_vt_nil()
in
list_vt_reverse0<a>(loop(xss,res))
end
) where
{
fnx
loop
( xss
: list(list(a))
, res: list_vt(a)): list_vt(a) =
(
case+ xss of
|
list_nil() => res
|
list_cons(xs, xss) =>
loop(xss,list_rappendx0_vt<a>(xs,res))
)
} (*where*) // end-of-(list_concat_vt)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_rappend
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fnx
loop
{m,n:nat}.<m>.
( xs
: list(a, m)
, ys
: list(a, n)): list(a, m+n) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  loop(xs, list_cons(x0, ys))
)
} (*where*) // end-of(list_rappend)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_rappend_vt
  (xs, ys) =
let
  val ys =
  list_copy_vt<a>(ys)
in
  list_rappendx0_vt<a>(xs, ys)
end(*let*)//end-of(list_rappend_vt)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_rappend0x
  (xs, ys) =
(
  loop(xs, ys)) where
{
fnx
loop
{m,n:nat}.<m>.
( xs
: list_vt
  ( a,m )
, ys
: list(a, n)): list(a, m+n) =
(
  case+ xs of
  | ~
  list_vt_nil() => ys
  | ~
  list_vt_cons(x0, xs) =>
  loop(xs, list_cons(x0, ys))
)
} (*where*) // end-of(list_rappend0x)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_rappendx0_vt
  (xs, ys) =
(
  loop(xs, ys)) where
{
fnx
loop
{m,n:nat}.<m>.
( xs
: list(a, m)
, ys
: list_vt(a,n)): list_vt(a,m+n) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  loop(xs, list_vt_cons(x0, ys))
)
}(*where*)//end-of(list_rappendx0_vt)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_reverse
  (xs) =
(
  list_rappend<a>(xs, list_nil())
) (* list_reverse *)
#impltmp
<a>(*tmp*)
list_reverse_vt
  (xs) =
(
list_rappendx0_vt<a>(xs, list_vt_nil())
) (* list_reverse_vt *)
//
(* ****** ****** *)
#impltmp
<x0>
<r0>(*tmp*)
list_foldl(*(xs,r0)*) =
gseq_foldl<list(x0)><x0><r0>(*(xs,r0)*)
(* ****** ****** *)
#impltmp
<x0>
<r0>(*tmp*)
list_foldr(*(xs,r0)*) =
gseq_foldr<list(x0)><x0><r0>(*(xs,r0)*)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_exists(xs) =
  (loop(xs)) where
{
fnx
loop
(xs: list(x0)): bool =
(
case+ xs of
| list_nil() => false
| list_cons(x0, xs) =>
  if
  exists$test<x0>(x0)
  then true else loop(xs)
)
}(*where*)//end-of-[list_exists(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_forall(xs) =
  (loop(xs)) where
{
fnx
loop
(xs: list(x0)): bool =
(
case+ xs of
| list_nil() => (true)
| list_cons(x0, xs) =>
  if
  forall$test<x0>(x0)
  then loop(xs) else false
)
}(*where*)//end-of-[list_forall(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_foritm(xs) =
  (loop(xs)) where
{
fnx
loop
(xs: list(x0)): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  let
  val () =
  foritm$work<x0>(x0) in loop(xs)
  end
)
}(*where*)//end-of-[list_foritm(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_sortedq(xs) =
(
case+ xs of
|list_nil
((*void*)) => true
|list_cons
( x0, xs ) => loop(x0, xs)
) where
{
fnx
loop
( x0: x0
, xs: list(x0)): bool =
(
case+ xs of
|list_nil() => true
|list_cons(x1, xs) =>
(
  if
  g_cmp<x0>(x0,x1) <= 0
  then loop(x1, xs) else false ) )
}(*where*)//end-of-[list_sortedq(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_listize = list_copy_vt<x0>
#impltmp
<x0>(*tmp*)
list_rlistize = list_rcopy_vt<x0>
//
#impltmp
<x0>(*tmp*)
list_strmize
  (xs) =
( auxmain(xs) ) where
{
fun
auxmain(xs) =
$llazy
(
case+ xs of
|
list_nil() =>
strmcon_vt_nil()
|
list_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs))
)
}(*where*)//end-of-[list_strmize(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_map(xs) =
(
list_vt2t
(list_map_vt<x0><y0>(xs))
)
//
#impltmp
<x0><y0>
list_map_vt(xs) = let
//
#vwtpdef
ys = list_vt(y0)
#vwtpdef
ys(i:int) = list_vt(y0, i)
//
fnx
loop
{i:nat}.<i>.
( xs:
  list(x0, i)
, r0:
& (?ys) >> ys(i)): void =
(
case+ xs of
|
list_nil() =>
(r0 := list_vt_nil())
|
list_cons(x0, xs) =>
let
val y0 =
map$fopr<x0><y0>(x0)
val () =
(r0 := list_vt_cons(y0, _))
in
  loop(xs, r0.1); $fold(r0)
end
) (* end of [loop] *)
//
in//let
let
var r0
  : list_vt(y0) in loop(xs, r0); r0
end
end (*let*) // end-of-[list_map_vt(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_maprev(xs) =
(
list_vt2t
(list_maprev_vt<x0><y0>(xs)))
//
#impltmp
<x0><y0>
list_maprev_vt(xs) =
(
loop(xs, list_vt_nil((*void*)))
) where
{
//
fnx
loop
{i,j:nat}.<i>.
( xs
: list(x0, i)
, ys
: list_vt(y0, j))
: list_vt(y0, i+j) =
(
case+ xs of
|
list_nil() => ys
|
list_cons(x0, xs) =>
(
  loop(xs, ys)
) where
{
  val y0 =
  map$fopr<x0><y0>(x0)
  val ys =
  list_vt_cons( y0, ys ) }
) (* end of [loop(xs, ys)] *)
//
}(*where*)//end-(list_maprev_vt(xs))
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_copy_vt
  (xs) =
(
list_map_vt<a><a>(xs)
) where
{
#impltmp map$fopr<a><a>(x0) = x0
}
#impltmp
<a>(*tmp*)
list_rcopy_vt
  (xs) =
(
list_maprev_vt<a><a>(xs)
) where
{
#impltmp map$fopr<a><a>(x0) = x0
}(*where*)//end-of-[list_rcopy_vt]

(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_filter(xs) =
(
list_vt2t
(list_filter_vt<x0>(xs)))
//
#impltmp
<x0>(*tmp*)
list_filter_vt(xs) =
let
#typedef xs = list(x0)
in // let
  gseq_filter_llist<xs><x0>(xs)
end(*let*)//end-of-[list_filter_vt]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2019-10:
Quite an informative example:
*)
//
(*
#impltmp
<a>(*tmp*)
list_tabulate$f1un
  {n}(n0, f0) =
(
list_tabulate<a><n>(n0)
) where
{
//
#impltmp
tabulate$fopr<a><n>(i0) = f0(i0)
//
} (*where*) // end of [list_tabulate$f1un]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_mergesort
  (xs) =
list_vt2t(list_mergesort_vt<a>(xs))
#impltmp
<a>(*tmp*)
list_mergesort_vt
  (xs) =
list_vt_mergesort0<a>(list_copy_vt<a>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_subsetize_vt
  (xs) =
(
  auxmain(xs)
) where
{
//
#vwtpdef
xs(n:int) =
listlte_vt(a, n)
//
fun
auxmain
{n:int}
( xs
: list(a, n))
: strm_vt(xs(n)) =
$llazy
(
case+ xs of
|
list_nil() =>
strmcon_vt_sing
(list_vt_nil(*void*))
|
list_cons(x0, xs) =>
let
val res1 =
auxmain(xs)
val res2 =
auxmain(xs)
val res2 =
strm_vt_map0(res2) where
{
#sexpdef n0 = n
#sexpdef n1 = n-1
#impltmp
map$fopr0
<xs(n1)><xs(n0)>(xs) =
(
  list_vt_cons(x0, xs))
}
in !
(strm_vt_append0<xs(n)>(res1,res2))
endlet // end of [list_cons(x0, xs)]
)
}(*where*)//end-of-[list_subsetize_vt(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_iforall(xs) =
(
loop(0(*i0*), xs)) where
{
fnx
loop
( i0: sint
, xs: list(x0)): bool =
(
case+ xs of
|
list_nil() => ( true )
|
list_cons(x1, xs) =>
(
if
test
then
loop(i0+1, xs) else false) where
{
val test = iforall$test<x0>(i0, x1)}
)
}(*where*)//end-of-[list_iforall<x0>(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_iforitm(xs) =
(
loop(0(*i0*), xs)) where
{
fnx
loop
( i0: sint
, xs: list(x0)): void =
(
case+ xs of
|
list_nil() => ( (*void*) )
|
list_cons(x1, xs) =>
(
  loop(i0+1, xs)) where
{
val () = iforitm$work<x0>(i0, x1)}
)
}(*where*)//end-of-[list_iforitm<x0>(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX-2022-07-23:
// higher-order gseq-functions
// Sun Jul 24 01:02:26 EDT 2022
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_map$f1un
(    xs, f0    ) =
(
list_map<x0><y0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//end-[list_map$f1un(xs,f0)]
#impltmp
<x0><y0>
list_map$f1un_vt
(    xs, f0    ) =
(
list_map_vt<x0><y0>(xs)) where
{
#impltmp map$fopr<x0><y0>(x0) = f0(x0)
} (*where*)//end-[list_map$f1un_vt(xs,f0)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_make_fwork
  (fwork) =
list_vt2t
(list_make_fwork_vt<x0>(fwork))
#impltmp
<x0>(*tmp*)
list_rmake_fwork
  (fwork) =
list_vt2t
(list_rmake_fwork_vt<x0>(fwork))
//
#impltmp
<x0>(*tmp*)
list_make_fwork_vt
  (fwork) =
(
  list_vt_reverse0<x0>(xs)) where
{
val xs = list_rmake_fwork_vt<x0>(fwork) }
//
#impltmp
<x0>(*tmp*)
list_rmake_fwork_vt
  (fwork) =
let
//
#vwtpdef
xs = list_vt(x0)
//
var r0: xs =
list_vt_nil((*0*))
val p0 = $addr(r0)
//
in
//
(
$UN.p2tr_get<xs>(p0)) where
{
val () = fwork
(
lam//cfr
(x0:x0):void =>
$UN.p2tr_set<xs>
(p0,list_vt_cons(x0,$UN.p2tr_get<xs>(p0))))}
//  
end//let//end-of-[list_rmake_fwork_vt(fwork)]
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
(*
#impltmp
{a:t0}
$UN.gseq_head
<list(a)><a>(xs) = xs.0
#impltmp
{a:t0}
$UN.gseq_tail
<list(a)><a>(xs) = xs.1
#impltmp
{a:t0}
$UN.gseq_uncons
<list(a)><a>(xs) =
let
val x0 = xs.0
val () = xs := xs.1 in x0
end
*)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_nil
<list(a)><a>
((*void*)) = list_nil()
#impltmp
{a:t0}
gseq_cons
<list(a)><a>
( x0, xs ) = list_cons(x0, xs)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_nilq
<list(a)><a> = list_nilq{a}
#impltmp
{a:t0}
gseq_consq
<list(a)><a> = list_consq{a}
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_cmp<list(a)> =
gseq_cmp<list(a)><a>
#impltmp
{a:t0}
gseq_cmp<list(a)><a> = list_cmp<a>
//
(* ****** ****** *)
//
(*
(*
HX-2022-06-24:
The following code
is moved into synoug0.dats.
*)
#impltmp
{a:t0}
g_print<list(a)> =
gseq_print<list(a)><a>
//
#impltmp
{a:t0}
gseq_print$beg
<list(a)><a>((*0*)) = strn_print("(")
#impltmp
{a:t0}
gseq_print$end
<list(a)><a>((*0*)) = strn_print(")")
#impltmp
{a:t0}
gseq_print$sep
<list(a)><a>((*0*)) = strn_print(";")
*)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_length<list(a)><a> = list_length<a>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_forall<list(a)><a> = list_forall<a>
#impltmp
{a:t0}
gseq_foritm<list(a)><a> = list_foritm<a>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_listize<list(a)><a> = list_listize<a>
#impltmp
{a:t0}
gseq_strmize<list(a)><a> = list_strmize<a>
//
#impltmp
{a:t0}
gseq_rlistize<list(a)><a> = list_rlistize<a>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{b:t0}
gseq_map
<list(a)><a>
<list(b)><b>(*xs*) = list_map<a><b>
#impltmp
{a:t0}
{b:t0}
gseq_maprev
<list(a)><a>
<list(b)><b>(*xs*) = list_maprev<a><b>
//
#impltmp
{a:t0}
{b:vt}
gseq_map
<list(a)><a>
<list_vt(b)><b>(*xs*) = list_map_vt<a><b>
#impltmp
{a:t0}
{b:vt}
gseq_maprev
<list(a)><a>
<list_vt(b)><b>(*xs*) = list_maprev_vt<a><b>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{b:vt}
gseq_map_llist
<list(a)><a><b>(*xs*) = list_map_vt<a><b>
#impltmp
{a:t0}
{b:vt}
gseq_map_rllist
<list(a)><a><b>(*xs*) = list_maprev_vt<a><b>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_make_list
<list(a)><a>(xs) = xs // identity
//
#impltmp
{a:t0}
gseq_make_strm
<list(a)><a>(*xs*) = list_make_strm<a>(*xs*)
//
#impltmp
{a:t0}
gseq_make0_lstrm
<list(a)><a>(*xs*) = list_make0_lstrm<a>(*xs*)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_rmake_list
<list(a)><a>(*xs*) = list_reverse<a>(*xs*)
//
(*
#impltmp
{a:t0}
gseq_rmake_strm
<list(a)><a>(*xs*) = list_rmake_strm<a>(*xs*)
*)
//
(*
#impltmp
{a:t0}
gseq_rmake0_lstrm
<list(a)><a>(*xs*) = list_rmake0_lstrm<a>(*xs*)
*)
//
(* ****** ****** *)
//
#impltmp
{x0:t0}
gseq_mergesort
<list(x0)><x0>( xs ) = list_mergesort<x0>(xs)
#impltmp
{x0:t0}
gseq_mergesort_llist
<list(x0)><x0>( xs ) = list_mergesort_vt<x0>(xs)
//
(* ****** ****** *)
//
(*
For gmap-operations
#staload
"prelude/SATS/gmap.sats"
*)
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_make_nil
<list@(k0,x0)><k0><x0>
  ((*void*)) =
(
  list_nil((*void*)) )
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_keyq
<list@(k0,x0)><k0><x0>
  (kxs, key) =
(
  loop(kxs)) where
{
fun
loop
( kxs
: list@(k0,x0)): bool =
(
case+ kxs of
|
list_nil() => false
|
list_cons(kx1, kxs) =>
if
g_equal<k0>
(key, kx1.0) then true else loop(kxs)
)
} (*where*) // end of [gmap_keyq(...)]
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_search$opt
<list@(k0,x0)><k0><x0>
(kxs, key) =
(
  loop(kxs)) where
{
fun
loop
( kxs
: list@(k0,x0)): optn_vt(x0) =
(
case+ kxs of
|
list_nil() =>
optn_vt_nil(*void*)
|
list_cons(kx1, kxs) =>
if
g_equal<k0>
(key, kx1.0)
then optn_vt_cons(kx1.1) else loop(kxs)
)
} (*where*)//end-of-[gmap_search$opt(...)]
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_insert$opt
<list@(k0,x0)><k0><x0>
(kxs, key, itm) =
optn_vt_nil(*void*) where
{
val () =
( kxs := list_cons((key, itm), kxs) )
} (*where*)//end-of-[gmap_insert$opt(...)]
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize
<
list@(k0,x0)><k0><x0>(*0*) =
list_strmize<(k0, x0)>(*0*)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_key$strmize
<list@(k0,x0)><k0><x0>(kxs) =
(
gseq_map_lstrm<kxs><k0>(kxs)
) where
{
#typedef kxs = list@(k0,x0)
#impltmp map$fopr<(k0,x0)><k0>(kx) = kx.0
}
#impltmp
{k0:t0}
{x0:t0}
gmap_val$strmize
<list@(k0,x0)><k0><x0>(kxs) =
(
gseq_map_lstrm<kxs><x0>(kxs)
) where
{
#typedef kxs = list@(k0,x0)
#impltmp map$fopr<(k0,x0)><x0>(kx) = kx.1
}
//
(* ****** ****** *)
//
(*
For gseqn-operations
#staload
"prelude/SATS/gseqn00.sats"
*)
//
(* ****** ****** *)
//
(*
#impltmp
{a:t0}
gseqn_head<listn(a)><a> = list_head<a>
#impltmp
{a:t0}
gseqn_tail<listn(a)><a> = list_tail<a>
*)
//
(* ****** ****** *)
//
(*
#impltmp
{a:t0}
gseqn_nilq<listn(a)><a> = list_nilq{a}
#impltmp
{a:t0}
gseqn_consq<listn(a)><a> = list_consq{a}
*)
//
(* ****** ****** *)
//
(*
#impltmp
{a:t0}
gseqn_length<listn(a)><a> = list_length<a>
*)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_list000.dats] *)
