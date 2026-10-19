(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-09-22:
For testing prelude/RB!
Tue Sep 22 12:30:52 AM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
#include
"./../../../..\
/prelude/HATS/prelude_RB_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
val A0 =
arrsz(10, 1)
val () =
(
  printsln("A0 = ", A0))
//
(* ****** ****** *)
//
val N = 10
val A0 =
arrsz
(N, lam(i:sint) => (i+1))
val () =
printsln
("A0(", type(A0), ") = ", A0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: nint) =
GSEQ
(
arrsz
(n, lam(i:sint) => i+1)).prod()
//
val () =
printsln("fact(10) = ", fact(10))
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs =
list
(10, lam(i:nint) => i*i)
val ys = a1sz_make_list(xs)
val () =
printsln("ys(", type(ys), ") = ", ys)
val () =
(
GSEQ(ys).foritm
  (lam(x) => print( x )); printsln())
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(*)
end of [
ATS3-XANADU/
srcgen2/xats2rb/srcgen1/prelude/TEST/CATS/RB/test03_a1sz000.dats] *)
(***********************************************************************)
(***********************************************************************)
