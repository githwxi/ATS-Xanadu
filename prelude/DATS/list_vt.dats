(* ****** ****** *)
(*
** for lists_vt
*)
(* ****** ****** *)

(*
#staload
"./../SATS/list_vt.sats"
*)

(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_sing(x0) =
list_vt_cons(x0, list_vt_nil())
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_pair(x0, x1) =
list_vt_cons(x0,
list_vt_cons(x1, list_vt_nil()))
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_make_nval
  (n0, x0) = let
//
fun
loop{i:nat}.<i>.
( i0
: int(i)
, r0
: &(?list_vt(a)) >> list_vt(a, i)
) : void =
if
(i0 = 0)
then
(r0 := list_vt_nil())
else let
  val x1 = g_copy<a>(x0)
  val () =
  (r0 := list_vt_cons(x1, _))
in
  loop(pred(i0), r0.1); $fold(r0)
end // end of [else]
//
in
let
var r0: list_vt(a) in loop(n0, r0); r0
end
end (* end of [list_vt_make_nval] *)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
list_vt_nilq
  (xs) =
(
case+ xs of
| !list_vt_nil() => true
| !list_vt_cons(_, _) => false
)
impltmp
<>(*tmp*)
list_vt_consq
  (xs) =
(
case+ xs of
| !list_vt_nil() => false
| !list_vt_cons(_, _) => (true)
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_free
  {n}(xs) =
( loop(xs) ) where
{
fun
loop
{n:nat}.<n>.
(xs: list_vt(a, n)): void =
(
case+ xs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
  val () = g_free<a>(x0) in loop(xs)
end
) (* end of [loop] *)
} (* end of [list_vt_free] *)
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_copy(xs) =
let
fun
loop
{n:nat}.<n>.
( xs
: !list_vt(a, n)
, r0
: &(?list_vt(a)>>list_vt(a, n))
) : void =
(
case+ xs of
| !
list_vt_nil() =>
(r0 := list_vt_nil())
| !
list_vt_cons(x0, xs) =>
let
  val x0 = g_copy<a>(x0)
  val () =
  (r0 := list_vt_cons(x0, _))
in
  loop(xs, r0.1); $fold(r0)
end
)
in
let
var r0: list_vt(a) in loop(xs, r0); r0
end
end // end of [list_vt_copy]
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_rcopy(xs) =
list_vt_rappend10<a>(xs, list_vt_nil())

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_length
  {n}(xs) =
( loop(xs, 0) ) where
{
fun
loop
{i,j:nat
|i+j = n}.<i>.
( xs:
! list_vt(a,i)
, ln: int( j )): int(n) =
(
case+ xs of
| !
list_vt_nil() => ln
| !
list_vt_cons(_, xs) => loop(xs, ln+1)
)
} endwhr // end of [length_vt_length]

(* ****** ****** *)
//
implement
<a>(*tmp*)
list_vt_extend
  (xs, x0) =
let
val ys =
list_vt_sing<a>(x0) in
list_vt_append<a>(xs, ys)
end // list_vt_extend
//
implement
<a>(*tmp*)
list_vt_append
  (xs, ys) =
(
let
var xs = xs
val () = loop(xs, ys) in xs
end
) where
{
//
fun
loop
{m,n:nat} .<m>.
( xs:
& list_vt(a, m) >>
  list_vt(a, m+n)
, ys:
~ list_vt(a, n)) : void =
(
case+ xs of
| ~
list_vt_nil() => xs := ys
| @
list_vt_cons(_, _) =>
let
  val () = loop(xs.1, ys)
in
  let prval () = $fold(xs) in () end
end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list_vt_append] *)
//
(* ****** ****** *)

implement
<a>(*tmp*)
list_vt_concat(xss) =
let
var
res:
list_vt(a) = list_vt_nil()
val () = auxmain(xss, &res) in res
end where
{
//
fun
auxnext
( res
: p2tr(list_vt(a))
)
: p2tr(list_vt(a)) =
let
val xs0 =
$UN.p2tr_get(res)
in
//
case+ xs0 of
|
list_vt_nil() =>
let
val
xs0 =
$UN.delinear(xs0) in res end
|
list_vt_cons(_, _) =>
let
val
res = &(xs0.1)
val
xs0 =
$UN.delinear(xs0) in auxnext(res) end
//
end // end of [auxnext]
fun
auxmain
( xss
: list_vt
  (list_vt(a))
, res
: p2tr(list_vt(a))): void =
(
case+ xss of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(xs0, xss) =>
let
  val () =
  $UN.p2tr_set(res, xs0)
  val res = auxnext(res) in auxmain(xss, res)
end // end of [let]
)
//
} (* end of [list_vt_concat] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_reverse(xs) =
list_vt_rappend<a>(xs, list_vt_nil())

(* ****** ****** *)

implement
<a>(*tmp*)
list_vt_rappend
  (xs, ys) =
(
  loop(xs, ys)
) where
{
//
fun
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
list_vt_nil() => ys0
| @
list_vt_cons(_, _) =>
let
  val xs1 = xs0.1
  val ( ) = xs0.1 := ys0
in
  $fold(xs0); loop(xs1, xs0)
end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list_vt_rappend] *)

(* ****** ****** *)

implement
<a>(*tmp*)
list_vt_rappend10
  (xs, ys) =
(
  loop(xs, ys)
) where
{
//
fun
loop
{m,n:nat} .<m>.
( xs0
: !list_vt(a, m)
, ys0
: ~list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| !
list_vt_nil() => ys0
| !
list_vt_cons(x0, xs1) =>
let
val x0 = g_copy<a>(x0)
in
loop(xs1, list_vt_cons(x0, ys0))
end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list_vt_rappend10] *)

(* ****** ****** *)

implement
<a>(*tmp*)
list_vt_rappend11
  (xs, ys) =
(
  loop(xs, ys)
) where
{
//
fun
loop
{m,n:nat} .<m>.
( xs0
: !list_vt(a, m)
, ys0
: !list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| !
list_vt_nil() =>
 list_vt_copy<a>(ys0)
| !
list_vt_cons(x0, xs1) =>
let
val x0 = g_copy<a>(x0)
in
loop(xs1, list_vt_cons(x0, ys0))
end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list_vt_rappend11] *)

(* ****** ****** *)
//
(*
HX-2019-10:
Quite an informative example:
*)
//
impltmp
<a>(*tmp*)
list_vt_tabulate_cfr
  {n}(n0, f0) = let
//
impltmp
tabulate$fopr<a><n>(i0) = f0(i0)
//
in
  list_vt_tabulate<a><n>(n0)
end // end of [list_vt_tabulate_cfr]
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_forall0
  (xs) =
  (loop(xs)) where
{
fun
loop
( xs
: list_vt(a)): bool =
(
case+ xs of
| ~
list_vt_nil() => true
| ~
list_vt_cons(x0, xs) =>
let
val
test = forall0$test<a>(x0)
in
//
if
test
then loop(xs)
else
let
val () =
list_vt_free<a>(xs) in false end
//
end // end of [list_vt_cons]
)
} (* end of [list_vt_forall0] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_forall1
  (xs) =
  (loop(xs)) where
{
fun
loop
( xs
: !list_vt(a)): bool =
(
case+ xs of
| !
list_vt_nil() => true
| !
list_vt_cons(x0, xs) =>
let
val
test = forall1$test<a>(x0)
in
//
if test then loop(xs) else false
//
end // end of [list_vt_cons]
)
} (* end of [list_vt_forall1] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_foreach0
  (xs) =
  (loop(xs)) where
{
fun
loop
( xs
: list_vt(a)): void =
(
case+ xs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
val () =
foreach0$work<a>(x0) in loop(xs)
end // end of [list_vt_cons]
)
} (* end of [list_vt_foreach0] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_foreach1
  (xs) =
  (loop(xs)) where
{
fun
loop
( xs
: list_vt(a)): void =
(
case+ xs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
val () =
foreach1$work<a>(x0) in loop(xs)
end // end of [list_vt_cons]
)
} (* end of [list_vt_foreach1] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_listize0(xs) = xs
impltmp
<a>(*tmp*)
list_vt_rlistize0(xs) =
  list_vt_reverse< a >( xs )
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_streamize(xs) =
let
fun
auxmain
( xs
: list_vt(a)): stream_vt(a) =
$llazy
(
g_free(xs);
case+ xs of
| ~
list_vt_nil() => strmcon_vt_nil()
| ~
list_vt_cons(x0, xs) =>
  strmcon_vt_cons(x0, auxmain(xs))
)
in auxmain(xs) end // list_vt_streamize

(* ****** ****** *)
//
impltmp
<x0><y0>
list_vt_map0(xs) = let
//
fun
loop{i:nat}.<i>.
( xs
: ~list_vt(x0, i)
, r0
: &(?list_vt(y0)) >> list_vt(y0, i)
) : void =
(
case+ xs of
| ~
list_vt_nil() =>
(r0 := list_vt_nil())
| ~
list_vt_cons(x0, xs) =>
let
  val y0 =
  map0$fopr<x0><y0>(x0)
  val () =
  (r0 := list_vt_cons(y0, _))
in
  loop(xs, r0.1); $fold(r0)
end
) (* end of [loop] *)
//
in
  let
  var r0: list_vt(y0)
  val () = loop(xs, r0) in r0 end
end (* end of [list_map0_vt] *)
//
(* ****** ****** *)

impltmp
<x0><y0>
list_vt_maprev0
  (xs) =
(
let
val ys =
list_vt_nil() in loop(xs, ys)
end
) where
{
//
fun
loop
{i,j:nat}.<i>.
( xs
: list_vt(x0, i)
, ys
: list_vt(y0, j))
: list_vt(y0, i+j) =
(
case+ xs of
| ~
list_vt_nil() => ys
| ~
list_vt_cons(x0, xs) =>
let
  val y0 =
  map0$fopr<x0><y0>(x0)
in
  loop(xs, list_vt_cons(y0, ys))
end
)
//
} (* end of [list_vt_maprev0] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_mergesort
  (xs) = let
//
typedef
xs = list_vt(a)
//
fun
amain
(xs: xs, n0: nint): xs =
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
}
//
and
split
( ys
: &xs >> xs
, n1: nint): xs =
(
if
(n1 >= 2)
then
split(ys.1, n1-1)
else
let
val zs = ys.1
in 
  ys.1 := list_vt_nil(); zs
end // end of [else]
)
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
val
sgn = gl_cmp00<a>(y0, z0)
in
if
(sgn <= 0)
then
let
val nd = ys
val ys = ys1
val () = $fold(zs)
in
  xs := nd;
  merge(ys, zs, xs.1); $fold(xs)
end
else
let
val nd = zs
val zs = zs1
val () = $fold(ys)
in
  xs := nd;
  merge(ys, zs, xs.1); $fold(xs)
end
end // list_vt_cons
) (* list_vt_cons] *)
) (* end of [merge] *)
//
in
  amain(xs, list_vt_length<a>(xs))
end (* end of [list_vt_mergesort] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_permutize
  (xs) = let
//
typedef
xs(n:int) = list_vt(a, n)
//
fun
auxmain1
{n:int}
( xs: xs(n)
, n0: int(n))
: stream_vt(xs(n)) =
if
n0 >= 2
then let
val
ys = list_vt_nil()
in
auxmain2(xs, ys, n0, 0)
end
else stream_vt_sing(xs)
//
and
auxmain2
{i,j:int
|i+j >= 2}
( xs: xs(i)
, ys: xs(j)
, i0: int(i)
, j0: int(j))
: stream_vt(xs(i+j)) =
$llazy
(
case+ xs of
| ~
list_vt_nil() =>
(
strmcon_vt_nil()
) where
{
val () =
list_vt_free<a>(ys)
}
| ~
list_vt_cons(x0, xs) =>
let
val n0 = i0+j0
val n1 = pred(n0)
val res1 =
auxmain1(xy, n1) where
{
val xy =
list_vt_rappend11(ys, xs)
}
val res1 =
stream_vt_map0
<xs(n1)><xs(n0)>(res1) where
{
sexpdef n0 = i+j
sexpdef n1 = n0-1
impltmp
map0$fopr
<xs(n1)><xs(n0)>(xx) = list_vt_cons(x0, xx)
}
in
let
  val
  ys =
  list_vt_cons(x0, ys)
  val
  res2 =
  auxmain2(xs, ys, i0-1, j0+1)
in
  !(stream_vt_append(res1, res2))
end
end
) (* end of [auxmain2] *)
//
in
auxmain1(xs, list_vt_length<a>(xs))
end (* end of [list_vt_permutize] *)

(* ****** ****** *)
//
// For glseq-operations
//
(* ****** ****** *)
//
impltmp
{a:vt}
glseq_nilq
<list_vt(a)><a> = list_vt_nilq
impltmp
{a:vt}
glseq_consq
<list_vt(a)><a> = list_vt_consq
//
(* ****** ****** *)
//
impltmp
{a:vt}(*tmp*)
g_free
<list_vt(a)> = list_vt_free<a>
//
impltmp
{a:vt}(*tmp*)
g_copy
<list_vt(a)> = list_vt_copy<a>
//
impltmp
{a:vt}
glseq_copy
<list_vt(a)><a> = list_vt_copy<a>
impltmp
{a:vt}
glseq_free
<list_vt(a)><a> = list_vt_free<a>
//
(* ****** ****** *)

impltmp
{a:vt}
glseq_uncons_raw
<list_vt(a)><a>(xs) =
let
val x0 = xs.0
val () = xs := xs.1 in x0 end

(* ****** ****** *)
//
impltmp
{a:vt}
glseq_listize0
<list_vt(a)><a>(xs) = xs
impltmp
{a:vt}
glseq_rlistize0
<list_vt(a)><a>(xs) =
list_vt_reverse<a>( xs )
//
(* ****** ****** *)

impltmp
{a:vt}
glseq_streamize
<list_vt(a)><a>(xs) =
list_vt_streamize<a>( xs )

(* ****** ****** *)
//
impltmp
{a:vt}
glseq_forall0
<list_vt(a)><a> = list_vt_forall0<a>
impltmp
{a:vt}
glseq_forall1
<list_vt(a)><a> = list_vt_forall1<a>
//
(* ****** ****** *)
//
impltmp
{a:vt}
glseq_foreach0
<list_vt(a)><a> = list_vt_foreach0<a>
impltmp
{a:vt}
glseq_foreach1
<list_vt(a)><a> = list_vt_foreach1<a>
//
(* ****** ****** *)
//
impltmp
{a:vt}
glseq_map0_list<list_vt(a)><a> = list_vt_map0<a>
impltmp
{a:vt}
glseq_map0_rlist<list_vt(a)><a> = list_vt_maprev0<a>
//
(* ****** ****** *)

(* end of [list_vt.dats] *)
