(* ****** ****** *)
(*
** The runtime for Xinterp
*)
(* ****** ****** *)
//
(*
prelude/gios.sats
*)
//
(* ****** ****** *)

#staload
"./../../stdio.dats"

(* ****** ****** *)
//
#extern
fun
xint_g_stdin
((*void*)): FILEref
impltmp
g_stdin<> = xint_g_stdin
#extern
fun
xint_g_stdout
((*void*)): FILEref
impltmp
g_stdout<> = xint_g_stdout
#extern
fun
xint_g_stderr
((*void*)): FILEref
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
