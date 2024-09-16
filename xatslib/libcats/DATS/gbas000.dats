(* ****** ****** *)
(* ****** ****** *)
(*
//
HX-2024-09-15:
Sun 15 Sep 2024 05:17:50 PM EDT
//
For various features originated
from the C programming language system
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
FILEref == p0tr(*FILE*)
#typedef FILR = FILEref
//
(* ****** ****** *)
#vwtpdef
FILRopt_vt = optn_vt(FILR)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_prerr(obj:(a)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
g_stdin((*void*)): FILR
//
#extern
fun<>
g_stdout((*void*)): FILR
#extern
fun<>
g_stderr((*void*)): FILR
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-15:
Sun 15 Sep 2024 05:46:08 PM EDT
*)
#extern
fun
<x0:t0>
g_fprint
(obj: x0, out: FILR): void
//
(* ****** ****** *)
//
#extern
fun<>
sint_fprint
(obj: sint, out: FILR): void
#extern
fun<>
bool_fprint
(obj: bool, out: FILR): void
#extern
fun<>
char_fprint
(obj: char, out: FILR): void
#extern
fun<>
dflt_fprint
(obj: dflt, out: FILR): void
#extern
fun<>
strn_fprint
(obj: strn, out: FILR): void
//
#symload
fprint with sint_fprint of 1000
#symload
fprint with bool_fprint of 1000
#symload
fprint with char_fprint of 1000
#symload
fprint with dflt_fprint of 1000
#symload
fprint with strn_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_print(obj) =
(
g_fprint<x0>
(obj, g_stdout<>((*void*))))
#impltmp
< a: t0 >
g_prerr(obj) =
(
g_fprint<x0>
(obj, g_stderr<>((*void*))))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<sint>(i0) =
sint_fprint(i0, g_stdout<>())
#impltmp
g_print<bool>(b0) =
bool_fprint(b0, g_stdout<>())
#impltmp
g_print<char>(c0) =
char_fprint(c0, g_stdout<>())
//
#impltmp
g_print<dflt>(f0) =
(
  dflt_fprint(f0, g_stdout<>()))
#impltmp
g_print<strn>(cs) =
(
  strn_fprint(cs, g_stdout<>()))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_fprint(obj, out) =
let
#impltmp
g_stdout<>() = out in g_print<x0>(obj) end
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_DATS_gbas000.dats] *)
