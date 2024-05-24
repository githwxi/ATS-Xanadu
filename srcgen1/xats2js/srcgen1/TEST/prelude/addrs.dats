(* ****** ****** *)
#include
"./../..\
/xshared/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
//
var x0: int = 0
val p0 = $addr(x0)
val x0 = $eval(p0)
//
val p1 =
  $addr($eval(p0))
val x1 =
  (!p1 := 1; $eval(p1))
//
(* ****** ****** *)
val xs =
list_cons
(
10
,
list_cons(20, list_nil()))
val x0 = (xs.0: int)
and x1 = (xs.1: list(int))
(* ****** ****** *)
//
val () =
( g_print("x0 = ")
; g_print( x0 );  g_print('\n'))
val () =
( g_print("x1 = ")
; g_print( x1 );  g_print('\n'))
val () =
( g_print("xs = ")
; g_print( xs );  g_print('\n'))
//
(* ****** ****** *)
//
val () = xs.0 := 20
//
val ys =
$eval($addr(xs.1)): list(int)
//
(* ****** ****** *)
val () =
( g_print("xs = ")
; g_print( xs );  g_print('\n'))
val () =
( g_print("ys = ")
; g_print( ys );  g_print('\n'))
(* ****** ****** *)

(* end of [xats2js/srcgen1/TEST/prelude_addrs.dats] *)
