(* ****** ****** *)
(*
** for lin-streams
*)
(* ****** ****** *)
//
(*
#staload
"./..\
/SATS/VT/strm000_vt.sats"
*)
//
(* ****** ****** *)
#abstbox box_tx
#typedef box = box_tx
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
// HX-2020-03-21
// It is a bit wild :)
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
  in $UN.castlin10{strmcon(a)}(r0) end
//
end // end of [let]
)
} (* end of [strm_vt2t] *)

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strmcon_vt_nil_
((*void*)) =
strmcon_vt_nil(*void*)
#impltmp
<a>(*tmp*)
strmcon_vt_cons_
( x0, xs ) =
strmcon_vt_cons(x0, xs)
//
(* ****** ****** *)
//
#impltmp
<x0><r0>
strmcon_vt_uncons_cfr
(xs, f0, f1) =
(
case+ xs of
| ~
strmcon_vt_nil() => f0((*void*))
| ~
strmcon_vt_cons(x0, xs) => f1(x0, xs)
)
#impltmp
<x0><r0>
strxcon_vt_uncons_cfr
(xs, f1) =
(
case+ xs of
| ~
strxcon_vt_cons(x0, xs) => f1(x0, xs)
)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_nil() =
$llazy(strmcon_vt_nil())
#impltmp
<a>(*tmp*)
strm_vt_cons
  (x0, xs) =
(
$llazy
(
  g_free(x0);
  g_free(xs);
  strmcon_vt_cons(x0, xs) )
)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_sing(x0) =
strm_vt_cons(x0, strm_vt_nil())
#impltmp
<a>(*tmp*)
strmcon_vt_sing(x0) =
strmcon_vt_cons(x0, strm_vt_nil())
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_pair(x0, y0) =
strm_vt_cons(x0, strm_vt_sing(y0))
#impltmp
<a>(*tmp*)
strmcon_vt_pair(x0, y0) =
strmcon_vt_cons(x0, strm_vt_sing(y0))
//  
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_free(xs) = $free(xs)
#impltmp
<a>(*tmp*)
strx_vt_free(xs) = $free(xs)
//
#impltmp
{a:vt}
g_free<strm_vt(a)> = strm_vt_free<a>
#impltmp
{a:vt}
g_free<strx_vt(a)> = strx_vt_free<a>
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
auxmain(x0) ) where
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
) (*llazy*)//end-of-[auxmain(x0)]
}
//
#impltmp
{a:t0}(*tmp*)
strm_vt_from$next<a>(x0) = g_succ<a>(x0)
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
) (*llazy*)//end-of-[auxmain(x0)]
}
//
#impltmp
{a:t0}(*tmp*)
strx_vt_from$next<a>(x0) = g_succ<a>(x0)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_length(xs) =
(
strm_vt_foldl0<a><nint>(xs, 0)
) where
{
//
#impltmp
foldl0$fopr<a><nint>(r0, x0) =
let
  val () = g_free<a>(x0) in succ(r0)
end // end of [let]
//
} (*where*)//end-of-(strm_vt_length)

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
  (g_succ<a>(s1), f2))
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
  (g_succ<a>(s1), f2))
else
(
  strmcon_vt_nil(*void*)))(*auxmain*)
//
}(*where*)//end-of-(strm_vt_range_lt(s1,f2))

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_listize(xs) =
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
  loop(xs, r0.1); $fold( r0 )
end
) (*case*) // end of [ loop ]
//
in
let
var r0: list_vt(a)
val () = loop(xs, r0) in r0 endlet
end (*let*) // end-of(strm_vt_listize)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_rlistize(xs) =
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
list_vt_cons(x0, r0) in loop(xs, r0)
end
)
} (*where*)//end-of(strm_vt_rlistize)

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_strmize(xs) = ( xs )
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strx_vt_strmize
  ( xs ) =
(
  auxmain(xs)) where
{
//
fun
auxmain(xs) = $llazy
(
//
g_free(xs);
case+ !xs of
| ~
strxcon_vt_cons
( x0, xs ) =>
(
strmcon_vt_cons(x0, auxmain(xs))
)
//
) (* end of [auxmain] *)
//
} (*where*)//end-of(strx_vt_strmize)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_extend
  (xs, x0) =
(
  strm_vt_append<a>
  (xs, strm_vt_sing<a>(x0))
)
//
#impltmp
<a>(*tmp*)
strm_vt_append
  (xs, ys) =
