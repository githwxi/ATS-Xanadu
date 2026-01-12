(* ****** ****** *)
(*
HX-2026-10-07:
For testing pre2026!
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude\
/almanac/HATS/pre2026_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude\
/almanac/HATS/pre2026_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
val () =
printsln("Hello from [test01_pre2026]!")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
let
val ds =
nint_digitize(0) in
print1s("\
nint_digitize(0) = ", ds, '\n') end
val () =
let
val ds =
nint_digitize(123456789) in
print1s("\
nint_digitize(123456789) = ", ds, '\n') end
val () =
let
val ds =
nint_base$digitize(1024, 2) in
print1s("\
nint_base$digitize(1024, 2) = ", ds, '\n') end
val () =
let
val ds =
nint_base$digitize(59049, 3) in
print1s("\
nint_base$digitize(59049, 3) = ", ds, '\n') end
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-11:
pre2026/SATS/i1range.sats
pre2026/DATS/i1range.dats
*)
val xs = list(range(0, 10))
val () = printsln("list(range(0, 10)) = ", xs)
val xs = list_vt(range(0, 10))
val () = print1s("list_vt(range(0, 10)) = ", xs, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush((*void*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac/TEST_CATS_JS_test01_pre2026.dats] *)
(***********************************************************************)
