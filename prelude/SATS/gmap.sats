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
gmap_streamize
(kxs: map): stream_vt(@(key, itm))
(* ****** ****** *)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_streamize_key(map): stream_vt(key)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_streamize_itm(map): stream_vt(key)
(* ****** ****** *)

(* end of [gmap.sats] *)
