(* ****** ****** *)
(*
Basics for Xinterp
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
Xint_g_stdin
((*void*)): FILEref
#extern
fun
Xint_g_stdout
((*void*)): FILEref
#extern
fun
Xint_g_stderr
((*void*)): FILEref
//
impltmp
g_stdin<> = Xint_g_stdin
impltmp
g_stdout<> = Xint_g_stdout
impltmp
g_stderr<> = Xint_g_stderr
//
(* ****** ****** *)
//
#extern
fun
Xint_fgetc_ref
(fr: FILEref): int
impltmp
fgetc_ref<> = Xint_fgetc_ref
//
(* ****** ****** *)
//
#extern
fun
Xint_fputc_ref
( c0: int
, fr: FILEref): int
impltmp
fputc_ref<> = Xint_fputc_ref
//
(* ****** ****** *)

(* end of [basics.dats] *)
