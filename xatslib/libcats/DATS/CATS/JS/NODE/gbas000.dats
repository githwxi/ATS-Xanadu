(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Sun 15 Sep 2024 05:54:50 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../../../myfil00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_stdin<>() =
(
XATS2JS_NODE_g_stdin
  ((*void*))) where
{
#extern
fun
XATS2JS_NODE_g_stdin(): FILR = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
g_stdout<>() =
(
XATS2JS_NODE_g_stdout
  ((*void*))) where
{
#extern
fun
XATS2JS_NODE_g_stdout(): FILR = $extnam()
}
//
//
#impltmp
g_stderr<>() =
(
XATS2JS_NODE_g_stderr
  ((*void*))) where
{
#extern
fun
XATS2JS_NODE_g_stderr(): FILR = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_DATS_CATS_JS_NODE_gbas000.dats] *)
