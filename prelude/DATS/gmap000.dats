(* ****** ****** *)
(*
//
// HX-2020-12-04:
// For gmap-operations
//
*)
(* ****** ****** *)
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_print(kxs) =
let
//
#vwtpdef
kx = @(key, itm)
//
fun
loop
( i0: sint
, kxs
: strm_vt(kx)): void =
(
case+ !kxs of
| ~
strmcon_vt_nil
  ((*void*)) => ()
| ~
strmcon_vt_cons
  (kx1, kxs) =>
(
loop(i0+1, kxs)) where
{
val () =
if
(i0 > 0)
then gmap_print$sep<>()
val () =
gmap_print$keyval
< key >< itm >(kx1.0, kx1.1)
}
) (* end of [loop] *)
in
gmap_print$beg<>();
loop
( 0(*i0*)
, gmap_strmize<map><key><itm>(kxs));
gmap_print$end<>();
end (*let*) // end of [gmap_print(kxs)]
//
(* ****** ****** *)
//
#impltmp
gmap_print$beg<>() = ()
#impltmp
gmap_print$end<>() = ()
#impltmp
gmap_print$sep<>() = strn_print(";")
//
#impltmp
<key><itm>
gmap_print$keyval
  (k0, x0) =
(
g_print<key>( k0 );
strn_print<>("->"); g_print<itm>( x0 )
) // end-of-[gmap_print$keyval(k0,x0)]
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_keyq
(kxs, k0) =
strm_vt_exists0<key>
(
gmap_strmize_key
<map><key><itm>(kxs)
) where // end-of(strm_vt_exists0<key>)
{
#impltmp
exists0$test<key>(k1)=g_equal<key>(k0,k1)
} (*where*) // end of [gmap_keyq(kxs, k0)]
//
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_strmize_key(kxs) =
let
#impltmp
map0$fopr
<(key,itm)><key>(kx) = kx.0
in
strm_vt_map0<(key,itm)>(gmap_strmize(kxs))
end(*let*)//end-of-[gmap_strmize_key(kxs)]
//
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_strmize_itm(kxs) =
let
#impltmp
map0$fopr
<(key,itm)><itm>(kx) = kx.1
in
strm_vt_map0<(key,itm)>(gmap_strmize(kxs))
end(*let*)//end-of-[gmap_strmize_itm(kxs)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gmap000.dats] *)
