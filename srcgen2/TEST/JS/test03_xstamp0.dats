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
//
#include
"./../../DATS/xstamp0.dats"
#include
"./../../DATS/xstamp0_print0.dats"
//
(* ****** ****** *)
val
tmper0=stamper_new()
val
tmper1=stamper_new()
(* ****** ****** *)
val () =
prerrsln
( "nilq(nil) = "
, nilq(the_stamp_nil))
val () =
prerrsln
( "nilq(nil) = "
, neqz(the_stamp_nil))
(* ****** ****** *)
val () =
prerrsln
("the_stamp_nil = ", the_stamp_nil)
(* ****** ****** *)
//
val (  ) =
prerrsln("tmp1 = ", tmper0.getinc())
val (  ) =
prerrsln("tmp2 = ", tmper0.getinc())
//
val
tmp3 =
tmper0.getinc() and tmp4 = tmper0.getinc()
//
val (  ) =
prerrsln("cmp(tmp3, tmp3) = ", tmp3 \cmp tmp3)
val (  ) =
prerrsln("cmp(tmp3, tmp4) = ", tmp3 \cmp tmp4)
val (  ) =
prerrsln("cmp(tmp4, tmp3) = ", tmp4 \cmp tmp3)
val (  ) =
prerrsln("cmp(tmp4, tmp4) = ", tmp4 \cmp tmp4)
//
val (  ) = tmper1.tmpset(1000)
//
val (  ) =
prerrsln("tmper1.getinc() = ", tmper1.getinc())
val (  ) =
prerrsln("tmper1.getinc() = ", tmper1.getinc())
val (  ) =
prerrsln("tmper1.getinc() = ", tmper1.getinc())
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test03_xstamp0.dats] *)
