(* ****** ****** *)
#staload
"prelude/SATS/gseq000.sats"
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_set_at
(xs, i0, x0) =
(xs := gseq_fset_at(xs, i0, x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0: t0}
gseq_append
<list(x0)><x0> = list_append<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0: t0}
list_reverse<x0> = gseq_reverse<list(x0)><x0>
//
(* ****** ****** *)

(* end of [DATA/mygseq.dats] *)
