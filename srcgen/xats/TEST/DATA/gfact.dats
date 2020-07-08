(* ****** ****** *)

fun
<a:type>
gfact(x:a): a =
if
g_gtz(x)
then
g_mul
(x, gfact(g_pred(x)))
else g_1()

(* ****** ****** *)

val
fact10 = gfact<int>(10)

(* ****** ****** *)

(* end of [gfact.dats] *)
