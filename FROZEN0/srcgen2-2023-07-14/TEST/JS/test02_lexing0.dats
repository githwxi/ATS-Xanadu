(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/lexing0.sats"
(* ****** ****** *)
#include
"./../../DATS/lexing0.dats"
#include
"./../../DATS/lexing0_token0.dats"
#include
"./../../DATS/lexing0_print0.dats"
(* ****** ****** *)
//
val () =
prerrln("T_EOF() = ", T_EOF())
val () =
prerrln("T_ERR() = ", T_ERR())
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test02_lexing0.dats] *)
