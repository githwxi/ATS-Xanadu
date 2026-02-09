(* ****** ****** *)
(*
HX-2025-12-07:
For testing xsyncpy!
Sun Dec  7 04:40:40 AM EST 2025
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
//
(*
//
fun
T0TRCD10
(x0: sint):
@(sint, sint) = @(x0, x0)
//
fun
T0TRCD11
(x0: sint):
#(sint, sint) = #(x0, x0)
//
fun
T0TRCD12
(x0: sint):
$tup(sint, sint) = $tup(x0, x0)
//
fun
T0TRCD13
(x0: sint):
$tuptx(sint, sint) = $tuptx(x0, x0)
fun
T0TRCD14
(x0: sint):
$tupvx(sint, sint) = $tupvx(x0, x0)
fun
T0TRCD15
(x0: sint):
$tuprf(sint, sint) = $tuprf(x0, x0)
//
*)
//
(*
fun
T0TRCD16
(x0: sint):
$tuprc(sint, sint) = $tuprc(x0, x0)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<a:t0>
head$raw
(xs: list(a)): (a) =
let
val-list_cons(x1, _) = xs in x1 end
*)
fun
<a:vt>
head$raw
(xs: list_vt(a)): (a) =
let
val-
~list_vt_cons(x1, _) = xs in x1 end
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<a:t0>
length
(xs: list(a)): sint =
(
case+ xs of
|list_nil() => ( 0 )
|list_cons(_, xs) => 1 + length(xs)
)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<a:vt>
length_vt
(xs: !list_vt(a)): nint =
(
case+ xs of
|list_vt_nil() => 0
|list_vt_cons(_, xs) => 1 + length_vt(xs)
)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test05_xsyncpy.dats] *)
(***********************************************************************)
