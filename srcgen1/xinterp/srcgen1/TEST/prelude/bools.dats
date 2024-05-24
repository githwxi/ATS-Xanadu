(* ****** ****** *)
#staload _ =
"prelude/DATS/bool000.dats"
(* ****** ****** *)
#staload // _ =
"srcgen1\
/prelude\
/DATS/CATS/Xint/basics0.dats"
#staload // _ =
"srcgen1\
/xatslib/githwxi\
/DATS/CATS/Xint/basics0.dats"
(* ****** ****** *)

val b0 = true
val b1 = not(b0)
val () = g_print(b0)
val () = g_print(b1)
val () = g_print(b0 + b1)
val () = g_print(b0 * b1)

(* ****** ****** *)

(* end of [xinterp/srcgen1/TEST/prelude_bools.dats] *)
