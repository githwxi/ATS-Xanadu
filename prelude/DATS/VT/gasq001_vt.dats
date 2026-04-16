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
Sun 21 Jul 2024 11:39:54 PM EDT
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
(*
HX-2026-04-16:
gasq_iforall1->gasq_forall1
*)
#impltmp
< xs:t0 >
< x0:vt >
gasq_iforall1(xs) =
(
gseq_iforall1<xs><x0>(xs))
where
{
#impltmp
gseq_forall1
< xs >< x0 > = gasq_forall1<xs><x0>
}(*where*)//end-of-[gasq_iforall1(xs)]
//
(* ****** ****** *)
//
(*
HX-2026-04-16:
gasq_irforall1->gasq_rforall1
*)
#impltmp
< xs:t0 >
< x0:vt >
gasq_irforall1(xs) =
(
gseq_irforall1<xs><x0>(xs))
where
{
#impltmp
gseq_rforall1
< xs >< x0 > = gasq_rforall1<xs><x0>
}(*where*)//end-of-[gasq_irforall1(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_gasq001_vt.dats] *)
(***********************************************************************)
