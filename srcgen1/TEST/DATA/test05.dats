(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xats/basics.dats"
(* ****** ****** *)

#extern
fun
<a:type>
gfact(x: a): a =
if
g_gtz(x)
then
g_mul
(x, gfact(g_pred(x)))
else g_1()

(* ****** ****** *)
(*
val res = gfact<bool>(true)
*)
(* ****** ****** *)

(* end of [test05.dats] *)
