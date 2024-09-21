(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Sun 15 Sep 2024 05:54:50 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
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
sint_fprint<> =
XATS2JS_NODE_sint_fprint
where{
#extern
fun
XATS2JS_NODE_sint_fprint
  (obj: sint, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
bool_fprint<> =
XATS2JS_NODE_bool_fprint
where{
#extern
fun
XATS2JS_NODE_bool_fprint
  (obj: bool, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
char_fprint<> =
XATS2JS_NODE_char_fprint
where{
#extern
fun
XATS2JS_NODE_char_fprint
  (obj: char, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
dflt_fprint<> =
XATS2JS_NODE_dflt_fprint
where{
#extern
fun
XATS2JS_NODE_dflt_fprint
  (obj: dflt, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
strn_fprint<> =
XATS2JS_NODE_strn_fprint
where{
#extern
fun
XATS2JS_NODE_strn_fprint
  (obj: strn, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
argv = a1sz(strn)
//
#extern
fun<>
process_argv(): argv
//
#impltmp
<(*tmp*)>
process_argv() =
(
XATS2JS_NODE_process_argv
  ((*void*))) where
{
#extern
fun//fun
XATS2JS_NODE_process_argv(): argv = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_DATS_CATS_JS_NODE_gbas000.dats] *)
