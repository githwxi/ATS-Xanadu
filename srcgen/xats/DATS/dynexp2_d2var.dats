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

#define ND2VAR 1*1024

(* ****** ****** *)

local

typedef
d2var_struct = @{
//
  d2var_loc= loc_t // loc
, d2var_sym= sym_t // name
, d2var_tqas= tq2as // tqas
, d2var_sexp= s2exp // sexp
, d2var_type= t2ype // type
, d2var_stamp= stamp // unicity
//
} (* end of [d2var_tbox] *)

absimpl
d2var_tbox=ref(d2var_struct)

in (* in-of-local *)

implement
d2var_new1
  (tok) = let
//
val
loc = tok.loc()
val
sym = dexpid_sym(tok)
//
in
  d2var_new2(loc, sym)
end // end of [d2var_new1]

implement
d2var_new2
(loc, sym) =
(
ref<d2var_struct>
@{
  d2var_loc= loc
, d2var_sym= sym
, d2var_tqas= tqas
, d2var_sexp= s2e1
, d2var_type= t2p2
, d2var_stamp= stamp
}
) where
{
//
  val tqas = list_nil()
//
  val s2e1 = the_s2exp_none0
  val t2p2 = the_t2ype_none0
  val stamp = d2var_stamp_new()
//
}
//
implement
d2var_get_loc(x0) = x0->d2var_loc
implement
d2var_get_sym(x0) = x0->d2var_sym
implement
d2var_get_tqas(x0) = x0->d2var_tqas
implement
d2var_get_sexp(x0) = x0->d2var_sexp
implement
d2var_get_type(x0) = x0->d2var_type
implement
d2var_get_stamp(x0) = x0->d2var_stamp
//
implement
d2var_set_tqas
  (x0, tqas) = (x0->d2var_tqas := tqas)
implement
d2var_set_sexp
  (x0, s2e0) = (x0->d2var_sexp := s2e0)
implement
d2var_set_type
  (x0, t2p0) = (x0->d2var_type := t2p0)
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp2_d2var.dats] *)
