(* ****** ****** *)
(*
** For gseqn-operations
*)
(* ****** ****** *)
//
(*
//
// HX-2020-07-04:
// Sequences with length
//
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_nilq(xs): bool(ln=0)
//
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_consq(xs): bool(ln>0)
//
(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_head{ln>0}(xs): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
<tl:t0>
gseqn_tail{ln>0}(xs): (tl)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_last{ln>0}(xs): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_length(xs): sint(ln)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_get_at
(xs: xs, i0: nintlt(ln)): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_listize(xs): list_vt(x0, ln)
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_rlistize(xs): list_vt(x0, ln)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_unlist(list(x0, ln)): (xs)
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_unrlist(list(x0, ln)): (xs)

(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_list(xs): list_vt(y0, ln)
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_rlist(xs): list_vt(y0, ln)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_array(xs): a1ptr( y0, ln )
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_rarray(xs): a1ptr( y0, ln )
//
(* ****** ****** *)

(*
//
(*
HX-2020-07-04:
Is this interesting?!
*)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
<rz:vt>
<ln:i0>
gseqn_foldl(xs, r0): rz
fun
<xs:t0>
<x0:t0>
<r0:vt>
<ln:i0>
gseqn_foldl_nil{ln=0}(xs, r0): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
<rz:vt>
<r1:vt>
<ln:i0>
gseqn_foldl_cons{ln>0}(xs, r0): rz
(*
foldl$foprn
<int(i)><x0><int(i+1)>{i<n}(r, _) = r + 1
*)
*)

(* ****** ****** *)
//
// For gseqn-i-operations
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_iforalln(xs: xs): bool
//
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_iforeachn(xs: xs): void
//
(* ****** ****** *)
//
// For z2-gseqn-operations
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
<ln:i0>
gseqn_z2map_list
  (xs: xs, ys: ys): list_vt(z0, ln)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
<ln:i0>
gseqn_z2map_rlist
  (xs: xs, ys: ys): list_vt(z0, ln)
//
(* ****** ****** *)

(* end of [gseqn.sats] *)
