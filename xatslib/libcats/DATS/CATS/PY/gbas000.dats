(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-05-01:
Thu May  1 10:34:54 PM EDT 2025
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../DATS/gbas000.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_stdin<>() =
(
XATS2PY_g_stdin
  ((*0*))) where
{
#extern
fun
XATS2PY_g_stdin(): FILR = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
g_stdout<>() =
(
XATS2PY_g_stdout
  ((*0*))) where
{
#extern
fun
XATS2PY_g_stdout(): FILR = $extnam()
}
//
#impltmp
g_stderr<>() =
(
XATS2PY_g_stderr
  ((*0*))) where
{
#extern
fun
XATS2PY_g_stderr(): FILR = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
sint_fprint<> =
XATS2PY_sint_fprint
where{
#extern
fun
XATS2PY_sint_fprint
(obj: sint, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
bool_fprint<> =
XATS2PY_bool_fprint
where{
#extern
fun
XATS2PY_bool_fprint
(obj: bool, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
char_fprint<> =
XATS2PY_char_fprint
where{
#extern
fun
XATS2PY_char_fprint
(obj: char, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
dflt_fprint<> =
XATS2PY_dflt_fprint
where{
#extern
fun
XATS2PY_dflt_fprint
(obj: dflt, out: FILR): void = $extnam()
}(*where*)
//
(* ****** ****** *)
//
#impltmp
strn_fprint<> =
XATS2PY_strn_fprint
where{
#extern
fun
XATS2PY_strn_fprint
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
process_argv
( (*void*) ): argv
//
#impltmp
<(*tmp*)>
process_argv() =
(
XATS2PY_process_argv
  ((*void*))) where
{
#extern
fun//fun
XATS2PY_process_argv(): argv = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_libcats_DATS_CATS_PY_gbas000.dats] *)
(***********************************************************************)