(
  append(xs, ys)
) where
{
fun
append(xs, ys) =
$llazy
(
g_free(xs);
g_free(ys);
case+ !xs of
| ~
strmcon_vt_nil() => !ys
| ~
strmcon_vt_cons(x0, xs) =>
strmcon_vt_cons(x0, append(xs, ys))
)
} (*where*)//end-of(strm_vt_append)

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_concat
  (xss) =
(
  auxmain0(xss)
) where
{
fnx
auxmain0(xss) =
$llazy
(
g_free(xss);
auxloop2(xss)
)
and
auxmain1(xss, xs0) =
$llazy
(
g_free(xss);
g_free(xs0);
(
case+ !xs0 of
| ~
strmcon_vt_nil() => auxloop2(xss)
| ~
strmcon_vt_cons(x0, xs1) =>
strmcon_vt_cons(x0, auxmain1(xss, xs1))
)
)
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
strmcon_vt_cons(x0, auxmain1(xss, xs1))
)
)
} (*where*)//end-of(strm_vt_concat)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_drop
  (xs, n0) =
(
strm_vt_idropif<x0>(xs)) where
{
#impltmp
idropif0$test<x0>(i0, x0) = (i0 < n0)
} (*where*)//end-of(gseq_drop/idropif)
//
#impltmp
<x0>(*tmp*)
strm_vt_take
  (xs, n0) =
(
strm_vt_itakeif<x0>(xs)) where
{
#impltmp
itakeif0$test<x0>(i0, x0) = (i0 < n0)
} (*where*)//end-of(gseq_take/itakeif)
//
#impltmp
<x0>(*tmp*)
strm_vt_dropif
  ( xs ) =
(
strm_vt_idropif<x0>(xs)) where
{
#impltmp
idropif0$test<x0>(i0,x0) = dropif0$test<x0>(x0)
}(*where*)//end-of(strm_vt_dropif/idropif)
//
#impltmp
<x0>(*tmp*)
strm_vt_takeif
  ( xs ) =
(
strm_vt_itakeif<x0>(xs)) where
{
#impltmp
itakeif0$test<x0>(i0,x0) = takeif0$test<x0>(x0)
}(*where*)//end-of(strm_vt_takeif/itakeif)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_idropif
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
idropif0$test<x0>(i0, x0)
then
( g_free<x0>(x0)
; auxloop(xs, succ(i0)))
else strm_vt_cons(x0, xs))(*auxloop*)
//
}(*where*)//end-of-(strm_vt_idropif(xs))
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_itakeif
  (    xs   ) =
(
auxmain
(xs, 0(*i0*))) where
{
//
#vwtpdef
xs = strm_vt(x0)
//
fun
auxmain
( xs: xs
, i0: sint): xs = $llazy
(
g_free(xs);
(
case+ !xs of
| ~
strmcon_vt_nil
  ((*void*)) =>
strmcon_vt_nil()
|
strmcon_vt_cons
  ( x0, xs ) =>
if
itakeif0$test<x0>(i0, x0)
then
( g_free<x0>(x0)
; !(auxmain(xs, succ(i0))))
else
strmcon_vt_cons(x0,auxmain(xs,succ(i0)))
)
)(*llazy*)
}(*where*)//end-of-(strm_vt_itakeif(xs))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_vt_prefixq
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
(g_free(x1); g_free(xs1); false)
| ~
strmcon_vt_cons(x2, xs2) =>
let
  val
  sgn = gl_cmp00<a>(x1, x2)
in
  if
  (sgn = 0)
  then auxloop(xs1, xs2)
  else
  (g_free(xs1); g_free(xs2); false)
end // end of [let]
)
) (* end of [auxloop] *)
} (*where*) // end-of(strm_vt_prefixq)

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_vt_fset_at
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
free(xs); free(x0);
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
free(x1) in strmcon_vt_cons(x0, xs)
end // end of [else]
)
}(*where*)//end-of-[strm_vt_fset_at]

(* ****** ****** *)
//
#impltmp
<xs><x0>
strm_vt_gappend
  (xs1, xs2) = let
//
val xs1 =
glseq_strmize<xs><x0>(xs1)
val xs2 =
glseq_strmize<xs><x0>(xs2)
//
in
strm_vt_append<x0>(xs1, xs2)
end(*let*)//end-of(strm_vt_gappend)
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
strm_vt_gconcat
  (xss) =
