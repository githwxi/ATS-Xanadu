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
myforall(xs:t0, x0:t0) =
(xs, x0 -<cfr> bool) -<cfr> bool
#typedef
myforeach(xs:t0, x0:t0) =
(xs, x0 -<cfr> void) -<cfr> void

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
forall_to_foreach
( forall
: myforall(xs, x0)
) : myforeach(xs, x0) = lam(xs, work) =>
let
val _ = forall(xs, lam x0 => (work(x0); true))
end//end-of-try//end-of-[forall_to_foreach(xs,forall)]

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
foreach_to_forall
( foreach
: myforeach(xs, x0)
) : myforall(xs, x0) = lam(xs, test) =>
try
foreach
(
xs, 
lam x0 =>
if
test(x0)
then ((*void*))
else $raise FalseExn()); true with FalseExn() => false
end//end-of-try//end-of-[foreach_to_forall(xs,foreach)]

(* ****** ****** *)

(* end of [DATA/mytryw2.dats] *)
