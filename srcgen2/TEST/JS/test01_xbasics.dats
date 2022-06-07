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
"./../../SATS/xbasics.sats"
(* ****** ****** *)
#include
"./../../DATS/xbasics.dats"
#include
"./../../DATS/xbasics_print0.dats"
(* ****** ****** *)

val () =
println("FNKfn0() = ", FNKfn0())
val () =
proutln("FNKfn1() = ", FNKfn1())
val () =
prerrln("FNKfnx() = ", FNKfnx())

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test01_xbasics.dats] *)
