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

val
csrc1 =
strx_vt_map0
(
strn_strxize
("Hello, world!")) where
{
#impltmp
map$fopr0
<char><sint>(cc) =
let
val ci = char_code(cc)
in//let
  if ci > 0 then ci else -1
end
} (*where*) // end of [strx_map0]

val
csrc2 =
strx_vt_map0
(
strn_strxize
("Hello, world!")) where
{
#impltmp
map$fopr0
<char><sint>(cc) =
let
val ci = char_code(cc)
in//let
  if ci > 0 then ci else -1
end
} (*where*) // end of [strx_map0]

(* ****** ****** *)

val buf1 = lxbf1_make0_cstrx(csrc1)

(* ****** ****** *)
//
val (  ) =
prerrsln
("buf1.getc0() = ", char(buf1.getc0()))
val (  ) =
prerrsln
("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrsln
("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrsln
("buf1.unget(0) = ", char(buf1.unget(0)))
//
val (  ) =
prerrsln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrsln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrsln("buf1.getc1() = ", char(buf1.getc1()))
val (  ) =
prerrsln("buf1.getc1() = ", char(buf1.getc1()))
//
val (  ) =
prerrsln("buf1.tclst() = ", strn(buf1.tclst()))
//
(* ****** ****** *)

val buf2 = lxbf2_make0_cstrx(csrc2)

(* ****** ****** *)
//
val (  ) =
prerrsln
("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln
("buf2.unget() = ", char(buf2.unget()))
//
val (  ) =
prerrsln("buf2.getc0() = ", char(buf2.getc0()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
//
val (  ) =
prerrsln("buf2.cpbeg() = ", buf2.cpbeg())
val (  ) =
prerrsln("buf2.cpcur() = ", buf2.cpcur())
val (  ) =
prerrsln("buf2.tclst() = ", strn(buf2.tclst()))
//
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
val (  ) =
prerrsln("buf2.getc1() = ", char(buf2.getc1()))
//
val (  ) =
prerrsln("buf2.cpbeg() = ", buf2.cpbeg())
val (  ) =
prerrsln("buf2.cpcur() = ", buf2.cpcur())
val (  ) =
prerrsln("buf2.tclst() = ", strn(buf2.tclst()))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test07_lexbuf0.dats] *)
