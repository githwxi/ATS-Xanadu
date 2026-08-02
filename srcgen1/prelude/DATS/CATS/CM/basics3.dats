(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-08-02:
Sun Aug  2
07:07:25 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-08-02:
Some needed templates
are in [./basics1.dats]
*)
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../..\
/SATS/gint000.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
cmobj_tbox(*void*)
#typedef cmobj = cmobj_tbox
//
(* ****** ****** *)
//
(*
HX-2020-11-09:
Native CM a1sz for XATS2CM
*)
//
#abstbox
cma1sz_tbox(x0:vt)
#sexpdef cma1sz = cma1sz_tbox
//
(* ****** ****** *)
(*
HX-2020-11-23:
Basics3 for XATS2CM
based on the native CM hmaps 
*)
(* ****** ****** *)
//
#abstbox
cmhmap_tbox(k0:t0, x0:vt)
//
#sexpdef cmhmap = cmhmap_tbox
(*
#typedef
cmhmap
( k0: t0
, x0: vt) = cmhmap_tbox(k0, x0)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
// XATS2CM/cmobj
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2CM_cmobj_get$at
( obj
: cmobj
, key
: string): cmobj
= $extnam() // end-of-[fun]
//
#extern
fun
XATS2CM_cmobj_set$at
( obj
: cmobj
, key
: string
, itm: cmobj): void
= $extnam() // end-of-[fun]
//
#symload
[] with
XATS2CM_cmobj_get$at of 1000
#symload
[] with
XATS2CM_cmobj_set$at of 1000
#symload
get$at with
XATS2CM_cmobj_get$at of 1000
#symload
set$at with
XATS2CM_cmobj_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
// XATS2CM/cma1sz:
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2CM_cma1sz_length
{x0:t0}
( xs
: cma1sz(x0)): nint
= $extnam() // end-of-[fun]
//
(* ****** ****** *)
//
#extern
fun
XATS2CM_cma1sz_get$at
{x0:t0}
( xs
: cma1sz(x0)
, i0: nint(*ind*)): x0
= $extnam() // end-of-[fun]
//
#extern
fun
XATS2CM_cma1sz_set$at
  {x0:t0}
( xs
: cma1sz(x0)
, i0: nint, x0: x0): void
= $extnam() // end-of-[fun]
//
(* ****** ****** *)
#symload
[] with
XATS2CM_cma1sz_get$at of 1000
#symload
[] with
XATS2CM_cma1sz_set$at of 1000
(* ****** ****** *)
#symload
size with
XATS2CM_cma1sz_length of 1000
#symload
length with
XATS2CM_cma1sz_length of 1000
(* ****** ****** *)
#symload
get$at with
XATS2CM_cma1sz_get$at of 1000
#symload
set$at with
XATS2CM_cma1sz_set$at of 1000
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<x0:t0>
XATS2CM_cma1sz_strmize
(xs: cma1sz(x0)): strm_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
#impltmp
{x0:t0}
g_print
<cma1sz(x0)>(xs) =
gseq_print<cma1sz(x0)><x0>(xs)
(* ****** ****** *)
#impltmp
{x0:t0}
gseq_strmize
<cma1sz(x0)><x0>(xs) =
XATS2CM_cma1sz_strmize<x0>(xs)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0:t0}
XATS2CM_cma1sz_strmize
<x0>(xs) =
(
  auxmain(0)) where
{
//
  val n0 = length(xs)
//
  fun
  auxmain
  (i0: sint): strm_vt(x0) =
  $llazy
  (
    if
    (i0 >= n0)
    then
    (
      strmcon_vt_nil((*0*))
    )
    else
    let
      val x0 = xs.get$at(i0)
    in//let
      strmcon_vt_cons(x0, auxmain(i0+1))
    end // let // end of [else]
  ) (* $llazy *) // end of [auxmain(...)]
//
} (* end of [XATS2CM_cma1sz_strmize<x0>(xs)] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
// XATS2CM/cmhmap:
//
(* ****** ****** *)
(* ****** ****** *)
#typedef int0 = sint
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-05-02:
This is NOT viewing!
*)
#extern
fun
<k0:t0>
XATS2CM_cmhmap_get_keys
{x0:vt}
( map
: cmhmap(k0, x0)): cma1sz(k0)
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_get_keys
<int0>(map) =
XATS2CM_cmhmap_get_keys(map)
where{
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_get_keys
{x0:vt}
( map
: cmhmap(k0, x0)): cma1sz(k0) = $extnam()
}(*where*)//end(XATS2CM_cmhmap_get_keys<int0>(map)]
//
#impltmp
XATS2CM_cmhmap_get_keys
<strn>(map) =
XATS2CM_cmhmap_get_keys(map)
where{
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_get_keys
{x0:vt}
( map
: cmhmap(k0, x0)): cma1sz(k0) = $extnam()
}(*where*)//end(XATS2CM_cmhmap_get_keys<strn>(map)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k0:t0>
XATS2CM_cmhmap_keyq
{x0:vt}
( map
: cmhmap
  (k0, x0), key: k0): bool
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_keyq
<int0>(map, key) =
XATS2CM_cmhmap_keyq(map, key)
where{
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_keyq
{x0:vt}
( map
: cmhmap
  (k0, x0), key: k0): bool = $extnam()
}(*where*)//end-of(XATS2CM_cmhmap_keyq<int0>(...)]
//
#impltmp
XATS2CM_cmhmap_keyq
<strn>(map, key) =
XATS2CM_cmhmap_keyq(map, key)
where{
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_keyq
{x0:vt}
( map
: cmhmap
  (k0, x0), key: k0): bool = $extnam()
}(*where*)//end-of(XATS2CM_cmhmap_keyq<strn>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k0:t0>
XATS2CM_cmhmap_make_nil
{x0:t0}
((*void*)): cmhmap(k0, x0)
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_make_nil
<int0>((*0*)) =
XATS2CM_cmhmap_make_nil((*0*))
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_make_nil
{x0:t0}((*nil*)): cmhmap(k0, x0) = $extnam()
}(*where*)//end(XATS2CM_cmhmap_make_nil<int0>)
//
#impltmp
XATS2CM_cmhmap_make_nil
<strn>((*0*)) =
XATS2CM_cmhmap_make_nil((*0*))
where{
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_make_nil
{x0:t0}((*nil*)): cmhmap(k0, x0) = $extnam()
//
}(*where*)//end(XATS2CM_cmhmap_make_nil<strn>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k0:t0>
XATS2CM_cmhmap_search$opt
{x0:t0}
(map: cmhmap(k0, x0), key: k0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_search$opt
<int0>(map, key) =
XATS2CM_cmhmap_search$opt(map, key)
where {
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_search$opt
{x0:t0}
( map
: cmhmap
  (k0, x0), key: k0): optn_vt(x0) = $extnam()
}(*where*)//end(XATS2CM_cmhmap_search$opt<int0>)
//
#impltmp
XATS2CM_cmhmap_search$opt
<strn>(map, key) =
XATS2CM_cmhmap_search$opt(map, key)
where {
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_search$opt
{x0:t0}
( map
: cmhmap
  (k0, x0), key: k0): optn_vt(x0) = $extnam()
}(*where*)//end(XATS2CM_cmhmap_search$opt<strn>)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#extern
fun
<k0:t0>
XATS2CM_cmhmap_remove
{x0:vt}
( map
: cmhmap(k0, x0), key: k0): bool
*)
//
#extern
fun
<k0:t0>
XATS2CM_cmhmap_remove$any
{x0:vt}
( map
: cmhmap(k0, x0), key: k0): void
#extern
fun
<k0:t0>
XATS2CM_cmhmap_remove$opt
{x0:vt}
( map
: cmhmap(k0, x0), key: k0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_remove$any
<int0>(map, key) =
XATS2CM_cmhmap_remove$any(map, key)
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_remove$any
{x0:vt}
( map
: cmhmap(k0, x0), key: k0): void = $extnam()
}
//
#impltmp
XATS2CM_cmhmap_remove$any
<strn>(map, key) =
XATS2CM_cmhmap_remove$any(map, key)
where
{
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_remove$any
{x0:vt}
( map
: cmhmap(k0, x0), key: k0): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_remove$opt
<int0>(map, key) =
XATS2CM_cmhmap_remove$opt(map, key)
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_remove$opt
{x0:vt}
( map
: cmhmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
//
#impltmp
XATS2CM_cmhmap_remove$opt
<strn>(map, key) =
XATS2CM_cmhmap_remove$opt(map, key)
where
{
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_remove$opt
{x0:vt}
( map
: cmhmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
(*
#extern
fun
<k0:t0>
XATS2CM_cmhmap_insert
{x0:vt}
( map
: cmhmap(k0, x0), key: k0, itm: x0): bool
*)
//
#extern
fun
<k0:t0>
XATS2CM_cmhmap_insert$any
{x0:vt}
( map
: cmhmap(k0, x0), key: k0, itm: x0): void
#extern
fun
<k0:t0>
XATS2CM_cmhmap_insert$opt
{x0:vt}
( map
: cmhmap(k0, x0), key: k0, itm: x0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_insert$any
<int0>(map, key, itm) =
XATS2CM_cmhmap_insert$any(map, key, itm)
where {
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_insert$any
{x0:t0}
(map:cmhmap(k0, x0), key:k0, itm:x0): void = $extnam()
}(*where*)//end-of-[XATS2CM_cmhmap_insert$any<int0>(...)]
//
#impltmp
XATS2CM_cmhmap_insert$any
<strn>(map, key, itm) =
XATS2CM_cmhmap_insert$any(map, key, itm)
where {
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_insert$any
{x0:t0}
(map:cmhmap(k0, x0), key:k0, itm:x0): void = $extnam()
}(*where*)//end-of-[XATS2CM_cmhmap_insert$any<strn>(...)]
//
(* ****** ****** *)
//
#impltmp
XATS2CM_cmhmap_insert$opt
<int0>(map, key, itm) =
XATS2CM_cmhmap_insert$opt(map, key, itm)
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2CM_cmhmap_insert$opt
{x0:t0}
(map:cmhmap(k0, x0), key:k0, itm:x0): optn_vt(x0) = $extnam()
}
//
#impltmp
XATS2CM_cmhmap_insert$opt
<strn>(map, key, itm) =
XATS2CM_cmhmap_insert$opt(map, key, itm)
where
{
//
#typedef k0 = strn
//
#extern
fun
XATS2CM_cmhmap_insert$opt
{x0:t0}
(map:cmhmap(k0, x0), key:k0, itm:x0): optn_vt(x0) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
g_print
<cmhmap(k0,x0)>(kxs) =
gmap_print
<cmhmap(k0,x0)><k0><x0>(kxs)
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize
<cmhmap(k0,x0)><k0><x0>(kxs) =
strm_vt_map0
(
gmap_key$strmize
<cmhmap(k0,x0)><k0><x0>(kxs)
) where
{
#impltmp
map$fopr0<k0><(k0,x0)>(k0) =
let
val-
~optn_vt_cons(x0) =
XATS2CM_cmhmap_search$opt(kxs, k0) in (k0, x0)
end//let
}(*end(gmap_strmize<cmhmap(k0,x0)><k0><x0>(kxs))*)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_key$strmize
<cmhmap(k0,x0)><k0><x0>(kxs) =
(
XATS2CM_cma1sz_strmize(XATS2CM_cmhmap_get_keys(kxs)))
//end-of(gmap_key$strmize<cmhmap(k0,x0)><k0><x0>(kxs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_CMy_basics3.dats] *)
(***********************************************************************)
