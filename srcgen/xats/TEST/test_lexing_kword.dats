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
#include "./../DATS/filepath.dats"
#include "./../DATS/location.dats"
//
#include "./../DATS/lexing_token.dats"
//
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
val () = println!(tnode_search("fn"))
val () = println!(tnode_search("fn0"))
val () = println!(tnode_search("fn1"))
val () = println!(tnode_search("fun"))
val () = println!(tnode_search("fnx"))
val () = println!("fn? = ", tnode_search("fn?"))
//
val () = println!(tnode_search("prfn"))
val () = println!(tnode_search("prfn0"))
val () = println!(tnode_search("prfn1"))
val () = println!(tnode_search("prfun"))
val () = println!("prfn? = ", tnode_search("prfn?"))
//
val () = println!(tnode_search("with"))
//
val () = println!(tnode_search("$raise"))
//
val () = println!(tnode_search("$delay"))
val () = println!(tnode_search("$delay_t"))
val () = println!(tnode_search("$delay_vt"))
//
val () = println!(tnode_search("datasort"))
//
val () = println!(tnode_search("dataprop"))
val () = println!(tnode_search("dataview"))
val () = println!(tnode_search("datatype"))
val () = println!(tnode_search("datavtype"))
//
(* ****** ****** *)

implement main0((*void*)) = ((*void*))

(* ****** ****** *)

(* end of [test_lexing_tnode.dats] *)
