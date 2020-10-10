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

#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/trans12.sats"
//
(* ****** ****** *)
//
// HX-2019-02:
// Please note that
// a non-functional s2cst is
// preferred over the functional ones
//
implement
s2cst_select_any
(s2cs) =
(
  test1(s2cs)
) where
{
//
fun
test1
(
xs: s2cstlst
) : s2cstopt_vt =
(
case+ xs of
| list_nil() =>
  (
    test2(s2cs)
  )
| list_cons(x0, xs) =>
  if
  sort2_is_fun(x0.sort())
  then test1(xs) else Some_vt(x0) 
)
and
test2
(
xs: s2cstlst
) : s2cstopt_vt =
(
case+ xs of
| list_nil() => None_vt()
| list_cons(x0, xs) => Some_vt(x0)
)
//
} (* end of [s2cst_select_any] *)

(* ****** ****** *)

implement
s2cst_select_bin
(s2cs, s2t1, s2t2) =
(
list_find_opt<s2cst>(s2cs)
) where
{
fun
test
( s2c0
: s2cst): bool = let
//
val
s2t0 = s2c0.sort()
//
in
//
case+ s2t0 of
| S2Tfun
  (s2ts, _) => test_1_(s2ts)
| _(* non-S2Tfun *) => false
//
end // end of [test]
and
test_1_
( s2ts
: sort2lst): bool =
(
  if
  length(s2ts) = 2
  then
  (
  s2ts[0] <= s2t1
  &&
  s2ts[1] <= s2t2
  ) else false // end of [if]
)
//
val () = $tempenver(s2t1)
val () = $tempenver(s2t2)
//
implement
list_find$pred<s2cst>
  (s2c) = $effmask_all(test(s2c))
//
} (* end of [s2cst_select_bin] *)

(* ****** ****** *)

implement
s2cst_select_list
(s2cs, s2es) =
(
list_find_opt<s2cst>(s2cs)
) where
{
fun
test
( s2c0
: s2cst): bool = let
//
in
//
case+
s2c0.sort() of
| S2Tfun(s2ts, _) =>
  test_1_(s2ts, s2es)
| _(* non-S2Tfun *) => false
//
end // end of [test]
and
test_1_
( s2ts
: sort2lst
, s2es
: s2explst): bool =
(
case+ s2ts of
| list_nil() =>
  (
  case+ s2es of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(s2t0, s2ts) =>
  (
  case+ s2es of
  | list_nil() => false
  | list_cons(s2e0, s2es) =>
    if
    s2e0.sort() <= s2t0
    then test_1_(s2ts, s2es) else false
  )
)
//
val () = $tempenver(s2es)
//
implement
list_find$pred<s2cst>
  (s2c) = $effmask_all(test(s2c))
//
} (* end of [s2cst_select_list] *)

(* ****** ****** *)

local
//
fun
DLR
( nm
: string): string =
strptr2string
(string0_append("$", nm))
//
fun
iseq
(x0: d1exp): bool =
(
case+
x0.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
|
T_IDENT_sym
("=") => true | _ => false
)
| _ (* non-D1Eid0 *) => false
)
in (* in-of-local *)
//
implement
d1exp_nmspace
  (d1e0) =
(
case+
d1e0.node() of
|
D1Eapp2
(x0, x1, x2) =>
(
ifcase
|
iseq(x0) =>
(
case+
x1.node() of
|
D1Eid0(tok) =>
(
case+
tok.node() of
| T_IDENT_alp(nm0) =>
  Some_vt
  (
    symbol_make(DLR(nm0))
  )
| _ =>
  Some_vt(symbol_make("$_"))
)
| _ (* else *) => None_vt(*void*)
)
| _ (* else *) => None_vt(*void*)
)
| _ (* else *) => None_vt(*void*)
)
//
end // end of [local]

(* ****** ****** *)
//
implement
trans12_tag_d2conlst
  (s2c0, d2cs) =
(
  auxlst(d2cs, 0(*i0*))
) where
{
//
fun
auxlst
( d2cs
: d2conlst, i0: int): void =
(
case+ d2cs of
| list_nil() => ()
| list_cons(d2c1, d2cs) =>
  (
    auxlst(d2cs, i0 + 1)
  ) where
  {
    val () = d2con_set_tag(d2c1, i0)
  }
) (* end of [auxlst] *)
//
} (* end of [trans12_tag_d2conlst] *)
//
(* ****** ****** *)

(* end of [xats_trans12_basics.dats] *)
