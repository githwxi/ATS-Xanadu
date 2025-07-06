(* ****** ****** *)
(*
** For lists_vt
*)
(* ****** ****** *)
(*
#staload
"./../SATS/list_vt.sats"
*)
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
list_vt_nil_
() = list_vt_nil()
#impltmp
<a>(*tmp*)
list_vt_cons_
(x0, xs) =
list_vt_cons(x0, xs)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_sing(x0) =
list_vt_cons(x0, list_vt_nil())
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_pair(x0, x1) =
list_vt_cons(x0,
list_vt_cons(x1, list_vt_nil()))
//
(* ****** ****** *)
//
(*
HX: lense:
[free] is [free0]!
*)
#impltmp
<a>(*tmp*)
list_vt_free
  {n}(xs) =
( loop(xs) ) where
{
//
fnx
loop
{n:nat}.<n>.
( xs:
~ list_vt(a, n)): void =
(
case+ xs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
  val () =
  g_free<a>(x0) in loop(xs) end)
//
}(*where*)//end-of-[list_vt_free(xs)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_tail0(xs) =
case- !xs of
| ~
list_vt_cons(x0, xs) =>
let
val () = g_free<a>(x0) in xs end
(* let *)//end-of-[list_vt_tail0(xs)]
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_copy(xs) =
let
//
fnx
loop
{n:nat}.<n>.
( xs:
! list_vt(a,n)
, r0:
& (?list_vt(a)>>list_vt(a,n))
) : void =
(
//
case+ xs of
| // !
list_vt_nil() =>
(r0 := list_vt_nil())
| // !
list_vt_cons(x0, xs) =>
let
val x0 = g_copy<a>(x0)
val () =
(r0 := list_vt_cons(x0, _))
in//let
  loop(xs, r0.1); $fold(r0) end)
//
in//let
let
var r0:
list_vt(a) in loop(xs, r0); r0 end
end (*let*) // end of [list_vt_copy]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_rcopy(xs) =
let
val ys = list_vt_nil()
in//let
  list_vt_rappend10<a>(xs, ys) end
// (*let*) // end of [list_vt_rcopy]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
list_vt_nilq1
  (xs) =
(
case+ xs of
| // !
list_vt_nil() => true
| // !
list_vt_cons(_, _) => false)//nilq1
//
#impltmp
<>(*tmp*)
list_vt_consq1
  (xs) =
(
case+ xs of
| // !
list_vt_nil() => false
| // !
list_vt_cons(_, _) => (true))//consq1
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_length1
  {n}(xs) =
( loop(xs, 0) ) where
{
fnx
loop
{i,j:nat
|i+j = n}.<i>.
( xs:
! list_vt(a,i)
, ln: int( j )): int(n) =
(
case+ xs of
| // !
list_vt_nil() => ln
| // !
list_vt_cons(_, xs) => loop(xs, ln+1)
)
} (*where*) // end of [list_vt_length1]
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_make_ncpy
  (n0, x0) = let
//
fnx
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
in // let
(
  loop(pre(i0), r0.1); $fold(r0) )
end // end of [else]
//
in
let
var r0: list_vt(a) in loop(n0, r0); r0
end
end (* end of [list_vt_make_ncpy] *)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_make_strm = strm_listize<a>
#impltmp
<a>(*tmp*)
list_vt_make0_lstrm = strm_vt_listize0<a>

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_extend0
  (xs, x0) =
let
val ys =
list_vt_sing<a>(x0)
in//let
(
  list_vt_append0<a>(xs, ys) )
end (*let*)//end-of-(list_vt_extend0(xs))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_append0
  (xs, ys) =
(
let
var xs = xs
val () = loop(xs, ys) in xs
end
) where
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
list_vt_nil() => xs := ys
| @
list_vt_cons(_, _) =>
let
  val () = loop(xs.1, ys)
in
let
prval () = $fold(xs) in () end
end // end of [list_vt_cons]
) (*case*) // end of [loop(xs, ys)]
//
} (* end of [list_vt_append0(xs,ys)] *)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_append1
  (xs, ys) =
