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
(* ****** ****** *)
#include
"./../../DATS/filpath_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/filpath_search.dats"
(* ****** ****** *)

val () =
prerrsln("theDirSep = ", theDirSep_get())
val () =
prerrsln("theCurDir = ", theCurDir_get())
val () =
prerrsln("theParDir = ", theParDir_get())

(* ****** ****** *)

val () =
let
val dpx = "./.." in
prerrsln
("drpth(", '"', dpx, '"', ") = ", drpth(dpx))
end // end of [val ()]

(* ****** ****** *)

val nms =
gseq_group_lstrm(fpx) where
{ 
  val DS =
  theDirSep_get()
  val fpx = "./a/ab/abc/"
  #impltmp
  group$test<cgtz>(ch) = (ch != DS) }

val ( ) = prerr1sln("nms = ", listize0(nms))

(* ****** ****** *)

val ( ) =
let
val fpx = "../../../a/ab/abc/abcd"
in
prerrsln("fpx = ", fpx);
prerrsln("fpath_normq(fpx) = ", fpath_normq(fpx))
end

(* ****** ****** *)

val ( ) =
let
val fpx = "./a/../ab/../abc/../../abcde"
in
prerrsln("fpx = ", fpx);
prerrsln("fpath_normize(fpx) = ", fpath_normize(fpx))
end

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test05_filpath.dats] *)
