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
Fri 12 Jul 2024 11:29:01 AM EDT
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
#typedef ni = nint
#typedef si = sint
#typedef ut = unit
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_si<si>(i0) = (i0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gasz_length<ni><ut>(ni) = (ni)
#impltmp
gseq_length<ni><ut>(ni) = (ni)
//
#impltmp
gasz_length<ni><ni>(ni) = (ni)
#impltmp
gseq_length<ni><ni>(ni) = (ni)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Sun 04 Aug 2024 10:05:15 AM EDT
*)
//
#impltmp
GSEQ_make<nint><ut> = GSEQ_make_nint0<>
#impltmp
GSEQ_make<nint><ni> = GSEQ_make_nint1<>
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gint000.dats] *)
