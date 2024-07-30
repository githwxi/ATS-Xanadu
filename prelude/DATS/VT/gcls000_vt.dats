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
Mon 29 Jul 2024 06:15:29 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../SATS/gcls000.sats"
#staload
"./../../SATS/VT/gcls000_vt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : vt>
<x0 : vt>
GSEQ_forall0
  (pf | xs) =
(
gseq_forall0<xs><x0>(xs))
//
#impltmp
<xs : vt>
<x0 : vt>
GSEQ_rforall0
  (pf | xs) =
(
gseq_rforall0<xs><x0>(xs))
//
#impltmp
<xs : vt>
<x0 : vt>
GSEQ_iforall0
  (pf | xs) =
(
gseq_iforall0<xs><x0>(xs))
//
#impltmp
<xs : vt>
<x0 : vt>
GSEQ_irforall0
  (pf | xs) =
(
gseq_irforall0<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0 : vt}
GSEQ_forall0
<llist(x0)><x0>
  (pf | xs) =
(
  list_vt_forall0<x0>(xs))
#impltmp
{x0 : vt}
GSEQ_forall0_c1fr
<llist(x0)><x0>
  (pf | xs, test) =
(
  list_vt_forall0<x0>(xs))
where{
#impltmp
forall$test0<x0>(x0) = test(x0)
}(*where*)//end-of-[GSEQ_forall0_c1fr(pf|xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gcls000_vt.dats] *)
