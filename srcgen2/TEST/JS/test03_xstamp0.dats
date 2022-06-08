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
"./../../SATS/xstamp0.sats"
(* ****** ****** *)
#staload _ =
"./../../DATS/xstamp0.dats"
#staload _ =
"./../../DATS/xstamp0_print0.dats"
(* ****** ****** *)
val () =
prerrln
( "nilq(nil) = "
, nilq(the_stamp_nil))
val () =
prerrln
( "nilq(nil) = "
, neqz(the_stamp_nil))
(* ****** ****** *)
val () =
prerrln
("the_stamp_nil = ", the_stamp_nil)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test03_xstamp0.dats] *)
