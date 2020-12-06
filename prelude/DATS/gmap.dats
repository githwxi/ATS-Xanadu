(* ****** ****** *)
(*
//
// HX-2020-12-04:
// For gmap-operations
//
*)
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

impltmp
<map>
<key>
<itm>
gmap_print(kxs) =
stream_vt_print_all
(
gmap_streamize<map><key><itm>(kxs)
) (* end of [gmap_print] *)

(* ****** ****** *)
//
impltmp
<map>
<key>
<itm>
gmap_streamize_key(kxs) =
let
impltmp
map0$fopr
<(key,itm)><key>(kx) = kx.0
in
stream_vt_map0(gmap_streamize(kxs))
end // end of [gmap_streamize_key]
//
(* ****** ****** *)
//
impltmp
<map>
<key>
<itm>
gmap_streamize_itm(kxs) =
let
impltmp
map0$fopr
<(key,itm)><itm>(kx) = kx.1
in
stream_vt_map0(gmap_streamize(kxs))
end // end of [gmap_streamize_itm]
//
(* ****** ****** *)

(* end of [gmap.dats] *)
