(* ****** ****** *)
//
#staload
"./../../xats/SATS/label0.sats"
#staload
"./../../xats/SATS/stamp0.sats"
#staload
"./../../xats/SATS/symbol.sats"
//
(* ****** ****** *)
//
#staload
"./../../xats/SATS/filsrch.sats"
//
(* ****** ****** *)
//
#staload
"./../../xats/SATS/lexing.sats"
//
#staload
"./../../xats/SATS/parsing.sats"
//
#staload
"./../../xats/SATS/staexp0.sats"
#staload
"./../../xats/SATS/dynexp0.sats"
#staload
"./../../xats/SATS/synread.sats"
//
#staload
"./../../xats/SATS/trans01.sats"
#staload
"./../../xats/SATS/staexp1.sats"
#staload
"./../../xats/SATS/dynexp1.sats"
#staload
"./../../xats/SATS/t1xread.sats"
//
#staload
"./../../xats/SATS/trans12.sats"
#staload
"./../../xats/SATS/t2xread.sats"
//
#staload
"./../../xats/SATS/trans23.sats"
#staload
"./../../xats/SATS/trans33.sats"
//
#staload
"./../../xats/SATS/t3xread.sats"
//
#staload
"./../../xats/SATS/trans3t.sats"
//
(* ****** ****** *)
//
#staload
GLO =
"./../../xats/SATS/global.sats"
//
#staload
ERR =
"./../../xats/SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload
FP0 =
"./../../xats/SATS/filpath.sats"
//
  typedef
  fpath_t = $FP0.filpath
  macdef
  dirbase =
  $FP0.filpath_dirbase
  macdef
  fpath_make = $FP0.filpath_make
//
(* ****** ****** *)
//
#staload S2E =
"./../../xats/SATS/staexp2.sats"
#staload D2E =
"./../../xats/SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"./../../xats/DATS/staexp0_print.dats"
#staload
_(*TMP*) =
"./../../xats/DATS/dynexp0_print.dats"
//
#staload
_(*TMP*) =
"./../../xats/DATS/staexp1_print.dats"
#staload
_(*TMP*) =
"./../../xats/DATS/dynexp1_print.dats"
//
#staload
_(*TMP*) =
"./../../xats/DATS/staexp2_print.dats"
#staload
_(*TMP*) =
"./../../xats/DATS/statyp2_print.dats"
#staload
_(*TMP*) =
"./../../xats/DATS/dynexp2_print.dats"
//
#staload
_(*TMP*) =
"./../../xats/DATS/dynexp3_print.dats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"./../../xats/DATS/trans12_envmap.dats"
//
(* ****** ****** *)

(* end of [libxatsopt.hats] *)

