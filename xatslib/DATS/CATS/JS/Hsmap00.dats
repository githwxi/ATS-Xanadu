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
g_ptype<x>();pstrn")")//impl
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_print
<jsm0(k,x)>
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
fun
<k:t0>
<x:vt>
jshsmap_listize
(map: jsm0(k,x)): list_vt@(k,x)
#symload listize with jshsmap_listize of 1000
//
(* ****** ****** *)
//
#extern
fun
<k:t0>
<x:vt>
jshsmap_strmize
(map: jsm0(k,x)): strm_vt@(k,x)
//
#symload strmize with jshsmap_strmize of 1000
//
(* ****** ****** *)
//
#extern
fun
<k:t0>
<x:vt>
jshsmap_rlistize
(map: jsm0(k,x)): list_vt@(k,x)
#symload rlistize with jshsmap_rlistize of 1000
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
jshsmap_search$opt
 {k:t0}{x:t0} // HX: not(x:vt)
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
Using [getout$old] if [key]
is known in the given map [map]
*)
#extern
fun<>
jshsmap_getout$old
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
Using [insert$new] if [key] is
known not in the given map [map]
*)
#extern
fun<>
jshsmap_insert$new
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
 {k:t0}{x:vt}
 (    map    ) =
(
XATS2JS_jshsmap_size
 (    map    )) where
{
#extern
fun
XATS2JS_jshsmap_size
 {k:t0}{x:vt}
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
 {k:t0}{x:vt}() =
(
XATS2JS_jshsmap_make_nil
  ( (*void*) )) where
{
#extern
fun
XATS2JS_jshsmap_make_nil
 {k:t0}{x:vt}(): jsm0(k,x) = $extnam()
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
map where
{
val () =
list_foritm<(k,x)>(kxs) }
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
list_vt_foritm0<(k,x)>(kxs) }
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
( map: jsm0(k,x)
, test
: (k, !x) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k: t0 >
< x: vt >
jshsmap_listize
  ( xs ) =
list_vt_reverse0<(k,x)>
(jshsmap_rlistize<k><x>(xs))
//
#impltmp
< k: t0 >
< x: vt >
jshsmap_rlistize
 ( xs ) =
(
  gseq_rlistize1<jsm0(k,x)><(k,x)>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_search$tst
  (map, key) =
(
XATS2JS_jshsmap_search$tst
  (map, key)) where
{
#extern
fun
XATS2JS_jshsmap_search$tst
 {k:t0}{x:vt}
(map: jsm0(k,x), key: k): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_search$opt
  (map, key) =
let
val
test =
jshsmap_search$tst<>(map, key)
in//let
if
test
then
optn_vt_cons
(
UN_jshsmap_get$at$raw<>(map, key))
else
(optn_vt_nil(      (*void*)      ))
end//let//end-of-[jshsmap_search$opt]
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
jshsmap_getout$old
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
jshsmap_insert$new
  (map, k, x) =
let
val-false =
jshsmap_search$tst<>(map, k)
in//let
UN_jshsmap_insert$raw<>(map, k, x)
end//let
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_insert$opt
  (map, k, x) =
(
  opt ) where
{
val opt =
jshsmap_getout$opt<>(map, k)
val ( ) =
UN_jshsmap_insert$raw<>(map, k, x) }
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
//
(*
HX-2024-08-09:
Fri 09 Aug 2024 08:24:11 AM EDT
*)
//
#absvwtp
jshsmap_iter(k:t0,x:vt)
//
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_ptype
<
jshsmap_iter(k,x)>
(    (*void*)    ) =
(
pstrn
"jshsmap_iter(";
g_ptype<k>(); pstrn",";
g_ptype<x>(); pstrn")")
//
(* ****** ****** *)
//
#extern
fun<>
jshsmap_iter_make
{k:t0}{x:vt}
(map
:jshsmap(k,x)): jshsmap_iter(k,x)
//
#extern
fun<>
jshsmap_iter_next$work
{k:t0}{x:vt}
( iter:
! jshsmap_iter(k,x)
, work
: (k(*key*), !x(*itm*)) -> void): bool
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_iter_make
  ( map ) =
(
XATS2JS_jshsmap_iter_make
  ( map )) where
{
#extern
fun
XATS2JS_jshsmap_iter_make
{k:t0}{x:vt}
( map
: jshsmap(k,x))
: jshsmap_iter(k,x) = $extnam()
}
#symload
jshsmap_iter with jshsmap_iter_make of 1000
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_iter_next$work
  (iter, work) =
(
XATS2JS_jshsmap_iter_next$work
  (iter, work)) where
{
#extern
fun
XATS2JS_jshsmap_iter_next$work
{k:t0}{x:vt}
( iter:
! jshsmap_iter(k, x)
, work
: (k(*key*), !x(*itm*))->void): bool = $extnam()
}
//
#symload next$work with jshsmap_iter_next$work of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k: t0 >
< x: vt >
jshsmap_strmize
  ( map ) =
(
auxmain
(jshsmap_iter(map)))
where
{
//
#vwtpdef
iter = jshsmap_iter(k,x)
//
var vk: k
var vx: x
val pk = $addr(vk)
val px = $addr(vx)
//
fun
auxmain
( iter: iter)
: strm_vt@(k,x) = $llazy
let
//
fun
work(k: k, x: !x): void =
(
$UN.p2tr_set<k>(pk, k);
$UN.p2tr_set<x>(px, g_copy<x>(x)))
//
val wrkd =
jshsmap_iter_next$work<>(iter, work)
//
in//let
//
if
not(wrkd)
then
(
strmcon_vt_nil()
) else
let
val k =
$UN.p2tr_get<k>(pk)
val x =
$UN.p2tr_get<x>(px) in//let
strmcon_vt_cons((k,x), auxmain(iter))
end//let//else//end-of-[if(not(wrkd))]
//
end(*let*)//end-of-[auxmain(iter):strm_vt]
//
}(*where*)//end-of-[jshsmap_strmize<>(map)]
//
#impltmp
{ k: t0
, x: vt }
gseq_strmize1
<jsm0(k,x)><(k,x)> = jshsmap_strmize<>{k}{x}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_DATS_CATS_JS_Hsmap00.dats] *)
