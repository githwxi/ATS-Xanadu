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
<map:vt>
<key:vt>
<itm:vt>
gmap_beg((*0*)): strn
fun
<map:vt>
<key:vt>
<itm:vt>
gmap_end((*0*)): strn
fun
<map:vt>
<key:vt>
<itm:vt>
gmap_sep((*0*)): strn
//
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
<itm:vt>
gmap_keyq
(kxs: map, key: key): bool
//
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_make_nil((*0*)): (map)
//
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_search
(kxs: map, key: key): (itm)
//
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_search$exn
(kxs: map, key: key): (itm)
fun
<map:t0>
<key:t0>
<itm:t0>
gmap_search$opt
(kxs: map, key: key): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-08:
These are in [srcgen2]:
*)
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_search$tst
(kxs: map, key: key): bool
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_search$cpy
(kxs: map, key: key): optn_vt(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_insert$opt
(kxs: &map >> map, key, itm): optn_vt(itm)
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_remove$opt
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
gmap_foritm(kxs: map): void
*)
//
(* ****** ****** *)
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_strmize
(kxs: map): strm_vt(@(key, itm))
(* ****** ****** *)
//
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_strmize_key(map): strm_vt(key)
fun
<map:t0>
<key:t0>
<itm:vt>
gmap_strmize_itm(map): strm_vt(itm)
//
(* ****** ****** *)
(*
HX: For initializing a gmap
Wed Aug  3 10:20:10 EDT 2022
*)
(* ****** ****** *)
//
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
//
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
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gmap000.sats] *)