(
list_vt_append0<a>(xs, ys)
) where
{
  val xs = list_vt_copy<a>(xs)
  and ys = list_vt_copy<a>(ys)
} (* end of [list_vt_append1(xs,ys)] *)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_concat0(xss) =
let
var
res:
list_vt(a) = list_vt_nil()
val () = auxmain(xss, &res) in res
end where
{
//
fnx
auxnext
( res
: p2tr(list_vt(a))
)
: p2tr(list_vt(a)) =
let
val xs0 =
$UN.p2tr_get(res)
in//let
//
case+ xs0 of
| @
list_vt_nil() =>
let
val
xs0 =
$UN.delinear(xs0) in res end
| @
list_vt_cons(_, _) =>
let
val
res = &(xs0.1)
val
xs0 =
$UN.delinear(xs0) in auxnext(res) end
//
end // end of [auxnext]
//
fnx
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
} (* end of [list_vt_concat0] *)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_reverse0(xs) =
list_vt_rappend00<a>(xs, list_vt_nil())

(* ****** ****** *)

#impltmp
<a>(*tmp*)
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
list_vt_nil() => ys0
| @
list_vt_cons(_, _) =>
let
  val xs1 = xs0.1
  val ( ) = xs0.1 := ys0
in
  $fold(xs0); loop(xs1, xs0)
end // end of [list_vt_cons]
) (* end of [loop(xs0, ys0)] *)
//
} (* end of [list_vt_rappend00] *)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_rappend10
  (xs, ys) =
(
  loop(xs, ys)) where
{
//
fnx
loop
{m,n:nat} .<m>.
( xs0:
! list_vt(a, m)
, ys0:
~ list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| // !
list_vt_nil() => ys0
| // !
list_vt_cons(x0, xs1) =>
let
val x0 = g_copy<a>(x0)
in
loop
(xs1, list_vt_cons(x0, ys0))
end // end of [list_vt_cons]
) (* end of [loop(xs0, ys0)] *)
//
} (* end of [list_vt_rappend10] *)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_rappend11
  (xs, ys) =
(
  loop(xs, ys)) where
{
//
fnx
loop
{m,n:nat} .<m>.
( xs0:
! list_vt(a, m)
, ys0:
! list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| // !
list_vt_nil() =>
 list_vt_copy<a>(ys0)
| // !
list_vt_cons(x0, xs1) =>
let
val x0 = g_copy<a>(x0)
in
loop
(xs1, list_vt_cons(x0, ys0))
end // end of [list_vt_cons]
) (* end of [loop(xs0, ys0)] *)
//
} (* end of [list_vt_rappend11] *)

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
list_vt_tabulate$f1un
  {n}(n0, f0) = let
//
#impltmp
tabulate$fopr<a><n>(i0) = f0(i0)
//
in
  list_vt_tabulate<a><n>(n0)
end // end of [list_vt_tabulate$f1un]
*)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_forall0
  (xs) =
  (loop(xs)) where
{
fnx
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
test = forall$test0<a>(x0)
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
}(*where*)//end-of-[list_vt_forall0]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_forall1
  (xs) =
  (loop(xs)) where
{
fnx
loop
(xs:
!list_vt(a)): bool =
(
case+ xs of
| // !
list_vt_nil() => true
| // !
list_vt_cons(x0, xs) =>
let
val
test = forall$test1<a>(x0)
in//let
//
if test then loop(xs) else false
//
end // end of [list_vt_cons]
)
}(*where*)//end-of-[list_vt_forall1]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_forall2
  (xs) =
  (loop(xs)) where
{
fnx
loop
(xs:
!list_vt(a)): bool =
(
case+ xs of
| // !
list_vt_nil() => true
| // !
list_vt_cons(!x0, xs) =>
let
val
test = forall$test2<a>(x0)
in//let
//
if test then loop(xs) else false
//
end // end of [list_vt_cons]
)
}(*where*)//end-of-[list_vt_forall2]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_foritm0
  (xs) =
  (loop(xs)) where
{
fnx
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
foritm$work0<a>(x0) in loop(xs)
end // end of [list_vt_cons]
)
}(*where*)//end-of-[list_vt_foritm0]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_foritm1
  (xs) =
  (loop(xs)) where
{
fnx
loop
( xs
: list_vt(a)): void =
(
case+ xs of
| // !
list_vt_nil() => ()
| // !
list_vt_cons(x0, xs) =>
let
val () =
foritm$work1<a>(x0) in loop(xs)
end // end of [list_vt_cons]
)
}(*where*)//end-of-[list_vt_foritm1]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_foritm2
  (xs) =
  (loop(xs)) where
{
fnx
loop
( xs
: list_vt(a)): void =
(
case+ xs of
| // !
list_vt_nil() => ()
| // !
list_vt_cons(!x0, xs) =>
let
val () =
foritm$work2<a>(x0) in loop(xs)
end // end of [list_vt_cons]
)
}(*where*)//end-of-[list_vt_foritm2]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_listize0(xs) = xs
#impltmp
<a>(*tmp*)
list_vt_rlistize0(xs) =
(
  list_vt_reverse0< a >( xs )
)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_vt_strmize0(xs) =
let
fun
auxmain
( xs
: list_vt(a)): strm_vt(a) =
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
in auxmain(xs) end // list_vt_strmize0

