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
#staload "./../SATS/xstamp0.sats"
//
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/trans01.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)

#define ND2CON 1*1024

(* ****** ****** *)

local

typedef
d2con_struct = @{
//
  d2con_loc= loc_t // loc
, d2con_sym= sym_t // name
, d2con_ctag= tag_t // ctag
, d2con_tqas= tq2as // tqas
, d2con_sexp= s2exp // sexp
, d2con_type= t2ype // type
, d2con_stamp= stamp // unicity
//
} (* end of [d2con_tbox] *)

absimpl
d2con_tbox=ref(d2con_struct)

in (* in-of-local *)

implement
d2con_make_idtp
( tok
, tqas, s2e1) =
(
ref<d2con_struct>
@{
  d2con_loc= loc
, d2con_sym= sym
, d2con_ctag= (~1)
, d2con_tqas= tqas
, d2con_sexp= s2e1
, d2con_type= t2p2
, d2con_stamp= stamp
}
) where
{
  val loc = tok.loc()
  val sym = dexpid_sym(tok)
//
  val t2p2 = s2exp_erase(s2e1)
//
  val
  stamp = d2con_stamp_new((*void*))
//
(*
  val () =
  println!("d2con_make_idtp: sym = ", sym)
  val () =
  println!("d2con_make_idtp: tag = ", tag)
  val () =
  println!("d2con_make_idtp: s2e1 = ", s2e1)
  val () =
  println!("d2con_make_idtp: t2p2 = ", t2p2)
  val () =
  println!("d2con_make_idtp: stamp = ", stamp)
*)
//
} (* d2con_make_idtp *)

(* ****** ****** *)

implement
d2con_get_loc(x0) = x0->d2con_loc
implement
d2con_get_sym(x0) = x0->d2con_sym

(* ****** ****** *)
//
implement
d2con_get_ctag(x0) = x0->d2con_ctag
//
implement
d2con_get_tqas(x0) = x0->d2con_tqas
//
implement
d2con_get_sexp(x0) = x0->d2con_sexp
//
implement
d2con_get_type(x0) = x0->d2con_type
//
implement
d2con_get_stamp(x0) = x0->d2con_stamp
//
(* ****** ****** *)
//
implement
d2con_set_ctag
(d2c, tag) = (d2c->d2con_ctag := tag)
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

implement
d2con_get_narg
  (d2c0) =
(
auxmain(d2c0.type())
) where
{
fun
auxmain
(t2p0
: t2ype): int =
(
case+ t2p0.node() of
|
T2Pfun
( fc2
, npf
, t2ps
, t2p1) =>
  list_length<t2ype>(t2ps)
|
T2Puni
(s2vs, t2p1) => auxmain(t2p1)
//
| _ (* non-T2Pfun *) => (0) // HX: deadcode?
)
} (* end of [d2con_get_narg] *)

(* ****** ****** *)

implement
d2con_get_s2vs
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
|
list_nil() => s2vs
|
list_cons
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
} (* end of [d2con_get_s2vs] *)

(* ****** ****** *)

(* end of [xats_dynexp2_d2con.dats] *)
