(* ****** ****** *)
(* ****** ****** *)
//
val UCHARMAX = 255
val TAPESIZE = 4096
(*
#define UCHARMAX 255
#define TAPESIZE 4096 // Not yet supported
*)
//
(* ****** ****** *)
(* ****** ****** *)

#typedef cell = uint
#typedef mptr = uint
#typedef mstate = (a1sz(cell), mptr)

excptcon Underflow of ()
excptcon Overflow of ()
excptcon RBNotFound of ()
excptcon LBNotFound of ()

(* ****** ****** *)
(* ****** ****** *)

(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
