(* ****** ****** *)
(*
#include "./mytest1.sats"
#include "./mytest1.dats"
*)
(* ****** ****** *)
#staload "./mytest2.sats"
(* ****** ****** *)
#staload
MYTEST2 = "./mytest2.sats"
(* ****** ****** *)

val
xyz_myint = $MYTEST2.xyz_myint

(* ****** ****** *)

(* end of [mytest2.dats] *)

