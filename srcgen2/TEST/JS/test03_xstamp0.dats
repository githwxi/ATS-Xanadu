(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/xstamp0.sats"
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
