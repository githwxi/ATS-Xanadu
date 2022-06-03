(* ****** ****** *)
(*
** For gseq-operations
*)
(* ****** ****** *)
//
(*
//
// HX-2020-02-26:
// this idea is abandoned!!!
//
#absprop
gseq_prop
(xs: t0, x0: t0)
#propdef
gseq
( xs: t0
, x0: t0) = gseq_prop(x0, xs)
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_nil(): xs
fun
<xs:t0>
<x0:t0>
gseq_cons(x0, xs): xs
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_nilq(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_consq(xs): bool
//
(*
fun
<xs:t0>
<x0:t0>
gseq_is_nil(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_is_cons(xs): bool
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_head_raw(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_tail_raw(xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_head_exn(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_tail_exn(xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_head_opt(xs): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_tail_opt(xs): optn_vt(xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_last_raw(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_last_exn(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_last_opt(xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_uncons_raw
  (xs: &xs >> xs): x0
fun
<xs:t0>
<x0:t0>
gseq_uncons_exn
  (xs: &xs >> xs): x0
fun
<xs:t0>
<x0:t0>
gseq_uncons_opt
  (xs: &xs >> xs): optn_vt(x0)
//
(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
gseq_cmp(xs, xs): sint

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
gseq_print(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_print$beg((*void*)): void
fun
<xs:t0>
<x0:t0>
gseq_print$end((*void*)): void
fun
<xs:t0>
<x0:t0>
gseq_print$sep((*void*)): void

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
gseq_length(xs): nint

(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_drop
(xs: xs, n0: sint): xs
//
fun
<xs:t0>
<x0:t0>
gseq_dropif(xs: xs): xs
//
(* ****** ****** *)
//
(*
gseq_foldl: foldl$fopr
gseq_foldr: foldr$fopr
*)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldl(xs, r0): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldr(xs, r0): r0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_exists(xs): bool
//
fun
<xs:t0>
<x0:t0>
gseq_forall(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_foreach(xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_memberq
(xs: xs, x0: x0): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_search(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_rsearch(xs): x0
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_search_opt
  (xs: xs): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_rsearch_opt
  (xs: xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_get_at
(xs: xs, i0: nint): x0
fun
<xs:t0>
<x0:t0>
gseq_fset_at
( xs: xs
, i0: nint, x0: x0): xs
//
fun
<xs:t0>
<x0:t0>
gseq_get_at_opt
( xs: xs
, i0: nint): optn_vt(x0)
(*
fun
<xs:t0>
<x0:t0>
gseq_fset_at_opt
( xs: xs
, i0: nint, x0: x0): optn_vt(xs)
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_listize(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_strmize(xs): strm_vt(x0)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_rlistize(xs): list_vt(x0)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_unlist(list(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_unrlist(list(x0)): (xs)
//
fun
<xs:t0>
<x0:t0>
gseq_unlist_vt(list_vt(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_unrlist_vt(list_vt(x0)): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_unstrm(strm(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_unstrm_vt(strm_vt(x0)): (xs)
//
(* ****** ****** *)
//
(*
gseq_map: map$fopr
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_list(xs): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_strm(xs): strm_vt(y0)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_rlist(xs): list_vt(y0)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_arrn(xs): a1ptrsz(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_rarrn(xs): a1ptrsz(y0)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_copy_list(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_copy_rlist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_list(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_strm(xs): strm_vt(x0)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_filter_rlist(xs): list_vt(x0)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_mapopt_list(xs): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_mapopt_strm(xs): strm_vt(y0)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_mapopt_rlist(xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>gseq_add(xs): x0
fun
<xs:t0>
<x0:t0>gseq_mul(xs): x0
fun
<xs:t0>
<x0:t0>
<y0:t0>gseq_map_add(xs): y0
fun
<xs:t0>
<x0:t0>
<y0:t0>gseq_map_mul(xs): y0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_max_exn(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_min_exn(xs): x0
//
fun
<xs:t0>
<x0:t0>
gseq_max_opt(xs): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_min_opt(xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_max2(xs, x0): x0
fun
<xs:t0>
<x0:t0>
gseq_min2(xs, x0): x0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_sortedq(xs): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_rexists(xs): bool
//
fun
<xs:t0>
<x0:t0>
gseq_rforall(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_rforeach(xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_list(xs): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_strm(xs): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_append
(xs1: xs, xs2: xs): xs
fun
<xz:t0>
<xs:t0>
<x0:t0>
gseq_concat(xss: xz): xs
//
fun
<xs:t0>
<x0:t0>
gseq_reverse(xs: xs): xs
fun
<xs:t0>
<x0:t0>
gseq_rappend(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_append_strm
(xs1: xs, xs2: xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<cz:t0>
gseq_concat_strn
  (css: cz): strn_vt
//
fun
<xz:t0>
<xs:t0>
<x0:t0>
gseq_concat_strm
  (xss: xz): strm_vt(x0)
//
(* ****** ****** *)
//
(*
fun
<x0:t0>
group$test(x0: x0): bool
*)
fun
<xs:t0>
<x0:t0>
gseq_group
( xs: xs ): strm_vt(xs)
fun
<xs:t0>
<x0:t0>
gseq_group_list
( xs: xs ): strm_vt(list_vt(x0))
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldl(xs, r0): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldr(xs, r0): r0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_iexists(xs: xs): bool
//
fun
<xs:t0>
<x0:t0>
gseq_iforall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_iforeach(xs: xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_indexof
(xs: xs, x0: x0): sint // -1: ~found
fun
<xs:t0>
<x0:t0>
gseq_rindexof
(xs: xs, x0: x0): sint // -1: ~found
//
(* ****** ****** *)
//
(*
gseq_imap: imap$fopr
*)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_list
  (xs: xs): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_rlist
  (xs: xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_strm
  (xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imapopt_strm
  (xs: xs): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_idropif(xs: xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_itakeif_list(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_itakeif_rlist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_ifilter_list(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_ifilter_rlist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_istrmize
  (xs: xs): strm_vt( @(nint, x0) )
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_mergesort(xs: xs): (xs)
fun
<xs:t0>
<x0:t0>
gseq_mergesort_list(xs: xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_permutize(xs: xs): strm_vt(xs)
//
(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<r0:vt>
gseq_z2foldl
  ( xs: xs
  , ys: ys, r0: r0): r0
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<r0:vt>
gseq_z2foldr
  ( xs: xs
  , ys: ys, r0: r0): r0
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2forall
  (xs: xs, ys: ys): bool
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2forcmp
  (xs: xs, ys: ys): sint
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2foreach
  (xs: xs, ys: ys): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_prefixq
  (xs1: xs, xs2: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_suffixq
  (xs1: xs, xs2: xs): bool
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2listize
(xs, ys): list_vt(@(x0, y0))
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2strmize
(xs, ys): strm_vt(@(x0, y0))
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_z2map_list
  (xs: xs, ys: ys): list_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_z2map_rlist
  (xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_z2map_strm
  (xs: xs, ys: ys): strm_vt(z0)
//
(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2map_list
(xs, ys): list_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2map_strm
(xs, ys): strm_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2mapopt_strm(xs, ys): strm_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_x2strmize(xs, ys): strm_vt(@(x0,y0))
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_x2foreach_row(xs, ys): void
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_x2foreach_col(xs, ys): void
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2imap_list(xs, ys): list_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2imap_strm(xs, ys): strm_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2imapopt_strm(xs, ys): strm_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_x2iforeach_row(xs, ys): void
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_x2iforeach_col(xs, ys): void
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for gseq
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseq000.sats] *)
