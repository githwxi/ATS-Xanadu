(* ****** ****** *)
(*
//
// HX-2020-12-04:
// For gmap-operations
//
*)
(* ****** ****** *)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_size(map): nint
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_print
( kxs: map ) : void
//
fun<>
gmap_print$beg(): void
fun<>
gmap_print$end(): void
fun<>
gmap_print$sep(): void
//
fun
<key:t0>
<itm:t0>
gmap_print$keyval
(k0: key, x0: itm) : void
//
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_keyq
(kxs: map, key: key): bool
//
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_make_nil(): map
//
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_search_opt
(kxs: map, key: key): optn_vt(itm)
//
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_insert_opt
(kxs: &map >> map, key, itm): optn_vt(itm)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_remove_opt
(kxs: &map >> map, key: key): optn_vt(itm)
//
(* ****** ****** *)
//
(*
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_forall(kxs: map): bool
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_foreach(kxs: map): void
*)
//
(* ****** ****** *)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_strmize
(kxs: map): strm_vt(@(key, itm))
(* ****** ****** *)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_strmize_key(map): strm_vt(key)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_strmize_itm(map): strm_vt(key)
(* ****** ****** *)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_unlist(list(@(key, itm))): map
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_unstrm(strm(@(key, itm))): map
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_unlist_vt(list_vt(@(key, itm))): map
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_unstrm_vt(strm_vt(@(key, itm))): map
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gmap000.sats] *)
