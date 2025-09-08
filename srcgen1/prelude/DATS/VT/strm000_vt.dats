(* ****** ****** *)
(*
** HX: For
** lin-streams which
** are possibly infinite
*)
(* ****** ****** *)
#abstbox box_tx
#typedef box = box_tx
(* ****** ****** *)
//
#staload UN = //HX:unsafe
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
(*
HX-2020-03-21
This is a bit wild :)
*)
//
#impltmp
<a>(*tmp*)
strm_vt2t(xs) =
(
auxmain
($UN.castlin01(xs))
) where
{
fun
auxmain
(xs: box): strm(a) =
$lazy
(
let
val xs =
$UN.castlin10{strm_vt(a)}(xs)
val r0 = !xs
in
//
case+ r0 of
| ~
strmcon_vt_nil
  () =>
  strmcon_nil((*void*))
| @
strmcon_vt_cons
  (x0, xs) =>
let
val xs =
$UN.castlin10{box}(xs)
val () =
( r0.1 := auxmain(xs) )
in//let
(
$UN.castlin10{strmcon(a)}(r0))end
//
end // end of [let]
)
} (*where*) // end of [strm_vt2t(xs)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strx_vt2t(xs) =
(
auxmain
($UN.castlin01(xs))
) where
{
fun
auxmain
(xs: box): strx(a) =
$lazy
(
let
val xs =
$UN.castlin10{strx_vt(a)}(xs)
val r0 = !xs
in
//
case+ r0 of
| @
strxcon_vt_cons
  (x0, xs) =>
let
val xs =
$UN.castlin10{box}(xs)
val () =
( r0.1 := auxmain(xs) )
in//let
(
$UN.castlin10{strxcon(a)}(r0))end
//
end // end of [let]
)
} (*where*) // end of [strx_vt2t(xs)]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strm_vt_nil() =
(
$llazy
(strmcon_vt_nil()) )
//
#impltmp
<a>(*tmp*)
strm_vt_cons
  (x0, xs) =
(
$llazy
(
g_free(x0);
g_free(xs);
strmcon_vt_cons(x0, xs)) )
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_sing(x0) =
(
strm_vt_cons<a>
(x0, strm_vt_nil<>{a}()) )
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_pair(x0, y0) =
(
  strm_vt_cons<a>
  (x0, strm_vt_sing<a>(y0)) )
//  
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_eval(xs) = (   !xs   )
#impltmp
<a>(*tmp*)
strx_vt_eval(xs) = (   !xs   )
#impltmp
<a>(*tmp*)
strq_vt_eval(xs) = (   !xs   )
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_free(xs) = ($free(xs))
#impltmp
<a>(*tmp*)
strq_vt_free(xs) = ($free(xs))
#impltmp
<a>(*tmp*)
strx_vt_free(xs) = ($free(xs))
//
(* ****** ****** *)
//
(*
HX-2024-01-03:
Wed Jan  3 07:47:36 EST 2024
*)
#impltmp
<a>(*tmp*)
strm_vt_tail0(xs) =
case- !xs of
| ~
strmcon_vt_cons(x0, xs) =>
let
val () = g_free<a>(x0) in xs end
//
(* ****** ****** *)
//
(*
HX-2022-07-03:
Sun Jul  3 13:01:34 EDT 2022
*)
//
#impltmp
<a>(*tmp*)
strm_vt_from
  (  x0  ) =
(
  auxmain(x0)) where
{
fun
auxmain
( x0: a)
: strm_vt(a) = $llazy
(
strmcon_vt_cons
(x0, auxmain(x1)) where
{
val x1 =
strm_vt_from$next<a>(x0) }
)(*llazy*)//end-of-[auxmain(x0)]
}(*where*)//end-of-[strm_vt_from]
//
#impltmp
<a>(*tmp*)
strx_vt_from
  (  x0  ) =
(
auxmain(x0) ) where
{
fun
auxmain
( x0: a)
: strx_vt(a) = $llazy
(
strxcon_vt_cons
(x0, auxmain(x1)) where
{
val x1 =
strx_vt_from$next<a>(x0) }
)(*llazy*)//end-of-[auxmain(x0)]
}(*where*)//end-of-[strx_vt_from]
//
#impltmp
{a:t0}(*tmp*)
strm_vt_from$next<a>
  ( x0 ) = g_suc<a>(x0)//default
#impltmp
{a:t0}(*tmp*)
strx_vt_from$next<a>
  ( x0 ) = g_suc<a>(x0)//default
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_length0(xs) =
(
strm_vt_foldl0<a><nint>(xs, 0)
) where
{
//
#impltmp
foldl$fopr0<a><nint>(r0, x0) =
let
val () = g_free<a>(x0) in suc(r0)
end // let // end of [foldl$fopr0]
//
} (*where*)//end-of-(strm_vt_length0)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_range_lt
  (s1, f2) =
