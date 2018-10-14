(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
<x>(*tmp*)
print$val<x> =
fprint$val<x>(stdout_ref, x)
implement
<x>(*tmp*)
prerr$val<x> =
fprint$val<x>(stderr_ref, x)

(* ****** ****** *)

implement
<x>(*tmp*)
print$ref<x> =
fprint$ref<x>(stdout_ref, x)
implement
<x>(*tmp*)
prerr$ref<x> =
fprint$ref<x>(stderr_ref, x)

(* ****** ****** *)
//
// HX-2018-10-14:
// Need to find a way to detect
// this kind of mutual dependency!
//
implement
{x:type}
fprint$ref<x>(out, x) =
fprint$val<x>(out, x)
implement
(x:type)
fprint$val<x>(out, x) =
let
val x = x in fprint$ref<x>(out, x)
endlet // end of [implement]
//
(* ****** ****** *)

(* end of [print.dats] *)
