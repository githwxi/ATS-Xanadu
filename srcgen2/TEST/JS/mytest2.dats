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
xyz_myint1 = xyz_myint: myint

(* ****** ****** *)

val
xyz_myint2 =
$MYTEST2.xyz_myint: $MYTEST2.myint

(* ****** ****** *)

(* end of [mytest2.dats] *)