(
auxmain(s1,f2)) where
{
//
fun
auxmain
( s1: a
, f2: a): strm_vt(a) = $llazy
(
if
g_lt<a>(s1,f2)
then
strmcon_vt_cons
( s1
, auxmain
  (g_suc<a>(s1), f2))
else
(
  strmcon_vt_nil(*void*)))(*auxmain*)
//
}(*where*)//end-of-(strm_vt_range_lt(s1,f2))

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_range_lte
  (s1, f2) =
(
auxmain(s1,f2)) where
{
//
fun
auxmain
( s1: a
, f2: a): strm_vt(a) = $llazy
(
if
g_lte<a>(s1,f2)
then
strmcon_vt_cons
( s1
, auxmain
  (g_suc<a>(s1), f2))
else
(
  strmcon_vt_nil(*void*)))(*auxmain*)
//
}(*where*)//end-of-(strm_vt_range_lt(s1,f2))

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_listize0(xs) =
let
//
fnx
loop
( xs
: strm_vt(a)
, r0:
& (?list_vt(a))>>list_vt(a)
) : void =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(r0 := list_vt_nil())
| ~
strmcon_vt_cons(x0, xs) =>
let
val () =
(r0 := list_vt_cons(x0, _))
in//let
  loop(xs, r0.1)
(*
HX-2025-05-02:
This is correct but
there is no TCO support
for it in srcgen1-xats2js!
  loop(xs, r0.1); $fold(r0) *)
end//let
) (*case+*) // end of [loop(xs,r0)]
//
in
let
var r0: list_vt(a)
val () = loop(xs, r0) in r0 endlet
end (*let*)//end-of(strm_vt_listize0(xs))

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_rlistize0(xs) =
(
  loop(xs, list_vt_nil())
) where
{
fnx
loop
( xs
: strm_vt(a)
, r0: list_vt(a)): list_vt(a) =
(
case+ !xs of
|
strmcon_vt_nil() => r0
|
strmcon_vt_cons(x0, xs) =>
let
val r0 =
list_vt_cons(x0,r0) in loop(xs,r0)
end//let
) (*case+*)
} (*where*)//end-of(strm_vt_rlistize0(xs))

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_strmize0(xs) = ( xs ) // identity
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_extend0
  (xs, x0) =
(
  strm_vt_append0<a>
  (xs, strm_vt_sing<a>(x0))
)
//
#impltmp
<a>(*tmp*)
strm_vt_append0
  (xs, ys) =
(
  auxmain(xs, ys) ) where
{
fun
auxmain
( xs: strm_vt(a)
, ys: strm_vt(a)): strm_vt(a) =
$llazy
(
g_free(xs);
g_free(ys);
case+ !xs of
| ~
strmcon_vt_nil() => !ys
| ~
strmcon_vt_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs, ys))
) (*case+*)
} (*where*)//end-of(strm_vt_append0(xs,ys))

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_concat0
  (xss) =
(
  auxmain0(xss)) where
{
//
fnx
auxmain0(xss) =
$llazy
(
g_free(xss); auxloop2(xss))
//
and
auxmain1(xss, xs0) = $llazy
(
g_free(xss);
g_free(xs0);
(
case+ !xs0 of
| ~
strmcon_vt_nil() => auxloop2(xss)
| ~
strmcon_vt_cons(x0, xs1) =>
strmcon_vt_cons(x0, auxmain1(xss, xs1)))
) (*case+*)//end-of-[auxmain1(xss)]
//
and
auxloop2(xss) =
(
case+ !xss of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(xs0, xss) =>
(
case+ !xs0 of
| ~
strmcon_vt_nil() => auxloop2(xss)
| ~
strmcon_vt_cons(x0, xs1) =>
strmcon_vt_cons(x0, auxmain1(xss, xs1)))
) (*case+*)//end-of-[auxloop2(xss)]
//
} (*where*)//end-of(strm_vt_concat0( xss ))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_prefixq0
  (xs1, xs2) =
