(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/Hsmap.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsm(k:t0,x:vt) = jshsmap(k,x)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0 }
{ x: vt }
g_ptype
< jsm(k,x) >
( (*void*) ) =
(
pstrn"jshsmap(";
g_ptype<k>();pstrn",";
g_ptype<x>();pstrn")")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
UN_jshsmap_get$at$raw
  (map, key) =
(
XATS2JS_jshsmap_get$at$raw
  (map, key)) where
{
#extern
fun
XATS2JS_jshsmap_get$at$raw
 {k:t0}{x:t0}
(map: jshsmap(k,x), key: k): ( x ) = $extnam()
}
//
#impltmp
<(*tmp*)>
UN_jshsmap_set$at$raw
  (map, key, itm) =
(
XATS2JS_jshsmap_set$at$raw
  (map, key, itm)) where
{
#extern
fun
XATS2JS_jshsmap_set$at$raw
 {k:t0}{x:t0}
(map: jshsmap(k,x), key: k, itm: x): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
UN_jshsmap_insert$raw
  (map, key, itm) =
(
XATS2JS_jshsmap_insert$raw
  (map, key, itm)) where
{
#extern
fun
XATS2JS_jshsmap_insert$raw
 {k:t0}{x:vt}
(map: jshsmap(k,x), key: k, itm: x): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Hsmaph0.dats] *)
