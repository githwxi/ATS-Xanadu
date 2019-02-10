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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

implement
<x0>(*tmp*)
print$val<x0> =
fprint$val<x0>(stdout, x0)
implement
<x0>(*tmp*)
prerr$val<x0> =
fprint$val<x0>(stderr, x0)

(* ****** ****** *)

implement
<x0>(*tmp*)
print$ref<x0> =
fprint$ref<x0>(stdout, x0)
implement
<x0>(*tmp*)
prerr$ref<x0> =
fprint$ref<x0>(stderr, x0)

(* ****** ****** *)
//
// HX-2018-10-14:
// We need a way to detect
// this kind of mutual dependency!
//
implement
{x0:vtype}
fprint$ref<x0>(out, x0) =
fprint$val<x0>(out, x0)
//
implement
(x0:vtype)
fprint$val<x0>(out, x0) =
let
var x0 = x0 in fprint$ref<x0>(out, x0)
endlet // end of [fprint$val]
//
(* ****** ****** *)

(* end of [print.dats] *)
