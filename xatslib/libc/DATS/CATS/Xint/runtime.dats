(* ****** ****** *)
(*
** The runtime for Xinterp
*)
(* ****** ****** *)
//
#staload
"./../../stdio.dats"
//
(* ****** ****** *)
//
#extern
fun
xint_g_stdin
((*void*)): FILEref
#extern
fun
xint_g_stdout
((*void*)): FILEref
#extern
fun
xint_g_stderr
((*void*)): FILEref
//
impltmp
g_stdin<> = xint_g_stdin
impltmp
g_stdout<> = xint_g_stdout
impltmp
g_stderr<> = xint_g_stderr
//
(* ****** ****** *)
//
#extern
fun
xint_fgetc_ref
(fr: FILEref): int
impltmp
fgetc_ref<> = xint_fgetc_ref
//
(* ****** ****** *)
//
#extern
fun
xint_fputc_ref
( c0: int
, fr: FILEref): int
impltmp
fputc_ref<> = xint_fputc_ref
//
(* ****** ****** *)

(* end of [runtime.dats] *)
