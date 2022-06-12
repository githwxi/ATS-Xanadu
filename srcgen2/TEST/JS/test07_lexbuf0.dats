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
("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln
("buf1.unget() = ", char(buf1.unget()))

val (  ) =
prerrln("buf1.getc0() = ", char(buf1.getc0()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
//
val (  ) =
prerrln("buf1.cpbeg() = ", buf1.cpbeg())
val (  ) =
prerrln("buf1.cpcur() = ", buf1.cpcur())
val (  ) =
prerrln("buf1.tcseg() = ", strn(buf1.tcseg()))
//
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrln("buf1.getc1() = ", char(buf1.getc1()))
//
val (  ) =
prerrln("buf1.cpbeg() = ", buf1.cpbeg())
val (  ) =
prerrln("buf1.cpcur() = ", buf1.cpcur())
val (  ) =
prerrln("buf1.tcseg() = ", strn(buf1.tcseg()))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test07_lexbuf0.dats] *)
