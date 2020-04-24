(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

#extern
fun
<a:type>
gfact(x: a): a

val res = gfact<int>(10)

(* ****** ****** *)

(* end of [test05.dats] *)
