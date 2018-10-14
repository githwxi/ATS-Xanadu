(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
datavtype
list_vtype_int_vtbox
  (a:vtype+, int) =
//
// vtype+: covariant
//
  | list_vt_nil(a, 0) of ((*void*))
  | {n:int | n >= 0}
    list_vt_cons(a, n+1) of (a, list_vtype_int_vtbox(a, n))
// end of [list_vtype_int_vtbox]
//
sexpdef
list_vt = list_vtype_int_vtbox
//
vtypedef
List_vt(a:vtype) = [n:int] list_vt(a, n)
vtypedef
List0_vt(a:vtype) = [n:int | n >= 0] list_vt(a, n)
vtypedef
List1_vt(a:vtype) = [n:int | n >= 1] list_vt(a, n)
vtypedef listLt_vt
  (a:vtype, n:int) = [k:nat | k < n] list_vt(a, k)
vtypedef listLte_vt
  (a:vtype, n:int) = [k:nat | k <= n] list_vt(a, k)
vtypedef listGt_vt
  (a:vtype, n:int) = [k:int | k > n] list_vt(a, k)
vtypedef listGte_vt
  (a:vtype, n:int) = [k:int | k >= n] list_vt(a, k)
vtypedef listBtw_vt
  (a:vtype, m:int, n:int) = [k:int | m <= k; k < n] list_vt(a, k)
vtypedef listBtwe_vt
  (a:vtype, m:int, n:int) = [k:int | m <= k; k <= n] list_vt(a, k)
//
(* ****** ****** *)
//
fun
<x:vtype>
list_vt_make_sing(x):<wrt> list_vt(x, 1)
fun
<x:vtype>
list_vt_make_pair(x, x):<wrt> list_vt(x, 2)
//
(* ****** ****** *)
//
fun
<x:vtype>
<y:vtype>
mapvt0$fopr(x: x): (y)
fun
<x:vtype>
<y:vtype>
mapvt1$fopr(x: &x >> _): (y)
//
fun
<x:vtype>
<y:vtype>
list_vt_mapvt0{n:int}
  (xs: list_vt(INV(x), n)):<wrt> list_vt(y, n)
fun
<x:vtype>
<y:vtype>
list_vt_mapvt1{n:int}
  (xs: !list_vt(INV(x), n)):<wrt> list_vt(y, n)
//
(* ****** ****** *)

fun
<x:vtype>
<y:vtype>
foreachvt0$fopr(x: x): (y)
fun
<x:vtype>
<y:vtype>
foreachvt1$fopr(x: &x >> _): (y)
fun
<x:vtype>
list_vt_foreachvt0{n:int}
  (xs: list_vt(INV(x), n)):<wrt> void
fun
<x:vtype>
list_vt_foreachvt1{n:int}
  (xs: !list_vt(INV(x), n)):<wrt> void

(* ****** ****** *)

(* end of [list_vt.sats] *)
