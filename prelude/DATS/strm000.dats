(* ****** ****** *)
(*
** for fun-streams
*)
(* ****** ****** *)
(*
#staload
"./../SATS/strm000.sats"
*)
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strmcon_nil_
() = strmcon_nil()
#impltmp
<a>(*tmp*)
strmcon_cons_
(x0, xs) =
strmcon_cons(x0, xs)
//
#impltmp
<a>(*tmp*)
strxcon_cons_
(x0, xs) =
strxcon_cons(x0, xs)
//
(* ****** ****** *)
//
#impltmp
<x0><r0>
strmcon_uncons_cfr
(xs, f0, f1) =
(
case+ xs of
|
strmcon_nil() => f0((*void*))
|
strmcon_cons(x0, xs) => f1(x0, xs)
)
#impltmp
<x0><r0>
strxcon_uncons_cfr
(xs, f1) =
(
case+ xs of
|
strxcon_cons(x0, xs) => f1(x0, xs)
)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_nil() =
$lazy(strmcon_nil())
#impltmp
<a>(*tmp*)
strm_cons
  (x0, xs) =
(
$lazy(strmcon_cons(x0, xs))
)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_nilq(xs) =
(
case !xs of
|
strmcon_nil() => true
|
strmcon_cons(_,_) => false
)
#impltmp
<a>(*tmp*)
strm_consq(xs) =
(
case !xs of
|
strmcon_nil() => false
|
strmcon_cons(_,_) => (true)
)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_sing(x0) =
strm_cons(x0, strm_nil())
#impltmp
<a>(*tmp*)
strm_pair(x0, y0) =
strm_cons(x0, strm_sing(y0))
//  
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_from(x0) =
(
auxmain(x0) ) where
{
fun
auxmain
(x0: a): strm(a) = $lazy
(
strmcon_cons
( x0
, auxmain(strm_from$next<a>(x0)))
) (*lazy*) // end-of-[auxmain(x0)]
}
#impltmp
<a>(*tmp*)
strm_from$next(x0) = g_succ<a>(x0)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strx_from(x0) =
(
auxmain(x0) ) where
{
fun
auxmain
(x0: a): strx(a) = $lazy
(
strxcon_cons
( x0
, auxmain(strx_from$next<a>(x0)))
) (*lazy*) // end-of-[auxmain(x0)]
}
#impltmp
<a>(*tmp*)
strx_from$next(x0) = g_succ<a>(x0)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_length
  (xs) =
(
  loop(xs, 0(*i0*))
) where
{
#typedef
xs = strm(a)
fnx
loop
( xs: xs
, i0: nint): nint =
(
case+ !xs of
|
strmcon_nil
((*void*)) => i0
|
strmcon_cons
( x0, xs ) => loop(xs, succ(i0))
)
}(*where*) // end-of(strm_length)

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_extend
  (xs, x0) =
(
strm_append(xs, strm_sing<a>(x0))
)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_append
  (xs, ys) =
(
  append(xs, ys)
) where
{
fun
append(xs, ys) =
$lazy
(
case+ $eval(xs) of
|
strmcon_nil() => $eval(ys)
|
strmcon_cons(x0, xs) =>
strmcon_cons(x0, append(xs, ys))
)
} (*where*) // end of(strm_append)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_forall
  (xs) =
( loop(xs) ) where
{
fnx
loop
( xs
: strm(a)): bool =
(
case+ !xs of
|
strmcon_nil() => true
|
strmcon_cons(x0, xs) =>
let
  val
  test = forall$test<a>(x0)
in
if test then loop(xs) else false
end
) (* end of [loop] *)
} (*where*) // end of [strm_forall]

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_strmize
( xs ) =
(
  auxmain(xs)) where
{
//
fun
auxmain
( xs ) = $llazy
(
case+
$eval(xs) of
|
strmcon_nil() =>
strmcon_vt_nil()
|
strmcon_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs))
)
//
} (*where*) // end of [strm_strmize]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_map
  (xs) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs ) = $lazy
(
case+
$eval(xs) of
|
strmcon_nil() =>
strmcon_nil()
|
strmcon_cons(x0, xs) =>
strmcon_cons
(map$fopr<x0>(x0), auxmain(xs))
)
} (*where*) // end of [strm_map(xs)]

(* ****** ****** *)

#impltmp
<x0><y0>
strm_map_vt
  (xs) =
