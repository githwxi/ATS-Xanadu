(* ****** ****** *)
(*
HX-2023-11-01:
A long journey of
bootstrapping ATS3/Xanadu!!!
*)
(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../SATS/locinfo.sats"
#staload
"./../../SATS/lexbuf0.sats"
#staload
"./../../SATS/lexing0.sats"
#staload
"./../../SATS/parsing.sats"
#staload
"./../../SATS/preadx0.sats"
(* ****** ****** *)
#staload
"./../../DATS/parsing.dats"
#staload
"./../../DATS/parsing_utils0.dats"
(* ****** ****** *)
//
val
opt50 =
p1_fun_test_fpath<d0eclist>
("./../../../prelude/SATS/list000.sats", p1_d0eclsq1_sta)
val
opt51 =
p1_fun_test_fpath<d0eclist>
("./../../../prelude/DATS/list000.dats", p1_d0eclsq1_dyn)
//
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_xatsopt_boot01.dats] *)
