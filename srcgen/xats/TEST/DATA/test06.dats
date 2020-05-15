(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

abstype
myint2_type == $(int, int)
typedef myint2 = myint2_type

(* ****** ****** *)

absopen myint2_type

(* ****** ****** *)

fun
myint2_fst(xx: myint2): int = xx.0
fun
myint2_snd(xx: myint2): int = xx.1

(* ****** ****** *)

(* end of [test06.dats] *)