(
  auxloop(xs1, xs2)
) where
{
fun
auxloop
( xs1
: strm_vt(a)
, xs2
: strm_vt(a)): bool =
(
case+ !xs1 of
| ~
strmcon_vt_nil() =>
(g_free(xs2); true)
| ~
strmcon_vt_cons(x1, xs1) =>
(
case+ !xs2 of
| ~
strmcon_vt_nil() =>
( g_free(x1)
; g_free(xs1); false)
| ~
strmcon_vt_cons(x2, xs2) =>
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
) (*case+*) // end of [auxloop(...)]
} (*where*) // end-of(strm_vt_prefixq0(...))

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_vt_fset$at0
  (xs, i0, x0) =
(
auxmain
(xs, 0(*i1*), x0)
) where
{
fun
auxmain
( xs
: strm_vt(x0)
, i1: nint, x0: x0) =
$llazy
(
g_free(xs);
g_free(x0);
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x1, xs) =>
if
(i1 < i0)
then
strmcon_vt_cons
(x1, auxmain(xs, i1+1, x0))
else
let
val () =
g_free(x1) in strmcon_vt_cons(x0, xs)
end // end of [else]
)
}(*where*)//end-of-[strm_vt_fset$at0(...)]

(* ****** ****** *)
//
#impltmp
<xs><x0>
strm_vt_gappend0
  (xs1, xs2) = let
//
val xs1 =
gseq_strmize0<xs><x0>(xs1)
val xs2 =
gseq_strmize0<xs><x0>(xs2)
//
in
(
  strm_vt_append0<x0>(xs1, xs2) )
end(*let*)//end-of(strm_vt_gappend0(...))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
strm_vt_gconcat0
  (xss) =
(
auxmain(xss)) where
{
fun
auxmain(xss) = $llazy
(
g_free(xss);
case+ !xss of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(xs0, xss) => !
(
strm_vt_append0<x0>
(gseq_strmize0<xs><x0>(xs0),auxmain(xss)))
)
}(*where*) // end-of-[strm_vt_gconcat0(xss)]
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_sortedq0
  ( xs ) =
(
case+ !xs of
| ~
strmcon_vt_nil
((*void*)) => true
| ~
strmcon_vt_cons
( x0, xs ) => loop(x0, xs)
) where
{
fnx
loop
( x0: a
, xs: strm_vt(a)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
let
val () = g_free<a>(x0) in true end
| ~
strmcon_vt_cons(x1, xs) =>
if
(x0 <= x1)
then
(g_free(x0); loop(x1, xs))
else
(g_free(x0);g_free(x1);g_free(xs);false)
)
} (*where*) // end-of-[strm_vt_sortedq0(xs)]

(* ****** ****** *)
(*
#impltmp
<a>(*tmp*)
<n:i0>(*tmp*)
strm_vt_tabulate
  ( n0 ) =
(
auxmain(0(*i0*))) where
{
fun
auxmain
{i:nat
|i<=n}
(i0: sint(i)): strm_vt(a) = $llazy
(
if
(i0 >= n0)
then strmcon_vt_nil() else
let
val x0 = tabulate$fopr<a><n>(i0)
in//let
strmcon_vt_cons(x0, auxmain(suc(i0)))
end // let // end-of-[ auxmain(i0) ]
)
}(*where*) // end of [strm_vt_tabulate(n0)]
*)
(* ****** ****** *)
//
(*
#impltmp
<a>(*tmp*)
strm_vt_tabulate$f1un
  {n}(n0, f0) =
(
strm_vt_tabulate<a><n>(n0)
) where
{ #impltmp
  tabulate$fopr<a><n>(i0) = f0(  i0  )
}(*where*) // end-of-[strm_vt_tabulate$f1un]
*)
//
(* ****** ****** *)

#impltmp
<x0><r0>
strm_vt_foldl0
  (xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  strm_vt_foritm0<x0>(xs)
) where
{
#impltmp
foritm$work0<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldl$fopr0<x0><r0>(r0, x0))
//
end // end of [foritm$work0]
}
//
}(*where*)//end-of(strm_foldl0/foritm0...)

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_vt_forall0
  (xs) =
( loop(xs) ) where
{
fnx
loop
( xs
: strm_vt(x0)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() => true
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  test = forall$test0<x0>(x0)
in//let
if
test
then loop(xs) else (g_free(xs); false)
end// let // end of [ loop(xs) ]
) (* end of [loop] *)
} (*where*) // end-of-[strm_vt_forall0(xs)]

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_vt_foritm0
  (xs) = let
//
val
test =
strm_vt_forall0<x0>(xs) where
{
#impltmp
forall$test0<x0>(x0) =
let
val () = foritm$work0<x0>(x0) in true
end
}
//
in
  // nothing
end(*let*)//end(strm_vt_foritm0/forall0,...)

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_map0
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain
( xs
: strm_vt(x0)
)
: strm_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil((*void*))
| ~
strmcon_vt_cons(x0, xs) =>
let
  val y0 =
  map$fopr0<x0><y0>(x0)
in
  strmcon_vt_cons(y0, auxmain(xs))
end//let//end-[strmcon_vt_cons]
) (*llazy*) // end of [auxmain(xs)]
} (*where*) // end-of-( strm_vt_map0(xs) )

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_vt_filter0
  (xs) =
