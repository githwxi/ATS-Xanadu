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
strn_forall<> =
gseq_forall<strn><cgtz>
#impltmp
strn_foritm<> =
gseq_foritm<strn><cgtz>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
<>(*tmp*)
strn_forall(cs) =
(
  nint_iforall<>(n0))
where
{
//
val n0 = strn_length(cs)
//
#impltmp
iforall$test
<unit>(i0, _) =
(
  forall$test<cgtz>(c0)) where
{
val c0 = $UN.strn_get_at<>(cs, i0)
}
}
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_strn000.dats] *)
