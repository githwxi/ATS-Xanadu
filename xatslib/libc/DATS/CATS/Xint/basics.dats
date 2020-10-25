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
XINTERP_g_stdin
((*void*)): FILEref
#extern
fun
XINTERP_g_stdout
((*void*)): FILEref
#extern
fun
XINTERP_g_stderr
((*void*)): FILEref
//
impltmp
g_stdin<> = XINTERP_g_stdin
impltmp
g_stdout<> = XINTERP_g_stdout
impltmp
g_stderr<> = XINTERP_g_stderr
//
(* ****** ****** *)
//
#extern
fun
XINTERP_fgetc_ref
(fr: FILEref): int
impltmp
fgetc_ref<> = XINTERP_fgetc_ref
//
(* ****** ****** *)
//
#extern
fun
XINTERP_fputc_ref
( c0: int
, fr: FILEref): int
impltmp
fputc_ref<> = XINTERP_fputc_ref
//
(* ****** ****** *)

(* end of [XINTERP_basics.dats] *)