(
  gconcat(xss)
) where
{
fun
gconcat(xss) =
$llazy
(
g_free(xss);
case+ !xss of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(xs0, xss) => !
(
strm_vt_append<x0>
(glseq_strmize<xs><x0>(xs0), gconcat(xss)))
)
}(*where*)//end-of-[strm_vt_gconcat]
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_sortedq
  (xs) =
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
let val () = g_free<a>(x0) in true end
| ~
strmcon_vt_cons(x1, xs) =>
if
(x0 <= x1)
then
(g_free(x0); loop(x1, xs))
else
(g_free(x0); g_free(x1); g_free(xs); false)
)
} (*where*) // end-of-[strm_vt_sortedq]

(* ****** ****** *)

#impltmp
<a><r0>
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
  strm_vt_foreach0<a>(xs)
) where
{
#impltmp
foreach0$work<a>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldl0$fopr<a><r0>(r0, x0))
//
end // end of [foreach0$work]
}
//
}(*where*)//end-of(strm_foldl0/foreach0)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_forall0
  (xs) =
( loop(xs) ) where
{
fnx
loop
( xs
: strm_vt(a)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() => true
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  test = forall0$test<a>(x0)
in
if
test
then loop(xs) else (g_free(xs); false)
end
) (* end of [loop] *)
} (*where*) // end-of-[strm_vt_forall0]

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_foreach0
  (xs) = let
//
val
test =
strm_vt_forall0<a>(xs) where
{
#impltmp
forall0$test<a>(x0) =
let
val () = foreach0$work<a>(x0) in true
end
}
//
in
  // nothing
end(*let*)//end-of(strm_vt_foreach0/forall0)

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
  map0$fopr<x0><y0>(x0)
in
  strmcon_vt_cons(y0, auxmain(xs))
end
)
} (*where*) // end-of(strm_vt_map0)

(* ****** ****** *)

#impltmp
<x0><y0>
strx_vt_map0
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain
( xs
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
  val y0 =
  map0$fopr<x0><y0>(x0)
in
  strxcon_vt_cons(y0, auxmain(xs))
end
)
} (*where*) // end of [strx_vt_map0]

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
(
g_free(xs); auxloop($eval(xs)))
//
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(x0) =
(
case+ xs of
| ~
strmcon_vt_nil
  () =>
strmcon_vt_nil()
| ~
strmcon_vt_cons
  (x0, xs) =>
( if
  filter0$test<x0>(x0)
  then
  strmcon_vt_cons(x0, auxmain(xs))
  else
  let
  val () = g_free(x0) in auxloop(!xs)
  end // end of [if]
) (* end of [strmcom_vt_cons] *)
)
//
} (*where*) // end of [strm_vt_filter0]

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strx_vt_filter0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: strx_vt(x0)
)
: strx_vt(x0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strxcon_vt(x0)
)
: strxcon_vt(x0) =
(
case+ xs of
| ~
strxcon_vt_cons
  (x0, xs) =>
( if
  filter0$test(x0)
  then
  strxcon_vt_cons(x0, auxmain(xs))
  else
  let
  val () = g_free(x0) in auxloop(!xs)
  end
) (* end of [strxcom_vt_cons] *)
)
} (*where*) // end of [strx_vt_filter0]

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
  mapopt0$fopr<x0><y0>(x0)
*)
  val
  opt = filter1$test<x0>(x0)
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
    map0$fopr<x0><y0>(x0)
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
} (*where*) // end of [strm_vt_mapopt0]

(* ****** ****** *)

#impltmp
<x0><y0>
strx_vt_mapopt0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strxcon_vt(x0)
)
: strxcon_vt(y0) =
(
case+ xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
(*
  val
  opt =
  mapopt0$fopr<x0><y0>(x0)
*)
  val
  opt = filter1$test<x0>(x0)
in
(*
  case+ opt of
  | optn_vt_nil() =>
    auxloop($eval(xs)) // tail-call
  | optn_vt_cons(y0) =>
    strxcon_vt_cons(y0, auxmain(xs))
*)
  if
  opt
  then
  let
    val y0 =
    map0$fopr<x0><y0>(x0)
  in
    strxcon_vt_cons(y0, auxmain(xs))
  end
  else
  let
    val () =
    g_free(x0) in auxloop($eval(xs))
  end
//
end // end of [strxcon_vt_cons]
)
} (*where*) // end of [strx_vt_mapopt0]

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
  mapoptn0$fopr<x0><y0>(x0)
in
  case+ opt of
  | optn_vt_nil() =>
    auxloop($eval(xs)) // tail-call
  | optn_vt_cons(y0) =>
    strmcon_vt_cons(y0, auxmain(xs))
