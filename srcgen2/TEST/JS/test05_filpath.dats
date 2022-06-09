(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/filpath.sats"
(* ****** ****** *)
#include
"./../../DATS/filpath.dats"
#include
"./../../DATS/filpath_drpth0.dats"
#include
"./../../DATS/filpath_fpath0.dats"
#include
"./../../DATS/filpath_print0.dats"
(* ****** ****** *)

val () =
prerrln("theDirSep = ", theDirSep_get())
val () =
prerrln("theCurDir = ", theCurDir_get())
val () =
prerrln("theParDir = ", theParDir_get())

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test05_filpath.dats] *)
