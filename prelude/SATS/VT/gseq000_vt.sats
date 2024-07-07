(* ****** ****** *)
(*
HX: For
linear gseq-operations
*)
(* ****** ****** *)

fun
<xs:vt>
<x0:vt>
gseq_nil0(): xs
fun
<xs:vt>
<x0:vt>
gseq_cons0(x0, xs): xs

(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_nilq1(!xs): bool
fun
<xs:vt>
<x0:vt>
gseq_consq1(!xs): bool
//
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_copy(xs: !xs): (xs)
(*
(*
HX: [copy] is [copy1]
*)
fun
<xs:vt>
<x0:vt>
gseq_copy1(xs: !xs): (xs)
*)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_free(xs: ~xs): void
(*
(*
HX: [free] is [free0]
*)
fun
<xs:vt>
<x0:vt>
gseq_free0(xs: ~xs): void
*)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_head1_raw(!xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_tail0_raw(~xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_uncons0
  (xs: &xs >> xs): ( x0 )
fun
<xs:vt>
<x0:vt>
gseq_uncons0_raw
  (xs: &xs >> xs): ( x0 )
//
fun
<xs:vt>
<x0:vt>
gseq_uncons0$exn
  (xs: &xs >> xs): ( x0 )
fun
<xs:vt>
<x0:vt>
gseq_uncons0_exn
  (xs: &xs >> xs): ( x0 )
//
fun
<xs:vt>
<x0:vt>
gseq_uncons0_opt
  (xs: &xs >> xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_cmp00(~xs, ~xs): sint
fun
<xs:vt>
<x0:vt>
gseq_cmp11(!xs, !xs): sint
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_print0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_print1(xs: !xs): void
//
fun
<xs:vt>
<x0:vt>
gseq_print0$beg((*void*)): void
fun
<xs:vt>
<x0:vt>
gseq_print1$beg((*void*)): void
fun
<xs:vt>
<x0:vt>
gseq_print0$end((*void*)): void
fun
<xs:vt>
<x0:vt>
gseq_print1$end((*void*)): void
fun
<xs:vt>
<x0:vt>
gseq_print0$sep((*void*)): void
fun
<xs:vt>
<x0:vt>
gseq_print1$sep((*void*)): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_length0(~xs): nint
fun
<xs:vt>
<x0:vt>
gseq_length1(!xs): nint
//
(* ****** ****** *)

fun
<xs:vt>
<x0:vt>
gseq_drop0(xs: ~xs, n0: sint): xs
fun
<xs:vt>
<x0:vt>
gseq_drop1(xs: !xs, n0: sint): xs

(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_listize0(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_listize1(!xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_strmize0(~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_strmize1(!xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rlistize0(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rlistize1(!xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rstrmize0(~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rstrmize1(!xs): strm_vt(x0)
//
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:t0>
gseq_unlist(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:t0>
gseq_unrlist(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:t0>
gseq_make_list(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:t0>
gseq_make_strm(xs: strm(x0)): (xs)
fun
<xs:vt>
<x0:t0>
gseq_rmake_list(xs: list(x0)): (xs)
*)
//
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:vt>
gseq_unlist_vt(list_vt(x0)): (xs)
fun
<xs:vt>
<x0:vt>
gseq_unstrm_vt(strm_vt(x0)): (xs)
//
fun
<xs:vt>
<x0:vt>
gseq_unrlist_vt(list_vt(x0)): (xs)
*)
(* ****** ****** *)
//
//
fun
<xs:vt>
<x0:vt>
gseq_make0_llist(list_vt(x0)): (xs)
fun
<xs:vt>
<x0:vt>
gseq_make0_lstrm(strm_vt(x0)): (xs)
//
fun
<xs:vt>
<x0:vt>
gseq_rmake0_llist(list_vt(x0)): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>gseq_append0(xs, xs): xs
fun
<xs:vt>
<x0:vt>gseq_extend0(xs, x0): xs
//
(* ****** ****** *)
fun
<xz:t0>
<xs:t0>
<x0:t0>gseq_concat0(xss: xz): xs
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>gseq_reverse0(xs: xs): xs
//
fun
<xs:vt>
<x0:vt>
gseq_rappend0(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
gseq_foldl: foldl$fopr
gseq_foldr: foldr$fopr
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldl0(~xs, r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldl1(!xs, r0): r0
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldr0(~xs, r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldr1(!xs, r0): r0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_exists0(~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_exists1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_rexists0(~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_rexists1(!xs): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_forall0(~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_forall1(!xs): bool
fun
<xs:vt>
<x0:vt>
gseq_forall2(!xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_foreach0(~xs): void
fun
<xs:vt>
<x0:vt>
gseq_foreach1(!xs): void
fun
<xs:vt>
<x0:vt>
gseq_foreach2(!xs): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rforall0(~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_rforall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_rforeach0(~xs): void
fun
<xs:vt>
<x0:vt>
gseq_rforeach1(!xs): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
Sat Jul  2 11:21:23 EDT 2022
*)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_map0(xs: ~xs): ( ys )
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_map1(xs: !xs): ( ys )
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_llist(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_llist(!xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_lstrm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_lstrm(!xs): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_rllist(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_rllist(!xs): list_vt(y0)
//
(* ****** ****** *)
//
(*
HX-2022-06-02:
[copy] is just map1-identity
[copy_llist] is just [listize1]
[copy_lstrm] is just [strmize1]
*)
//
fun
<xs:vt>
<x0:vt>
gseq_copy_llist(!xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_copy_lstrm(!xs): strm_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_rcopy_llist(!xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rcopy_lstrm(!xs): strm_vt(x0)
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
gseq_copy_rllist(!xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rcopy_rllist(!xs): list_vt(x0)
//
(* ****** ****** *)
//
(*
Sat Jul  2 11:55:04 EDT 2022
*)
fun
<xs:vt>
<x0:vt>
gseq_filter0(~xs): ( xs )
fun
<xs:vt>
<x0:vt>
gseq_filter0_llist(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter0_lstrm(~xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_mapopt0_lstrm(~xs): strm_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_maplist0_lstrm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_mapoptn0_lstrm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_mapstrm0_lstrm(~xs): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
gseq_add0$nil(): (x0)
fun
<xs:vt>
<x0:vt>gseq_add0(xs): (x0)
//
fun
<x0:vt>
gseq_mul0$nil(): (x0)
fun
<xs:vt>
<x0:vt>gseq_mul0(~xs): (x0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>gseq_map0_add0(~xs): (y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>gseq_map0_mul0(~xs): (y0)
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>gseq_iexists0(~xs): bool
fun
<xs:vt>
<x0:vt>gseq_iexists1(!xs): bool
//
fun
<xs:vt>
<x0:vt>gseq_iforall0(~xs): bool
fun
<xs:vt>
<x0:vt>gseq_iforall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>gseq_iforeach0(~xs): void
fun
<xs:vt>
<x0:vt>gseq_iforeach1(!xs): void
//
(* ****** ****** *)
//
// HX-2022-06-09:
// For z2-gseq-operations
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt>
gseq_z2cmp00(xs: ~xs, ys: ~ys): sint
fun
<xs:vt
,ys:vt>
<x0:vt>
gseq_z2cmp11(xs: !xs, ys: !ys): sint
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2forall0(xs: ~xs, ys: ~ys): bool
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2forcmp0(xs: ~xs, ys: ~ys): sint
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2forcmp1(xs: !xs, ys: !ys): sint
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2foreach0(xs: ~xs, ys: ~ys): void
//
(* ****** ****** *)
//
(*
HX-2023-08-14:
higher-order gseq-functions
*)
// lam
// $lam $lam?
// lamfnp lamcfr
// llamcfp llamenv
//
(* ****** ****** *)
//
// HX: gseq_foldl0/1
//
(* ****** ****** *)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldl0_c2fr
(~xs, r0, f0: (r0, x0)-<cfr>r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldl1_c2fr
(!xs, r0, f0: (r0, x0)-<cfr>r0): r0
(* ****** ****** *)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldr0_c2fr
(~xs, r0, f0: (~x0, r0)-<cfr>r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldr1_c2fr
(!xs, r0, f0: (!x0, r0)-<cfr>r0): r0
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_forall0_c1fr
(xs: ~xs, f0: (~x0) -<cfr> bool): bool
fun
<xs:vt>
<x0:vt>
gseq_forall1_c1fr
(xs: !xs, f0: (!x0) -<cfr> bool): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_filter0_c1fr
(xs: ~xs, f0: (!x0) -<cfr> bool): (xs)
fun
<xs:vt>
<x0:vt>
gseq_filter0_c1fr_llist
(xs: ~xs, f0: (!x0) -<cfr> bool): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter0_c1fr_lstrm
(xs: ~xs, f0: (!x0) -<cfr> bool): strm_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2020-05-31:
symbol overloading for gseq_vt
*)
//
(* ****** ****** *)
(*
HX-2023-08-14:
Mon Aug 14 13:03:44 EDT 2023
On a second thought, overloading seems to work well
with closed templates!
*)
(* ****** ****** *)
//
#symload
foldl0_cfr with gseq_foldl0_c2fr of 0100
#symload
foldl1_cfr with gseq_foldl1_c2fr of 0100
//
#symload
foldr0_cfr with gseq_foldr0_c2fr of 0100
#symload
foldr1_cfr with gseq_foldr1_c2fr of 0100
//
(* ****** ****** *)
//
#symload
forall0_cfr with gseq_forall0_c1fr of 0100
#symload
forall1_cfr with gseq_forall1_c1fr of 0100
//
(* ****** ****** *)
//
#symload
filter0_cfr_lstrm with gseq_filter0_c1fr_lstrm of 0100
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS/XANADU_prelude_gseq000_vt.sats] *)
