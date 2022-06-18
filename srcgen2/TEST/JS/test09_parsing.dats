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
"./../../DATS/parsing.dats"
#include
"./../../DATS/parsing_tokbuf.dats"
#include
"./../../DATS/parsing_basics.dats"
#include
"./../../DATS/parsing_staexp.dats"
#include
"./../../DATS/parsing_utils0.dats"
(* ****** ****** *)
#include
"./../../DATS/preadx0.dats"
#include
"./../../DATS/preadx0_staexp.dats"
(* ****** ****** *)
var the_err = 0
(* ****** ****** *)

val opt =
p1_fun_test<t0int>("123", p1_t0int)
val ( ) =
prerrln("p1_t0int(\"123\") = ", opt)
val opt =
p1_fun_test<t0int>("int?+", p1_t0int)
val ( ) =
prerrln("p1_t0int(\"int?+\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<t0chr>("'0'", p1_t0chr)
val ( ) =
prerrln("p1_t0chr(\"'0'\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<t0flt>("3.14", p1_t0flt)
val ( ) =
prerrln("p1_t0flt(\"3.14\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<t0str>("\"Hello!\"", p1_t0str)
val ( ) =
prerrln("p1_t0str(\"\"Hello!\"\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<l0abl>("12345", p1_l0abl)
val ( ) =
prerrln("p1_l0abl(\"12345\") = ", opt)
val opt =
p1_fun_test<l0abl>("label", p1_l0abl)
val ( ) =
prerrln("p1_l0abl(\"label\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<i0dnt>("@", p1_i0dnt)
val ( ) =
prerrln("p1_i0dnt(\"@\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<i0dnt>("<>", p1_i0dnt)
val ( ) =
prerrln("p1_i0dnt(\"<>\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<i0dnt>("i0dnt", p1_i0dnt)
val ( ) =
prerrln("p1_i0dnt(\"i0dnt\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<i0dnt>("0idnt", p1_i0dnt)
val ( ) =
prerrln("p1_i0dnt(\"0idnt\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<sort0>("type", p1_sort0)
val ( ) =
prerrln("p1_sort0(\"type\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<sort0>("(int,", p1_sort0)
val ( ) =
prerrln("p1_sort0(\"(int,\") = ", opt)
val opt =
preadx0_sort0opt(opt, the_err)
val ( ) =
prerrln("p1_sort0(\"(int,\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<sort0>("(int,chr.1)", p1_sort0)
val ( ) =
prerrln("p1_sort0(\"(int,chr.1)\") = ", opt)

(* ****** ****** *)

val opt =
p1_fun_test<sort0>("int->(int,(int,))->type)", p1_sort0)
val ( ) =
prerrln("p1_sort0(\"int->(int,(int,))->type)\") = ", opt)
val opt =
preadx0_sort0opt(opt, the_err)
val ( ) =
prerrln("p1_sort0(\"int->(int,(int,))->type)\") = ", opt)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test09_parsing.dats] *)