(
auxmain(xs)) where
{
//
fnx
auxmain
( xs
: strm_vt(x0)
)
: strm_vt(x0) =
$llazy
(g_free(xs); auxloop(xs))
//
and
auxloop
( xs
: strm_vt(x0)
)
: strmcon_vt(x0) =
(
case+ !xs of
| ~
strmcon_vt_nil
  () =>
strmcon_vt_nil()
| ~
strmcon_vt_cons
  (x0, xs) =>
( if
  filter$test1<x0>(x0)
  then
  strmcon_vt_cons(x0, auxmain(xs))
  else
  let
  val () = g_free(x0) in auxloop(xs)
  end // end of [if]
) (* end of [strmcom_vt_cons] *)
)
//
} (*where*) // end of [strm_vt_filter0(xs)]

(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_drop0
  (xs, n0) =
(
strm_vt_idropif0<x0>(xs)) where
{
#impltmp
idropif$test0<x0>(i0, x0) = (i0 < n0)
} (*where*)//end-of(gseq_drop0/idropif0...)
//
#impltmp
<x0>(*tmp*)
strm_vt_take0
  (xs, n0) =
(
strm_vt_itakeif0<x0>(xs)) where
{
#impltmp
itakeif$test0<x0>(i0, x0) = (i0 < n0)
} (*where*)//end-of(gseq_take0/itakeif0...)
//
#impltmp
<x0>(*tmp*)
strm_vt_dropif0
  ( xs ) =
(
strm_vt_idropif0<x0>(xs)) where
{
#impltmp
idropif$test0<x0>(i0,x0) = dropif$test0<x0>(x0)
}(*where*)//end-of(strm_vt_dropif0/idropif0)
//
#impltmp
<x0>(*tmp*)
strm_vt_takeif0
  ( xs ) =
(
strm_vt_itakeif0<x0>(xs)) where
{
#impltmp
itakeif$test0<x0>(i0,x0) = takeif$test0<x0>(x0)
}(*where*)//end-of(strm_vt_takeif0/itakeif0)
//
(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_mapopt0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: strm_vt(x0)
)
: strm_vt(y0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
(*
  val
  opt =
  mapopt$fopr0<x0><y0>(x0)
*)
  val
  opt = filter$test1<x0>(x0)
in
(*
  case+ opt of
  | optn_vt_nil() =>
    auxloop($eval(xs)) // tail-call
  | optn_vt_cons(y0) =>
    strmcon_vt_cons(y0, auxmain(xs))
*)
  if
  opt
  then
  let
    val y0 =
    map$fopr0<x0><y0>(x0)
  in
    strmcon_vt_cons(y0, auxmain(xs))
  end
  else
  let
    val () =
    g_free(x0) in auxloop($eval(xs))
  end
//
end // end of [strmcon_vt_cons]
)
} (*where*) // end of [strm_vt_mapopt0(xs)]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_mapoptn0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: strm_vt(x0)
)
: strm_vt(y0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  opt =
  mapoptn$fopr0<x0><y0>(x0)
in
  case+ opt of
  | optn_vt_nil() =>
    auxloop($eval(xs)) // tail-call
  | optn_vt_cons(y0) =>
    strmcon_vt_cons(y0, auxmain(xs))
//
end // end of [strmcon_vt_cons]
)
} (*where*) // end-of(strm_vt_mapoptn0(xs))

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_maplist0
  (xs) =
(
  auxmain0(xs)
) where
{
fnx
auxmain0
( xs
: strm_vt(x0)
)
: strm_vt(y0) =
$llazy
(
g_free(xs);
auxloop2($eval(xs)))
//
and
auxmain1
( xs
: strm_vt(x0)
, ys: list_vt(y0)
) : strm_vt(y0) =
$llazy
(
g_free(xs);
g_free(ys);
case+ ys of
| ~
list_vt_nil() =>
auxloop2($eval(xs))
| ~
list_vt_cons(y0, ys) =>
strmcon_vt_cons(y0, auxmain1(xs, ys))
)
//
and
auxloop2
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  ys =
  maplist$fopr0<x0><y0>(x0)
in
case+ ys of
| ~
list_vt_nil() =>
auxloop2($eval(xs)) // tail-call
| ~
list_vt_cons(y0, ys) =>
strmcon_vt_cons(y0, auxmain1(xs, ys))
end // end of [strmcon_vt_cons]
)
} (*where*) // end of [strm_vt_maplist0(xs)]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_mapstrm0
  (xs) =
