(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Fri 06 Sep 2024 11:24:53 PM EDT
Some simple stuff for handling files
*)
(* ****** ****** *)
(* ****** ****** *)
#staload "./../../../myfil00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
#extern
fun<>
myfil00$fpath_readall$work
  (fpath: strn, work: (strn)->void): void
*)
//
#impltmp
<(*tmp*)>
myfil00$fpath_readall$work
  (fpath, work) =
(
XATS2JS_NODE_myfil00$fpath_readall$work
  (fpath, work)) where
{
#extern
fun
XATS2JS_NODE_myfil00$fpath_readall$work
  (fpath: strn, work: (strn)->void): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_CATS_JS_NODE_myfil00.dats] *)
