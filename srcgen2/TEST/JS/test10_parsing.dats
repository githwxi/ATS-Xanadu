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
in//local
(* ****** ****** *)
//
var
err:
sint = 0
//
(*
val opt =
p1_fun_test<d0eclist>
("./mytest1.sats", p1_d0eclseq_sta)
*)
//
// (*
val opt =
p1_fun_test<d0eclist>
("./basics0.sats", p1_d0eclseq_sta)
// *)
//
val opt =
(
case+ opt of
|
optn_nil() => optn_nil()
|
optn_cons(dcls) =>
optn_cons
(preadx0_d0eclist(dcls, err))
)
//
val ( ) =
(
case+ opt of
|
optn_nil() => ()
|
optn_cons(dcls) =>
d0eclist_fpemsg(out, dcls)
where { val out = g_stderr<>() }
)
//
// (*
val ( ) =
prerrln("p1_fun_test(\"./basics0.sats\") =\n", opt)
// *)
//
(* ****** ****** *)
endloc (*local*) // end-of-[local(p1_fun_test)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test10_parsing.dats] *)
