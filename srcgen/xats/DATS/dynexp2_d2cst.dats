(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: March, 2020
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
#staload "./../SATS/stamp0.sats"
//
#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/trans01.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)

#define ND2CST 1*1024

(* ****** ****** *)

local

typedef
d2cst_struct = @{
//
  d2cst_loc= loc_t // loc
, d2cst_sym= sym_t // name
, d2cst_tqas= tq2as // tqas
, d2cst_sexp= s2exp // sexp
, d2cst_type= t2ype // type
, d2cst_stamp= stamp // unicity
//
} (* end of [d2cst_tbox] *)

absimpl
d2cst_tbox = ref(d2cst_struct)

in (* in-of-local *)

implement
d2cst_make_dvar
( d2v0 ) =
(
( d2c0 ) where
{
val
d2c0 =
ref<d2cst_struct>
@{
  d2cst_loc= loc
, d2cst_sym= sym
, d2cst_tqas= tqas
, d2cst_sexp= s2e1
, d2cst_type= t2p2
, d2cst_stamp= stamp
}
val () =
stamp_d2cst_kind(d2c0, knd0)
}
) where
{
//
  val loc =
    d2var_get_loc(d2v0)
  val sym =
    d2var_get_sym(d2v0)
  val knd0 =
    d2var_get_kind(d2v0)
  val tqas =
    d2var_get_tqas(d2v0)
  val s2e1 =
    d2var_get_sexp(d2v0)
//
  val t2p2 = s2exp_erase(s2e1)
//
  val
  stamp = d2cst_stamp_new((*void*))
//
(*
  val () =
  println!("d2cst_make_dvar: d2v0 = ", d2v0)
  val () =
  println!("d2cst_make_dvar: knd0 = ", knd0)
  val () =
  println!("d2cst_make_dvar: tqas = ", tqas)
  val () =
  println!("d2cst_make_dvar: s2e1 = ", s2e1)
  val () =
  println!("d2cst_make_dvar: t2p2 = ", t2p2)
*)
//
} (* d2cst_make_dvar *)

(* ****** ****** *)

implement
d2cst_make_idtp
( tok
, knd0
, tqas, s2e1) =
(
( d2c0 ) where
{
val
d2c0 =
ref<d2cst_struct> 
@{
  d2cst_loc= loc
, d2cst_sym= sym
, d2cst_tqas= tqas
, d2cst_sexp= s2e1
, d2cst_type= t2p2
, d2cst_stamp= stamp
}
val () =
stamp_d2cst_kind(d2c0, knd0)
}
) where
{
//
  val loc = tok.loc()
  val sym = dexpid_sym(tok)
//
  val t2p2 = s2exp_erase(s2e1)
//
  val
  stamp = d2cst_stamp_new((*void*))
//
(*
  val () =
  println!("d2cst_make_idtp: sym = ", sym)
  val () =
  println!("d2cst_make_idtp: knd0 = ", knd0)
  val () =
  println!("d2cst_make_idtp: tqas = ", tqas)
  val () =
  println!("d2cst_make_idtp: s2e1 = ", s2e1)
  val () =
  println!("d2cst_make_idtp: t2p2 = ", t2p2)
*)
//
} (* d2cst_make_idtp *)

(* ****** ****** *)

implement
d2cst_get_loc(x0) = x0->d2cst_loc
implement
d2cst_get_sym(x0) = x0->d2cst_sym
implement
d2cst_get_tqas(x0) = x0->d2cst_tqas
implement
d2cst_get_sexp(x0) = x0->d2cst_sexp
implement
d2cst_get_type(x0) = x0->d2cst_type
implement
d2cst_get_stamp(x0) = x0->d2cst_stamp
//
implement
d2cst_set_sexp
  (x0, s2e) = (x0->d2cst_sexp := s2e)
implement
d2cst_set_type
  (x0, t2p) = (x0->d2cst_type := t2p)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
d2cst_get_s2vs
  (d2c0) =
(
let
val s2vs =
auxlst
(d2c0.tqas(), list_vt_nil())
in
list_vt2t(list_vt_reverse(s2vs))
end
) where
{
fun
auxlst
( tqas
: tq2arglst
, s2vs
: List0_vt(s2var)
)
: List0_vt(s2var) =
(
case+ tqas of
| list_nil() => s2vs
| list_cons
  (t2qa, tqas) =>
  (
  auxlst(tqas, s2vs)
  ) where
  {
  val s2vs =
  revapp(t2qa.s2vs(), s2vs)
  }
)
and
revapp
( xs
: s2varlst
, ys
: s2varlst_vt
)
: s2varlst_vt =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  revapp(xs, list_vt_cons(x0, ys))
)
//
} (* end of [d2cst_get_s2vs] *)

(* ****** ****** *)

local
//
#staload
"libats/SATS/dynarray.sats"
#staload _ =
"libats/DATS/dynarray.dats"
//
typedef itm = tnode
vtypedef dynarray = dynarray(itm)
//
val
theDynarr = 
dynarray_make_nil<itm>(i2sz(ND2CST))
val
theDynarr = $UN.castvwtp0{ptr}(theDynarr)
//
in (* in-of-local *)

implement
d2cst_get_kind
  (d2c) = let
//
  val s0 =
  d2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val cp = dynarray_getref_at(A0, i0)
  prval ((*void*)) = $UN.cast2void(A0)
//
in
//
if isneqz(cp)
  then $UN.p2tr_get(cp) else $LEX.T_EOF()
//
end // end of [d2cst_get_kind]

(* ****** ****** *)

implement
stamp_d2cst_kind
  (d2c, knd) = let
//
(*
val () =
println!
("stamp_d2cst_kind: d2c = ", d2c)
val () =
println!
("stamp_d2cst_kind: knd = ", knd)
*)
//
  val s0 =
  d2c.stamp()
  val i0 =
  stamp2uint(s0)
  val i0 =
  u2sz(g1ofg0(i0))
  val A0 =
  $UN.castvwtp0{dynarray}(theDynarr)
  val-
  ~None_vt() =
  dynarray_insert_at_opt(A0, i0, knd)
  prval ((*void*)) = $UN.cast2void(A0)
in
  // nothing
end // end of [stamp_d2cst_kind]

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp2_d2cst.dats] *)
