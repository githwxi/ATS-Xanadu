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
#staload "./../SATS/lexing.sats"
//
(* ****** ****** *)

local
//
#include "./../DATS/symbol.dats"
#include "./../DATS/lexing_kword.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)
//
val () =
println!
("Hello from [test_lexing_kword]!")
//
(* ****** ****** *)
//
val () = println!(kword_search("fn"))
val () = println!(kword_search("fn0"))
val () = println!(kword_search("fn1"))
val () = println!(kword_search("fun"))
val () = println!(kword_search("fnx"))
val () = println!("fn? = ", kword_search("fn?"))
//
val () = println!(kword_search("prfn"))
val () = println!(kword_search("prfn0"))
val () = println!(kword_search("prfn1"))
val () = println!(kword_search("prfun"))
val () = println!("prfn? = ", kword_search("prfn?"))
//
val () = println!(kword_search("with"))
//
val () = println!(kword_search("$raise"))
//
val () = println!(kword_search("$delay"))
val () = println!(kword_search("$delay_t"))
val () = println!(kword_search("$delay_vt"))
//
(* ****** ****** *)

implement main0((*void*)) = ((*void*))

(* ****** ****** *)

(* end of [test_lexing_kword.dats] *)
