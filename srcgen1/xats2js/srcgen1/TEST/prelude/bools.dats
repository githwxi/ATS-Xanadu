(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude/DATS/bool000.dats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude/DATS/char000.dats"
(* ****** ****** *)
#staload
"srcgen1\
/prelude\
/DATS/CATS/JS/basics0.dats"
#staload
"srcgen1\
/prelude\
/DATS/CATS/JS/unsafex.dats"
(* ****** ****** *)
//
#staload _ =
"prelude/DATS/synoug0.dats"
#staload _ =
"srcgen1\
/prelude\
/DATS/CATS/JS/Node/g_print.dats"
//
(* ****** ****** *)

val b0 = true
val b1 = not(b0)
val () = g_print(b0)
val () = char_print( '\n' )
val () = g_print(b1)
val () = char_print( '\n' )
val () = g_print(b0 + b1)
val () = char_print( '\n' )
val () = g_print(b0 * b1)
val () = char_print( '\n' )

(* ****** ****** *)

(* end of [xats2js/srcgen1/TEST/prelude_bools.dats] *)
