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

(*
#impltmp
<map>
<key>
<itm>
gmap_print(kxs) =
strm_vt_print_all
(
gmap_strmize<map><key><itm>(kxs)
) (* end of [gmap_print] *)
*)
#impltmp
<map>
<key>
<itm>
gmap_print(kxs) =
let
fun
loop(kxs): void =
(
case+ !kxs of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(kx1, kxs) =>
(
print
(kx1.0, " = ", kx1.1); loop(kxs)
)
) (* end of [loop] *)
in
loop
(gmap_strmize<map><key><itm>(kxs))
end // end of [gmap_print]

(* ****** ****** *)
//
#impltmp
<map>
<key>
<itm>
gmap_strmize_key(kxs) =
let
#impltmp
map0$fopr
<(key,itm)><key>(kx) = kx.0
in
  strm_vt_map0(gmap_strmize(kxs))
end // end of [gmap_strmize_key]
//
(* ****** ****** *)
//
#impltmp
<map>
<key>
<itm>
gmap_strmize_itm(kxs) =
let
#impltmp
map0$fopr
<(key,itm)><itm>(kx) = kx.1
in
  strm_vt_map0(gmap_strmize(kxs))
end // end of [gmap_strmize_itm]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gmap000.dats] *)
