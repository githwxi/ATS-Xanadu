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
#impltmp
<map>
<key><itm>
gmap_size(kxs) =
strm_vt_length
(gmap_strmize<map><key><itm>(kxs))
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

#impltmp
<map>
<key><itm>
gmap_search
(kxs, k0) =
let
val opt =
gmap_search_opt
<map><key><itm>(kxs, k0)
in
case+ opt of
| ~
optn_cons(x0) => x0 // found!
| ~
optn_nil(x0) => // not found!
gmap_search$exn<map><key><itm>()
end (*let*)//end-of[gmap_search(kxs,k0)]

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
//
(*
(*
HX-2022-07-12:
Tue Jul 12 13:01:46 EDT 2022
It is already in [list000.dats]
*)
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize
<list0((k0,x0))><k0><x0> = list_strmize<(k0,x0)>
*)
//
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_unlist(kxs) =
gmap_unstrm_vt
<map><key><itm>
(list_strmize<(key,itm)>(kxs))
//
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_unstrm(kxs) =
gmap_unstrm_vt
<map><key><itm>
(strm_strmize<(key,itm)>(kxs))
//
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_unlist_vt(kxs) =
gmap_unstrm_vt
<map><key><itm>
(list_vt_strmize<(key,itm)>(kxs))
//
(* ****** ****** *)
//
#impltmp
<map>
<key><itm>
gmap_unstrm_vt(kxs) =
let
val map =
gmap_make_nil
<map><key><itm>((*nil*))
var map = map
val ( ) = loop(map, kxs) in map
end where
{
//
#vwtpdef
kxs = strm_vt@(key,itm)
//
fun
loop
( map
: &map >> map
, kxs
: strm_vt@(key,itm)): void =
(
case+ !kxs of
| ~
strmcon_vt_nil() => ()
| ~
strmcon_vt_cons(kx1, kxs) =>
(
  loop(map, kxs)) where
{
val opt =
gmap_insert_opt
<map><key><itm>(map, kx1.0, kx1.1)
val ( ) =
(
case+ opt of
| ~
optn_vt_nil _ => ( (*void*) )
| ~
optn_vt_cons _ => ( (*void*) )): void
} (*where*) // end of [strmcon_vt_cons]
)
//
} (*where*) // end of [gmap_unstrm_vt(kxs)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gmap000.dats] *)
