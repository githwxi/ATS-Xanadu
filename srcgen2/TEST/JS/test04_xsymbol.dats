(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/xsymbol.sats"
(* ****** ****** *)
//
#include
"./../../DATS/xglobal.dats"
//
(* ****** ****** *)
//
#include
"./../../DATS/xstamp0.dats"
#include
"./../../DATS/xsymbol.dats"
#include
"./../../DATS/xstamp0_print0.dats"
#include
"./../../DATS/xstamp0_tmpmap.dats"
#include
"./../../DATS/xsymbol_mymap0.dats"
#include
"./../../DATS/xsymbol_print0.dats"
#include
"./../../DATS/xsymmap_topmap.dats"
//
(* ****** ****** *)
//
val () =
prerrsln
("the_symbl_nil = ", the_symbl_nil)
//
(* ****** ****** *)
//
val () = prerrsln("sym1 = ", symbl("sym1"))
val () = prerrsln("sym2 = ", symbl("sym2"))
val () = prerrsln("sym1 = ", symbl("sym1"))
val () = prerrsln("sym2 = ", symbl("sym2"))
val () = prerrsln("sym3 = ", symbl("sym3"))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test04_xsymbol.dats] *)
