(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
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
val tmper0 = stamper_new()
(* ****** ****** *)
val (   ) =
println("tmp1 = ", tmper0.getinc())
val (   ) =
println("tmp2 = ", tmper0.getinc())
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test03_xstamp0.dats] *)
