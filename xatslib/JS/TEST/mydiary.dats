(* ****** ****** *)
(*
HX-2024-07-21:
For testing xatslib/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload
"prelude/SATS/gsyn000.sats"
#staload _ =
"prelude/DATS/gsyn000.dats"
(* ****** ****** *)
#staload
"prelude/SATS/VT/gsyn000_vt.sats"
#staload _ =
"prelude/DATS/VT/gsyn000_vt.dats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-21:
Sun 21 Jul 2024 11:06:11 PM EDT
*)
//
#include
"xatslib\
/JS/HATS/xatslib_JS_sats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
//
#include
"xatslib/JS/HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)
//
val A1 =
jsarray(1)
val A2 =
jsarray('1', '2')
val A3 =
jsarray("1", "2", "3")
//
val A4 = append(A3, A3)
//
val () =
prints("A4 = ", A4, '\n')
//
val An =
jsarray_make_ncpy
( 10, -1(*init*) )
//
val () =
prints("An = ", An, '\n')
//
val An =
jsarray_make_nfun
( 10, lam(i)=> i+1)
//
val () =
prints("An = ", An, '\n')
//
val xs = listize(An)
val () =
print1s("xs = ", xs, '\n')
//
(* ****** ****** *)
//
val xs = list_vt2t(xs)
val () = prints("xs = ", xs, '\n')
//
(* ****** ****** *)
//
val ys =
gseq_imap_list
<xs><x0><y0>(An) where
{
#typedef x0 = nint
#typedef y0 = nint
#typedef xs = jsa(nint)
#impltmp
imap$fopr
<x0><y0>(i0, x0) = i0*x0*x0 + 1
}
val () = prints("ys = ", ys, '\n')
//
(* ****** ****** *)
(* ****** ****** *)
//
val zs =
gseq_irmap_list
<xs><x0><z0>(An) where
{
#typedef x0 = nint
#typedef z0 = nint
#typedef xs = jsa(nint)
#impltmp
irmap$fopr
<x0><z0>(i0, x0) = i0*x0*x0 + 1
}
val () = prints("zs = ", zs, '\n')
//
(* ****** ****** *)
(* ****** ****** *)
//
val sAn = sum(An)
val ( ) = prints("sAn = ", sAn, '\n')
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
list$sint_sum(xs) =
gseq_sum<list(sint)><sint>(xs)
#symload sum with list$sint_sum
//
val sys = sum(ys)
val ( ) = prints("sys = ", sys, '\n')
val szs = sum(zs)
val ( ) = prints("szs = ", szs, '\n')
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prints("An = ", An, '\n') where
{
  val () =
  mapref(An, lam(x:sint) => x+x)
}
//
val () = prints
("map_list(An) = "
, map_list(An, lam(x:sint) => x*x), '\n')
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_TEST_mydiary.dats] *)
