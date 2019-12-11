(* ****** ****** *)
//
#staload
ERR =
"./../../../../srcgen/xats/SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload
STM =
"./../../../../srcgen/xats/SATS/stamp0.sats"
#staload
SYM =
"./../../../../srcgen/xats/SATS/symbol.sats"
//
(* ****** ****** *)
//
#staload
FP0 =
"./../../../../srcgen/xats/SATS/filpath.sats"
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
#staload
GLO =
"./../../../../srcgen/xats/SATS/global.sats"
#staload
FS0 =
"./../../../../srcgen/xats/SATS/filsrch.sats"
//
(* ****** ****** *)
//
(*
#staload
"./../../../../srcgen/xats/SATS/json.sats"
*)
#staload
"./../../../../srcgen/xats/SATS/lexing.sats"
//
#staload
"./../../../../srcgen/xats/SATS/parsing.sats"
//
#staload
"./../../../../srcgen/xats/SATS/synread.sats"
//
#staload
"./../../../../srcgen/xats/SATS/trans01.sats"
#staload
"./../../../../srcgen/xats/SATS/t1xread.sats"
//
#staload
"./../../../../srcgen/xats/SATS/trans12.sats"
#staload
"./../../../../srcgen/xats/SATS/t2xread.sats"
//
#staload
"./../../../../srcgen/xats/SATS/trans23.sats"
#staload
"./../../../../srcgen/xats/SATS/trans33.sats"
//
#staload
"./../../../../srcgen/xats/SATS/t3xread.sats"
//
#staload
"./../../../../srcgen/xats/SATS/trans3t.sats"
//
#staload
"./../../../../srcgen/xats/SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload S2E =
"./../../../../srcgen/xats/SATS/staexp2.sats"
#staload D2E =
"./../../../../srcgen/xats/SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload IR0 =
"./../../../../srcgen/xats/SATS/intrep0.sats"
//
(* ****** ****** *)
//
(*
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/json.dats"
*)
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/staexp0_print.dats"
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/dynexp0_print.dats"
//
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/staexp1_print.dats"
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/dynexp1_print.dats"
//
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/staexp2_print.dats"
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/statyp2_print.dats"
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/dynexp2_print.dats"
//
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/dynexp3_print.dats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/intrep0_print.dats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"./../../../../srcgen/xats/DATS/trans12_envmap.dats"
//
(* ****** ****** *)

(* end of [libxatsopt.hats] *)
