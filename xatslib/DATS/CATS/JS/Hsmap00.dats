(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu 08 Aug 2024 07:48:50 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX: For hashmap support in JS
*)
(* ****** ****** *)
(* ****** ****** *)
#abstbox
jshsmap_tbox(k:t0,x:vt)
#absvtbx
jshsmap_vtbx(k:t0,x:vt)
(* ****** ****** *)
#typedef
jshsmap
(k:t0
,x:vt) = jshsmap_tbox(k,x)
#vwtpdef
jshsmap_vt
(k:t0
,x:vt) = jshsmap_vtbx(k,x)
(* ****** ****** *)
#sexpdef jsm0 = jshsmap
#sexpdef jslm = jshsmap_vt
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast
jshsmap_vt2t
{k:t0}{x:vt}
(map: jslm(k,x)): jsm0(k,x)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_ptype
<jsm0(k,x)>
( (*nil*) ) =
(
pstrn"jshsmap(";
g_ptype<k>();pstrn",";
g_ptype<x>();pstrn")")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_print<jsm0(k,x)>
  ( map ) =
let
//
#vwtpdef x0 = @(k,x)
#typedef xs = jsm0(k,x)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "jshsmap("
//
in//let
(
  gseq_print1<xs><x0>(map) )
end//end-of-[g_print<jsm0(k,x)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_forall<jsm0(k,x)> =
gseq_forall1<jsm0(k,x)><(k,x)>
//
#impltmp
{ k: t0
, x: vt }
g_foritm<jsm0(k,x)> =
gseq_foritm1<jsm0(k,x)><(k,x)>
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshsmap_make_nil
 {k:t0}{x:vt}
(    (*nil*)    ): jsm0(k,x)
//
#extern
fun<>
jshsmap_make_list
 {k:t0}{x:t0}
( kxs:list@(k,x) ): jsm0(k,x)
//
#symload
jshsmap with jshsmap_make_nil of 1000
#symload
jshsmap with jshsmap_make_list of 1000
//
#extern
fun<>
jshsmap_make0_llist
 {k:t0}{x:vt}
( kxs:list_vt@(k,x) ): jsm0(k,x)
#symload
jshsmap with jshsmap_make0_llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshsmap_get$at
 {k:t0}{x:t0}
(A: jsm0(k,x), k: k): (x)
#extern
fun<>
jshsmap_set$at
 {k:t0}{x:t0}
(A: jsm0(k,x), k:k, x:x): void
//
#symload [] with jshsmap_get$at of 1000
#symload [] with jshsmap_set$at of 1000
#symload get$at with jshsmap_get$at of 1000
#symload set$at with jshsmap_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshsmap_strmize
 {k:t0}{x:vt}
(map: jsm0(k,x)): strm_vt@(k,x)
//
#symload strmize with jshsmap_strmize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-10:
There is no [rforall] as there
is no natural ordering of pairs
in a hashmap.
*)
#extern
fun<>
jshsmap_forall_f2un
 {k:t0}{x:vt}
( map: jsm0(k,x)
, test: (k, !x) -> bool): bool
//
#symload forall with jshsmap_forall_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshsmap_search$tst
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k): bool
//
#extern
fun<>
jshsmap_search$cpy
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k): optn_vt(x)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-10:
Sat 10 Aug 2024 12:18:20 PM EDT
jshsmap_delete(map) = map.delete
Note that:
[jshsmap_delete$raw] is not needed!
*)
#extern
fun<>
jshsmap_delete
  {k:t0}{x:t0}
(map: jsm0(k,x), key: k): void
//
(* ****** ****** *)
//
(*
HX-2024-08-10:
Using [getout$any] if [key]
is known in the given map [map]
*)
#extern
fun<>
jshsmap_getout$any
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k): ( x )
#extern
fun<>
jshsmap_getout$opt
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k): optn_vt(x)
//
(* ****** ****** *)
//
(*
HX-2024-08-10:
Using [insert$any] if [key]
is known not in the given map [map]
*)
#extern
fun<>
jshsmap_insert$any
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k, itm: x): void
#extern
fun<>
jshsmap_insert$opt
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k, itm: x): optn_vt(x)
//
(* ****** ****** *)
//
(*
HX-2024-08-09:
The prefix "UN" indicate that
the declared function is unsafe
in nature; it is usually only used
to implement some safe functions.
*)
#extern
fun<>
UN_jshsmap_get$at$raw
 {k:t0}{x:t0}
