(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

absvtbox myint2

(* ****** ****** *)

fun
myint2_fst(xx: myint2): int = xx.0
fun
myint2_snd(xx: myint2): int = xx.1

(* ****** ****** *)

(* end of [test06.dats] *)
