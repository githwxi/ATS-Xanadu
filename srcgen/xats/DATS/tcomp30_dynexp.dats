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
// Start Time: July, 2020
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

#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/tcomp30.sats"

(* ****** ****** *)
//
implement
tcomp30_program
  (prog0) =
  (prog1) where
{
//
val
prog1 =
tcomp30_declist(prog0)
//
} (* end of [tcomp30_program] *)
//
(* ****** ****** *)

implement
tcomp30_dvar
  (d2v0) =
let
val opt =
the_d2vmap_search_opt(d2v0)
in
case+ opt of
| ~
Some_vt(hdv1) => hdv1
| ~
None_vt((*void*)) =>
let
val hdv1 =
hdvar_make_dvar(d2v0)
in
the_d2vmap_insert_any(d2v0, hdv1); hdv1
end
end // end of [tcomp30_dvar]

(* ****** ****** *)

local

fun
auxvar
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdv1 =
(
  tcomp30_dvar(d2v0)
) where
{
  val-
  D3Evar(d2v0) = d3e0.node()
}
//
in
h0exp_make_node(loc0, h0t0, H0Evar(hdv1))
end

in(*in-of-local*)

implement
tcomp30_dexp
  (d3e0) =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
(*
val () =
println!
("tcomp30_dexp: d3e0 = ", d3e0)
val () =
println!
("tcomp30_dexp: t2p0 = ", t2p0)
*)
//
in
//
case+
d3e0.node() of
//
|
D3Evar _ => auxvar(d3e0)
//
| _(* rest-of_d3exp *) =>
let
//
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Enone1($UN.cast{ptr}(d3e0))
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [let]
//
end // end of [tcomp30_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
tcomp30_dexpopt
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(d3e) => Some(tcomp30_dexp(d3e))
)
//
implement
tcomp30_dexplst
  (d3es) =
list_vt2t(d3es) where
{
val
d3es =
list_map<d3exp><h0exp>
  (d3es) where
{
implement
list_map$fopr<d3exp><h0exp>(d3e) = tcomp30_dexp(d3e)
}
} (* end of [tcomp30_dexplst] *)
//
(* ****** ****** *)

implement
tcomp30_decl
  (d3cl) =
let
//
val
loc0 = d3cl.loc()
//
(*
val () =
println!
("tcomp30_decl: d3cl = ", d3cl)
*)
//
in
//
case+
d3cl.node() of
|
_(* rest-of_d3exp *) =>
let
val
node =
H0Cnone1($UN.cast{ptr}(d3cl))
in
  h0dcl_make_node( loc0, node )
end // end of [let]
//
end // end of [tcomp30_decl]

(* ****** ****** *)

implement
tcomp30_declist
  (d3cs) =
list_vt2t(d3cs) where
{
val
d3cs =
list_map<d3ecl><h0dcl>
  (d3cs) where
{
implement
list_map$fopr<d3ecl><h0dcl>(d3c) = tcomp30_decl(d3c)
}
} (* end of [tcomp30_declist] *)

(* ****** ****** *)

(* end of [xats_tcomp30_dynexp.dats] *)