//
end // end of [strmcon_vt_cons]
)
} (*where*) // end-of(strm_vt_mapoptn0)

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
  maplist0$fopr<x0><y0>(x0)
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
} (*where*) // end of [strm_vt_maplist0]

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
  mapstrm0$fopr<x0><y0>(x0)
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
} (*where*)//end of [strm_vt_mapstrm0]

(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_group0_list
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
group0$test<x0>(x0)
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
}(*where*)//end-of(strm_vt_group0_list)

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
filter0$test<x0>(x2) = sieve0$test<x0>(x1, x2)
}
)
} (*where*) // end-of-[strm_vt_sieve0(xs)]

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
val knd = g_sel2<a>(x0, y0)
in//let
//
if
(knd <= 0)
then
strmcon_vt_cons(x0,merge0_x(y0,xs1,ys1))
else
strmcon_vt_cons(y0,merge0_y(x0,xs1,ys1))
endlet // end-of-[ strmcon_cons(x0, xs1 )]
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
val knd = g_sel2<a>(x0, y0)
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
} (*where*)//end-of-[strm_vt_merge0(xs,ys)]

(* ****** ****** *)
//
// For glseq-i-operations
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
  imap0$fopr<x0><y0>(i0, x0)
in
  strmcon_vt_cons
  (y0, auxmain(succ(i0), xs))
end
)
} (*where*)//end-of(strm_vt_imap0)

(* ****** ****** *)

#impltmp
<x0><y0>
strx_vt_imap0
  (xs) =
(
auxmain(0(*i0*), xs)
) where
{
fun
auxmain
( i0: nint
, xs
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
val y0 =
imap0$fopr<x0><y0>(i0, x0)
in
strxcon_vt_cons
(y0, auxmain(succ(i0), xs))
end // strxcon_vt_cons
) (* end of [auxmain] *)
} (*where*)//end-of(strx_vt_imap0)

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
  val i1 = succ(i0)
  val
  opt = ifilter1$test<x0>(i0, x0)
in
//
if
opt
then
let
val y0 =
imap0$fopr<x0><y0>(i0, x0)
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
} (*where*)//end-of-(strm_vt_imapopt0)

(* ****** ****** *)

#impltmp
<x0><y0>
strx_vt_imapopt0
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
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
g_free(xs);
auxloop(i0, $eval(xs)))
//
and
auxloop
( i0: nint
, xs
: strxcon_vt(x0)
)
: strxcon_vt(y0) =
(
case+ xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
  val i1 = succ(i0)
  val
  opt = ifilter1$test<x0>(i0, x0)
in
//
if
opt
then
let
val y0 =
imap0$fopr<x0><y0>(i0, x0)
in
strxcon_vt_cons(y0, auxmain(i1, xs))
end // end of [then]
else
let
val () =
g_free(x0) in auxloop(i1, $eval(xs))
end // end of [else]
//
end // end of [strxcon_vt_cons]
) (* end of [auxloop] *)
//
} (*where*)//end-of(strx_vt_imapopt0)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_vt_istrmize
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
$free(xs);
case+ !xs of
| ~
strmcon_vt_nil
  ((*nil*)) => strmcon_vt_nil()
| ~
strmcon_vt_cons
  ( x0, xs ) =>
  strmcon_vt_cons
  ( (i0, x0), auxmain(i0+1, xs) )
) (* end of [auxmain] *)
} (*where*)//end-of(strx_vt_istrmize)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strx_vt_istrmize
  (xs) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0
: nint
, xs
: strx_vt(a))
: strm_vt(@(nint, a)) =
$llazy
(
$free(xs);
case+ !xs of
| ~
strxcon_vt_cons
  ( x0, xs ) =>
  strmcon_vt_cons
  ( (i0, x0), auxmain(i0+1, xs) )
) (* end of [auxmain] *)
} (*where*)//end-of(strx_vt_istrmize)

(* ****** ****** *)
//
// For z2-glseq-operations
//
(* ****** ****** *)

#impltmp
<x0,y0>
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
  z2forall0$test<x0,y0>(x0, y0)
in//let
if
test
then loop(xs, ys)
else (g_free(xs); g_free(ys); false)
end // end of [strmcon_vt_cons]
)
) (* end of [loop] *)
} (*where*) // end-of(strm_vt_z2forall0)

(* ****** ****** *)

#impltmp
<x0,y0>
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
  z2forcmp0$fcmp<x0,y0>(x0, y0)
