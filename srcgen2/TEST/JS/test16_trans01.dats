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
"./../../DATS/xsymmap_topmap.dats"
#include
"./../../DATS/xsymmap_stkmap.dats"
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
#include
"./../../DATS/xfixity.dats"
(* ****** ****** *)
#include
"./../../DATS/staexp1.dats"
#include
"./../../DATS/staexp1_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/dynexp1.dats"
#include
"./../../DATS/dynexp1_print0.dats"
(* ****** ****** *)
#include
"./../../DATS/trans01.dats"
#include
"./../../DATS/trans01_myenv0.dats"
#include
"./../../DATS/trans01_staexp.dats"
#include
"./../../DATS/trans01_dynexp.dats"
#include
"./../../DATS/trans01_decl00.dats"
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
val ret =
the_fxtyenv_pvsload()
val (  ) =
prerrln
("the_fxtyenv_pvsload() = ", ret)
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
val
dpar =
d0parsed_from_fpath
( 1(*dyn*)
, "./../../../prelude/DATS/bool000.dats")
val
dpar = d0parsed_of_preadx0(dpar)
val
dpar = d1parsed_of_trans01(dpar)
//
val (  ) =
prerrln
("\
dparsed_from_fpath\
(\"./../../../prelude/DATS/bool000.dats\") =\n", dpar)
//
(* ****** ****** *)
//
val
dpar =
d0parsed_from_fpath
( 1(*dyn*)
, "./../../../prelude/DATS/char000.dats")
val
dpar = d0parsed_of_preadx0(dpar)
val
dpar = d1parsed_of_trans01(dpar)
//
val (  ) =
prerrln
("\
d1parsed_from_fpath\
(\"./../../../prelude/DATS/char000.dats\") =\n", dpar)
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test16_trans01.dats] *)
