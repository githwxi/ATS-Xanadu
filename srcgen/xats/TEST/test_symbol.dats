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
val () = println!(ADD_symbol)
val () = println!(SUB_symbol)
val () = println!(MUL_symbol)
val () = println!(DIV_symbol)
//
(* ****** ****** *)
//
val ADD_symbol = symbol_make("+")
val SUB_symbol = symbol_make("-")
val MUL_symbol = symbol_make("*")
val DIV_symbol = symbol_make("/")
//
val () = println!(ADD_symbol)
val () = println!(SUB_symbol)
val () = println!(MUL_symbol)
val () = println!(DIV_symbol)
//
val i0 = ADD_symbol.stamp()
val-~Some_vt(x0) = symbol_of_stamp(i0)
val () = println!("x0(ADD) = ", x0)
//
val i0 = SUB_symbol.stamp()
val-~Some_vt(x0) = symbol_of_stamp(i0)
val () = println!("x0(SUB) = ", x0)
//
val i0 = MUL_symbol.stamp()
val-~Some_vt(x0) = symbol_of_stamp(i0)
val () = println!("x0(MUL) = ", x0)
//
val i0 = DIV_symbol.stamp()
val-~Some_vt(x0) = symbol_of_stamp(i0)
val () = println!("x0(DIV) = ", x0)
//
(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test_symbol.dats] *)
