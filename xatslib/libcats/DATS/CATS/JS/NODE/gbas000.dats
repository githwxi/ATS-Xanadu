(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Sun 15 Sep 2024 05:54:50 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../../../gbas000.dats"
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
#impltmp
FILR_print_sint<> =
XATS2JS_NODE_FILR_print_sint
where{
#extern
fun
XATS2JS_NODE_FILR_print_sint
  (out: FILR, obj: sint): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
FILR_print_bool<> =
XATS2JS_NODE_FILR_print_bool
where{
#extern
fun
XATS2JS_NODE_FILR_print_bool
  (out: FILR, obj: bool): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
FILR_print_char<> =
XATS2JS_NODE_FILR_print_char
where{
#extern
fun
XATS2JS_NODE_FILR_print_char
  (out: FILR, obj: char): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
FILR_print_dflt<> =
XATS2JS_NODE_FILR_print_dflt
where{
#extern
fun
XATS2JS_NODE_FILR_print_dflt
  (out: FILR, obj: dflt): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
FILR_print_strn<> =
XATS2JS_NODE_FILR_print_strn
where{
#extern
fun
XATS2JS_NODE_FILR_print_strn
  (out: FILR, obj: strn): void = $extnam()
}(*where*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_DATS_CATS_JS_NODE_gbas000.dats] *)
