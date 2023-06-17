(* ****** ****** *)
(*
#include
"./../mytest1.sats"
#include
"./../mytest1.dats"
*)
(* ****** ****** *)
#staload "./mytest2.sats"
(* ****** ****** *)
#staload
MYTEST2 = "./mytest2.sats"
(* ****** ****** *)
#staload "./../mytest1.sats"
(* ****** ****** *)

val
xyz_myint1 = xyz_myint: myint

(* ****** ****** *)

val
xyz_myint2 =
$MYTEST2.xyz_myint: $MYTEST2.myint

(* ****** ****** *)

val
xyz_mylist = mylist_nil(*void*)
val
xyz_mylist = mylist_cons(1, xyz_mylist)
val
xyz_mylist = mylist_cons(2, xyz_mylist)

(* ****** ****** *)

(* end of [DATA/mytest2.dats] *)