(map: jsm0(k,x), key: k): ( x )
#extern
fun<>
UN_jshsmap_set$at$raw
 {k:t0}{x:t0}
(map: jsm0(k,x), key: k, itm: x): void
//
(*
HX-2024-08-09:
This assume that [key] is not in [map]
*)
#extern
fun<>
UN_jshsmap_insert$raw
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k, itm: x): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshsmap_size
 {k:t0}{x:vt}
( map: jsm0(k,x)): (nint)
//
#impltmp
<(*tmp*)>
jshsmap_size
 {k:t0}{x:t0}
 (    map    ) =
(
XATS2JS_jshsmap_size
 (    map    )) where
{
#extern
fun
XATS2JS_jshsmap_size
 {k:t0}{x:t0}
(map: jsm0(k,x)): nint = $extnam()
}
//
#impltmp
{ k: t0
, x: t0 }
gseq_length
<jsm0(k,x)><(k,x)>
  ( kxs ) =
(
  jshsmap_size<>{k}{x}(kxs))
//
#impltmp
{ k: t0
, x: vt }
gseq_length1
<jsm0(k,x)><(k,x)>
  ( kxs ) =
(
  jshsmap_size<>{k}{x}(kxs))
//
#symload size with jshsmap_size of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_make_nil
 {k:t0}{x:t0}() =
(
XATS2JS_jshsmap_make_nil
  ( (*void*) )) where
{
#extern
fun
XATS2JS_jshsmap_make_nil
 {k:t0}{x:t0}(): jsm0(k,x) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_make_list
 {k:t0}{x:t0}(kxs) =
let
//
val map =
jshsmap_make_nil<>()
//
in//let
(
list_foritm(kxs); map
) where
{
#impltmp
foritm$work<(k,x)>(kx) =
let
val (k, x) = kx in
UN_jshsmap_insert$raw(map, k, x)
end//let//end-of-[forithm$work(...)]
}
end//let//end-of-[jshsmap_make_list]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_make0_llist
 {k:t0}{x:vt}(kxs) =
let
//
val map =
jshsmap_make_nil<>()
//
in//let
(
map where
{
val () =
list_vt_foritm0(kxs) }
) where
{
#impltmp
foritm$work0<(k,x)>(kx) =
let
val (k, x) = kx in
UN_jshsmap_insert$raw(map, k, x)
end//let//end-of-[forithm$work0(...)]
}
end//let//end-of-[jshsmap_make0_llist]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: t0 }
gseq_forall
<jsm0(k,x)><(k,x)>
  ( kxs ) =
jshsmap_forall_f2un<>
(kxs
,lam(k,x) => forall$test@(k,x))
//
#impltmp
{ k: t0
, x: vt }
gseq_forall1
<jsm0(k,x)><(k,x)>
  ( kxs ) =
jshsmap_forall_f2un<>
(kxs
,lam(k,x) => forall$test1@(k,x))
//
#impltmp
<(*tmp*)>
jshsmap_forall_f2un
  (map, test) =
(
XATS2JS_jshsmap_forall_f2un
  (map, test)) where
{
#extern
fun
XATS2JS_jshsmap_forall_f2un
 {k:t0}{x:vt}
( map
: jsm0(k,x)
, test
: (k, !x) -> bool): bool = $extnam()
}
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
(map: jsm0(k,x), key: k): ( x ) = $extnam()
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
( map
: jsm0(k,x), key:k, itm:x): void = $extnam()
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
( map
: jsm0(k,x), key: k, itm: x): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_getout$any
  (map, key) =
(    itm     ) where
{
val-
~optn_vt_cons(itm) =
jshsmap_getout$opt<>(map, key) }
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_insert$any
  (map, k, x) =
let
val-
~optn_vt_nil() =
jshsmap_insert$opt<>(map, k, x) end
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-13:
[jshsmap] is not a gasz!
*)
#extern
fcast // fun
GSEQ_make_jshsmap
{k:t0}{x:t0}
( map: jsm0(k, x))
: GSEQ(jsm0(k, x), @(k, x))
#symload GSEQ with GSEQ_make_jshsmap of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_DATS_CATS_JS_Hsmap00.dats] *)
