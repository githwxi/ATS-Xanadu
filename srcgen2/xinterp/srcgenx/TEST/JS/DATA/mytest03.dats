(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude\
/HATS/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-01-03:
More than 10 template layers!
*)
fun
fact3
(x: sint): sint =
(
 strm_vt_mul0
 (tail0(strmize(x+1))))
//
(* ****** ****** *)
val fact3_10 = fact3(10)//end-of-val
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-01-04:
Thu Jan  4 15:16:21 EST 2024
*)
fun
fact4
(x: sint): sint =
let
#typedef x0 = sint
#vwtpdef xs = strm_vt(x0)
in//let
glseq_mul0
< xs >< x0 >
(
tail0
(gseq_strmize(x+1))) end//let
//
(* ****** ****** *)
val fact4_10 = fact4(10)//end-of-val
(* ****** ****** *)
(* ****** ****** *)
//
val fact5_10: sint =
(
  gseq_mul(range1(10, 0)))//end-of-val
//
(* ****** ****** *)
(* ****** ****** *)
//
val
mystrn2 = "01"
val test =
gseq_forall
<xs><x0>(mystrn2) where
{
#typedef x0 = char
#typedef xs = strn
#impltmp
forall$test<x0>(x0) = (x0 >= '0') }
//
(* ****** ****** *)
(* ****** ****** *)
//
val
mylist2 = list(0,1)
//
val test =
gseq_forall
<xs><x0>(mylist2) where
{
#typedef x0 = sint
#typedef xs = list(x0)
#impltmp
forall$test<x0>(x0) = ( x0 >= 0 ) }
//
(* ****** ****** *)
val
mystrn26 =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
(* ****** ****** *)
val
mystrn26 = reverse(mystrn26)
(* ****** ****** *)
//
val
mylist26 =
gseq_foldr
<strn><c><r>
( mystrn26
, list_nil()) where
{
#typedef c = char
#typedef r = list(char)
#impltmp
foldr$fopr
<c><r>(c, r) = list_cons(c, r) }
//
val mylist26 = reverse(mylist26)
val length26 = list_length(mylist26)
//
(* ****** ****** *)
(* ****** ****** *)
//
val perms =
strm_vt_listize0
(gseq_permutize_lstrm<strn><char>("123"))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XINTERP_TEST_JS_DATA_mytest03.dats] *)
