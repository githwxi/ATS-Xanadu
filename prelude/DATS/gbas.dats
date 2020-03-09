(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

#staload
"./../SATS/gbas.sats"

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
impltmp
{a:vt}
g_noteq<a>
  (x, y) =
(
  not(g_equal<a>(x, y))
)
//
(* ****** ****** *)
//
// HX: for list_vt
//
(* ****** ****** *)

impltmp
{a:vt}
g_free<list_vt(a)>
  (xs) =
( loop(xs) ) where
{
fun`
loop(xs: list_vt(a)): void =
(
case+ xs of
|
~list_vt_nil() => ()
|
~list_vt_cons(x0, xs) =>
 let
   val () = g_free<a>(x0) in loop(xs)
 end
)
} (* end of [g_free<list_vt>] *)

(* ****** ****** *)
//
impltmp
<x0><y0>
mapopt$fopr(x0) =
if
filter$test<x0>(x0)
then
optn_vt_cons
(map$fopr<x0><y0>(x0))
else optn_vt_nil((*void*))
//
(* ****** ****** *)
//
impltmp
<x0><y0>
mapopt0$fopr(x0) =
if
filter1$test<x0>(x0)
then
optn_vt_cons
(map0$fopr<x0><y0>(x0))
else
let
val () = g_free<x0>(x0)
in
  optn_vt_nil((*void*))
end
//
impltmp
<x0><y0>
mapopt1$fopr(x0) =
if
filter1$test<x0>(x0)
then
optn_vt_cons
(map1$fopr<x0><y0>(x0))
else optn_vt_nil((*void*))
//
(* ****** ****** *)

(* end of [gbas.dats] *)
