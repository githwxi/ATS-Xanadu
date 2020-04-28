(* ****** ****** *)
(*
** The runtime for Xinterp
*)
(* ****** ****** *)
//
// prelude/bool.sats
//
(* ****** ****** *)
//
#extern
fun
xint_fgetc_ref
(fr: FILEref): int
impltmp
fgetc_ref<> = xint_getc_ref
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