(
  auxmain(xs)) where
{
fun
auxmain(xs) =
$llazy
(
case+
$eval(xs) of
|
strmcon_nil() =>
strmcon_vt_nil()
|
strmcon_cons(x0, xs) =>
strmcon_vt_cons
(map$fopr<x0>(x0), auxmain(xs))
)
} (*where*)//end-of-[strm_map_vt(xs)]

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_filter
  (xs) =
(
  auxmain(xs)) where
{
fnx
auxmain(xs) =
$lazy
(auxloop($eval(xs)))
and
auxloop
( xs
: strmcon(x0)
)
: strmcon(x0) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_nil()
| strmcon_cons(x0, xs) =>
  if
  filter$test<x0>(x0)
  then
  strmcon_cons(x0, auxmain(xs)) else auxloop($eval(xs))
)
} (*where*) // end of [strm_filter(xs)]

(* ****** ****** *)

#impltmp
<x0>(*tmp*)
strm_filter_vt
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$llazy
(auxloop($eval(xs)))
and
auxloop
( xs
: strmcon(x0)
)
: strmcon_vt(x0) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_vt_nil()
| strmcon_cons(x0, xs) =>
  if
  filter$test<x0>(x0)
  then
  strmcon_vt_cons(x0, auxmain(xs)) else auxloop($eval(xs))
)
} (*where*) // end of [strm_filter_vt(xs)] *)

(* ****** ****** *)

#impltmp
<x0><y0>
strm_mapopt
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$lazy
(auxloop($eval(xs)))
and
auxloop(xs) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_nil()
| strmcon_cons(x0, xs) =>
  let
(*
    val
    opt =
    mapopt$fopr<x0><y0>(x0)
*)
    val
    opt =
    filter$test<x0>(x0)
  in
(*
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_cons(y0, auxmain(xs))
*)
    if
    opt
    then
    let
      val y0 =
      map$fopr<x0><y0>(x0)
    in
      strmcon_cons(y0, auxmain(xs))
    end
    else auxloop($eval(xs))
  end // end of [strmcon_cons]
)
} (* end of [strm_mapopt] *)

(* ****** ****** *)

#impltmp
<x0><y0>
strm_mapopt_vt
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$llazy
(auxloop($eval(xs)))
and
auxloop(xs) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_vt_nil()
| strmcon_cons(x0, xs) =>
  let
    val
    opt =
    filter$test<x0>(x0)
(*
    val
    opt =
    mapopt$fopr<x0><y0>(x0)
*)
  in
(*
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_vt_cons(y0, auxmain(xs))
*)
    if
    opt
    then
    let
      val y0 =
      map$fopr<x0><y0>(x0)
    in
      strmcon_vt_cons(y0, auxmain(xs))
    end
    else auxloop($eval(xs))
  end // end of [strmcon_cons]
)
} (* end of [strm_mapopt_vt] *)

(* ****** ****** *)

#impltmp
<x0><y0>
strm_mapoptn
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$lazy
(auxloop($eval(xs)))
and
auxloop(xs) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_nil()
| strmcon_cons(x0, xs) =>
  let
    val
    opt =
    mapoptn$fopr<x0><y0>(x0)
  in
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_cons(y0, auxmain(xs))
  end
)
} (* end of [strm_mapoptn] *)

(* ****** ****** *)

#impltmp
<x0><y0>
strm_mapoptn_vt
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$llazy
(auxloop($eval(xs)))
and
auxloop(xs) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_vt_nil()
| strmcon_cons(x0, xs) =>
  let
    val
    opt =
    mapoptn$fopr<x0><y0>(x0)
  in
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_vt_cons(y0, auxmain(xs))
  end
)
} (* end of [strm_mapoptn_vt] *)

(* ****** ****** *)
//
(*
// HX-2020-12-21:
// This is mostly as an example
// rather than for its usefulness
*)
//
#impltmp
<x0:t0>
strm_sieve
  (xs) =
(
auxmain(xs)) where
{
fun
auxmain
( xs
: strm(x0)): strm(x0) =
$lazy
(
case+ !xs of
|
strmcon_nil() =>
strmcon_nil()
|
strmcon_cons(x1, xs) =>
let
val xs = 
strm_filter<x0>(xs)
in//let
strmcon_cons(x1, auxmain(xs))
end where
{
#impltmp
filter$test<x0>(x2) = sieve$test<x0>(x1, x2)
}
)
} (*where*) // end-of-(strm_sieve(xs))
//
#impltmp
<x0:t0>
strm_sieve_vt
  (xs) =
