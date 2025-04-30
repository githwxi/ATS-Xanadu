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
HX:
For hashmap support in JS
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
#staload
UN = "prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#abstbox
jshmap_tbox(k:t0,x:vt)
#absvtbx
jshmap_vtbx(k:t0,x:vt)
(* ****** ****** *)
#sexpdef jsm1 = jshmap_tbox
#sexpdef jslm = jshmap_vtbx
(* ****** ****** *)
#typedef
jshmap(k:t0,x:vt) = jshmap_tbox(k,x)
#vwtpdef
jshmap_vt(k:t0,x:vt) = jshmap_vtbx(k,x)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast
jshmap_vt2t
{k:t0}{x:vt}
(map: jslm(k,x)): jsm1(k,x)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_ptype
<jsm1(k,x)>
( (*nil*) ) =
(
pstrn
"jshmap(";
g_ptype<k>();pstrn",";
g_ptype<x>();pstrn")")
//end-of-(impltmp(g_ptype<jsm1(k,x)>))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_print
<jsm1(k,x)>
  ( map ) =
let
//
#vwtpdef x0 = @(k,x)
#typedef xs = jsm1(k,x)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "jshmap("
//
in//let
(
  gseq_print1<xs><x0>(map) )
end(*let*)//end-of-[impltmp(g_print<jsm1(k,x)>)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_forall<jsm1(k,x)> =
gseq_forall1<jsm1(k,x)><(k,x)>
//
#impltmp
{ k: t0
, x: vt }
g_foritm<jsm1(k,x)> =
gseq_foritm1<jsm1(k,x)><(k,x)>
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshmap_make_nil
 {k:t0}{x:vt}
(    (*nil*)    ): jsm1(k,x)
//
#extern
fun<>
jshmap_make_list
 {k:t0}{x:t0}
( kxs:list@(k,x) ): jsm1(k,x)
//
#symload
jshmap with jshmap_make_nil of 1000
#symload
jshmap with jshmap_make_list of 1000
//
#extern
fun<>
jshmap_make0_llist
 {k:t0}{x:vt}
( kxs:list_vt@(k,x) ): jsm1(k,x)
#symload
jshmap with jshmap_make0_llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshmap_keyq
 {k:t0}{x:vt}
(A: jsm1(k,x), k: k): bool
#symload keyq with jshmap_keyq of 1000
//
(* ****** ****** *)
//
#extern
fun<>
jshmap_get$at
 {k:t0}{x:t0}
(A: jsm1(k,x), k: k): ( x )
#extern
fun<>
jshmap_set$at
 {k:t0}{x:t0}
(A: jsm1(k,x), k:k, x:x): void
//
#symload [ ] with jshmap_get$at of 1000
#symload [ ] with jshmap_set$at of 1000
#symload get$at with jshmap_get$at of 1000
#symload set$at with jshmap_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k:t0>
<x:vt>
jshmap_listize
(map: jsm1(k,x)): list_vt@(k,x)
#symload listize with jshmap_listize of 1000
//
(* ****** ****** *)
//
#extern
fun
<k:t0>
<x:vt>
jshmap_strmize
(map: jsm1(k,x)): strm_vt@(k,x)
//
#symload strmize with jshmap_strmize of 1000
//
(* ****** ****** *)
//
#extern
fun
<k:t0>
<x:vt>
jshmap_rlistize
(map: jsm1(k,x)): list_vt@(k,x)
#symload rlistize with jshmap_rlistize of 1000
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
jshmap_forall_f2un
 {k:t0}{x:vt}
( map: jsm1(k,x)
, test: (k, !x) -> bool): bool
//
#symload forall with jshmap_forall_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshmap_search$tst
 {k:t0}{x:vt}
(map: jsm1(k,x), key: k): bool
//
#extern
fun<>
jshmap_search$opt
 {k:t0}{x:t0} // HX: not(x:vt)
(map: jsm1(k,x), key: k): optn_vt(x)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-10:
Sat 10 Aug 2024 12:18:20 PM EDT
jshmap_delete(map) = map.delete
Note that:
[jshmap_delete$raw] is not needed!
*)
#extern
fun<>
jshmap_delete
  {k:t0}{x:t0}
(map: jsm1(k,x), key: k): void
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
jshmap_getout$old
 {k:t0}{x:vt}
(map: jsm1(k,x), key: k): ( x )
#extern
fun<>
jshmap_getout$opt
 {k:t0}{x:vt}
(map: jsm1(k,x), key: k): optn_vt(x)
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
jshmap_insert$new
 {k:t0}{x:vt}
(map: jsm1(k,x), key: k, itm: x): void
#extern
fun<>
jshmap_insert$opt
 {k:t0}{x:vt}
(map: jsm1(k,x), key: k, itm: x): optn_vt(x)
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
UN_jshmap_get$at$raw
 {k:t0}{x:t0}