(
  auxmain0(xs)
) where
{
fnx
auxmain0
( xs
: strm_vt(x0)
)
: strm_vt(y0) =
$llazy
(
g_free(xs);
auxloop2($eval(xs)))
//
and
auxmain1
( xs
: strm_vt(x0)
, ys
: strm_vt(y0)
) : strm_vt(y0) =
$llazy
(
g_free(xs);
g_free(ys);
case+ !ys of
| ~
strmcon_vt_nil() =>
auxloop2($eval(xs))
| ~
strmcon_vt_cons(y0, ys) =>
strmcon_vt_cons(y0, auxmain1(xs, ys))
)
//
and
auxloop2
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  ys =
  mapstrm$fopr0<x0><y0>(x0)
in
case+ !ys of
| ~
strmcon_vt_nil() =>
auxloop2($eval(xs)) // tail-call
| ~
strmcon_vt_cons(y0, ys) =>
strmcon_vt_cons(y0, auxmain1(xs, ys))
end // end of [strmcon_vt_cons]
)
} (*where*)//end of [strm_vt_mapstrm0(xs)]

(* ****** ****** *)
//
#impltmp
<x0:t0>
strm_vt_add0
  (  xs  ) =
let
#vwtpdef
xs = strm_vt(x0)
#impltmp
map$fopr0<x0><x0>(x0) = x0
in//let
  gseq_map0_add0<xs><x0><x0>(xs)
end(*let*)//end-of-(strm_vt_add0(xs)/map0)
//
#impltmp
<x0:t0>
strm_vt_mul0
  (  xs  ) =
let
#vwtpdef
xs = strm_vt(x0)
#impltmp
map$fopr0<x0><x0>(x0) = x0
in//let
  gseq_map0_mul0<xs><x0><x0>(xs)
end(*let*)//end-of-(strm_vt_mul0(xs)/map0)
//
(* ****** ****** *)

#impltmp
<x0:t0>
strm_vt_sieve0
  (  xs  ) =
(
auxmain(xs) ) where
{
fun
auxmain
( xs
: strm_vt(x0)
)
: strm_vt(x0) = $llazy
(
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x1, xs) =>
let
  val xs = 
  strm_vt_filter0<x0>(xs)
in
  strmcon_vt_cons(x1, auxmain(xs))
end where
{
#impltmp
filter$test1<x0>(x2) = sieve$test1<x0>(x1, x2)
}
)
} (*where*) // end-of-[ strm_vt_sieve0(xs) ]

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_merge0
  (xs, ys) =
(
merge0(xs, ys)) where
{
//
fun
merge0
( xs0
: strm_vt(a)
, ys0
: strm_vt(a)): strm_vt(a) =
$llazy
(
g_free(xs0);
g_free(ys0);
case+ $eval(xs0) of
| ~
strmcon_vt_nil
((*void*)) => $eval(ys0)
| ~
strmcon_vt_cons
( x0, xs1 ) =>
!(merge0_y(x0, xs1, ys0))
)
//
and
merge0_x
( y0: a
, xs0
: strm_vt(a)
, ys1
: strm_vt(a)): strm_vt(a) = $llazy
(
case+ !xs0 of
| ~
strmcon_vt_nil() =>
strmcon_vt_cons(y0, ys1)
| ~
strmcon_vt_cons(x0, xs1) =>
let
val knd = g_s2el<a>(x0, y0)
in//let
//
if
(knd <= 0)
then
strmcon_vt_cons(x0,merge0_x(y0,xs1,ys1))
else
strmcon_vt_cons(y0,merge0_y(x0,xs1,ys1))
endlet // end-of-[ strmcon_cons(x0, xs1)]
) (*llazy*)//end-of-[merge0_x(y0,xs1,ys1)]
//
and
merge0_y
( x0: a
, xs1
: strm_vt(a)
, ys0
: strm_vt(a)): strm_vt(a) = $llazy
(
case+ !ys0 of
| ~
strmcon_vt_nil() =>
strmcon_vt_cons(x0, xs1)
| ~
strmcon_vt_cons(y0, ys1) =>
let
val knd = g_s2el<a>(x0, y0)
in//let
//
if
(knd <= 0)
then
strmcon_vt_cons(x0,merge0_x(y0,xs1,ys1))
else
strmcon_vt_cons(y0,merge0_y(x0,xs1,ys1))
//
endlet // end-of-[ strmcon_cons(y0, ys1)]
) (*llazy*)//end-of-[merge0_y(x0,xs1,ys1)]
//
} (*where*)//end-of-[ strm_vt_merge0(xs,ys) ]

