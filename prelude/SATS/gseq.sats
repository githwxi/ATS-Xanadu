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
absprop
gseq_prop
(xs: t0, x0: t0)
propdef
gseq
( xs: t0
, x0: t0) = gseq_prop(x0, xs)
*)
//
(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
gseq_nil(): xs
fun
<xs:t0>
<x0:t0>
gseq_cons(x0, xs): xs

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
gseq_memberq(xs, x0): bool
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
fun
<xs:t0>
<x0:t0>
gseq_streamize(xs): stream_vt(x0)
//
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
fun
<xs:t0>
<x0:t0>
gseq_unstream_vt(stream_vt(x0)): (xs)
//
(* ****** ****** *)
//
(*
gseq_map: map$fopr
*)
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
gseq_map_rlist(xs): list_vt(y0)
//
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_array(xs): a1ptrsz(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_rarray(xs): a1ptrsz(y0)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_stream(xs): stream_vt(y0)
(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
gseq_copy_list(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_copy_rlist(xs): list_vt(x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
gseq_filter_list(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_rlist(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_filter_stream(xs): stream_vt(x0)

(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_mapopt_stream(xs): stream_vt(y0)
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
gseq_append_stream
(xs1: xs, xs2: xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
<cz:t0>
gseq_concat_string(css: cz): string_vt
//
fun
<xz:t0>
<xs:t0>
<x0:t0>
gseq_concat_stream(xss: xz): stream_vt(x0)
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
(xs: xs, x0: x0): sint // ~1: ~found
fun
<xs:t0>
<x0:t0>
gseq_rindexof
(xs: xs, x0: x0): sint // ~1: ~found
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
gseq_imap_stream
  (xs: xs): stream_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imapopt_stream
  (xs: xs): stream_vt(y0)
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
gseq_mergesort(xs: xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_permutize(xs: xs): stream_vt(xs)
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
gseq_z2streamize
(xs, ys): stream_vt(@(x0, y0))
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
gseq_z2map_stream
  (xs: xs, ys: ys): stream_vt(z0)
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
gseq_x2map_stream
(xs, ys): stream_vt(z0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2mapopt_stream
(xs, ys): stream_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_x2streamize
(xs, ys): stream_vt(@(x0,y0))
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
gseq_x2imap_list
(xs, ys): list_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2imap_stream
(xs, ys): stream_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_x2imapopt_stream
(xs, ys): stream_vt(z0)
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

#symload
nilq with gseq_nilq of 0100
#symload
consq with gseq_consq of 0100

(* ****** ****** *)

#symload
head with gseq_head_exn of 0100
#symload
head_exn with gseq_head_exn of 0100
#symload
head_opt with gseq_head_opt of 0100

(* ****** ****** *)

#symload
tail with gseq_tail_exn of 0100
#symload
tail_exn with gseq_tail_exn of 0100
#symload
tail_opt with gseq_tail_opt of 0100

(* ****** ****** *)

#symload
length with gseq_length of 0100

(* ****** ****** *)
//
#symload foldl with gseq_foldl of 0100
#symload forall with gseq_forall of 0100
#symload foreach with gseq_foreach of 0100
//
(* ****** ****** *)
//
#symload max2 with gseq_max2 of 0100
#symload min2 with gseq_min2 of 0100
//
#symload max_exn with gseq_max_exn of 0100
#symload min_exn with gseq_min_exn of 0100
//
#symload max_opt with gseq_max_opt of 0100
#symload min_opt with gseq_min_opt of 0100
//
(* ****** ****** *)

#symload sortedq with gseq_sortedq of 0100

(* ****** ****** *)
//
#symload foldr with gseq_foldr of 0100
#symload rforall with gseq_rforall of 0100
#symload rforeach with gseq_rforeach of 0100
//
(* ****** ****** *)

#symload listize with gseq_listize of 0100
#symload rlistize with gseq_rlistize of 0100
#symload streamize with gseq_streamize of 0100

(* ****** ****** *)

#symload map_list with gseq_map_list of 0100
#symload map_rlist with gseq_map_rlist of 0100
#symload map_stream with gseq_map_stream of 0100

(* ****** ****** *)

#symload append with gseq_append of 0100
#symload concat with gseq_append of 0100
#symload reverse with gseq_append of 0100
#symload rappend with gseq_append of 0100

(* ****** ****** *)

#symload
append_stream with gseq_append_stream of 0100
#symload
concat_stream with gseq_concat_stream of 0100
#symload
concat_string with gseq_concat_string of 0100

(* ****** ****** *)

#symload ifoldl with gseq_ifoldl of 0100

(* ****** ****** *)

#symload iforall with gseq_iforall of 0100
#symload iforeach with gseq_iforeach of 0100

(* ****** ****** *)

#symload
imap_list with gseq_imap_list of 0100
#symload
imap_rlist with gseq_imap_rlist of 0100
#symload
imap_stream with gseq_imap_stream of 0100
#symload
imapopt_stream with gseq_imapopt_stream of 0100

(* ****** ****** *)

#symload
z2listize with gseq_z2listize of 0100
#symload
z2streamize with gseq_z2streamize of 0100

(* ****** ****** *)

#symload
x2foreach_row with gseq_x2foreach_row of 0100
#symload
x2foreach_col with gseq_x2foreach_col of 0100
#symload
x2iforeach_row with gseq_x2iforeach_row of 0100
#symload
x2iforeach_col with gseq_x2iforeach_col of 0100

(* ****** ****** *)

(* end of [gseq.sats] *)
