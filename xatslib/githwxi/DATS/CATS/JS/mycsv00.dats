(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
Sat 07 Sep 2024 12:56:59 PM EDT
Some simple stuff for CSV-handling
*)
(* ****** ****** *)
(* ****** ****** *)
#staload "./../../mycsv00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
#extern
fun<>
mycsv00$line_csv$parse$fwork
  (line: strn, work: a1sz(strn)->void): void
*)
//
#impltmp
<(*tmp*)>
mycsv00$line_csv$parse$fwork
  (line, work) =
(
XATS2JS_NODE_mycsv00$line_csv$parse$fwork
  (line, work)) where
{
#extern
fun
XATS2JS_NODE_mycsv00$line_csv$parse$fwork
  (line: strn, work: a1sz(strn)->void): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_CATS_JS_NODE_mycsv00.dats] *)
