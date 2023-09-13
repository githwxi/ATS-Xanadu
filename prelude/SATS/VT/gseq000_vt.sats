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
glseq_nilq1(!xs): bool
fun
<xs:vt>
<x0:vt>
glseq_consq1(!xs): bool
//
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_copy(xs: !xs): (xs)
(*
fun
<xs:vt>
<x0:vt>
glseq_copy1(xs: !xs): (xs)
*)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_free(xs: ~xs): void
(*
fun
<xs:vt>
<x0:vt>
glseq_free0(xs: ~xs): void
*)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_head1_raw(!xs): (x0)
fun
<xs:vt>
<x0:vt>
glseq_tail0_raw(~xs): (xs)
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
glseq_cmp00(~xs, ~xs): sint
fun
<xs:vt>
<x0:vt>
glseq_cmp11(!xs, !xs): sint
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
glseq_print0$beg((*void*)): void
fun
<xs:vt>
<x0:vt>
glseq_print1$beg((*void*)): void
fun
<xs:vt>
<x0:vt>
glseq_print0$end((*void*)): void
fun
<xs:vt>
<x0:vt>
glseq_print1$end((*void*)): void
fun
<xs:vt>
<x0:vt>
glseq_print0$sep((*void*)): void
fun
<xs:vt>
<x0:vt>
glseq_print1$sep((*void*)): void
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
glseq_drop0(xs: ~xs, n0: sint): xs
fun
<xs:vt>
<x0:vt>
glseq_drop1(xs: !xs, n0: sint): xs

(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_listize0(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_listize1(!xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
glseq_strmize0(~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_strmize1(!xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_rlistize0(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_rstrmize0(~xs): strm_vt(x0)
//
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:t0>
glseq_unlist(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:t0>
glseq_unrlist(xs: list(x0)): (xs)
*)
//
fun
<xs:vt>
<x0:t0>
glseq_make_list(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:t0>
glseq_make_strm(xs: strm(x0)): (xs)
fun
<xs:vt>
<x0:t0>
glseq_rmake_list(xs: list(x0)): (xs)
//
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:vt>
glseq_unlist_vt(list_vt(x0)): (xs)
fun
<xs:vt>
<x0:vt>
glseq_unstrm_vt(strm_vt(x0)): (xs)
//
fun
<xs:vt>
<x0:vt>
glseq_unrlist_vt(list_vt(x0)): (xs)
*)
//
fun
<xs:vt>
<x0:vt>
glseq_make0_llist(list_vt(x0)): (xs)
fun
<xs:vt>
<x0:vt>
glseq_make0_lstrm(strm_vt(x0)): (xs)
//
fun
<xs:vt>
<x0:vt>
glseq_rmake0_llist(list_vt(x0)): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>glseq_append0(xs, xs): xs
fun
<xs:vt>
<x0:vt>glseq_extend0(xs, x0): xs
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
<x0:vt>glseq_reverse0(xs: xs): xs
//
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
fun
<xs:vt>
<x0:vt>
glseq_rexists0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_rexists1(!xs): bool
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
fun
<xs:vt>
<x0:vt>
glseq_rforall0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_rforall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
glseq_rforeach0(~xs): void
fun
<xs:vt>
<x0:vt>
glseq_rforeach1(!xs): void
//
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
glseq_map0(xs: ~xs): ( ys )
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
glseq_map1(xs: !xs): ( ys )
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_llist(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_llist(!xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_lstrm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_lstrm(!xs): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_rllist(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_rllist(!xs): list_vt(y0)
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
glseq_copy_llist(!xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_copy_lstrm(!xs): strm_vt(x0)
//
fun
<xs:vt>
<x0:vt>
glseq_rcopy_llist(!xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_rcopy_lstrm(!xs): strm_vt(x0)
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
glseq_copy_rllist(!xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_rcopy_rllist(!xs): list_vt(x0)
//
(* ****** ****** *)
//
(*
Sat Jul  2 11:55:04 EDT 2022
*)
fun
<xs:vt>
<x0:vt>
glseq_filter0(~xs): ( xs )
fun
<xs:vt>
<x0:vt>
glseq_filter0_llist(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_filter0_lstrm(~xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapopt0_lstrm(~xs): strm_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_maplist0_lstrm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapoptn0_lstrm(~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapstrm0_lstrm(~xs): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
glseq_add0$nil(): (x0)
fun
<xs:vt>
<x0:vt>glseq_add0(xs): (x0)
//
fun
<x0:vt>
glseq_mul0$nil(): (x0)
fun
<xs:vt>
<x0:vt>glseq_mul0(xs): (x0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>glseq_map0_add0(xs): (y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>glseq_map0_mul0(xs): (y0)
//
(* ****** ****** *)
//
// For glseq-i-operations
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>glseq_iexists0(~xs): bool
fun
<xs:vt>
<x0:vt>glseq_iexists1(!xs): bool
//
fun
<xs:vt>
<x0:vt>glseq_iforall0(~xs): bool
fun
<xs:vt>
<x0:vt>glseq_iforall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>glseq_iforeach0(~xs): void
fun
<xs:vt>
<x0:vt>glseq_iforeach1(!xs): void
//
(* ****** ****** *)
//
// HX-2022-06-09:
// For z2-glseq-operations
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt>
glseq_z2cmp00(xs: ~xs, ys: ~ys): sint
fun
<xs:vt
,ys:vt>
<x0:vt>
glseq_z2cmp11(xs: !xs, ys: !ys): sint
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
glseq_z2forall0(xs: ~xs, ys: ~ys): bool
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
glseq_z2forcmp0(xs: ~xs, ys: ~ys): sint
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
glseq_z2forcmp1(xs: !xs, ys: !ys): sint
//
(* ****** ****** *)
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
glseq_z2foreach0(xs: ~xs, ys: ~ys): void
//
(* ****** ****** *)
//
(*
HX-2023-08-14:
higher-order glseq-functions
*)
// lam
// $lam $lam?
// lamfnp lamcfr
// llamcfp llamenv
//
(* ****** ****** *)
//
// HX: glseq_foldl0/1
//
(* ****** ****** *)
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldl0_c2fr
(~xs, r0, f0: (r0, x0)-<cfr>r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldl1_c2fr
(!xs, r0, f0: (r0, x0)-<cfr>r0): r0
(* ****** ****** *)
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldr0_c2fr
(~xs, r0, f0: (x0, r0)-<cfr>r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldr1_c2fr
(!xs, r0, f0: (x0, r0)-<cfr>r0): r0
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
foldl0_cfr with glseq_foldl0_c2fr of 0100
#symload
foldl1_cfr with glseq_foldl1_c2fr of 0100
//
#symload
foldr0_cfr with glseq_foldr0_c2fr of 0100
#symload
foldr1_cfr with glseq_foldr1_c2fr of 0100
//
(* ****** ****** *)

(* end of [ATS/XANADU_prelude_gseq000_vt.sats] *)
