(* ****** ****** *)
(*
** For gseq-operations
*)
(* ****** ****** *)
//
(*
//
(*
HX-2020-02-26:
this idea is abandoned!!!
*)
//
#absprop
gseq_prop
(xs: t0, x0: t0)
#sexpdef gseq = gseq_prop
//
*)
//
(* ****** ****** *)
(*
Hongwei Xi:
Wed Aug 16 21:34:47 EDT 2023
How should a function be named?
gseq_map_llist:
map refers to the action verb
gseq refers to the input object
llist refers to the output object
*)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_nil(): xs
//
fun
<xs:t0>
<x0:t0>
gseq_cons(x0, xs): xs
fun
<xs:t0>
<x0:t0>
gseq_snoc(xs, x0): xs
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_sing(x0): xs
fun
<xs:t0>
<x0:t0>
gseq_pair(x0, x0): xs
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
gseq_singq(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_pairq(xs): bool
//
(*
fun
<xs:t0>
<x0:t0>
gseq_is_sing(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_is_pair(xs): bool
*)
//
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_copy(xs): (xs)
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_head(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_tail(xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_head$exn(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_tail$exn(xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_head$opt(xs): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_tail$opt(xs): optn_vt(xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_last$exn(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_last$opt
( xs: xs ): optn_vt(x0)
//
fun
<xs:t0>
<x0:t0>
gseq_last_ini(xs, x0): x0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_uncons
  (xs: &xs >> xs): x0
//
fun
<xs:t0>
<x0:t0>
gseq_uncons$exn
  (xs: &xs >> xs): x0
//
fun
<xs:t0>
<x0:t0>
gseq_uncons$opt
  (xs: &xs >> xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_cmp(xs, xs): sint
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_beg((*0*)): strn
fun
<xs:vt>
<x0:vt>
gseq_end((*0*)): strn
fun
<xs:vt>
<x0:vt>
gseq_sep((*0*)): strn
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_print(xs: xs): void
//
fun
<xs:t0>
<x0:t0>
gseq_print$beg((*0*)): void
fun
<xs:t0>
<x0:t0>
gseq_print$end((*0*)): void
fun
<xs:t0>
<x0:t0>
gseq_print$sep((*0*)): void
//
(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
gseq_length(xs: xs): nint

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
gseq_foldl(xs, r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldr(xs, r0): (r0)
//
(* ****** ****** *)
//
fun
<xs:t0>
g_exists(xs: xs): bool
fun
<xs:t0>
g_forall(xs: xs): bool
fun
<xs:t0>
g_foritm(xs: xs): void
//
fun
<xs:t0>
<x0:t0>
gseq_exists(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_forall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_foritm(xs: xs): void
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
fun
<xs:t0>
<x0:t0>
gseq_search$exn(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_rsearch$exn(xs): x0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_search$opt
  (xs: xs): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_rsearch$opt
  (xs: xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_get$at
(xs: xs, i0: nint): x0
fun
<xs:t0>
<x0:t0>
gseq_get$at$exn
(xs: xs, i0: nint): x0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_set$at
( xs:
& xs >> xs
, i0: nint, x0: x0): void
fun
<xs:t0>
<x0:t0>
gseq_set$at$exn
( xs:
& xs >> xs
, i0: nint, x0: x0): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_fset$at
( xs: xs
, i0: nint, x0: x0): (xs)
fun
<xs:t0>
<x0:t0>
gseq_fset$at$exn
( xs: xs
, i0: nint, x0: x0): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_get$at$opt
( xs: xs
, i0: nint): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_set$at$opt
( xs:
& xs >> xs
, i0: nint, x0: x0): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_fset$at$opt
( xs: xs
, i0: nint, x0: x0): optn_vt(xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_arrnize(xs): a1psz(x0)
fun
<xs:t0>
<x0:t0>
gseq_rarrnize(xs): a1psz(x0)
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
gseq_rlistize(xs): list_vt(x0)
//
(* ****** ****** *)
(*
HX-2024-07-09:
*)
fun
<xs:t0>
<x0:t0>
gseq_strqize(xs): strq_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_rstrqize(xs): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_strmize(xs): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_rstrmize(xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_range_lt
(*
gseq_make_range_lt
*)
  (s1:x0, f2:x0): (xs)//s1<=x0<f2
fun
<xs:t0>
<x0:t0>
gseq_range_lte
(*
gseq_make_range_lte
*)
  (s1:x0, f2:x0): (xs)//s1<=x0<=f2
//
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_unlist(list(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_unrlist(list(x0)): (xs)
*)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_unlist_vt(list_vt(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_unrlist_vt(list_vt(x0)): (xs)
*)
//
fun
<xs:t0>
<x0:t0>
gseq_make_list(list(x0)): (xs)
(*
HX-2024-07-07:
It is in [gseq000_vt.sats]
fun
<xs:t0>
<x0:t0>
gseq_make0_llist(list_vt(x0)): (xs)
*)
//
fun
<xs:t0>
<x0:t0>
gseq_rmake_list(list(x0)): (xs)
(*
HX-2024-07-07:
It is in [gseq000_vt.sats]
fun
<xs:t0>
<x0:t0>
gseq_rmake0_llist(list_vt(x0)): (xs)
*)
//
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_unstrm(strm(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_unstrm_vt(strm_vt(x0)): (xs)
*)
//
fun
<xs:t0>
<x0:t0>
gseq_make_strm(strm(x0)): (xs)
(*
HX-2024-07-07:
It is in [gseq000_vt.sats]
fun
<xs:t0>
<x0:t0>
gseq_make0_lstrm(strm_vt(x0)): (xs)
*)
//
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_make_fwork
( fwork: (x0->void)->void): (xs)
fun
<xs:t0>
<x0:t0>
gseq_make_filter
( fwork: (x0->void)->void): (xs)
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<n0:i0>
gseq_tabulate(n0: sint(n0)): (xs)
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
<ys:vt>
<y0:vt>
gseq_map(xs: xs): (ys)
//
fun
<xs:t0>
<x0:t0> // g_mul
gseq_scale(xs, x0): (xs)
fun
<xs:t0>
<x0:t0> // g_add
gseq_shift(xs, x0): (xs)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_maprev(xs: xs): (ys)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_list(xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_rlist(xs): list(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_larrn(xs): a1psz(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_rlarrn(xs): a1psz(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_llist(xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_lstrm(xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_lstrq(xs): strq_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_rllist(xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_copy_list(xs): list(x0)
fun
<xs:t0>
<x0:t0>
gseq_copy_rlist(xs): list(x0)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_copy_llist(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_copy_rllist(xs): list_vt(x0)
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_filter(xs: xs): (xs)
//
(*
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_filter_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_filter_self(xs: xs): (xs)
*)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_list(xs): list(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_llist(xs): list_vt(x0)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_lstrm(xs): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_lstrq(xs): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_rlist(xs): list(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_rllist(xs): list_vt(x0)
//
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
fun
<xs:t0>
<x0:t0>
gseq_take
(xs: xs, n0: sint): xs
//
fun
<xs:t0>
<x0:t0>
gseq_takeif(xs: xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_takeif_llist(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_takeif_lstrm(xs): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_takeif_rllist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_mapopt_list(xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_mapopt_rlist(xs): list(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_mapopt_llist(xs): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_mapopt_lstrm(xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_mapopt_rllist(xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_add(xs:xs): x0
fun
<xs:t0>
<x0:t0>
gseq_mul(xs:xs): x0
//
fun
<x0:t0>
gseq_add$nil((*nil*)): x0
fun
<x0:t0>
gseq_mul$nil((*nil*)): x0
//
(* ****** ****** *)
//
fun
<xs:t0>
gseq_conj(xs:xs): bool
//gseq_forall<xs><bool>(xs)
fun
<xs:t0>
gseq_disj(xs:xs): bool
//gseq_exists<xs><bool>(xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_add(xs): (y0)
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_mul(xs): (y0)
//
fun
<xs:t0>
<x0:t0>
gseq_map_conj(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_map_disj(xs): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_max(xs:xs): x0
fun
<xs:t0>
<x0:t0>
gseq_min(xs:xs): x0
//
fun
<x0:t0>
gseq_max$nil((*nil*)): x0
fun
<x0:t0>
gseq_min$nil((*nil*)): x0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_max$exn(xs:xs): x0
fun
<xs:t0>
<x0:t0>
gseq_min$exn(xs:xs): x0
//
fun
<xs:t0>
<x0:t0>
gseq_max$opt
(  xs: xs  ): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_min$opt
(  xs: xs  ): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_max_ini
( xs: xs, x0: x0 ): (x0)
fun
<xs:t0>
<x0:t0>
gseq_min_ini
( xs: xs, x0: x0 ): (x0)
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
gseq_rforitm(xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_rmap_list(xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_rmap_rlist(xs): list(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_llist(xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_lstrm(xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_lstrq(xs): strq_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_rllist(xs): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_append
(xs: xs, ys: ~ys): xs
//
(*
#symload
append with gseq_append of 0100
*)
//
(* ****** ****** *)
//
fun
<xz:t0>
<xs:t0>
<x0:t0>
gseq_concat
( xss: xz ): xs//xz=[xs]
//
fun
<xs:t0>
<x0:t0>
gseq_reverse
( xs0: xs ): xs//xs=[x0]
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_rappend
( xs: xs, ys: ~ys ): xs
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_append_lstrm
(xs: xs, ys: ~ys): strm_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
// c0 = cgtz
// cs = strn
// cz = gseq(cs)
*)
fun
<cz:t0>
gseq_concat_lstrn
  (css: cz): strn_vt
//
(* ****** ****** *)
//
fun
<xz:t0>
<xs:t0>
<x0:t0>
gseq_concat_lstrm
  (xss: xz): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_rappend_lstrm
(xs: xs, ys: ~ys): strm_vt(x0)
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
gseq_group_lstrm
( xs: xs ): strm_vt(xs)
fun
<xs:t0>
<x0:t0>
gseq_group_lstrm_llist
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
fun
<xs:t0>
<x0:t0>
gseq_iforall(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gseq_iforitm(xs: xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_indexof
(xs: xs, x0: x0): sint//-1:~found
fun
<xs:t0>
<x0:t0>
gseq_rindexof
(xs: xs, x0: x0): sint//-1:~found
//
(* ****** ****** *)
//
(*
gseq_imap: imap$fopr
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_imap(xs: xs): (ys)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_imap_list
  (xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_llist
  (xs: xs): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_lstrm
  (xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_lstrq
  (xs: xs): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_imap_rlist
  (xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_rllist
  (xs: xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imapopt_lstrm
  (xs: xs): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_idropif(xs: xs): xs
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_itakeif(xs: xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_itakeif_llist(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_itakeif_lstrm(xs): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_itakeif_rllist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_ifilter_llist(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_ifilter_lstrm(xs): list_vt(x0)
//
fun
<xs:t0>
<x0:t0>
gseq_ifilter_rllist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_istrmize
  (xs: xs): strm_vt@(nint, x0)
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
gseq_mergesort_llist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_permutize_lstrm(xs: xs): strm_vt(xs)
//
(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2cmp
  (xs: xs, ys: ys): sint
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<r0:vt>
gseq_z2foldl
  (xs: xs, ys: ys, r0: r0): r0
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<r0:vt>
gseq_z2foldr
  (xs: xs, ys: ys, r0: r0): r0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forall
  (xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forcmp
  (xs: xs, ys: ys): sint
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2foritm
  (xs: xs, ys: ys): void
//
(* ****** ****** *)
//
(*
HX-2022-06-13:
[xs1] is a prefix of [xs2]
*)
fun
<xs:t0>
<x0:t0>
gseq_prefixq
  (xs1: xs, xs2: xs): bool
(*
HX-2022-06-13:
[xs1] is a suffix of [xs2]
*)
fun
<xs:t0>
<x0:t0>
gseq_suffixq
  (xs1: xs, xs2: xs): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2listize
(xs, ys): list_vt(@(x0, y0))
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2strmize
(xs, ys): strm_vt(@(x0, y0))
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_z2map
  (xs: xs, ys: ys): (  zs  )
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:t0>
gseq_z2map_list
  (xs: xs, ys: ys): list(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:t0>
gseq_z2map_rlist
  (xs: xs, ys: ys): list(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_llist
  (xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_lstrm
  (xs: xs, ys: ys): strm_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_rllist
  (xs: xs, ys: ys): list_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2forall
  (xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2forcmp
  (xs: xs, ys: ys): sint
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2foritm
  (xs: xs, ys: ys): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_iz2map
  (xs: xs, ys: ys): (  zs  )
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:t0>
gseq_iz2map_list
  (xs: xs, ys: ys): list(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:t0>
gseq_iz2map_rlist
  (xs: xs, ys: ys): list(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_iz2map_llist
  (xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_iz2map_lstrm
  (xs: xs, ys: ys): strm_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_iz2map_rllist
  (xs: xs, ys: ys): list_vt(z0)
//
(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_x2map
  (xs: xs, ys: ys): (  zs  )
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:t0>
gseq_x2map_list
  (xs: xs, xs: ys): list(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2map_llist
  (xs: xs, xs: ys): list_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2map_lstrm
  (xs: xs, ys: ys): strm_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2mapopt_lstrm(xs, ys): strm_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2strmize(xs, ys): strm_vt(@(x0,y0))
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2forall(xs, ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2rforall(xs, ys): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2foritm(xs, ys): void
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2foritm_row(xs, ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2foritm_col(xs, ys): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_x2imap(xs:xs, ys:ys): ( zs )
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:t0>
gseq_x2imap_list(xs, ys): list(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imap_llist(xs, ys): list_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imap_lstrm(xs, ys): strm_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imapopt_lstrm(xs, ys): strm_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforall(xs, ys): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforitm(xs, ys): void
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforitm_row(xs, ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforitm_col(xs, ys): void
//
(* ****** ****** *)
//
(*
HX-2022-07-01:
higher-order gseq-functions
*)
//
(* ****** ****** *)
// lam
// $lam $lam?
// lamfnp lamcfr
// llamcfp llamenv
//
(* ****** ****** *)
//
// HX: gseq_foldl
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldl_f2un
( xs, r0
, f0: (r0, x0) -> r0): (r0)
(* ****** ****** *)
//
// HX: gseq_foldr
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldr_f2un
( xs, r0
, f0: (x0, r0) -> r0): (r0)
(* ****** ****** *)
(* ****** ****** *)
//
// HX: gseq_exists
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_exists_f1un
( xs: xs
, test: (x0) -> bool): (bool)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_rexists_f1un
( xs: xs
, test: (x0) -> bool): (bool)
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX: gseq_forall
//
(* ****** ****** *)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_forall_f1un
( xs: xs
, test: (x0) -> bool): (bool)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_rforall_f1un
( xs: xs
, test: (x0) -> bool): (bool)
(* ****** ****** *)
#symload
forall with gseq_forall_f1un of 0100
#symload
rforall with gseq_rforall_f1un of 0100
(* ****** ****** *)
(* ****** ****** *)
//
// HX: gseq_foritm
//
(* ****** ****** *)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_foritm_f1un
( xs: xs
, work: (x0) -> void): (void)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_rforitm_f1un
( xs: xs
, work: (x0) -> void): (void)
(* ****** ****** *)
#symload
foritm with gseq_foritm_f1un of 0100
#symload
rforitm with gseq_rforitm_f1un of 0100
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: gseq_tabulate
*)
//
fun
<xs:t0>
<x0:t0>
gseq_tabulate_f1un
{n0:i0}
(sint(n0), nintlt(n0) -> x0): (xs)
//
(* ****** ****** *)
//
// HX: gseq_map(seq)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_f1un
(xs:xs, fopr: (x0) -> y0):(ys)
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_c1fp0
(xs:xs, fopr: ~(x0)-<cfp>y0):(ys)
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_c1fp1
(xs:xs, fopr: !(x0)-<cfp>y0):(ys)
(* ****** ****** *)
//
(*
HX: gseq_map_list
HX: gseq_map_llist
*)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_f1un_list
( xs: xs
, fopr: (x0) -> y0): list(y0)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_map_f1un_rlist
( xs: xs
, fopr: (x0) -> y0): list(y0)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_f1un_llist
( xs: xs
, fopr: (x0) -> y0): list_vt(y0)
(* ****** ****** *)
//
(*
HX: gseq_map_lstrm
*)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_f1un_lstrm
( xs: xs
, fopr: (x0) -> y0): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_f1un_lstrq
( xs: xs
, fopr: (x0) -> y0): strq_vt(y0)
(* ****** ****** *)
//
// HX: gseq_filter
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_filter_f1un
(xs:xs, test:(x0) -> bool): (xs)
(* ****** ****** *)
//
(*
HX: gseq_filter_list
HX: gseq_filter_llist
HX: gseq_filter_lstrm
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_f1un_list
( xs: xs
, test: (x0) -> bool): list(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_f1un_llist
( xs: xs
, test: (x0) -> bool): list_vt(x0)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_f1un_lstrm
( xs: xs
, test: (x0) -> bool): strm_vt(x0)
//
fun
<xs:t0>
<x0:t0>
gseq_filter_f1un_lstrq
( xs: xs
, test: (x0) -> bool): strq_vt(x0)
//
(* ****** ****** *)
//
// HX: gseq_ifoldl
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldl_c3fr
( xs, r0
, f0: (r0, nint, x0) -> r0): r0
(* ****** ****** *)
//
// HX: gseq_ifoldr
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldr_c3fr
( xs, r0
, f0: (nint, x0, r0) -> r0): r0
(* ****** ****** *)
//
// HX: gseq_iexists
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_iexists_f2un
( xs: xs
, test: (nint,x0) -> bool): bool
(* ****** ****** *)
//
// HX: gseq_iforall
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_iforall_f2un
( xs: xs
, test: (nint, x0) -> bool): bool
(* ****** ****** *)
//
// HX: gseq_iforitm
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_iforitm_f2un
( xs: xs
, test: (nint, x0) -> void): void
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_irforitm_f2un
( xs: xs
, test: (nint, x0) -> void): void
(* ****** ****** *)
//
// HX: gseq_imap(seq)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_imap_f2un
( xs: xs
, fopr: (nint, x0) -> y0): (ys)
(* ****** ****** *)
//
(*
HX: gseq_imap_list
HX: gseq_imap_llist
HX: gseq_imap_lstrm
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_imap_f2un_list
( xs: xs
, fopr: (nint, x0) -> y0): list(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_f2un_llist
( xs: xs
, fopr: (nint, x0) -> y0): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_f2un_lstrm
( xs: xs
, fopr: (nint, x0) -> y0): strm_vt(y0)
//
(* ****** ****** *)
//
// HX: gseq_z2forall
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forall_f2un
( xs: xs
, ys: ys, test: (x0, y0) -> bool): bool
//
(* ****** ****** *)
//
// HX: gseq_z2forcmp
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forcmp_f2un
( xs: xs
, ys: ys, test: (x0, y0) -> sint): sint
//
(* ****** ****** *)
//
// HX: gseq_z2foritm
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2foritm_f2un
( xs: xs
, ys: ys, test: (x0, y0) -> void): void
//
(* ****** ****** *)
//
// HX: gseq_z2map(seq)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_z2map_f2un
(xs:xs, ys:ys, fopr:(x0, y0) -> z0): (zs)
(* ****** ****** *)
//
// HX: gseq_z2map_llist
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_f2un_llist
( xs:xs
, ys:ys, fopr:(x0, y0) -> z0): list_vt(z0)
(* ****** ****** *)
//
// HX: gseq_z2map_strm
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_f2un_lstrm
( xs:xs
, ys:ys, fopr:(x0, y0) -> z0): strm_vt(z0)
(* ****** ****** *)
//
// HX: gseq_iz2forall
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2forall_c3fr
( xs:xs
, ys:ys
, work: (nint, x0, y0) -> bool): bool
//
(* ****** ****** *)
//
// HX: gseq_iz2forcmp
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2forcmp_c3fr
( xs:xs
, ys:ys
, work: (nint, x0, y0) -> sint): sint
(* ****** ****** *)
//
// HX: gseq_iz2foritm
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2foritm_c3fr
( xs:xs
, ys:ys
, work: (nint, x0, y0) -> void): void
(* ****** ****** *)
//
// HX: gseq_iz2map(seq)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_iz2map_c3fr
( xs:xs
, ys:ys
, fopr: (nint, x0, y0) -> z0): ( zs )
(* ****** ****** *)
//
// HX: gseq_x2foritm
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2foritm_f2un
( xs:xs
, ys:ys, work:(x0, y0) -> void): void
//
(* ****** ****** *)
//
// HX: gseq_x2map(seq)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_x2map_f2un
(xs:xs, ys:ys, fopr:(x0,y0) -> z0): (zs)
//
(* ****** ****** *)
//
// HX: gseq_x2map_llist
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2map_f2un_llist
( xs:xs
, ys:ys, fopr:(x0,y0) -> z0): list_vt(z0)
//
(* ****** ****** *)
//
// HX: gseq_x2map_strm
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2map_f2un_lstrm
( xs:xs
, ys:ys, fopr:(x0,y0) -> z0): strm_vt(z0)
//
(* ****** ****** *)
//
// HX: gseq_x2iforitm
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforitm_c4fr
( xs:xs
, ys:ys
, work:
  (nint, x0, nint, y0) -> void): void
//
(* ****** ****** *)
//
// HX: gseq_x2imap(seq)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_x2imap_c4fr
( xs:xs
, ys:ys
, fopr:(nint, x0, nint, y0) -> z0): (zs)
//
(* ****** ****** *)
//
// HX: gseq_x2imap_llist
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imap_c4fr_llist
( xs:xs
, ys:ys
, fopr:
  (nint, x0, nint, y0) -> z0): list_vt(z0)
//
(* ****** ****** *)
//
// HX: gseq_x2imap_strm
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imap_c4fr_lstrm
( xs:xs
, ys:ys
, fopr:
  (nint, x0, nint, y0) -> z0): strm_vt(z0)
//
(* ****** ****** *)
//
// HX: Some third-order gseq-functions
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_forall_of_strmize
(strmize: strmize(xs, x0)): forall(xs, x0)
fun
<xs:t0>
<x0:t0>
gseq_forall_of_foritm
(foritm: foritm(xs, x0)): forall(xs, x0)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_foritm_of_strmize
(strmize: strmize(xs, x0)): foritm(xs, x0)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldl_of_strmize//default
(strmize: strmize(xs, x0)): foldl(xs, x0, r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldr_of_rstrmize//default
(rstrmize: rstrmize(xs, x0)): foldr(xs, x0, r0)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldl_of_foritm//list-like
(foritm: foritm(xs, x0)): foldl(xs, x0, r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldr_of_rforitm//list-like
(rforitm: rforitm(xs, x0)): foldr(xs, x0, r0)
(* ****** ****** *)
//
(*
HX-2020-05-30:
symbol overloading for gseq-operations
*)
//
(* ****** ****** *)
//
(*
HX-2023-08-04:
Fri Aug  4 12:19:06 EDT 2023
It dawned on me last night that overloading
for the gseq-operations needs to be supported by
some form of type unification DURING the phase of
TEMPLATE RESOLUTION. A BIG design decision to take!
HX-2023-08-14:
Mon Aug 14 13:03:44 EDT 2023
On a second thought, overloading seems to work well
with closed templates!
*)
//
(* ****** ****** *)
(*
#symload map with gseq_map of 0100
#symload filter with gseq_filter of 0100
#symload mapopt with gseq_mapopt of 0100
*)
(* ****** ****** *)
(*
#symload forall with gseq_forall of 0100
#symload foritm with gseq_foritm of 0100
*)
(* ****** ****** *)
(*
#symload map_llist with gseq_map_llist of 0100
#symload filter_list with gseq_filter_list of 0100
#symload mapopt_list with gseq_mapopt_list of 0100
*)
(* ****** ****** *)

#symload
foldl_fun with gseq_foldl_f2un of 0100
#symload
foldr_fun with gseq_foldr_f2un of 0100

(* ****** ****** *)

#symload
forall_fun with gseq_forall_f1un of 0100
#symload
foritm_fun with gseq_foritm_f1un of 0100

(* ****** ****** *)

#symload
ifoldl_fun with gseq_ifoldl_c3fr of 0100
#symload
ifoldr_fun with gseq_ifoldr_c3fr of 0100

(* ****** ****** *)

#symload
iforall_fun with gseq_iforall_f2un of 0100
#symload
iforitm_fun with gseq_iforitm_f2un of 0100

(* ****** ****** *)
//
#symload
map_fun with gseq_map_f1un_lstrm of 0100
//
#symload
map_fun_list with gseq_map_f1un_list of 0100
//
#symload
map_fun_llist with gseq_map_f1un_llist of 0100
//
#symload
map_fun_lstrm with gseq_map_f1un_lstrm of 0100
//
(* ****** ****** *)
//
#symload
filter_fun with gseq_filter_f1un_lstrm of 0100
//
#symload
filter_fun_list with gseq_filter_f1un_list of 0100
//
#symload
filter_fun_llist with gseq_filter_f1un_llist of 0100
//
#symload
filter_fun_lstrm with gseq_filter_f1un_lstrm of 0100
//
(* ****** ****** *)
//
#symload
imap_fun with gseq_imap_f2un_lstrm of 0100
//
#symload
imap_fun_list with gseq_imap_f2un_list of 0100
//
#symload
imap_fun_llist with gseq_imap_f2un_llist of 0100
//
#symload
imap_fun_lstrm with gseq_imap_f2un_lstrm of 0100
//
(* ****** ****** *)
//
(*
//
#symload
ifilter_fun_llist with gseq_ifilter_f2un_llist of 0100
//
#symload
imapopt_fun_llist with gseq_imapopt_f2un_llist of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gseq000.sats] *)
