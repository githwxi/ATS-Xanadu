(* ****** ****** *)
#staload
"prelude/SATS/gseq000.sats"
(* ****** ****** *)
//
#impltmp
{ a:t0 }
gseq_set_at
(xs, i0, x0) =
(xs :=
 gseq_fset_at(xs, i0, x0))
//
(* ****** ****** *)

(* end of [DATA/mygseq.dats] *)
