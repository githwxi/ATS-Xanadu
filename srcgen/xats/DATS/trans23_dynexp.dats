(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: April, 2019
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

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"

(* ****** ****** *)

local

fun
aux_int
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eint(tok) = d2e0.node()
//
val
t2p0 =
(
case+
tok.node() of
| T_INT1 _ => t2ype_sint()
| T_INT2 _ => t2ype_sint()
| T_INT3 _ => t2ype_sint()
| _ (* dead *) => t2ype_sint()
) : t2ype // end of [val]
//
in
let
val node = D3Eint(tok)
in
d3exp_make_node(loc0, t2p0, node)
end
end (* end of [aux_int] *)

fun
aux_chr
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Echr(tok) = d2e0.node()
//
val node = D3Echr(tok)
val t2p0 = t2ype_char((*void*))
//
in
d3exp_make_node(loc0, t2p0, node)
end (* end of [aux_chr] *)

fun
aux_flt
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Echr(tok) = d2e0.node()
//
val
t2p0 =
(
case+
tok.node() of
| T_FLOAT1 _ => t2ype_double()
| T_FLOAT2 _ => t2ype_double()
| T_FLOAT3 _ => t2ype_double()
| _ (* dead *) => t2ype_double()
) : t2ype // end of [val]
//
in
let
val node = D3Eflt(tok)
in
d3exp_make_node(loc0, t2p0, node)
end
end (* end of [aux_flt] *)

fun
aux_str
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Estr(tok) = d2e0.node()
//
val node = D3Estr(tok)
val t2p0 = t2ype_string((*void*))
//
in
d3exp_make_node(loc0, t2p0, node)
end (* end of [aux_str] *)

in (* in-of-local *)

implement
trans23_dexp
  (d2e0) = let
//
val
loc0 = d2e0.loc()
//
val () =
println!
("trans23_dexp: d2e0 = ", d2e0)
//
in
//
case+
d2e0.node() of
//
| D2Eint _ => aux_int(d2e0)
| D2Echr _ => aux_chr(d2e0)
| D2Eflt _ => aux_flt(d2e0)
| D2Estr _ => aux_str(d2e0)
//
//
| _ (*rest-of-d2e0*) => d3exp_none1(d2e0)
//
end // end of [trans23_dexp]

end // end of [local]

(* ****** ****** *)

local

fun
aux_fundecl
( d2c0
: d2ecl): d3ecl = let
//
val
loc0 = d2c0.loc()
val-
D2Cfundecl
( knd
, mopt
, tqas
, f2ds) = d2c0.node()
//
val
f3ds = auxf2ds(d2c0, f2ds)
//
in
  d3ecl_make_node
  (loc0, D3Cfundecl(knd, mopt, tqas, f3ds))
end where
{
//
fun
auxf2ds
( d2c0: d2ecl
, f2ds
: f2undeclist
)
: f3undeclist = list_nil()
//
} (* end of [aux_fundecl] *)

in (* in-of-local *)

implement
trans23_decl
  (d2c0) = let
//
val
loc0 = d2c0.loc()
// (*
val () =
println!
("trans23_decl: d2c0 = ", d2c0)
// *)
//
in
//
case+
d2c0.node() of
//
| D2Cfundecl _ => aux_fundecl(d2c0)
//
| _ (* rest-of-d2ecl *) => d3ecl_none1(d2c0)
//
end // end of [trans23_decl]

end // end of [local]

(* ****** ****** *)

implement
trans23_declist
  (d2cs) =
list_vt2t(d2cs) where
{
val
d2cs =
list_map<d2ecl><d3ecl>
  (d2cs) where
{
  implement
  list_map$fopr<d2ecl><d3ecl> = trans23_decl
}
} (* end of [trans23_declist] *)

(* ****** ****** *)

(* end of [xats_trans23_dynexp.dats] *)