(
auxmain(xs)) where
{
fun
auxmain
( xs
: strm(x0)): strm_vt(x0) =
$llazy
(
case+ !xs of
|
strmcon_nil() =>
strmcon_vt_nil()
|
strmcon_cons(x1, xs) =>
let
  val xs = 
  strm_filter<x0>(xs)
in
  strmcon_vt_cons(x1, auxmain(xs))
end where
{
#impltmp
filter$test<x0>(x2) = sieve$test<x0>(x1, x2)
}
)
} (*where*) // end-of-[strm_sieve_vt(xs)]
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
strm_merge
  (xs, ys) =
(
merge(xs, ys)) where
{
fun
merge
( xs0: strm(a)
, ys0: strm(a)) = $lazy
(
case+ $eval(xs0) of
|
strmcon_nil
((*void*)) => $eval(ys0)
|
strmcon_cons
( x0, xs1 ) =>
(
case+ $eval(ys0) of
|
strmcon_nil
((*void*)) => $eval(xs0)
|
strmcon_cons
( y0, ys1 ) =>
let
val knd = g_sel2<a>(x0, y0)
in//let
//
  if
  (knd <= 0)
  then
  strmcon_cons(x0, merge(xs1, ys0))
  else
  strmcon_cons(y0, merge(xs0, ys1))
//
end // end of [strmcon_cons]
) (* strmcon_cons *)
)
}(*where*)//end-of-[strm_merge(xs,ys)]

(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)

#impltmp
<x0><y0>
strm_imap
  (xs) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0
: nint,
  xs
: strm(x0)) = $lazy
(
case+
$eval(xs) of
|
strmcon_nil() =>
strmcon_nil()
|
strmcon_cons(x0, xs) =>
strmcon_cons
(imap$fopr<x0><y0>(i0, x0), auxmain(i0+1, xs))
)
} (*where*) // end-of(strm_imap)

(* ****** ****** *)

#impltmp
<x0><y0>
strm_imap_vt
  (xs) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0
: nint,
  xs
: strm(x0)) = $llazy
(
case+
$eval(xs) of
|
strmcon_nil() =>
strmcon_vt_nil()
|
strmcon_cons(x0, xs) =>
strmcon_vt_cons
(imap$fopr<x0><y0>(i0, x0), auxmain(i0+1, xs))
)
} (*where*) // end of(strm_imap_vt)

(* ****** ****** *)

#impltmp
<x0
,y0><z0>
strm_x2map_vt_cmp
  (xs, ys) =
(
auxmain(xs, ys)) where
{
fun
auxmain
( xs0: strm(x0)
, ys0: strm(y0)): strm_vt(z0) =
$llazy
(
case+ !xs0 of
|
strmcon_nil() =>
strmcon_vt_nil()
|
strmcon_cons(x0, xs1) =>
(
case+ !ys of
|
strmcon_nil() =>
strmcon_vt_nil()
|
strmcon_cons(y0, ys1) =>
let
val z0 =
x2map$fopr
<x0,y0><z0>(x0, y0)
val zs1 =
let
#impltmp
map$fopr<y0><z0>(y0) =
x2map$fopr<x0,y0><z0>(x0, y0)
in
  strm_map_vt<y0><z0>(ys1)
end
//
#impltmp
g_sel2<z0>(z1, z2) =
let
val sgn =
gl_cmp11<z0>(z1, z2) in
if (sgn <= 0) then 0 else 1 end
//
in//let
strmcon_vt_cons
( z0
, strm_vt_merge0<z0>(zs1,auxmain(xs1,ys0)))
end(*let*) // end of [strmcon_cons(x0, y0)]
)
)(*llazy*)//end-of-[auxmain(xs0,ys0)]
}(*where*)//end-of-[strm_x2map_vt_cmp(xs,ys)]

(* ****** ****** *)
//
// HX-2022-07-03:
// for gseq-operations
// Sun Jul  3 12:08:45 EDT 2022
//
(* ****** ****** *)
#impltmp
{a:t0}
gseq_nil
<strm(a)><a> = strm_nil<a>
#impltmp
{a:t0}
gseq_cons
<strm(a)><a> = strm_cons<a>
(* ****** ****** *)
#impltmp
{a:t0}
gseq_nilq
<strm(a)><a> = strm_nilq<a>
#impltmp
{a:t0}
gseq_consq
<strm(a)><a> = strm_consq<a>
(* ****** ****** *)
#impltmp
{a:t0}
gseq_imap<strm(a)><a> = strm_imap_vt<a>
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm000.dats] *)
