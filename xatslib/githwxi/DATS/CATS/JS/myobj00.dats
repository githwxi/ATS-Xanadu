(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-08:
For hmap: myobj = hmap(dtval)
Sat 07 Sep 2024 08:37:22 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
#staload
"xatslib\
/DATS/CATS/JS/Hsmap00.dats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../../myobj00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
hmap_tbox(a:t0) = jshsmap(strn, a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_strmize
 (map) = jshsmap_strmize(map)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_make_nil
 ((*void*)) = jshsmap_make_nil<>()
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_search$opt
 (map, k0) =
(
 jshsmap_search$opt<>(map, k0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_insert$opt
 (map, k0, x0) =
(
 jshsmap_insert$opt<>(map, k0, x0))
//
#impltmp
< a: t0 >
hmap_insert$new
 (map, k0, x0) =
(
 jshsmap_insert$new<>(map, k0, x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_CATS_JS_myobj00.dats] *)
