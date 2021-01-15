(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xats/basics.dats"
(* ****** ****** *)
abstype
myint1_type
typedef myint1 = myint1_type
(* ****** ****** *)

fun
myint1_fst
(xx: myint1): int =
( xx.0 + xx.1 ) where
{
absimpl myint1_type = @(int, int)
}

(* ****** ****** *)
abstype
myint2_type == @(int, int)
typedef myint2 = myint2_type
(* ****** ****** *)

fun
myint2_fst
(xx: myint2): int =
let absopen myint2_type in xx.0 end

fun
myint2_snd(xx: myint2): int =
let absopen myint2_type in xx.1 end

(* ****** ****** *)

(* end of [test06.dats] *)
