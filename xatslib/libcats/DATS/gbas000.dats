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
Should FILR_print_obj
be used for FILR_gprint?
Sun 15 Sep 2024 05:46:08 PM EDT
*)
#extern
fun
<x0:t0>
FILR_gprint
(out: FILR, obj: a): void
//
#symload
fprint with FILR_gprint of 0100
//
(* ****** ****** *)
//
#extern
fun<>
FILR_print_sint
(out: FILR, obj: sint): void
#extern
fun<>
FILR_print_bool
(out: FILR, obj: bool): void
#extern
fun<>
FILR_print_char
(out: FILR, obj: char): void
#extern
fun<>
FILR_print_dflt
(out: FILR, obj: dflt): void
#extern
fun<>
FILR_print_strn
(out: FILR, obj: strn): void
//
#symload
fprint with FILR_print_sint of 1000
#symload
fprint with FILR_print_bool of 1000
#symload
fprint with FILR_print_char of 1000
#symload
fprint with FILR_print_dflt of 1000
#symload
fprint with FILR_print_strn of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
g_prerr(obj) =
FILR_gprint(g_stderr<>(), obj)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<sint>(i0) =
FILR_print_sint(g_stdout<>(), i0)
#impltmp
g_print<bool>(b0) =
FILR_print_bool(g_stdout<>(), b0)
#impltmp
g_print<char>(c0) =
FILR_print_char(g_stdout<>(), c0)
//
#impltmp
g_print<dflt>(f0) =
(
  FILR_print_dflt(g_stdout<>(), f0))
#impltmp
g_print<strn>(cs) =
(
  FILR_print_strn(g_stdout<>(), cs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
FILR_gprint(out, obj) =
let
#impltmp
g_stdout<>() = out in g_print<x0>(obj) end
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_gint000.dats] *)
