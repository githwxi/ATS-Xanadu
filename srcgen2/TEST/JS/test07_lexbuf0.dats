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
val ci = char_code(cc)
in//let
  if ci > 0 then ci else -1
end
} (*where*) // end of [strx_map0]

val buf1 = lxbf1_make_cstrx(csrc)

val (  ) =
prerrln
("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln
(
"buf1.unget() = ", char(buf1.undo()))

val (  ) =
prerrln("buf1.get0() = ", char(buf1.get0()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
//
val (  ) =
prerrln("buf1.pbeg() = ", buf1.pbeg())
val (  ) =
prerrln("buf1.pcur() = ", buf1.pcur())
val (  ) =
prerrln("buf1.cseg() = ", strn(buf1.cseg()))
//
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
val (  ) =
prerrln("buf1.get1() = ", char(buf1.get1()))
//
val (  ) =
prerrln("buf1.pbeg() = ", buf1.pbeg())
val (  ) =
prerrln("buf1.pcur() = ", buf1.pcur())
val (  ) =
prerrln("buf1.cseg() = ", strn(buf1.cseg()))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test07_lexbuf0.dats] *)
