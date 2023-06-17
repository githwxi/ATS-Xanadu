(* ****** ****** *)
(*
#include
"./../mytest1.sats"
#include
"./../mytest1.dats"
*)
(* ****** ****** *)
#staload
SMYTEST2 = "./mytest2.sats"
(* ****** ****** *)
#staload
DMYTEST2 = "./mytest2.dats"
(* ****** ****** *)
local
#staload
$DMYTEST2$MYTEST2
in//let
val
xyz_mybtf0 = (xyz_mybtf)
end // end of [ local(...) ]
(* ****** ****** *)
#staload
D_MYTEST2 = $DMYTEST2$MYTEST2
(* ****** ****** *)

val//error
xyz_mybtf0 = (xyz_mybtf)

val
xyz_mybtf1 = ($SMYTEST2.xyz_mybtf)

val
xyz_mybtf2 = ($D_MYTEST2.xyz_mybtf)
val//error
xyz_mybtf2 = ($D_SMYTEST2.xyz_mybtf)

val
xyz_mybtf3 = ($DMYTEST2$MYTEST2.xyz_mybtf)

val
xyz_mybtf4 = ($DMYTEST2.$MYTEST2.xyz_mybtf)

(* ****** ****** *)

(* end of [DATA/mytest3.dats] *)
