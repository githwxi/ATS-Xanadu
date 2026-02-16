(* ****** ****** *)
(*
HX-2026-02-09
For testing xsyncpy!
Mon Feb  9 11:03:15 AM EST 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
fun
<x0:vt>
flen_vt
( xs:
~ list_vt(x0)): nint =
( case+ xs of
| ~list_vt_nil() => 0
| ~list_vt_cons(x1, xs) => 1 + flen_vt(xs))
(* ****** ****** *)
////
(* ****** ****** *)
//
fun
<x0:t0>
myfree0
(x0: x0): void = ()
(*
fun
<x0:vt>
myfree0_
(x0: x0): void = ()
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
duplicity0
(x0: x0): (x0, x0) = (x0, x0)
//
(*
fun
<x0:vt>
duplicity0_
(x0: x0): (x0, x0) = (x0, x0)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
listlen
( xs
: list(x0)): nint =
(
  f_t0(xs)) where
{
fun f_t0(xs) =
( case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1 + f_t0(xs))
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
listlen_vt
( xs:
! list_vt(x0)): nint =
(
  f_vt(  xs  )) where
{
fun
f_vt
( xs:
! list_vt(x0)): nint =
( case+ xs of
| list_vt_nil() => 0
| list_vt_cons(_, xs) => 1 + f_vt(xs))
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test06_xsyncpy.dats] *)
(***********************************************************************)