(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_group0_llist
  (xs) =
(
auxmain0(xs)) where
{
//
#vwtpdef r0 = list_vt(x0)
#vwtpdef xs = strm_vt(x0)
//
fnx
auxmain0
( xs: xs) =
$llazy
(
auxmain1(xs, list_vt_nil())
)
//
and
auxmain1
( xs: xs
, r0: r0)
: strmcon_vt(r0) =
(
case+ !xs of
| ~
strmcon_vt_nil
  ((*void*)) =>
let
val r0 =
list_vt_reverse0<x0>(r0)
in
  strmcon_vt_sing<r0>(r0)
end // end of [strmcon_vt_cons]
| ~
strmcon_vt_cons
  ( x0, xs ) =>
if
group$test0<x0>(x0)
then
auxmain1
(xs, list_vt_cons(x0, r0))
else
let
val r0 = list_vt_reverse0<x0>(r0)
in//let
  g_free(x0)
; strmcon_vt_cons(r0, auxmain0(xs))
end // end of [strmcon_vt_cons]
)
//
}(*where*)//end-of-(strm_vt_group0_llist(xs))

(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_imap0
  (xs) =
(
auxmain(0(*i0*), xs)
) where
{
fun
auxmain
( i0: nint
, xs
: strm_vt(x0)
)
: strm_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil((*void*))
| ~
strmcon_vt_cons(x0, xs) =>
let
  val y0 =
  imap$fopr0<x0><y0>(i0, x0)
in//let
strmcon_vt_cons(y0, auxmain(i0+1, xs))
end//let
)
} (*where*) // end-of-(strm_vt_imap0(xs))

(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_idropif0
  (    xs   ) =
(
auxloop
(xs, 0(*i0*))) where
{
//
#vwtpdef
xs = strm_vt(x0)
//
fnx
auxloop
(xs: xs, i0: sint): xs =
(
case+ !xs of
| ~
strmcon_vt_nil
  ((*void*)) =>
(
  strm_vt_nil((*void*))
)
|
strmcon_vt_cons
  ( x0, xs ) =>
if
idropif$test0<x0>(i0, x0)
then
( g_free<x0>(x0)
; auxloop(xs, suc(i0)) )
else strm_vt_cons(x0, xs) )(*auxloop*)
//
}(*where*)//end-of-(strm_vt_idropif0(xs))
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_itakeif0
  (    xs   ) =
(
auxmain
(xs, 0(*i0*))) where
{
//
#vwtpdef
xs = strm_vt(x0)
//
fnx
auxmain
( xs: xs
, i0: sint)
: strm_vt(x0) = $llazy
(
case+ !xs of
| ~
strmcon_vt_nil
  ((*void*)) =>
strmcon_vt_nil()
| ~
strmcon_vt_cons
  ( x0, xs ) =>
if
itakeif$test0<x0>(i0, x0)
then
strmcon_vt_cons
(x0, auxmain(xs, suc(i0)))
else
( g_free(x0)
; g_free(xs); strmcon_vt_nil(*void*))
)
}(*where*)//end-of-(strm_vt_itakeif0(xs))
//
(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_imapopt0
  (xs) =
(
auxmain(0(*i0*), xs)
) where
{
//
fnx
auxmain
( i0: nint
, xs
: strm_vt(x0)
)
: strm_vt(y0) =
$llazy
(
g_free(xs);
auxloop(i0, $eval(xs)))
//
and
auxloop
( i0: nint
, xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val i1 = suc(i0)
  val
  opt = ifilter$test1<x0>(i0, x0)
in
//
if
opt
then
let
val y0 =
imap$fopr0<x0><y0>(i0, x0)
in
strmcon_vt_cons(y0, auxmain(i1, xs))
end // end of [then]
else
let
val () =
g_free(x0) in auxloop(i1, $eval(xs))
end // end of [else]
//
end // end of [strmcon_vt_cons]
) (* end of [auxloop] *)
//
} (*where*)//end-of-(strm_vt_imapopt0(xs))

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_istrmize0
  (xs) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0
: nint
, xs
: strm_vt(a))
: strm_vt(@(nint, a)) =
$llazy
(
g_free(xs);
case+ !xs of
| ~
strmcon_vt_nil
  ((*nil*)) => strmcon_vt_nil()
| ~
strmcon_vt_cons
  ( x0, xs ) =>
(
  strmcon_vt_cons
  ( (i0, x0), auxmain(i0+1, xs) ) )
) (* end of [auxmain] *)
} (*where*)//end-of(strm_vt_istrmize0(xs))

(* ****** ****** *)
(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)
(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_z2forall0
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fnx
loop
( xs
: strm_vt(x0)
, ys
: strm_vt(y0)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(g_free(ys); true)
| ~
strmcon_vt_cons(x0, xs) =>
(
case+ !ys of
| ~
strmcon_vt_nil() =>
( g_free(x0)
; g_free(xs); true)
| ~
strmcon_vt_cons(y0, ys) =>
let
  val
  test =
  z2forall$test0<x0><y0>(x0, y0)
in//let
if
test
then loop(xs, ys)
else (g_free(xs); g_free(ys); false)
end // end of [strmcon_vt_cons]
)
) (*case+*)//end of [loop(xs,ys)]
} (*where*)//end-of(strm_vt_z2forall0(xs,ys))

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_z2forcmp0
  (xs, ys) =
(
loop(xs, ys)) where
{
fnx
loop
( xs
: strm_vt(x0)
, ys
: strm_vt(y0)): sint =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(
case+ !ys of
| ~
strmcon_vt_nil() => 0
| ~
strmcon_vt_cons(y0, ys) =>
(
  g_free(y0); g_free(ys); -1
)
)
| ~
strmcon_vt_cons(x0, xs) =>
(
case+ !ys of
| ~
strmcon_vt_nil() =>
(
  g_free(x0); g_free(xs);  1
)
| ~
strmcon_vt_cons(y0, ys) =>
let
val
sgn =
z2forcmp$test0<x0><y0>(x0, y0)
in
(
if
(sgn = 0)
then loop(xs, ys)
else (g_free(xs); g_free(ys); sgn))
end // end of [strmcon_vt_cons]
)
) (*case+*)//end of [loop(xs,ys)]
} (*where*)//end-of[strm_vt_z2forcmp0(xs,ys)]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_z2foritm0
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fnx
loop
( xs
: strm_vt(x0)
, ys
: strm_vt(y0)): void =
(
case+ !xs of
| ~
strmcon_vt_nil
  ((*void*)) =>
(  g_free(ys)  )
| ~
strmcon_vt_cons(x0, xs) =>
(
case+ !ys of
| ~
strmcon_vt_nil() =>
(g_free(x0);g_free(xs))
| ~
strmcon_vt_cons
  ( y0, ys ) =>
(
  loop(xs, ys) ) where
{
val () =
z2foritm$work0<x0><y0>(x0, y0)
}(*where*)//end(strmcon_vt_cons)
)
) (*case+*) // end of [loop(xs,ys)]
} (*where*) // end-of(strm_vt_z2foritm0...)

