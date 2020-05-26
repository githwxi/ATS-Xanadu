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
// Start Time: October, 2019
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

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans3x.sats"

(* ****** ****** *)

implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
implement
trans3x_program
  (prog0) =
  (prog1) where
{
//
val
env0 = dvarenv_make_nil()
//
val
prog1 =
trans3x_declist(env0, prog0)
//
val () = dvarenv_free_top(env0)
//
} (* end of [trans3x_program] *)
//
(* ****** ****** *)

local

in(*in-of-local*)

implement
trans3x_dexp
(env0, d3e0) = let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val () =
println!
("trans3x_dexp: d3e0 = ", d3e0)
//
in(*in-of-let*)
//
case+
d3e0.node() of
//
| D3Elet(d3cs, d3e1) =>
  let
//
    val () =
    dvarenv_add_let1(env0)
//
    val
    d3cs =
    trans3x_declist(env0, d3cs)
    val
    d3e1 = trans3x_dexp(env0, d3e1)
//
    val () =
    dvarenv_pop_let1(env0)
//
  in
    d3exp_make_node
    (loc0, t2p0, D3Elet(d3cs, d3e1))
  end
//
| _ (* rest-of-d3exp *) => d3e0 // yet-to-be-handled
//
end // end of [trans3x_dexp]

end // end of [local]

(* ****** ****** *)

implement
trans3x_dexpopt
(env0, opt) =
(
case+ opt of
| None() => None()
| Some(d3e) =>
  Some(trans3x_dexp(env0, d3e))
) (* end of [trans3x_dexpopt] *)

(* ****** ****** *)

implement
trans3x_dexplst
  (env0, d3es) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3exp><d3exp>(d3es)
) where
{
implement
list_map$fopr<d3exp><d3exp>(d3e0) =
let
val env0 =
$UN.castvwtp0{dvarenv}(env0)
val d3e0 = trans3x_dexp(env0, d3e0)
in
let prval () = $UN.cast2void(env0) in d3e0 end
end
}
end // end of [trans3x_dexplst]

(* ****** ****** *)
//
//
implement
trans3x_decl
(env0, d3cl) = let
//
val loc0 = d3cl.loc()
//
in(* in-of-let *)
//
case+
d3cl.node() of
| _(*rest-of-d3ecl*) => d3cl // yet-to-be-handled
//
end // end of [trans3x_decl]
//
(* ****** ****** *)
//
implement
trans3x_declist
  (env0, dcls) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3ecl><d3ecl>(dcls)
) where
{
implement
list_map$fopr<d3ecl><d3ecl>(d3cl) =
let
val env0 =
$UN.castvwtp0{dvarenv}(env0)
val d3cl = trans3x_decl(env0, d3cl)
in
let prval () = $UN.cast2void(env0) in d3cl end
end
}
end // end of [trans3x_declist]
//
(* ****** ****** *)

(* end of [xats_trans3x_dynexp.dats] *)
