(* ****** ****** *)
#staload
"prelude/SATS/gseq000.sats"
#staload UN =
"prelude/SATS/unsafex.sats"
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

#impltmp
<xs>
<x0><y0>
gseq_map_list
  (xs) = let
//
#vwtpdef
yy = list_vt(y0)
//
#typedef r0 = p2tr(yy)
//
#impltmp
foldl$fopr
<x0><r0>(p0, x0) =
let
//
val y0 =
map$fopr<x0><y0>(x0)
val r1 = 
list_vt_cons(y0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_foldl<xs><x0><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_map_list/foldl(...)]

(* ****** ****** *)

(* end of [DATA/mygseq.dats] *)
