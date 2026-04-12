(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Apr 12 01:09:27 PM EDT 2026
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
{ t0:t0 }
g_ptype
<a1at(t0)>
( (*void*) ) =
(
pstrn("a1at(");
g_ptype<t0>((*0*)); pstrn(")"))
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_print
<a1at(x0)>
(   xs   ) =
let
//
#typedef xs = a1at(x0)
//
#impltmp
gseq$sep<xs><x0>() = ","
#impltmp
gseq$end<xs><x0>() = ")"
#impltmp
gseq$beg<xs><x0>() = "a1at("
in//let
(
  gseq_print1<xs><x0>( xs ) )
end(*let*)//end(g_print<a1at(x0)>())
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_axat000.dats] *)
(***********************************************************************)
