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
#staload
"./../../SATS/lexbuf0.sats"
#staload
"./../../SATS/lexing0.sats"
#staload
"./../../SATS/staexp0.sats"
#staload
"./../../SATS/dynexp0.sats"
#staload
"./../../SATS/parsing.sats"
#staload
"./../../SATS/preadx0.sats"
(* ****** ****** *)
#include
"./../../DATS/xbasics.dats"
#include
"./../../DATS/xbasics_print0.dats"
(* ****** ****** *)
//
#include
"./../../DATS/xglobal.dats"
//
(* ****** ****** *)
#include
"./../../DATS/xstamp0.dats"
#include
"./../../DATS/xstamp0_print0.dats"
#include
"./../../DATS/xstamp0_tmpmap.dats"
(* ****** ****** *)
#include
"./../../DATS/xsymbol.dats"
#include
"./../../DATS/xsymbol_print0.dats"
#include
"./../../DATS/xsymbol_mymap0.dats"
#include
"./../../DATS/xsymbol_inits0.dats"
(* ****** ****** *)
#include
"./../../DATS/xsymmap_topmap.dats"
(* ****** ****** *)
#include
"./../../DATS/xlabel0.dats"
#include
"./../../DATS/xlabel0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/locinfo.dats"
#include
"./../../DATS/locinfo_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/lexbuf0.dats"
#include
"./../../DATS/lexbuf0_cstrx1.dats"
#include
"./../../DATS/lexbuf0_cstrx2.dats"
(* ****** ****** *)
#include
"./../../DATS/lexing0.dats"
#include
"./../../DATS/lexing0_token0.dats"
#include
"./../../DATS/lexing0_print0.dats"
#include
"./../../DATS/lexing0_mymap0.dats"
#include
"./../../DATS/lexing0_kword0.dats"
#include
"./../../DATS/lexing0_utils1.dats"
#include
"./../../DATS/lexing0_utils2.dats"
(* ****** ****** *)
#include
"./../../DATS/staexp0.dats"
#include
"./../../DATS/staexp0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/dynexp0.dats"
#include
"./../../DATS/dynexp0_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/parsing.dats"
#include
"./../../DATS/parsing_tokbuf.dats"
#include
"./../../DATS/parsing_basics.dats"
#include
"./../../DATS/parsing_utils0.dats"
#include
"./../../DATS/parsing_staexp.dats"
#include
"./../../DATS/parsing_dynexp.dats"
#include
"./../../DATS/parsing_decl00.dats"
(* ****** ****** *)
#include
"./../../DATS/preadx0.dats"
#include
"./../../DATS/preadx0_staexp.dats"
#include
"./../../DATS/preadx0_dynexp.dats"
#include
"./../../DATS/preadx0_decl00.dats"
#include
"./../../DATS/preadx0_errmsg.dats"
(* ****** ****** *)
var the_err = 0
(* ****** ****** *)
#define
p1_fun_test p1_fun_test_fpath
#define
pq_fun_test pq_fun_test_fpath
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
#impltmp
optn_print$beg<>() = ()
#impltmp
optn_print$end<>() = ()
//
#impltmp
list_print$beg<>() = ()
#impltmp
list_print$end<>() = ()
#impltmp
list_print$sep<>() = print("\n")
//
(* ****** ****** *)
//
(*
#impltmp
g_print<token>(tok) =
print(tok.lctn(), ":", tok.node())
*)
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
var
err:
sint = 0
//
val
(  ) =
prerrln("p1_fun_test(0)")
//
val
opt1 =
p1_fun_test<d0eclist>
("./../../..\
/srcgen1/prelude/DATS/bool000.dats", p1_d0eclsq1_dyn)
//
val
(  ) =
prerrln("p1_fun_test(1)")
//
val
opt2 =
p1_fun_test<d0eclist>
("./../../..\
/srcgen1/prelude/DATS/char000.dats", p1_d0eclsq1_dyn)
//
val
(  ) =
prerrln("p1_fun_test(2)")
//
val
opt30 =
p1_fun_test<d0eclist>
("./../../..\
/prelude/SATS/gint000.sats", p1_d0eclsq1_sta)
val
opt31 =
p1_fun_test<d0eclist>
("./../../..\
/srcgen1/prelude/DATS/gint000.dats", p1_d0eclsq1_dyn)
//
val (  ) =
prerrln("p1_fun_test(3)")
//
val
opt40 =
p1_fun_test<d0eclist>
("./../../..\
/prelude/SATS/gseq000.sats", p1_d0eclsq1_sta)
val
opt41 =
p1_fun_test<d0eclist>
("./../../..\
/srcgen1/prelude/DATS/gseq000.dats", p1_d0eclsq1_dyn)
//
val (  ) =
prerrln("p1_fun_test(4)")
//
val
opt50 =
p1_fun_test<d0eclist>
("./../../..\
/prelude/SATS/list000.sats", p1_d0eclsq1_sta)
val
opt51 =
p1_fun_test<d0eclist>
("./../../..\
/srcgen1/prelude/DATS/list000.dats", p1_d0eclsq1_dyn)
//
val (  ) =
prerrln("p1_fun_test(5)")
//
val
opt60 =
p1_fun_test<d0eclist>
("./../../..\
/prelude/SATS/strm000.sats", p1_d0eclsq1_sta)
val
opt61 =
p1_fun_test<d0eclist>
("./../../..\
/srcgen1/prelude/DATS/strm000.dats", p1_d0eclsq1_dyn)
//
val (  ) =
prerrln("p1_fun_test(6)")
//
val (  ) =
prerrln
("p1_fun_test(\"./../../../srcgen1/prelude/DATS/bool000.dats\") =\n", opt1)
//
val (  ) =
prerrln
("p1_fun_test(\"./../../../srcgen1/prelude/DATS/char000.dats\") =\n", opt2)
//
val (  ) =
prerrln
("p1_fun_test(\"./../../../prelude/SATS/gint000.sats\") =\n", opt30)
val (  ) =
prerrln
("p1_fun_test(\"./../../../srcgen1/prelude/DATS/gint000.dats\") =\n", opt31)
//
val (  ) =
prerrln
("p1_fun_test(\"./../../../prelude/SATS/gseq000.sats\") =\n", opt40)
val (  ) =
prerrln
("p1_fun_test(\"./../../../srcgen1/prelude/DATS/gseq000.dats\") =\n", opt41)
//
val (  ) =
prerrln
("p1_fun_test(\"./../../../prelude/SATS/list000.sats\") =\n", opt50)
val (  ) =
prerrln
("p1_fun_test(\"./../../../srcgen1/prelude/DATS/list000.dats\") =\n", opt51)
//
val (  ) =
prerrln
("p1_fun_test(\"./../../../prelude/SATS/strm000.sats\") =\n", opt60)
val (  ) =
prerrln
("p1_fun_test(\"./../../../srcgen1/prelude/DATS/strm000.dats\") =\n", opt61)
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(p1_fun_test)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test13_parsing.dats] *)
