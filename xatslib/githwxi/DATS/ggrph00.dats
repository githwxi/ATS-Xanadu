(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
Sat 03 Aug 2024 11:07:02 AM EDT
For implementing operations on generic graphs
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-03:
Let's first skip linearity for now.
This is usually the way to get started!
*)
//
#extern
fun
<node0:t0>
<nodes:t0>
ggrph_node_neighbors
  (node0: node0): nodes
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<node0:t0>
<nodes:t0>
<store:t0>
ggrph_node_bfs$strmize
  (node0: node0): strm_vt(node0)
//
#impltmp
<node0:t0>
<nodes:t0>
<store:t0>
ggrph_node_bfs$strmize
  (node0) = let
//
fun
auxmain
(
store: store):
strm_vt(node0) = $llazy
(
if
gseq_nilq
<store>
<node0>(store)
then
strmcon_vt_nil(*0*)
else let // else
//
val
(node1, store) =
$UN.gseq_uncons_raw
<store><node0>(store)
val nodes =
ggrph_node_neighbors
<node0><nodes>(node1)//val(nodes)
//
in//let
(
  strmcon_vt_cons
  (node1, auxmain(store))) where
{
val store =
gseq_append<store><node0>(store, nodes)
}
end//[if(gseq_nilq<store><node0>(store))]
) (*llazy*) // end-of-[ auxmain( store ) ]
//
in//let
(
  auxmain(gseq_sing<store><node0>(node0)) )
end//let//end-of-[ggrph_node_bfs$strmize(node0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<node0:t0>
<nodes:t0>
<store:t0>
ggrph_node_dfs$strmize
  (node0: node0): strm_vt(node0)
//
#impltmp
<node0:t0>
<nodes:t0>
<store:t0>
ggrph_node_dfs$strmize
  (node0) = let
//
fun
auxmain
(
store: store):
strm_vt(node0) = $llazy
(
if
gseq_nilq
<store>
<node0>(store)
then
strmcon_vt_nil(*0*)
else let // else
//
val
(node1, store) =
$UN.gseq_uncons_raw
<store><node0>(store)
val nodes =
ggrph_node_neighbors
<node0><nodes>(node1)//val(nodes)
//
in//let
(
  strmcon_vt_cons
  (node1, auxmain(store))) where
{
val store =
gseq_prepend<store><node0>(store, nodes)
}
end//[if(gseq_nilq<store><node0>(store))]
) (*llazy*) // end-of-[ auxmain( store ) ]
//
in//let
(
  auxmain(gseq_sing<store><node0>(node0)) )
end//let//end-of-[ggrph_node_dfs$strmize(node0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_ggrph00.dats] *)
