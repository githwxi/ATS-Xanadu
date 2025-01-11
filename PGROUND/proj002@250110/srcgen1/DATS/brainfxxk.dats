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

(* ****** ****** *)

excptcon Overflow of ()
excptcon Underflow of ()
excptcon RBNotFound of ()
excptcon LBNotFound of ()

(* ****** ****** *)
(* ****** ****** *)

(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS-Xanadu/PGROUND/proj001-2025-01-09/srcgen1/DATS/brainfxxk.dats] *)
