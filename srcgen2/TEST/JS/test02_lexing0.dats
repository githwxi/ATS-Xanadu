(* ****** ****** *)
#include
"prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude\
/HATS\
/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload
"xatslib\
/libcats/DATS/synoug0.dats"
(* ****** ****** *)
#staload
"xatslib\
/githwxi/DATS/g00iout.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/githwxi\
/DATS/CATS/JS/Node/basics0.dats"
(* ****** ****** *)
#staload
"./../../SATS/lexing0.sats"
(* ****** ****** *)
#staload _ =
"./../../DATS/lexing0.dats"
#staload _ =
"./../../DATS/lexing0_print0.dats"
(* ****** ****** *)

val () =
prerrln("T_EOF() = ", T_EOF())
val () =
prerrln("T_ERR() = ", T_ERR())

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test02_lexing0.dats] *)
