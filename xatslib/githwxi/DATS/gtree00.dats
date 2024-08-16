(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
Sat 03 Aug 2024 11:07:02 AM EDT
For implementing operations on generic trees
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
#staload GGRPH = "./ggrph00.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<node0:t0>
<nodes:t0>
gtree_node_children
  (node0: node0): nodes
//
#impltmp
<node0:t0>
<nodes:t0>
gtree_node_children = $GGRPH.ggrph_node_neighbors
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<node0:t0>
<nodes:t0>
<store:t0>
gtree_node_bfs$strmize
  (root0: node0): strm_vt(node0)
#impltmp
<node0:t0>
<nodes:t0>
<store:t0>
gtree_node_bfs$strmize = $GGRPH.ggrph_node_bfs$strmize
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<node0:t0>
<nodes:t0>
<store:t0>
gtree_node_dfs$strmize
  (root0: node0): strm_vt(node0)
#impltmp
<node0:t0>
<nodes:t0>
<store:t0>
gtree_node_dfs$strmize = $GGRPH.ggrph_node_dfs$strmize
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_gtree00.dats] *)