(* ****** ****** *)

#impltmp
<x0><y0><z0>
strm_vt_z2map0
  ( xs, ys ) =
auxmain(xs, ys) where
{
fun
auxmain
( xs
: strm_vt(x0)
, ys
: strm_vt(y0)): strm_vt(z0) =
$llazy
(
g_free(xs);
g_free(ys);
case+ !xs of
//
| ~
strmcon_vt_nil
((*void*)) =>
(g_free(ys); strmcon_vt_nil())
//
| ~
strmcon_vt_cons
( x0, xs ) =>
(
case+ !ys of
| ~
strmcon_vt_nil
((*void*)) =>
( g_free(x0)
; g_free(xs); strmcon_vt_nil())
| ~
strmcon_vt_cons
( y0, ys ) =>
let
val z0 =
  z2map$fopr0<x0><y0><z0>(x0,y0)
in//let
strmcon_vt_cons(z0,auxmain(xs,ys))
endlet // strmcon_vt_cons(y0,ys)
)(*case+*)//strmcon_vt_cons(x0,xs)
//
)(*llazy*)//end-of-[auxmain(xs,ys)]
}(*where*)//end-of-[strm_vt_z2map0(xs,ys)]

(* ****** ****** *)
//
#impltmp
<x0><y0>
strm_vt_z2strmize0
( xs, ys ) =
strm_vt_z2map0(xs, ys) where
{
#vwtpdef z0 = @(x0, y0)
#impltmp
z2map$fopr0<x0><y0><z0>(x0, y0) = (x0, y0)
}(*where*)//end-of-(strm_vt_z2strmize0(xs,ys))
//
(* ****** ****** *)

#impltmp
<x0><y0><z0>
strm_vt_z2imap0
  ( xs, ys ) =
auxmain(0, xs, ys) where
{
fun
auxmain
( i0: nint
, xs
: strm_vt(x0)
, ys
: strm_vt(y0)): strm_vt(z0) =
$llazy
(
g_free(xs);
g_free(ys);
case+ !xs of
//
| ~
strmcon_vt_nil
((*void*)) =>
(g_free(ys); strmcon_vt_nil())
//
| ~
strmcon_vt_cons
( x0, xs ) =>
(
case+ !ys of
| ~
strmcon_vt_nil
((*void*)) =>
( g_free(x0)
; g_free(xs); strmcon_vt_nil())
| ~
strmcon_vt_cons
( y0, ys ) =>
let
val z0 =
z2imap$fopr0<x0><y0><z0>(i0,x0,y0)
in//let
strmcon_vt_cons(z0,auxmain(i0+1,xs,ys))
endlet // strmcon_vt_cons(y0,ys)
)(*case+*)//strmcon_vt_cons(x0,xs)
//
)(*llazy*)//end-of-[auxmain(i0,xs,ys)]
}(*where*)//end-of-[strm_vt_z2imap0(xs,ys)]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_z2iforall0
  ( xs, ys ) =
