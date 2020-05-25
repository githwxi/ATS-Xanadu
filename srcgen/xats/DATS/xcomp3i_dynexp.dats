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
// Start Time: May 24, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./basics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"

(* ****** ****** *)

#staload "./dynexp3.sats"

(* ****** ****** *)

#staload "./intrep0.sats"
#staload "./xcomp3i.sats"

(* ****** ****** *)

local


in(*in-of-local*)

implement
xcomp3i_dexp
(env0, d3e0) = let
//
val
loc0 = d3e0.loc()
val () =
println!
("xcomp3i_dexp: loc0 = ", loc0)
val () =
println!
("xcomp3i_dexp: d3e0 = ", d3e0)
//
in
//
case+
d3e0.node()
|
D3Eint _ =>
auxint(env0, d3e0)
|
D3Ebtf _ =>
auxbtf(env0, d3e0)
//
| _(* rest-of-d3exp *) => i0val_error(d3e0)
//
end // end of [xcomp3i_dexp]

end // end of [local]

(* ****** ****** *)

(* end of [xats_xcomp3i_dynexp.dats] *)