in
  if
  (sgn = 0)
  then loop(xs, ys)
  else (g_free(xs); g_free(ys); sgn)
end // end of [strmcon_vt_cons]
)
) (* end of [loop] *)
} (*where*)//end-of[strm_vt_z2forcmp0]

(* ****** ****** *)

#impltmp
<x0,y0>
strm_vt_z2foreach0
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
z2foreach0$work<x0,y0>(x0, y0)
}(*where*)//end(strmcon_vt_cons)
)
) (* end of [loop] *)
} (*where*) // end-of(strm_vt_z2foreach0)

(* ****** ****** *)

#impltmp
<x0
,y0><z0>
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
  z2map0$fopr<x0,y0><z0>(x0,y0)
in//let
strmcon_vt_cons(z0,auxmain(xs,ys))
endlet // strmcon_vt_cons(y0,ys)
) (*case*)// strmcon_vt_cons(x0,xs)
//
)(*llazy*)//end-of-[auxmain(xs,ys)]
}(*where*)//end-of-[strm_vt_z2map0(xs,ys)]

(* ****** ****** *)
//
#impltmp
<x0,y0>
strm_vt_z2strmize
( xs, ys ) =
strm_vt_z2map0(xs, ys) where
{
#vwtpdef z0 = @(x0, y0)
#impltmp
z2map0$fopr<x0,y0><z0>(x0, y0) = (x0, y0)
}(*where*)//end-(strm_vt_z2strmize(xs,ys))
//
(* ****** ****** *)

#impltmp
<x0
,y0><z0>
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
z2imap0$fopr<x0,y0><z0>(i0,x0,y0)
in//let
strmcon_vt_cons(z0,auxmain(i0+1,xs,ys))
endlet // strmcon_vt_cons(y0,ys)
) (*case*)// strmcon_vt_cons(x0,xs)
//
)(*llazy*)//end-of-[auxmain(i0,xs,ys)]
}(*where*)//end-of-[strm_vt_z2imap0(xs,ys)]

(* ****** ****** *)

#impltmp
< x0,y0 >
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
z2iforall0$test<x0,y0>(i0,x0,y0)
in//let
if test then auxloop(i0+1,xs,ys) else false
endlet // strmcon_vt_cons(y0,ys)
) (*case*)// strmcon_vt_cons(x0,xs)
//
)(*end-of-[ auxloop(i0,xs,ys) ]*)
}(*where*)//end-of-[strm_vt_z2iforall0(xs,ys)]

(* ****** ****** *)

#impltmp
<x0,y0>
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
z2iforcmp0$fcmp<x0,y0>(i0, x0, y0)
in
  if
  (sgn = 0)
  then auxloop(i0+1, xs, ys)
  else (g_free(xs); g_free(ys); sgn)
end // end of [strmcon_vt_cons]
)
)(*end-of-[auxloop(i0,xs,ys)] *)
}(*where*)//end-of[strm_vt_z2iforcmp0(xs,ys)]

(* ****** ****** *)

#impltmp
< x0,y0 >
strm_vt_z2iforeach0
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
z2iforeach0$work<x0,y0>(i0,x0,y0)
} // strmcon_vt_cons(y0,ys)
) (*case*)// strmcon_vt_cons(x0,xs)
//
)(*end-of-[ auxloop(i0,xs,ys) ]*)
}(*where*)//end-of-[strm_vt_z2iforeach0(xs,ys)]

(* ****** ****** *)
//
// HX-2020-06-02: for glseq-operations
//
(* ****** ****** *)
//
#impltmp
{x0:vt}
glseq_listize
<strm_vt(x0)><x0> = strm_vt_listize<x0>
//
#impltmp
{x0:vt}
glseq_strmize
<strm_vt(x0)><x0> = strm_vt_strmize<x0>
#impltmp
{x0:vt}
glseq_strmize
<strx_vt(x0)><x0> = strx_vt_strmize<x0>
//
#impltmp
{x0:vt}
glseq_rlistize
<strm_vt(x0)><x0> = strm_vt_rlistize<x0>
//
(* ****** ****** *)
//
#impltmp
{x0:t0}
glseq_unstrm_vt
<list(x0)><x0>
  (   xs   ) =
(
list_vt2t(strm_vt_listize<x0>(xs))
)
//
#impltmp
{x0:vt}
glseq_unstrm_vt
<list_vt(x0)><x0> = strm_vt_listize< x0 >
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm000_vt.dats] *)
