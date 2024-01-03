(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude/HATS/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
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
(* ****** ****** *)
//
val
mylist26 =
gseq_foldr
<strn><c><r>
( "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
, list_nil()) where
{
#typedef c = char
#typedef r = list(char)
#impltmp
foldr$fopr
<c><r>(c, r) = list_cons(c, r) }
//
val length26 = list_length(mylist26)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest03.dats] *)
