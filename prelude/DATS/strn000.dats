(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu 11 Jul 2024 01:11:20 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_0<strn>
((*void*)) = ("")
//
(* ****** ****** *)
#impltmp
g_cmp<strn> = strn_cmp<>
(* ****** ****** *)
//
(*
HX:
This is in [gdbg000.dats]:
#impltmp
g_ptype
< strn >
( (*void*) ) = pstrn("strn")
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-10:
This one should definitely
be replaced later!!!
Sat 10 Aug 2024 08:49:55 PM EDT
*)
#impltmp
<(*tmp*)>
strn_cmp
(xs, ys) =
let
#typedef xs = strn
#typedef x0 = cgtz
in//let
gseq_cmp<xs><x0>(xs, ys) end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strn_gmake
<list(cgtz)> = strn_make_list<>
//
#impltmp
strn_gmake0
<list_vt(cgtz)> = strn_make0_llist<>
#impltmp
strn_gmake1
<list_vt(cgtz)> = strn_make1_llist<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
$UN.gasz_get$at$raw
< strn >< cgtz >(cs, i0) =
$UN.strn_get$at$raw<>(cs, i0)
//
#impltmp
$UN.gasz_lget$at$raw
< strn >< cgtz >(cs, i0) =
let
val c0 =
$UN.strn_get$at$raw<>(cs, i0)
prval pf = owed_t0_make{cgtz}() in (pf|c0)
end//let//end($UN.gasz_lget$at$raw<strn><cgtz>)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_strn000.dats] *)
