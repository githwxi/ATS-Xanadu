(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
//
#include
"srcgen1\
/prelude\
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
fact6_10: sint =
(
glseq_mul0
(strm_vt_range_lte(1, 10)))
//
(* ****** ****** *)
//
(*
val
dfact6_10: sint =
(
glseq_mul0
(strm_vt_range_lte(1, 10))) where
{
 #impltmp g_succ<sint>(x) = x + 2
}
*)
//
(* ****** ****** *)
//
val
dfact6_10: sint =
(
glseq_mul0
(
filter0
(strm_vt_range_lte(1, 10))
where
{
#impltmp
filter0$test<sint>(x) = x%2 > 0
}
)
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
#extern
fun
<a:vt>
foo(x: a): sint
(* ****** ****** *)
//
#impltmp
< a:vt >
foo( x ) =
(g_free<a>(x); 1)
//
#impltmp<a:t0>foo( x ) = 0
//
(* ****** ****** *)
val ans0 = foo(list_nil<sint>())//0
val ans1 = foo(list_vt_nil<sint>())//1
(* ****** ****** *)
(* ****** ****** *)
//
val perms =
strm_vt_listize0
(gseq_permutize_lstrm<strn><char>("123"))
//
(* ****** ****** *)
(* ****** ****** *)

#abstbox mylist2(a:type)

(* ****** ****** *)

#extern
fun
<a:type>
mylist2_make
( xs: list(a)
, ys: list(a)): mylist2(a)

#extern
fun
<a:type>
mylist2_strmize
(xsys: mylist2(a)): strm_vt(a)

(* ****** ****** *)

local

#absimpl
mylist2
(a:type) = (list(a), list(a))

in//local

#impltmp
<a:t0>
mylist2_make(xs, ys) = (xs, ys)

#impltmp
<a:t0>
mylist2_strmize(xsys) =
strm_vt_append0
(strmize(xsys.0), strmize(xsys.1))

end//local

(* ****** ****** *)

val xsys =
mylist2_make(list(1,2), list(3,4,5))

(* ****** ****** *)

#impltmp
{a:t0}
gseq_strmize<mylist2(a)><a> = mylist2_strmize<a>

(* ****** ****** *)
(* ****** ****** *)

val xsys_mul = gseq_mul<mylist2(sint)><sint>(xsys)

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XINTERP_TEST_JS_DATA_mytest03.dats] *)
