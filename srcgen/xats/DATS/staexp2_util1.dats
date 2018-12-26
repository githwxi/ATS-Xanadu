(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
// Start Time: December, 2018
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
//
#staload
STM = "./../SATS/stamp0.sats"
#staload
SYM = "./../SATS/symbol.sats"
//
overload
= with $STM.eq_stamp_stamp
overload
= with $SYM.eq_symbol_symbol
//
(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)
//
implement
eq_t2dat_t2dat
(x1, x2) =
(x1.stamp() = x2.stamp())
//
(* ****** ****** *)

implement
eq_t2bas_t2bas
(x1, x2) =
(
case+
(x1, x2) of
| ( T2BASpre s1
  , T2BASpre s2) => (s1 = s2)
| ( T2BASdat t1
  , T2BASdat t2) => (t1 = t2)
| ( T2BASimp(_, s1)
  , T2BASimp(_, s2)) => (s1 = s2)
//
| (_(*rest*), _(*rest*)) => false
//
) (* end of [eq_t2bas_t2bas] *)
//
(* ****** ****** *)

implement
lte_sort2_sort2
  (x1, x2) =
(
case+ x1 of
//
| S2Tid(id1) =>
  (case+ x2 of
   | S2Tid(id2) => id1 = id2 | _ => false)
//
| S2Tint(int1) =>
  (case+ x2 of
   | S2Tint(int2) => int1 = int2 | _ => false)
//
| S2Tbas(stb1) =>
  (case+ x2 of
   | S2Tbas(stb2) => stb1 = stb2 | _ => false)
//
| S2Ttup(sts1) =>
  (case+ x2 of
   | S2Ttup(sts2) => sts1 <= sts2 | _ => false)
//
| S2Tfun(arg1, res1) =>
  (case+ x2 of
   | S2Tfun(arg2, res2) =>
     if (arg1 <= arg2) then (res1 <= res2) else false
   | _ (* non-S2Tfun *) => false
  )
//
| S2Tapp(fun1, arg1) =>
  (case+ x2 of
   | S2Tapp(fun2, arg2) =>
     if (fun1 <= fun2) then (arg1 <= arg2) else false
   | _ (* non-S2Tfun *) => false
  )
//
(*
| S2Ttup() => false
| S2Tfun() => false
| S2Tnone(s1t1) => false
| S2Tnone((*void*)) => false
*)
| _ (* rest-of-sort2 *) => false
//
) (* end of [lte_sort2_sort2] *)

(* ****** ****** *)

implement
lte_sort2lst_sort2lst
  (xs1, xs2) =
(
  auxlst(xs1, xs2)
) where
{
fun
auxlst
(xs1: sort2lst, xs2: sort2lst): bool =
(
case+ xs1 of
| list_nil() =>
  (case+ xs2 of
   | list_nil() => true | list_cons _ => false
  )
| list_cons(x1, xs1) =>
  (case+ xs2 of
  | list_nil() => false
  | list_cons(x2, xs2) => (x1 <= x2) && (xs1 <= xs2)
  )
)
} (* end of [lte_sort2lst_sort2lst] *)

(* ****** ****** *)

implement
sort2lst_get_at
  (s2ts, n) =
(
case+ s2ts of
| list_nil() => S2Tnone()
| list_cons(s2t0, s2ts) =>
  if n = 0 then s2t0 else sort2lst_get_at(s2ts, n-1)
) (* end of [sort2lst_get_at] *)

(* ****** ****** *)

(* end of [xats_staexp2_util1.dats] *)
