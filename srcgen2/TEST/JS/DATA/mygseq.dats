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
//
#impltmp
{x0: t0}
gseq_append
< list(x0) ><x0>
(  xs, ys  ) = list_append(xs, ys)
//
(* ****** ****** *)

(* end of [DATA/mygseq.dats] *)
