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
// HX-2018-10-01:
//
datatype
list_type_int_tbox
  (a:type+, int) =
//
// type+: covariant
//
| list_nil(a, 0) of ()
| {n:int | n >= 0}
  list_cons(a, n+1) of
  (a, list_type_int_tbox(a, n))
// end of [list_type_int_tbox]
//
sexpdef list = list_type_int_tbox
//
(* ****** ****** *)
//
typedef
List(a:type) = [n:int] list(a, n)
//
typedef
List0(a:type) = [n:int | n >= 0] list(a, n)
typedef
List1(a:type) = [n:int | n >= 1] list(a, n)
//
typedef listLt
  (a:type, n:int) = [k:nat | k < n] list(a, k)
typedef listLte
  (a:type, n:int) = [k:nat | k <= n] list(a, k)
typedef listGt
  (a:type, n:int) = [k:int | k > n] list(a, k)
typedef listGte
  (a:type, n:int) = [k:int | k >= n] list(a, k)
typedef listBtw
  (a:type, m:int, n:int) = [k:int | m <= k; k < n] list(a, k)
typedef listBtwe
  (a:type, m:int, n:int) = [k:int | m <= k; k <= n] list(a, k)
//
(* ****** ****** *)
(*
//
#define nil list_nil
//
#define :: list_cons
#define cons list_cons
//
*)
(* ****** ****** *)
//
prfun
lemma_list_param
  {x:type}{n:int}
  (xs: list(INV(x), n)): [n >= 0] void
// end of [lemma_list_param]
//
(* ****** ****** *)
//
castfn
list_vt2t
  {x:type}{n:int}
  (xs: list_vt(INV(x), n)):<!wrt> list(x, n)
castfn
list_of_list_vt
  {x:type}{n:int}
  (xs: list_vt(INV(x), n)):<!wrt> list(x, n)
//
(* ****** ****** *)
//
fun<a:type>
list_tuple_0():<> list(a, 0)
//
fun<a:type>
list_tuple_1(x0: a):<> list(a, 1)
fun<a:type>
list_tuple_2(x0: a, x1: a):<> list(a, 2)
fun<a:type>
list_tuple_3(x0: a, x1: a, x2: a):<> list(a, 3)
//
fun<a:type>
list_tuple_4
  (x0: a, x1: a, x2: a, x3: a):<> list(a, 4)
fun<a:type>
list_tuple_5
  (x0: a, x1: a, x2: a, x3: a, x4: a):<> list(a, 5)
fun<a:type>
list_tuple_6
  (x0: a, x1: a, x2: a, x3: a, x4: a, x5: a):<> list(a, 6)
//
(* ****** ****** *)

fun
<x:type>
list_make_sing(x):<!wrt> list_vt(x, 1)
fun
<x:type>
list_make_pair(x, x):<!wrt> list_vt(x, 2)

(* ****** ****** *)
//
fun
<x:type>
list_make_elt
  {n:nat}(n: int(n), x: x):<!wrt> list_vt(x, n)
// end of [list_make_elt]
//
(* ****** ****** *)

(* end of [list.sats] *)
