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
//
(*
Author: Hongwei Xi
(*
Thu 08 Aug 2024 08:19:17 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/Hsmap.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsm(k:t0,x:vt) = jshsmap(k,x)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jshsmap_length
 {k:t0}{x:t0}
 (    map    ) =
(
XATS2JS_jshsmap_length
 (    map    )) where
{
#extern
fun
XATS2JS_jshsmap_length
 {k:t0}{x:t0}
(map: jshsmap(k,x)): nint = $extnam()
}
//
#impltmp
{ k: t0 }
{ x: t0 }
gseq_length
<jsm(k,x)><(k,x)> =
(
  jshsmap_length<>{k}{x}(kxs))
//
#impltmp
{ k: t0 }
{ x: vt }
gseq_length1
<jsm(k,x)><(k,x)>
  ( kxs ) =
(
  jshsmap_length<>{k}{x}(kxs))
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
 {k:t0}{x:t0}(): jshsmap(k,x) = $extnam()
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
{ k: t0 }
{ x: t0 }
gseq_forall
<jsm(k,x)><(k,x)>
  ( kxs ) =
jshsmap_forall_f2un<>
(kxs
,lam(k,x) => forall$test@(k,x))
//
#impltmp
{ k: t0 }
{ x: vt }
gseq_forall1
<jsm(k,x)><(k,x)>
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
( map: jshsmap(k,x)
, test: (k, !x) -> bool): bool = $extnam()
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

(* end of [ATS3/XANADU_xatslib_JS_DATS_Hsmap00.dats] *)