(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_vt_map0(xs) = let
//
fnx
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
  map$fopr0<x0><y0>(x0)
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
end (*let*)//end of [list_vt_map0_vt(...)]
//
(* ****** ****** *)

#impltmp
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
fnx
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
  map$fopr0<x0><y0>(x0)
in
  loop(xs, list_vt_cons(y0, ys))
end
)
//
}(*where*)//end-of-[list_vt_maprev0(xs)]

(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_mergesort1
  (xs) = // [xs] is kept!
(
  list_vt_mergesort0(xs))
where
{
  val xs = list_vt_copy<a>(xs) }//where
//
//
#impltmp
<a>(*tmp*)
list_vt_permutize1
  (xs) = // [xs] is kept!
(
  list_vt_permutize0<a>(xs))
where
{
  val xs = list_vt_copy<a>(xs) }//where
//
(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_mergesort0
  (xs) = let
//
#vwtpdef
xs = list_vt(a)
//
fnx
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
} (*where*) // end of [amain(xs, n0)]
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
val zs = ys.1 in//let
(
ys.1 :=
list_vt_nil<a>(); zs)
endlet // end of [else]
) (* ift *) // end of [split(ys, n1)]
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
sgn = g_cmp11<a>(y0, z0)
in//let
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
end
else
let
val nd = zs
val zs = zs1
val () = $fold(ys)
in//let
  xs := nd;
  merge(ys, zs, xs.1); $fold(xs)
end
end // list_vt_cons
) (*case+*) // list_vt_cons(y0,ys1)]
) (*case+*) // end of [merge(ys,zs,xs)]
//
in//let
(
  amain(xs, list_vt_length1<a>(xs)) )
end(*let*)//end of [list_vt_mergesort0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_permutize0
  (xs) = let
//
#vwtpdef
xs(n:int) =
list_vt(a, n)
//
fun
auxmain1
{n:int}
( xs: xs(n)
, n0: int(n))
: strm_vt(xs(n)) =
(
if
n0 >= 2
then let
val
ys = list_vt_nil()
in//let
auxmain2(xs, ys, n0, 0)
end else strm_vt_sing(xs))
//
and
auxmain2
{i,j:int
|i+j >= 2}
( xs: xs(i)
, ys: xs(j)
, i0: int(i)
, j0: int(j))
: strm_vt(xs(i+j)) =
$llazy
(
case+ xs of
//
| ~
list_vt_nil() =>
(
strmcon_vt_nil()
) where
{
val () =
list_vt_free<a>(ys)}
//
| ~
list_vt_cons(x0, xs) =>
let
val n0 = i0+j0
val n1 = pre(n0)
val res1 =
auxmain1(xy, n1) where
{
val xy =
list_vt_rappend11(ys, xs)
}
val res1 =
strm_vt_map0
<xs(n1)><xs(n0)>(res1) where
{
#sexpdef n0 = i+j
#sexpdef n1 = n0-1
#impltmp
map$fopr0
<xs(n1)>
<xs(n0)>(xx) = list_vt_cons(x0, xx)
}
in//let
let
  val
  ys =
  list_vt_cons(x0, ys)
  val
  res2 =
  auxmain2(xs, ys, i0-1, j0+1)
in//let
  strm_vt_eval
  (strm_vt_append0(res1, res2)) end
end//let
) (*case+*) // end of [auxmain2(...)]
//
in//let
(
  auxmain1(xs, list_vt_length1<a>(xs)))
end(*let*)//end of [list_vt_permutize0(xs)]

