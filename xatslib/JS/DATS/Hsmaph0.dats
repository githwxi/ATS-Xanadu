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
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Hsmaph0.dats] *)
