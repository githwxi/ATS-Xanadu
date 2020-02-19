(* ****** ****** *)
//
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
#staload
"prelude/DATS/gint.dats"
//
(*
#include
"prelude/DATS/gnum.dats"
#include
"prelude/DATS/gord.dats"
#include
"prelude/DATS/gint.dats"
*)
//
(* ****** ****** *)

fun
<a:type>
gfact(x) =
if
g_gtz(x)
then
g_mul(x, gfact(g_pred(x))) else g_1()

(* ****** ****** *)

val fact10 = gfact<int>(10)

(* ****** ****** *)

(* end of [gfact.dats] *)
