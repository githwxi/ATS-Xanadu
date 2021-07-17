(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: January, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/staexp2.sats"

(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)

implement
stmap_merge2
(map1, map2) =
let
val
kxs1 =
stmap_listize(map1)
val
kxs2 =
stmap_listize(map2)
in
list_vt2t
(
auxlst2
( kxs1
, kxs2, list_vt_nil())
)
end where
{
typedef
kx = (d2var, s2exp)
vtypedef
kxs = List0_vt(kx)
vtypedef
res = List0_vt(dvmrg2)
//
fun
auxlstl
( kxs: kxs
, res: res): res =
(
case+ kxs of
| ~
list_vt_nil() =>
list_vt_reverse(res)
| ~
list_vt_cons(kx0, kxs) =>
let
//
val
(k0, x0) = kx0
//
val mrg =
DVMRG2(k0, Some(x0), None())
//
in
auxlstl
(kxs, list_vt_cons(mrg, res))
end ) (* end of [auxlstl] *)
//
and
auxlstr
( kxs: kxs
, res: res): res =
(
case+ kxs of
| ~
list_vt_nil() =>
list_vt_reverse(res)
| ~
list_vt_cons(kx0, kxs) =>
let
//
val
(k0, x0) = kx0
//
val mrg =
DVMRG2(k0, None(), Some(x0))
//
in
auxlstl
(kxs, list_vt_cons(mrg, res))
end ) (* end of [auxlstr] *)
//
and
auxlst2
( kxs1
: List0_vt(kx)
, kxs2
: List0_vt(kx), res: res): res =
(
case+ kxs1 of
| ~
list_vt_nil
((*void*)) => auxlstr(kxs2, res)
| ~
list_vt_cons
(kx1, kxs1) =>
(
case+ kxs2 of
| ~
list_vt_nil() =>
let
val
(k1, x1) = kx1
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlstl
(kxs1, list_vt_cons(mrg, res))
end // end of [list_vt_nil]
| ~
list_vt_cons
(kx2, kxs2) =>
let
val
(k1, x1) = kx1
val
(k2, x2) = kx2
val
sgn = cmp_d2var_d2var(k1, k2)
in
//
ifcase
|
(sgn < 0) =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlst2r
( k2
, x2
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
(sgn > 0) =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlst2l
( k1
, x1
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
_(* else *) =>
let
val mrg =
DVMRG2(k1, Some(x1), Some(x2))
in
auxlst2
( kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
//
end
) (* end of [list_vt_cons] *)
) (*case*) (* end of [auxlst2] *)
//
and
auxlst2l
( k1: d2var
, x1: s2exp
, kxs1
: List0_vt(kx)
, kxs2
: List0_vt(kx), res: res): res =
(
case+ kxs2 of
| ~
list_vt_nil() =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlstl
(kxs1, list_vt_cons(mrg, res))
end // end of [list_vt_nil]
| ~
list_vt_cons(kx2, kxs2) =>
let
val
(k2, x2) = kx2
val
sgn = cmp_d2var_d2var(k1, k2)
in
//
ifcase
|
(sgn < 0) =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlst2r
( k2
, x2
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
(sgn > 0) =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlst2l
( k1
, x1
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
_(* else *) =>
let
val mrg =
DVMRG2(k1, Some(x1), Some(x2))
in
auxlst2
( kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
//
end
) (*case*) (* end of [auxlst2l] *)
//
and
auxlst2r
( k2: d2var
, x2: s2exp
, kxs1
: List0_vt(kx)
, kxs2
: List0_vt(kx), res: res): res =
(
case+ kxs1 of
| ~
list_vt_nil() =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlstr
(kxs2, list_vt_cons(mrg, res))
end // end of [list_vt_nil]
| ~
list_vt_cons(kx1, kxs1) =>
let
val
(k1, x1) = kx1
val
sgn = cmp_d2var_d2var(k1, k2)
in
//
ifcase
|
(sgn < 0) =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlst2r
( k2
, x2
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
(sgn > 0) =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlst2l
( k1
, x1
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
_(* else *) =>
let
val mrg =
DVMRG2(k1, Some(x1), Some(x2))
in
auxlst2
( kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
//
end
) (*case*) (* end of [auxlst2r] *)
//
} (*where*) // end of [stmap_merge2]

(* ****** ****** *)

(* end of [xats_dynexp4_util0.dats] *)
