(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

fun
<a:vtflt>
g_self(x: a): a

(* ****** ****** *)

fun
<a:vtflt>
g_free(x: a): void
fun
<a:vtflt>
g_copy(x: !(a)): (a)

(* ****** ****** *)

fun
<a:vtflt>
g_equal(!a, !a): void

(* ****** ****** *)

(* end of [gbas.sats] *)
