(* ****** ****** *)
(*
** HX-2018-05-16
** Unit testing. Kind of.
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/symbol.sats"
//
(* ****** ****** *)

local
//
#include "./../DATS/symbol.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)
//
val () =
println!
("Hello from [test_symbol]!")
//
(* ****** ****** *)
//
val () = println!(symbol_nil)
//
(* ****** ****** *)
//
val () = println!(symbol_ADD)
val () = println!(symbol_SUB)
val () = println!(symbol_MUL)
val () = println!(symbol_DIV)
//
(* ****** ****** *)
//
val symbol_ADD = symbol_make("+")
val symbol_SUB = symbol_make("-")
val symbol_MUL = symbol_make("*")
val symbol_DIV = symbol_make("/")
//
val () = println!(symbol_ADD)
val () = println!(symbol_SUB)
val () = println!(symbol_MUL)
val () = println!(symbol_DIV)
//
val i0 = symbol_ADD.stamp()
val-~Some_vt(x0) = stamp_to_symbol(i0)
val () = println!("x0(ADD) = ", x0)
//
val i0 = symbol_SUB.stamp()
val-~Some_vt(x0) = stamp_to_symbol(i0)
val () = println!("x0(SUB) = ", x0)
//
val i0 = symbol_MUL.stamp()
val-~Some_vt(x0) = stamp_to_symbol(i0)
val () = println!("x0(MUL) = ", x0)
//
val i0 = symbol_DIV.stamp()
val-~Some_vt(x0) = stamp_to_symbol(i0)
val () = println!("x0(DIV) = ", x0)
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test_symbol.dats] *)