(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_prefixq0
  (xs1, xs2) =
(
  auxloop(xs1, xs2)
) where
{
fun
auxloop
( xs1
: list_vt(a)
, xs2
: list_vt(a)): bool =
(
case+ xs1 of
| ~
list_vt_nil() =>
(g_free(xs2); true)
| ~
list_vt_cons(x1, xs1) =>
(
  case+ xs2 of
  | ~
  list_vt_nil() =>
  ( g_free(x1)
  ; g_free(xs1); false)
  | ~
  list_vt_cons(x2, xs2) =>
  let
    val
    sgn = g_cmp00<a>(x1, x2)
  in
    if
    (sgn = 0)
    then auxloop(xs1, xs2)
    else
    (g_free(xs1); g_free(xs2); false)
  end // end of [let]
)
) (* end of [auxloop] *)
} (*where*)//end-of-[list_vt_prefixq0(...)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_vt_suffixq0
  (xs1, xs2) =
let
  val xs1 =
  list_vt_reverse0(xs1)
  and xs2 =
  list_vt_reverse0(xs2)
in
  list_vt_prefixq0<a>(xs1, xs2)
end (*let*)//end of [list_vt_suffixq0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX:
For implementing g-ops
*)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{a:vt}(*tmp*)
g_free
<list_vt(a)> = list_vt_free<a>
//
#impltmp
{a:vt}(*tmp*)
g_copy
<list_vt(a)> = list_vt_copy<a>
//
(* ****** ****** *)
//
(*
HX:
For implementing gseq-ops
*)
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_nilq1
<list_vt(a)><a> = list_vt_nilq1{a}
#impltmp
{a:vt}
gseq_consq1
<list_vt(a)><a> = list_vt_consq1{a}
//
(* ****** ****** *)
//
(*
#impltmp
{a:vt}
gseq_uncons1_raw
<list_vt(a)><a>(xs) =
let
  val x0 = xs.0
  val () = xs := xs.1 in ( x0 )
end // end-of(gseq_uncons_raw(xs))
*)
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_copy
<list_vt(a)><a> = list_vt_copy<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_free
<list_vt(a)><a> = list_vt_free<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_listize0
<list_vt(a)><a>(xs) = xs
#impltmp
{a:vt}
gseq_rlistize0
<list_vt(a)><a>(xs) =
( list_vt_reverse0<a>( xs ) )
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_strmize0
<list_vt(a)><a> = list_vt_strmize0<a>
//
(* ****** ****** *)
//
(*
#impltmp
{a:t0}
gseq_make_list
<list_vt(a)><a> = list_copy_vt<a>
*)
//
(*
#impltmp
{a:t0}
gseq_make_strm
<list_vt(a)><a> = list_make_strm_vt<a>
*)
//
#impltmp
{a:vt}
gseq_make0_llist
<list_vt(a)><a>(xs) = xs // identity
//
#impltmp
{a:vt}
gseq_make0_lstrm
<list_vt(a)><a> = list_vt_make0_lstrm<a>
//
(* ****** ****** *)
//
(*
#impltmp
{a:t0}
gseq_rmake_list
<list_vt(a)><a> = list_reverse_vt<a>
*)
//
#impltmp
{a:vt}
gseq_rmake0_llist
<list_vt(a)><a> = list_vt_reverse0<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_forall0
<list_vt(a)><a> = list_vt_forall0<a>
#impltmp
{a:vt}
gseq_forall1
<list_vt(a)><a> = list_vt_forall1<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gseq_foritm0
<list_vt(a)><a> = list_vt_foritm0<a>
#impltmp
{a:vt}
gseq_foritm1
<list_vt(a)><a> = list_vt_foritm1<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
{b:vt}
gseq_map0_llist
<list_vt(a)><a><b> = list_vt_map0<a><b>
#impltmp
{a:vt}
{b:vt}
gseq_map0_rllist
<list_vt(a)><a><b> = list_vt_maprev0<a><b>
//
#impltmp
{a:vt}
{b:vt}
gseq_map1_llist
<list_vt(a)><a><b> = list_vt_map1<a><b>
#impltmp
{a:vt}
{b:vt}
gseq_map1_rllist
<list_vt(a)><a><b> = list_vt_maprev1<a><b>
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_list000_vt.dats] *)
