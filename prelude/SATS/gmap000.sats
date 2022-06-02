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
gmap_print
( kxs: map ) : void
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

(* end of [prelude_gmap000.sats] *)