(
auxloop(0, xs, ys)) where
{
fnx
auxloop
( i0: nint
, xs
: strm_vt(x0)
, ys
: strm_vt(y0)): bool =
(
case+ !xs of
//
| ~
strmcon_vt_nil
((*void*)) =>
(g_free(ys); true)
//
| ~
strmcon_vt_cons
( x0, xs ) =>
(
case+ !ys of
| ~
strmcon_vt_nil
((*void*)) =>
( g_free(x0)
; g_free(xs); true)
| ~
strmcon_vt_cons
( y0, ys ) =>
let
val test =
z2iforall$test0<x0><y0>(i0,x0,y0)
in//let
if test then auxloop(i0+1,xs,ys) else false
endlet // strmcon_vt_cons(y0,ys)
)(*case+*)//strmcon_vt_cons(x0,xs)
//
)(*where*)//end-of-[auxloop(i0,xs,ys)]
}(*where*)//end-of-[strm_vt_z2iforall0(xs,ys)]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_z2iforcmp0
  (xs, ys) =
(
auxloop(0, xs, ys)) where
{
fnx
auxloop
( i0: nint
, xs
: strm_vt(x0)
, ys
: strm_vt(y0)): sint =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(
case+ !ys of
| ~
strmcon_vt_nil() => 0
| ~
strmcon_vt_cons(y0, ys) =>
(
  g_free(y0); g_free(ys); -1
)
)
| ~
strmcon_vt_cons(x0, xs) =>
(
case+ !ys of
| ~
strmcon_vt_nil() =>
(
  g_free(x0); g_free(xs);  1
)
| ~
strmcon_vt_cons(y0, ys) =>
let
val
sgn =
z2iforcmp$test0<x0><y0>(i0, x0, y0)
in
  if
  (sgn = 0)
  then auxloop(i0+1, xs, ys)
  else (g_free(xs); g_free(ys); sgn)
end // end of [strmcon_vt_cons]
)
)(*case+*)//end-of-[auxloop(i0,xs,ys)]
}(*where*)//end-of[strm_vt_z2iforcmp0(...)]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_vt_z2iforitm0
  ( xs, ys ) =
(
auxloop(0, xs, ys)) where
{
fnx
auxloop
( i0: nint
, xs
: strm_vt(x0)
, ys
: strm_vt(y0)): void =
(
case+ !xs of
//
| ~
strmcon_vt_nil
((*void*)) => g_free(ys)
//
| ~
strmcon_vt_cons
( x0, xs ) =>
(
case+ !ys of
| ~
strmcon_vt_nil
((*void*)) =>
( g_free(x0); g_free(xs) )
| ~
strmcon_vt_cons
( y0, ys ) =>
auxloop(i0+1,xs,ys) where
{
val () =
z2iforitm$work0<x0><y0>(i0,x0,y0)
} // strmcon_vt_cons(y0,ys)
)(*case+*)// strmcon_vt_cons(x0,xs)
//
)(*where*)//end-of-[auxloop(i0,xs,ys)]
}(*where*)//end-of-[strm_vt_z2iforitm0(...)]

(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2020-06-02: for g/g-operations
*)
(* ****** ****** *)
//
#impltmp
{a:vt}
g_free<strm_vt(a)> = strm_vt_free<a>
#impltmp
{a:vt}
g_free<strq_vt(a)> = strq_vt_free<a>
#impltmp
{a:vt}
g_free<strx_vt(a)> = strx_vt_free<a>
//
(* ****** ****** *)
//
(*
HX-2020-06-02: for gseq-operations
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0:vt}
gseq_listize0
<strm_vt(x0)><x0> = strm_vt_listize0<x0>
//
#impltmp
{x0:vt}
gseq_strmize0
<strm_vt(x0)><x0> = strm_vt_strmize0<x0>
//
(* ****** ****** *)
//
#impltmp
{x0:vt}
gseq_make0_lstrm
<list_vt(x0)><x0> = strm_vt_listize0<x0>
//
(* ****** ****** *)
//
#impltmp
{x0:vt}
gseq_rlistize0
<strm_vt(x0)><x0> = strm_vt_rlistize0<x0>
//
(* ****** ****** *)
//
#impltmp
{x0:vt}
gseq_add0
<strm_vt(x0)><x0> = strm_vt_add0<x0>(*xs*)
#impltmp
{x0:vt}
gseq_mul0
<strm_vt(x0)><x0> = strm_vt_mul0<x0>(*xs*)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm000_vt.dats] *)