(map: jsm1(k,x), key: k): ( x )
#extern
fun<>
UN_jshmap_set$at$raw
 {k:t0}{x:t0}
(map: jsm1(k,x), key: k, itm: x): void
//
(* ****** ****** *)
//
(*
HX-2024-08-09:
This assume that [key] is not in [map]
*)
#extern
fun<>
UN_jshmap_insert$raw
 {k:t0}{x:vt}
(map: jsm1(k,x), key: k, itm: x): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jshmap_size
 {k:t0}{x:vt}
( map: jsm1(k,x)): (nint)
//
#impltmp
<(*tmp*)>
jshmap_size
 {k:t0}{x:vt}
 (    map    ) =
(
XATS2JS_jshmap_size
 (    map    )) where
{
#extern
fun
XATS2JS_jshmap_size
 {k:t0}{x:vt}
(map: jsm1(k,x)): nint = $extnam()
}
//
#impltmp
{ k: t0
, x: t0 }
gseq_length
<jsm1(k,x)><(k,x)>
  ( kxs ) =
(
  jshmap_size<>{k}{x}(kxs))
//
#impltmp
{ k: t0
, x: vt }
gseq_length1
<jsm1(k,x)><(k,x)>
  ( kxs ) =
(
  jshmap_size<>{k}{x}(kxs))
//
#symload size with jshmap_size of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_make_nil
 {k:t0}{x:vt}() =
(
XATS2JS_jshmap_make_nil
  ( (*void*) )) where
{
#extern
fun
XATS2JS_jshmap_make_nil
 {k:t0}{x:vt}(): jsm1(k,x) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_make_list
 {k:t0}{x:t0}(kxs) =
let
//
val map =
jshmap_make_nil<>()
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
UN_jshmap_insert$raw(map, k, x)
end//let//endof[forithm$work(...)]
}
end//let//end-of-[jshmap_make_list]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_make0_llist
 {k:t0}{x:vt}(kxs) =
let
//
val map =
jshmap_make_nil<>()
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
UN_jshmap_insert$raw(map, k, x)
end//let//endof[forithm$work0(...)]
}
end//let//end-of-[jshmap_make0_llist]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_keyq
  (A, k) =
(
XATS2JS_jshmap_keyq
  (A, k)) where
{
#extern
fun
XATS2JS_jshmap_keyq
 {k:t0}{x:vt}
(A:jsm1(k,x), k:k): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_get$at
  (A, k) =
let
//
val b0 =
jshmap_keyq(A, k)
val () =
assert(b0, "jshmap_get$at")
//
in//let
//
(
  UN_jshmap_get$at$raw<>(A, k))
end//let//end-of-[jshmap_get$at(...)]
//
#impltmp
<(*tmp*)>
jshmap_set$at
  (A, k, x) =
(
  UN_jshmap_set$at$raw<>(A, k, x))
//jshmap_set$at: keyq(A,k) may be true!
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: t0 }
gseq_forall
<jsm1(k,x)><(k,x)>
  ( kxs ) =
jshmap_forall_f2un<>
(kxs
,lam(k, x) => forall$test@(k, x))
//
#impltmp
{ k: t0
, x: vt }
gseq_forall1
<jsm1(k,x)><(k,x)>
  ( kxs ) =
jshmap_forall_f2un<>
(kxs
,lam(k, x) => forall$test1@(k, x))
//
#impltmp
<(*tmp*)>
jshmap_forall_f2un
  (map, test) =
