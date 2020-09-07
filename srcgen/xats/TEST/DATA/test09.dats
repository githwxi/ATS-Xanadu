#extern
fun<>
foo1(): void
#extern
fun<>
foo2(): void

(* ****** ****** *)
(*
impltmp<>
foo1() = foo2<>()
*)
(* ****** ****** *)

impltmp
<>
foo1() =
let
//
#extern
fun
foo1_(): void
//
impltmp
<>
foo1() = foo1_()
//
implfun
foo1_() = foo2<>() in foo1_()
//
end // end of [foo1]

(* ****** ****** *)

impltmp<>
foo2() = foo1<>()

(* ****** ****** *)

val foo1_tmp_res = foo1<>()

(* ****** ****** *)
