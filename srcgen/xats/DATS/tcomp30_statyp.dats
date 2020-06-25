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
// Start Time: September, 2019
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

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/tcomp30.sats"

(* ****** ****** *)

implement
tcomp30_sort
  (s2t0) = let
//
(*
val () =
println!
("tcomp30_sort: s2t0 = ", s2t0)
*)
//
in
//
case+ s2t0 of
| _(*rest-of-sort2*) =>
  HSTerror($UN.cast{ptr}(s2t0))
//
end // end of [tcomp30_sort]
//
(* ****** ****** *)

implement
tcomp30_type
  (t2p0) = let
//
val s2t0 = t2p0.sort()
//
(*
val () =
println!
("tcomp30_type: t2p0 = ", t2p0)
val () =
println!
("tcomp30_type: s2t0 = ", s2t0)
*)
//
val hst0 = tcomp30_sort(s2t0)
//
(*
val () =
println!
("tcomp30_type: hst0 = ", hst0)
*)
//
in
//
case+
t2p0.node() of
|
_(*rest-of-t2ype*) =>
let
val errp =
$UN.cast{ptr}(t2p0)
in
h0typ_make_node(hst0, H0Terror(errp))
end // end of [rest]
//
end // end of [tcomp30_type]

(* ****** ****** *)

(* end of [xats_tcomp30_statyp.dats] *)
