(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Fri 06 Sep 2024 11:24:53 PM EDT
Some simple stuff for handling files
*)
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats/HATS/libcats_dats.hats"
//
(* ****** ****** *)
#staload "./../../../myfil00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
#extern
fun<>
myfil00$fpath_readall$fwork
  (fpath: strn, work: (strn)->void): void
*)
//
#impltmp
<(*tmp*)>
myfil00$fpath_readall$fwork
  (fpath, work) =
(
XATS2JS_NODE_myfil00$fpath_readall$fwork
  (fpath, work)) where
{
#extern
fun
XATS2JS_NODE_myfil00$fpath_readall$fwork
  (fpath: strn, work: (strn)->void): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
myfil00$FILR_close
  ( filr ) =
(
XATS2JS_NODE_myfil00$FILR_close
  ( filr )) where
{
#extern
fun
XATS2JS_NODE_myfil00$FILR_close
  (filr: FILR(*HX:it is a stream*)): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
myfil00$fpath_createWrite$fwork
  (fpath, work) =
(
XATS2JS_NODE_myfil00$fpath_createWrite$fwork
  (fpath, work)) where
{
#extern
fun
XATS2JS_NODE_myfil00$fpath_createWrite$fwork
  (fpath: strn, work: (FILR)->void): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_CATS_JS_NODE_myfil00.dats] *)
