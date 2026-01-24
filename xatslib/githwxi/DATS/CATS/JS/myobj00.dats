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
/xbasics\
/DATS/CATS/JS/hashmp0.dats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../../myobj00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
hmap_tbox(a:t0) = jshmap(strn, a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_strmize
 (map) = jshmap_strmize(map)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_make_nil
 ((*void*)) = jshmap_make_nil<>()
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_get$at
 (map, k0) =
(
 jshmap_get$at<>(map, k0))
#impltmp
< a: t0 >
hmap_set$at
 (map, k0, x0) =
(
 jshmap_set$at<>(map, k0, x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_search$opt
 (map, k0) =
(
 jshmap_search$opt<>(map, k0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
hmap_insert$opt
 (map, k0, x0) =
(
 jshmap_insert$opt<>(map, k0, x0))
//
#impltmp
< a: t0 >
hmap_insert$new
 (map, k0, x0) =
(
 jshmap_insert$new<>(map, k0, x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_CATS_JS_myobj00.dats] *)
(***********************************************************************)