(
XATS2JS_jshmap_forall_f2un
  (map, test)) where
{
#extern
fun
XATS2JS_jshmap_forall_f2un
 {k:t0}{x:vt}
( map: jsm1(k,x)
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
jshmap_listize
  ( xs ) =
list_vt_reverse0<(k,x)>
(jshmap_rlistize<k><x>(xs))
//
#impltmp
< k: t0 >
< x: vt >
jshmap_rlistize
 ( xs ) =
(
  gseq_rlistize1<jsm1(k,x)><(k,x)>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_search$tst
  (map, key) =
(
XATS2JS_jshmap_search$tst
  (map, key)) where
{
#extern
fun
XATS2JS_jshmap_search$tst
 {k:t0}{x:vt}
(map: jsm1(k,x), key: k): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_search$opt
  (map, key) =
let
val
test =
jshmap_search$tst<>(map, key)
in//let
if
test
then
optn_vt_cons
(
UN_jshmap_get$at$raw<>(map, key))
else
(optn_vt_nil(      (*void*)      ))
end//let//end-of-[jshmap_search$opt]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
UN_jshmap_get$at$raw
  (map, key) =
(
XATS2JS_jshmap_get$at$raw
  (map, key)) where
{
#extern
fun
XATS2JS_jshmap_get$at$raw
 {k:t0}{x:t0}
(map: jsm1(k,x), key: k): ( x ) = $extnam()
}
//
#impltmp
<(*tmp*)>
UN_jshmap_set$at$raw
  (map, key, itm) =
(
XATS2JS_jshmap_set$at$raw
  (map, key, itm)) where
{
#extern
fun
XATS2JS_jshmap_set$at$raw
 {k:t0}{x:t0}
( map
: jsm1(k,x), key:k, itm:x): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
UN_jshmap_insert$raw
  (map, key, itm) =
(
XATS2JS_jshmap_insert$raw
  (map, key, itm)) where
{
#extern
fun
XATS2JS_jshmap_insert$raw
 {k:t0}{x:vt}
( map
: jsm1(k,x), key: k, itm: x): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_getout$old
  (map, key) =
(    itm     ) where
{
val-
~optn_vt_cons(itm) =
jshmap_getout$opt<>(map, key) }
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_insert$new
  (map, k, x) =
let
val-false =
jshmap_search$tst<>(map, k)
in//let
UN_jshmap_insert$raw<>(map, k, x)
end//let
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_insert$opt
  (map, k, x) =
(
  opt ) where
{
val opt =
jshmap_getout$opt<>(map, k)
val ( ) =
UN_jshmap_insert$raw<>(map, k, x) }
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-13:
[jshmap] is not a gasz!
*)
#extern
fcast // fun
GSEQ_make_jshmap
{k:t0}{x:t0}
( map: jsm1(k, x))
: GSEQ(jsm1(k, x), @(k, x))
#symload GSEQ with GSEQ_make_jshmap of 1000
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
jshmap_iter(k:t0,x:vt)
//
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_ptype
<
jshmap_iter(k,x)>
(    (*void*)    ) =
(
pstrn
"jshmap_iter(";
g_ptype<k>(); pstrn",";
g_ptype<x>(); pstrn")")
//
(* ****** ****** *)
//
#extern
fun<>
jshmap_iter_make
{k:t0}{x:vt}
(map
:jshmap(k,x)): jshmap_iter(k,x)
//
#extern
fun<>
jshmap_iter_next$work
{k:t0}{x:vt}
( iter:
! jshmap_iter(k,x)
, work
: (k(*key*), !x(*itm*)) -> void): bool
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_iter_make
  ( map ) =
(
XATS2JS_jshmap_iter_make
  ( map )) where
{
#extern
fun
XATS2JS_jshmap_iter_make
{k:t0}{x:vt}
( map
: jshmap(k,x))
: jshmap_iter(k,x) = $extnam()
}
#symload
jshmap_iter with jshmap_iter_make of 1000
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_iter_next$work
  (iter, work) =
(
XATS2JS_jshmap_iter_next$work
  (iter, work)) where
{
#extern
fun
XATS2JS_jshmap_iter_next$work
{k:t0}{x:vt}
( iter:
! jshmap_iter(k, x)
, work
: (k(*key*), !x(*itm*))->void): bool = $extnam()
}
//
#symload next$work with jshmap_iter_next$work of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< k: t0 >
< x: vt >
jshmap_strmize
  ( map ) =
(
auxmain
(jshmap_iter(map)))
where
{
//
#vwtpdef
iter = jshmap_iter(k,x)
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
jshmap_iter_next$work<>(iter, work)
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
}(*where*)//end-of-[jshmap_strmize<>(map)]
//
#impltmp
{ k: t0
, x: vt }
gseq_strmize1
<jsm1(k,x)><(k,x)> = jshmap_strmize<>{k}{x}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-20:
Fri Sep 20 10:48:22 AM EDT 2024
*)
//
#extern
fun<>
jshmap_get$at$opt
 {k:t0}{x:t0}
// HX: nil if !keyq(k)
// HX: cons(old) if keyq(k)
(A: jsm1(k,x), k: k): optn_vt(x)
#extern
fun<>
jshmap_set$at$opt
 {k:t0}{x:t0}
// HX: nil if !keyq(k)
// HX: cons(old) if keyq(k)
(A: jsm1(k,x), k: k, x: x): optn_vt(x)
//
#symload get$at$opt with jshmap_get$at$opt of 1000
#symload set$at$opt with jshmap_set$at$opt of 1000
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_get$at$opt
  (A, k) =
if
jshmap_keyq(A, k)
then
optn_vt_cons(
UN_jshmap_get$at$raw<>(A, k))
else optn_vt_nil()//else//end-of-[if]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshmap_set$at$opt
  (A, k, x) =
let
//
val opt =
jshmap_get$at$opt<>(A, k)
//
in//let
  UN_jshmap_set$at$raw<>(A, k, x); opt
end//let//end-of-[jshmap_set$at$opt(A,k,x)]
//
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_xbasics_DATS_CATS_JS_hashmap0.dats] *)
