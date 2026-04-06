(* ****** ****** *)
(*
HX-2026-04-05:
For testing prelude/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
isqrt
(n0: nint): nint =
(
N-1-
gasq_bin$search
< xs >< x0 >( N )
) where
{
//
#define N 31600
//
#typedef x0 = nint
#typedef xs = nint
//
#impltmp
gasq_length<xs>(xs) = N
//
#impltmp
search$tcmp1<x0>(x0) =
let val x0 = N-1-x0 in (x0*x0)\cmp(n0) end
}
//
val () = printsln("isqrt(80) = ", isqrt(80))
val () = printsln("isqrt(81) = ", isqrt(81))
val () = printsln("isqrt(82) = ", isqrt(82))
val () = printsln("isqrt(99) = ", isqrt(99))
val () = printsln("isqrt(100) = ", isqrt(100))
val () = printsln("isqrt(101) = ", isqrt(101))
//
val () =
printsln("isqrt(10000000) = ", isqrt(10000000))
val () =
printsln("isqrt(100000000) = ", isqrt(100000000))
val () =
printsln("isqrt(1000000000) = ", isqrt(1000000000))
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush( (*void*) ))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test11_gasq000.dats] *)
(***********************************************************************)
