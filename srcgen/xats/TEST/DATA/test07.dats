(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

#define X "foo"

(* ****** ****** *)

#if
X = "foo"
#then

fun foo(x: int) = x + x

#elsif

fun bar(x: int) = x * x

#endif // #endif

(* ****** ****** *)

(* end of [test07.dats] *)
