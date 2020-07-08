(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload
"./../SATS/gbas.sats"
*)
(* ****** ****** *)

impltmp
{a:vt}
g_self<a>(x) = x

(* ****** ****** *)

impltmp
{a:t0}
g_free<a>(x) = ()

(* ****** ****** *)

impltmp
{a:t0}
g_copy<a>(x) = (x)

(* ****** ****** *)
//
(*
HX-2020-06-06:
Please do see
the circular beauty :)
*)
//
impltmp
{a:vt}
g_equal<a>
  (x, y) =
(
not(g_noteq<a>(x, y))
)
impltmp
{a:vt}
g_noteq<a>
  (x, y) =
(
not(g_equal<a>(x, y))
)
//
(* ****** ****** *)
impltmp
{a:vt}
g_equal<a> = gl_eq11<a>
(* ****** ****** *)
//
impltmp
{a:vt}
g_print0<a>(x) =
( g_free<a>(x) ) where
{
  val () = g_print<a>(x)
} (* end of [g_print0] *)
//
(* ****** ****** *)
//
impltmp
<x0><y0>
mapoptn$fopr(x0) =
if
filter$test<x0>(x0)
then
(
  optn_vt_cons(y0)
) where
{
  val y0 =
  map$fopr<x0><y0>(x0)
}
else
(
  optn_vt_nil((*void*))
)
//
(* ****** ****** *)
//
impltmp
<x0><y0>
mapoptn0$fopr(x0) =
if
filter1$test<x0>(x0)
then
(
  optn_vt_cons(y0)
) where
{
  val y0 =
  map0$fopr<x0><y0>(x0)
}
else
(
  optn_vt_nil((*void*))
) where
{
  val () = g_free<x0>(x0)
} (* end of [mapoptn0$fopr] *)
//
impltmp
<x0><y0>
mapoptn1$fopr(x0) =
if
filter1$test<x0>(x0)
then
(
  optn_vt_cons(y0)
) where
{
  val y0 =
  map1$fopr<x0><y0>(x0)
}
else
(
  optn_vt_nil((*void*))
) (* end of [mapoptn1$fopr] *)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
x2foreach_row$beg() = ((*void*))
impltmp
<>(*tmp*)
x2foreach_row$end() = ((*void*))
//
impltmp
<>(*tmp*)
x2foreach_col$beg() = ((*void*))
impltmp
<>(*tmp*)
x2foreach_col$end() = ((*void*))
//
(* ****** ****** *)

(* end of [gbas.dats] *)
