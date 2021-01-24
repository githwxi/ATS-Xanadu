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

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/lexing0.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/trans12.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
#staload "./../SATS/trans34.sats"

(* ****** ****** *)

implement
fprint_val<s2exp> = fprint_s2exp
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
implement
fprint_val<d3exp> = fprint_d3exp
(* ****** ****** *)

local

fun
auxi00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ei00(int) = d3e0.node()
//
val
s2i0 = s2exp_int(int)
val
s2e0 = s2exp_type_sint(s2i0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ei00(int))
end // end of [auxi00]

fun
auxb00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Eb00(btf) = d3e0.node()
//
val
s2b0 = s2exp_btf(btf)
val
s2e0 = s2exp_type_bool(s2b0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Eb00(btf))
end // end of [auxb00]

fun
auxc00
( d3e0
: d3exp): d4exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Ec00(chr) = d3e0.node()
//
val
s2c0 = s2exp_chr(chr)
val
s2e0 = s2exp_type_char(s2c0)
//
in
  d4exp_make_node
  (loc0, s2e0, t2p0, D4Ec00(chr))
end // end of [auxb00]

in(*in-of-local*)

implement
trans34_dexp
( env0, d3e0) =
(
case+
d3e0.node() of
//
| D3Ei00 _ => auxi00(d3e0)
| D3Eb00 _ => auxb00(d3e0)
| D3Ec00 _ => auxb00(d3e0)
//
| _ (* rest-of-d3exp *) => d4exp_none1(d3e0)
)

end // end of [local]

(* ****** ****** *)
//
implement
trans34_dexpopt
( env0, opt0 ) =
(
case+ opt0 of
| None() => None()
| Some(d3e0) =>
  Some(trans34_dexp(env0, d3e0))
)
//
implement
trans34_dexplst
(  env0, d3es  ) =
(
list_vt2t
(
list_map<d3exp><d4exp>(d3es)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3exp><d4exp>
  (d3e0) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
d4e0 = trans34_dexp(env0, d3e0)
//
in
let
prval () = $UN.cast2void(env0) in d4e0
end
end // list_map$fopr
} (* end of [trans34_dexplst] *)
//
(* ****** ****** *)

local

fun
aux_fundecl
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
val
loc0 = d3cl.loc()
in
d4ecl_make_node(loc0, D4Cnone1(d3cl))
end

in(*in-of-local*)

implement
trans34_decl
( env0, d3cl) =
let
//
val () =
println!
("trans34_decl: d3cl = ", d3cl)
//
in(*in-of-local*)
//
case+
d3cl.node() of
| D3Cfundecl _ =>
  aux_fundecl(env0, d3cl)
|
_(*rest-of-d3ecl*) =>
let
  val
  loc0 = d3cl.loc()
in
  d4ecl_make_node(loc0, D4Cnone1(d3cl))
end
//
end // end of [trans34_decl]

end // end of [local]

(* ****** ****** *)
//
implement
trans34_declopt
( env0, opt0 ) =
(
case+ opt0 of
| None() => None()
| Some(d3cl) =>
  Some(trans34_decl(env0, d3cl))
)
//
implement
trans34_declist
(  env0, dcls  ) =
(
list_vt2t
(
list_map<d3ecl><d4ecl>(dcls)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3ecl><d4ecl>
  (d3cl) = let
//
val
env0 =
$UN.castvwtp0{tr34env}(env0)
val
d4cl = trans34_decl(env0, d3cl)
//
in
let
prval () = $UN.cast2void(env0) in d4cl
end
end // list_map$fopr
} (* end of [trans34_declist] *)
//
(* ****** ****** *)

(* end of [xats_trans34_dynexp.dats] *)
