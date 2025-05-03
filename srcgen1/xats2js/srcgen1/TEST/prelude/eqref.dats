(* ****** ****** *)
#include
"./../..\
/xshared/xats2js_prelude.hats"
(* ****** ****** *)
#infix0 === !== of 30
(* ****** ****** *)
#symload === with g_eqref
#symload !== with g_neqrf
(* ****** ****** *)
#staload
"srcgen1\
/prelude\
/DATS/CATS/JS/NODE/g_print.dats"
(* ****** ****** *)

val () =
printsln("0===0: ", 0===0)
val () =
printsln("'0'==='0': ", '0' === '0')
val () =
printsln("\"0\"===\"0\": ", "0" === "0")
val () =
printsln("true!==true: ", true !== true)

(* ****** ****** *)

(* end of [ATS3-Xanadu/srcgen1/xats2js/srcgen1/TEST/prelude/eqref.dats] *)
