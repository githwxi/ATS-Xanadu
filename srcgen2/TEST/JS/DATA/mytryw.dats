(* ****** ****** *)

excptcon TrueExn
excptcon FalseExn

(* ****** ****** *)
//
(*
#typedef
map(a:t0, b:t0) = a -> b
*)
//
(* ****** ****** *)

#typedef
forall(xs:t0, x0:t0) =
(xs, x0 -<cfr> bool) -<cfr> bool
#typedef
foreach(xs:t0, x0:t0) =
(xs, x0 -<cfr> void) -<cfr> void

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
foreach_to_forall
( xs: xs
, foreach: foreach(xs, x0)): forall(xs, x0) =
try
(foreach(xs, x0); true) with FalseExn() => false
end

(* ****** ****** *)

(* end of [DATA/mytryw.dats] *)
