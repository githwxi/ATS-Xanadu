(* ****** ****** *)
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
(* ****** ****** *)

fun
<a:t0>
pswap
( p1: p2tr(a)
, p2: p2tr(a)): void =
let
val x1 = !p1
and x2 = !p2
in
  !p1 := x2; !p2 := x1
end // end of [pswap]

(* ****** ****** *)
//
var x1: int = 1
var x2: int = 2
//
val () = pswap(&x1,&x2)
//
val x1 = x1 and x2 = x2
//
val () =
( g_print("x1 = ")
; g_print(x1); g_print('\n') )
val () =
( g_print("x2 = ")
; g_print(x2); g_print('\n') )
//
(* ****** ****** *)
//
var
y01:
(int, int) = (0, 1)
//
val () =
pswap(&(y01.0),&(y01.1))
val y0 = y01.0 and y1 = y01.1
//
val () =
( g_print("y0 = ")
; g_print(y0); g_print('\n') )
val () =
( g_print("y1 = ")
; g_print(y1); g_print('\n') )
//
(* ****** ****** *)
//
var
z01:
(int, int) = (10, 11)
//
val () =
pswap((&z01).0, (&z01).1)
val z0 = z01.0 and z1 = z01.1
//
val () =
( g_print("z0 = ")
; g_print(z0); g_print('\n') )
val () =
( g_print("z1 = ")
; g_print(z1); g_print('\n') )
//
(* ****** ****** *)

(* end of [ATS3-Xanadu/srcgen1/xats2js/srcgen1/TEST/prelude_pswap.dats] *)
