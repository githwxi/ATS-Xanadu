(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload
"prelude\
/SATS/gbas000.sats"
*)
(* ****** ****** *)
//
#impltmp
{a:vt}
g_self<a>(x) = x
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_free<a>(x) = ()
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_copy<a>(x) = (x)
//
(* ****** ****** *)
//
(*
HX-2020-06-06:
Please do see
the circular beauty :)
*)
//
#impltmp
{a:t0}
g_equal<a>
  (x, y) =
(
not(g_noteq<a>(x, y))
)
//
#impltmp
{a:t0}
g_noteq<a>
  (x, y) =
(
not(g_equal<a>(x, y))
)
//
(* ****** ****** *)
//
(*
#impltmp
{a:t0}
g_equal<a> = g_eq<a>
#impltmp
{a:t0}
g_noteq<a> = g_neq<a>
*)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_eqref<a>
  (x, y) =
(
not(g_neqrf<a>(x, y))
)
//
#impltmp
{a:t0}
g_neqrf<a>
  (x, y) =
(
not(g_eqref<a>(x, y))
)
//
(* ****** ****** *)
//
#impltmp
{a:vt}
g_print0<a>(x) =
( g_free<a>(x) ) where
{
val () = g_print1<a>(x)
} (* end of [g_print0] *)
//
#impltmp
{a:t0}
g_print1<a> = g_print<a>
//
(* ****** ****** *)
//
#impltmp
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
  map$fopr<x0><y0>(x0) }
else
(
  optn_vt_nil((*void*)) )
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
mapoptn$fopr0(x0) =
if
filter$test0<x0>(x0)
then
(
  optn_vt_cons(y0)
) where
{
  val y0 =
  map$fopr0<x0><y0>(x0)
}
else
(
  optn_vt_nil((*void*))
) where
{
  val () = g_free<x0>(x0)
} (* end of [mapoptn$fopr0] *)
//
#impltmp
<x0><y0>
mapoptn$fopr1(x0) =
if
filter$test1<x0>(x0)
then
(
  optn_vt_cons(y0)
) where
{
  val y0 =
  map$fopr1<x0><y0>(x0)
}
else
(
  optn_vt_nil((*void*))
) (* end of [mapoptn$fopr1] *)

(* ****** ****** *)
(*
imptmp
{x0:t0}
group$test0<x0> = group$test<x0>
*)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
x2foreach_row$beg() = ((*void*))
#impltmp
<>(*tmp*)
x2foreach_row$end() = ((*void*))
//
#impltmp
<>(*tmp*)
x2foreach_col$beg() = ((*void*))
#impltmp
<>(*tmp*)
x2foreach_col$end() = ((*void*))
//
(* ****** ****** *)
#impltmp
<x0,y0>(*tmp*)
x2iforeach_row$work = x2iforeach$work<x0,y0>
#impltmp
<x0,y0>(*tmp*)
x2iforeach_col$work = x2iforeach$work<x0,y0>
(* ****** ****** *)
#impltmp
<x0,y0>(*tmp*)
x2iforeach_row$work = x2iforeach$work<x0,y0>
#impltmp
<x0,y0>(*tmp*)
x2iforeach_col$work = x2iforeach$work<x0,y0>
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gbas000.dats] *)
