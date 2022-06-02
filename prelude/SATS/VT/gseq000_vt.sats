(* ****** ****** *)
(*
** For glseq-operations
*)
(* ****** ****** *)

fun
<xs:vt>
<x0:vt>
glseq_nil(): xs
fun
<xs:vt>
<x0:vt>
glseq_cons(x0, xs): xs

(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_nilq(!xs): bool
fun
<xs:vt>
<x0:vt>
glseq_consq(!xs): bool
//
(*
fun
<xs:vt>
<x0:vt>
glseq_nilq1(!xs): bool
fun
<xs:vt>
<x0:vt>
glseq_consq1(!xs): bool
*)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_copy(!xs): (xs)
fun
<xs:vt>
<x0:vt>
glseq_free(~xs): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_head_raw(!xs): x0
fun
<xs:vt>
<x0:vt>
glseq_tail_raw(~xs): xs
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_uncons_raw
  (xs: &xs >> xs): x0
fun
<xs:vt>
<x0:vt>
glseq_uncons_exn
  (xs: &xs >> xs): x0
fun
<xs:vt>
<x0:vt>
glseq_uncons_opt
  (xs: &xs >> xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_print0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
glseq_print1(xs: !xs): void
//
fun
<xs:vt>
<x0:vt>
glseq_print$beg((*void*)): void
fun
<xs:vt>
<x0:vt>
glseq_print$end((*void*)): void
fun
<xs:vt>
<x0:vt>
glseq_print$sep((*void*)): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_length0(~xs): nint
fun
<xs:vt>
<x0:vt>
glseq_length1(!xs): nint
//
(* ****** ****** *)

fun
<xs:vt>
<x0:vt>
glseq_drop0
(xs: ~xs, n0: sint): xs
fun
<xs:vt>
<x0:vt>
glseq_drop1
(xs: !xs, n0: sint): xs

(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_listize(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_strmize(~xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_rlistize(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_rstrmize(~xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:t0>
glseq_unlist(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:t0>
glseq_unrlist(xs: list(x0)): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_unlist_vt(list_vt(x0)): (xs)
fun
<xs:vt>
<x0:vt>
glseq_unstrm_vt(strm_vt(x0)): (xs)
fun
<xs:vt>
<x0:vt>
glseq_unrlist_vt(list_vt(x0)): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_append0(xs, xs): xs
fun
<xs:vt>
<x0:vt>
glseq_extend0(xs, x0): xs
//
(* ****** ****** *)
fun
<xz:t0>
<xs:t0>
<x0:t0>glseq_concat0(xss: xz): xs
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_reverse0(xs: xs): xs
fun
<xs:vt>
<x0:vt>
glseq_rappend0(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)
//
(*
glseq_foldl: foldl$fopr
glseq_foldr: foldr$fopr
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldl0(~xs, r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldl1(!xs, r0): r0
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldr0(~xs, r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldr1(!xs, r0): r0
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_exists0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_exists1(!xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_forall0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_forall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
glseq_foreach0(~xs): void
fun
<xs:vt>
<x0:vt>
glseq_foreach1(!xs): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_list(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_list(!xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_strm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_strm(!xs): strm_vt(y0)
//
(* ****** ****** *)
(*
HX-2022-06-02:
[copy] is just map1-identity
[copy_list] is just [listize1]
[copy_strm] is just [strmize1]
*)
fun
<xs:vt>
<x0:vt>
glseq_copy_list(!xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_copy_strm(!xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_rlist(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_rstrm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_rlist(!xs): list_vt(y0)
//
(* ****** ****** *)
//
(*
HX-2022-06-02:
[copy] is just map1-identity
*)
fun
<xs:vt>
<x0:vt>
glseq_copy_rlist(!xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapopt0_strm(~xs): strm_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_maplist0_strm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapoptn0_strm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapstrm0_strm(~xs): strm_vt(y0)
//
(* ****** ****** *)
//
// For glseq-i-operations
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_iexists0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_iexists1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
glseq_iforall0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_iforall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
glseq_iforeach0(~xs): void
fun
<xs:vt>
<x0:vt>
glseq_iforeach1(!xs): void
//
(* ****** ****** *)
//
// HX-2020-05-31:
// symbol overloading for gseq_vt
//
(* ****** ****** *)

#symload nilq with glseq_nilq of 0100
#symload consq with glseq_consq of 0100

(* ****** ****** *)

#symload length with glseq_length1 of 0100
#symload length0 with glseq_length0 of 0100
#symload length1 with glseq_length1 of 0100

(* ****** ****** *)

#symload append with glseq_append0 of 0100
#symload extend with glseq_extend0 of 0100
#symload concat with glseq_concat0 of 0100
#symload append0 with glseq_append0 of 0100
#symload extend0 with glseq_extend0 of 0100
#symload concat0 with glseq_concat0 of 0100

(* ****** ****** *)

#symload rappend with glseq_rappend0 of 0100
#symload reverse with glseq_reverse0 of 0100
#symload rappend0 with glseq_rappend0 of 0100
#symload reverse0 with glseq_reverse0 of 0100

(* ****** ****** *)

#symload forall with glseq_forall0 of 0100
#symload forall0 with glseq_forall0 of 0100
#symload forall1 with glseq_forall1 of 0100

(* ****** ****** *)

#symload foreach with glseq_foreach0 of 0100
#symload foreach0 with glseq_foreach0 of 0100
#symload foreach1 with glseq_foreach1 of 0100

(* ****** ****** *)
//
#symload listize with glseq_listize of 0100
#symload strmize with glseq_strmize of 0100
#symload rlistize with glseq_rlistize of 0100
#symload rstrmize with glseq_rstrmize of 0100
//
(* ****** ****** *)

#symload iforall with glseq_iforall0 of 0100
#symload iforall0 with glseq_iforall0 of 0100
#symload iforall1 with glseq_iforall1 of 0100

(* ****** ****** *)

#symload iforeach with glseq_iforeach0 of 0100
#symload iforeach0 with glseq_iforeach0 of 0100
#symload iforeach1 with glseq_iforeach1 of 0100

(* ****** ****** *)
//
#symload map_list with glseq_map0_list of 0100
#symload map0_list with glseq_map0_list of 0100
#symload map1_list with glseq_map1_list of 0100
//
(* ****** ****** *)
//
#symload map_strm with glseq_map0_strm of 0100
#symload map0_strm with glseq_map0_strm of 0100
#symload map1_strm with glseq_map1_strm of 0100
//
(* ****** ****** *)
//
#symload map_rlist with glseq_map0_rlist of 0100
#symload map0_rlist with glseq_map0_rlist of 0100
#symload map1_rlist with glseq_map1_rlist of 0100
//
(* ****** ****** *)

(* end of [prelude_gseq000_vt.sats] *)
