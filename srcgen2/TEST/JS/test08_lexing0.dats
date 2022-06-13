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
"./../../DATS/lexing0_print0.dats"
#include
"./../../DATS/lexing0_utils0.dats"
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

val buf1 = lxbf1_make_cstrx(csrc1)

(* ****** ****** *)

val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))
val (  ) =
prerrln
("lexing(buf1) = ", lxbf1_lexing_tnode(buf1))

(* ****** ****** *)
//
val
csrc2 =
strx_vt_map0
(
strn_strxize
(
"(\"lexing(buf1) = \", lxbf1_lexing_tnode(buf1))"
)
) where
{
#impltmp
map0$fopr
<char><sint>(cc) =
let
val ci = char_code(cc) in if ci > 0 then ci else -1
end
} (*where*) // end of [strx_map0]
//
val buf2 = lxbf1_make_cstrx(csrc2)
//
val (  ) =
prerrln("lexing(buf2) = ", lxbf1_lexing_tnodelst(buf2))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test08_lexing0.dats] *)
