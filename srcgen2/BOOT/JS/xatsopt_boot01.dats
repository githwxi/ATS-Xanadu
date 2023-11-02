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
(* ****** ****** *)
//
val
xbasics_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xbasics.sats", p1_d0eclsq1_sta)
val
xbasics_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xbasics.dats", p1_d0eclsq1_dyn)
val
xbasics_print0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xbasics_print0.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xbasics.sats\") =\n", xbasics_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xbasics.dats\") =\n", xbasics_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xbasics_print0.dats\") =\n", xbasics_print0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xsynoug_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xsynoug.sats", p1_d0eclsq1_sta)
val
xsynoug_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsynoug.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xsynoug.sats\") =\n", xsynoug_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsynoug.dats\") =\n", xsynoug_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xerrory_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xerrory.sats", p1_d0eclsq1_sta)
val
xerrory_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xerrory.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xerrory.sats\") =\n", xerrory_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xerrory.dats\") =\n", xerrory_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xglobal_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xglobal.sats", p1_d0eclsq1_sta)
val
xglobal_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xglobal.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xglobal.sats\") =\n", xglobal_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xglobal.dats\") =\n", xglobal_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xstamp0_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xstamp0.sats", p1_d0eclsq1_sta)
val
xstamp0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xstamp0.dats", p1_d0eclsq1_dyn)
val
xstamp0_print0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xstamp0_print0.dats", p1_d0eclsq1_dyn)
val
xstamp0_tmpmap_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xstamp0_tmpmap.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xstamp0.sats\") =\n", xstamp0_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xstamp0.dats\") =\n", xstamp0_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xstamp0_print0.dats\") =\n", xstamp0_print0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xsymbol_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xsymbol.sats", p1_d0eclsq1_sta)
val
xsymbol_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsymbol.dats", p1_d0eclsq1_dyn)
val
xsymbol_print0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsymbol_print0.dats", p1_d0eclsq1_dyn)
val
xsymbol_mymap0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsymbol_mymap0.dats", p1_d0eclsq1_dyn)
val
xsymbol_inits0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsymbol_inits0.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xsymbol.sats\") =\n", xsymbol_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsymbol.dats\") =\n", xsymbol_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsymbol_print0.dats\") =\n", xsymbol_print0_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsymbol_mymap0.dats\") =\n", xsymbol_mymap0_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsymbol_inits0.dats\") =\n", xsymbol_inits0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xlabel0_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xlabel0.sats", p1_d0eclsq1_sta)
val
xlabel0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xlabel0.dats", p1_d0eclsq1_dyn)
val
xlabel0_print0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xlabel0_print0.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xlabel0.sats\") =\n", xlabel0_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xlabel0.dats\") =\n", xlabel0_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xlabel0_print0.dats\") =\n", xlabel0_print0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
filpath_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/filpath.sats", p1_d0eclsq1_sta)
val
filpath_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/filpath.dats", p1_d0eclsq1_dyn)
val
filpath_print0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/filpath_print0.dats", p1_d0eclsq1_dyn)
val
filpath_drpth0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/filpath_drpth0.dats", p1_d0eclsq1_dyn)
val
filpath_fpath0_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/filpath_fpath0.dats", p1_d0eclsq1_dyn)
val
filpath_search_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/filpath_search.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/filpath.sats\") =\n", filpath_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/filpath.dats\") =\n", filpath_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/filpath_print0.dats\") =\n", filpath_print0_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/filpath_drpth0.dats\") =\n", filpath_drpth0_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/filpath_fpath0.dats\") =\n", filpath_fpath0_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/filpath_search.dats\") =\n", filpath_search_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
locinfo_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/locinfo.sats", p1_d0eclsq1_sta)
val
locinfo_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/locinfo.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/locinfo.sats\") =\n", locinfo_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/locinfo.dats\") =\n", locinfo_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xsymmap_sats =
p1_fun_test_fpath<d0eclist>
("./../../SATS/xsymmap.sats", p1_d0eclsq1_sta)
val
xsymmap_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsymmap.dats", p1_d0eclsq1_dyn)
val
xsymmap_topmap_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsymmap_topmap.dats", p1_d0eclsq1_dyn)
val
xsymmap_stkmap_dats =
p1_fun_test_fpath<d0eclist>
("./../../DATS/xsymmap_stkmap.dats", p1_d0eclsq1_dyn)
//
val (  ) = prerrln
("p1_fun_test(\"./../../SATS/xsymmap.sats\") =\n", xsymmap_sats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsymmap.dats\") =\n", xsymmap_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsymmap_topmap.dats\") =\n", xsymmap_topmap_dats)
val (  ) = prerrln
("p1_fun_test(\"./../../DATS/xsymmap_stkmap.dats\") =\n", xsymmap_stkmap_dats)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_xatsopt_boot01.dats] *)
