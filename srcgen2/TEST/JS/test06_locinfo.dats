(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/locinfo.sats"
(* ****** ****** *)
#include
"./../../DATS/locinfo.dats"
#include
"./../../DATS/locinfo_print0.dats"
(* ****** ****** *)

val pos0 = postn(0, 0, 0)
val (  ) = prerrln("postn(0, 0, 0) = ", pos0)
val pos1 = postn(0, 1, 2)
val (  ) = prerrln("postn(0, 1, 2) = ", pos1)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test06_locinfo.dats] *)
