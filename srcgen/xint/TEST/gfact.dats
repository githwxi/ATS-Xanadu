(* ****** ****** *)

#include
"./../../../prelude/DATS/gnum.dats"
#include
"./../../../prelude/DATS/gord.dats"
#include
"./../../../prelude/DATS/gint.dats"

(* ****** ****** *)

fun
<a:type>
gfact(x) =
if
g_gtz(x)
then
g_mul(x, gfact(g_pred(x))) else g_1()

(* ****** ****** *)

(*
//
#extern
fun
<a:type>
gfact(x: a): a
//
implement
<a>
gfact =
fix
fact(x) =>
if
g_gtz(x)
then
g_mul(x, fact(g_pred(x))) else g_1()
//
*)

(* ****** ****** *)

val fact10 =
let val ans = gfact<int>(10) in ans end

(* ****** ****** *)

(* end of [gfact.dats] *)
