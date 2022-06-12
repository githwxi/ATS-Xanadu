(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/lexbuf0.sats"
(* ****** ****** *)
#include
"./../../DATS/lexbuf0.dats"
#include
"./../../DATS/lexbuf0_cstrx0.dats"
(* ****** ****** *)

val csrc =
strx_vt_map0
(
strn_strxize
("Hello, world!")) where
{
#impltmp
map0$fopr
<char><sint>(cc) =
let
val ci = char2sint(cc)
in//let
  if ci >= 0 then ci else -1
end
} (*where*) // end of [strx_map0]

val buf1 = lxbf1_make_cstrx(csrc)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test07_lexbuf0.dats] *)
