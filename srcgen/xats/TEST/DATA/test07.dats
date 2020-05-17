(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

#if
X = 0
#then

fun foo(x: int) = x + x

#else

fun bar(x: int) = x + x

#endif // #endif

(* ****** ****** *)

(* end of [test07.dats] *)
