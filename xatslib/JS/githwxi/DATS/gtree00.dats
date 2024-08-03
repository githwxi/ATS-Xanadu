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
(*
HX-2024-08-03:
Let's first skip linearity.
This is usually the way to go!
*)
//
#extern
fun
<node0:t0>
<nodes:t0>
gtree_node_neighbors(x0: node0): (xs)
#extern
fun
<x0:t0>
gtree_node_dfs$strmize(x0: node0): strm_vt(node0)
//
#imptmp
<node0:t0>
<nodes:t0>
<store:t0>
gtree_node_dfs$strmize
  (node0) = let
fun
auxmain
(
store: nodes):
strm_vt(node0) = $llazy
if
gseq_nilq<store><node0>(store)
then strm_vt_nil((*void*)) else
let
//
val
(node1, store) =
$UN.gseq_uncons_raw
<store><node0>(store)
val nodes =
gtree_node_neighbors
<node0><nodes>(node1)//val(nodes)
//
in//let
(
  strm_vt_cons(node1, store)) where
{
val store =
(
gseq_folditm
<nodes><node0><store>(nodes, store)
) where
{
#impltmp
folditm$fopr
<node0><store>(store, node0) =
gseq_cons<store><node0>(node0, store) } }//whr
//
in//let
(
  auxmain(gseq_sing<store><node0>(node0)))
end//let//end-of-[gtree_node_dfs$strmize(node0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_githwxi_DATS_gtree00.dats] *)
