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
(* ****** ****** *)
(*
//HX-2022-06-14:
//For compiling excptcons
*)
(* ****** ****** *)
#include
"./../../DATS/xbasics.dats"
#include
"./../../DATS/xbasics_print0.dats"
(* ****** ****** *)
#include
"./../../SATS/xerrory.sats"
#include
"./../../DATS/xerrory.dats"
(* ****** ****** *)
#include
"./../../DATS/locinfo.dats"
#include
"./../../DATS/locinfo_print0.dats"
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
//
val
csrc1 =
strx_vt_map0
(
strn_strxize
("H e l l o, w o r l d !")) where
{
#impltmp
map0$fopr
<char><sint>(cc) =
let
val ci = char_code(cc)
in//let
  if ci > 0 then ci else -1
end
} (*where*) // end of [strx_map0]
//
(* ****** ****** *)

val buf1 = lxbf1_make0_cstrx(csrc1)

(* ****** ****** *)

val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))

(* ****** ****** *)
(*
val (  ) = prerrsln("ALNUMq('a') = ", ALNUMq('a'))
val (  ) = prerrsln("ALNUMq('z') = ", ALNUMq('z'))
val (  ) = prerrsln("ALNUMq('0') = ", ALNUMq('0'))
val (  ) = prerrsln("ALNUMq('9') = ", ALNUMq('9'))
val (  ) = prerrsln("ALNUMq('_') = ", ALNUMq('_'))
val (  ) = prerrsln("ALNUM_q('a') = ", ALNUM_q('a'))
val (  ) = prerrsln("ALNUM_q('z') = ", ALNUM_q('z'))
val (  ) = prerrsln("ALNUM_q('0') = ", ALNUM_q('0'))
val (  ) = prerrsln("ALNUM_q('9') = ", ALNUM_q('9'))
val (  ) = prerrsln("ALNUM_q('_') = ", ALNUM_q('_'))
val (  ) = prerrsln("ALNUM_q('.') = ", ALNUM_q('.'))
val (  ) = prerrsln("XDIGITq('0') = ", XDIGITq('0'))
val (  ) = prerrsln("XDIGITq('a') = ", XDIGITq('a'))
val (  ) = prerrsln("XDIGITq('f') = ", XDIGITq('f'))
val (  ) = prerrsln("XDIGITq('g') = ", XDIGITq('g'))
val (  ) = prerrsln("XDIGITq('A') = ", XDIGITq('A'))
val (  ) = prerrsln("XDIGITq('F') = ", XDIGITq('F'))
val (  ) = prerrsln("XDIGITq('G') = ", XDIGITq('G'))
*)
(* ****** ****** *)
(*
val (  ) = prerrsln("IDFSTq('z') = ", IDFSTq( 'z' ))
val (  ) = prerrsln("IDFSTq('X') = ", IDFSTq( 'X' ))
val (  ) = prerrsln("IDFSTq('_') = ", IDFSTq( '_' ))
val (  ) = prerrsln("IDFSTq('%') = ", IDFSTq( '%' ))
val (  ) = prerrsln("IDSYMq('%') = ", IDSYMq( '%' ))
val (  ) = prerrsln("IDSYMq(':') = ", IDSYMq( ':' ))
val (  ) = prerrsln("IDSYMq('@') = ", IDSYMq( '@' ))
val (  ) = prerrsln("IDSYMq('#') = ", IDSYMq( '#' ))
val (  ) = prerrsln("IDSYMq('$') = ", IDSYMq( '$' ))
val (  ) = prerrsln("IDFSTq('\'') = ", IDFSTq( '\'' ))
val (  ) = prerrsln("IDRSTq('\'') = ", IDRSTq( '\'' ))
*)
(* ****** ****** *)
val (  ) =
prerrsln("SLASHq('/') = ", SLASHq( '/' ))
val (  ) =
prerrsln("SLASH4q('//Hello?!') = ", SLASH4q("//Hello?!"))
val (  ) =
prerrsln("SLASH4q('////Hello?!') = ", SLASH4q("////Hello?!"))
(* ****** ****** *)
//
val buf1 =
lxbf1_make_strn
(
":<abcde>\"Hello, world!\"'\\000''\\a'bcd012"
)
//
val (  ) =
prerrsln
("lexing(buf1) = ", lxbf1_lexing_tnodelst(buf1))
//
(* ****** ****** *)
//
val buf2 =
lxbf1_make_strn
(
"\"lexing(buf1) =\", $LX$BF.lxbf1_lexing_tnode(buf1), \"Hello?"
)
//
val (  ) =
prerrsln
("lexing(buf2) = ", lxbf1_lexing_tnodelst(buf2))
//
(* ****** ****** *)
//
val buf3 =
lxbf1_make_strn
(
"//A-line-comment\n////A-comment-of-rest-style"
)
//
val (  ) =
prerrsln
("lexing(buf3) = ", lxbf1_lexing_tnodelst(buf3))
//
(* ****** ****** *)
//
val buf4 =
lxbf1_make_strn
(
"(* Hello? (* world!!! *) *)"
)
//
val (  ) =
prerrsln
("lexing(buf4) = ", lxbf1_lexing_tnodelst(buf4))
//
(* ****** ****** *)
//
(*
val buf5 =
lxbf1_make_strn
(
"(0, 10, 012ULL, 0xFF, 123E+10, 3.14)"
)
//
val (  ) =
prerrsln
("lexing(buf5) = ", lxbf1_lexing_tnodelst(buf5))
*)
//
val toks = 
strn_tokenize
(
"(0, 10, 012ULL, 0xFF, 123E+10, 3.14)"
)
local
#impltmp
<xs><x0>
gseq_print$beg() = ()
#impltmp
<xs><x0>
gseq_print$end() = ()
#impltmp
<xs><x0>
gseq_print$sep() = g_print("\n")
#impltmp
g_print<token>(tok) =
print(tok.lctn(), ":", tok.node())
in//local
val (  ) = prerrsln("lexing(buf5): toks =\n", toks)
end//local
//
(* ****** ****** *)
//
val toks =
strn_tokenize("op+")
(*
fpath_tokenize("./../../SATS/xbasics.sats")
fpath_tokenize("./../../DATS/xbasics.dats")
*)
//
(*
//
val buf6 =
lxbf1_make_fpath("./../../SATS/xbasics.sats")
//
val tnds = lxbf1_lexing_tnodelst(buf6)
val toks = lexing_lctnize_all(LCSRCnone0(), tnds)
//
*)
local
#impltmp
<xs><x0>
gseq_print$beg() = ()
#impltmp
<xs><x0>
gseq_print$end() = ()
#impltmp
<xs><x0>
gseq_print$sep() = g_print("\n")
#impltmp
g_print<token>(tok) =
print(tok.lctn(), ":", tok.node())
in//local
val (  ) = prerrsln("lexing(buf6): toks =\n", toks)
end//local
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test08_lexing0.dats] *)
