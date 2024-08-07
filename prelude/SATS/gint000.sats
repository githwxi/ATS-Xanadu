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
Fri 26 Jul 2024 09:27:30 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
Is GSEQ coming of age?
Sun 04 Aug 2024 08:24:43 AM EDT
*)
//
fcast // fun
GSEQ_make_nint0
(xs: nint): GSEQ(nint, unit)
fcast // fun
GSEQ_make_nint1
(xs: nint): GSEQ(nint, nint)
#symload GSEQ with GSEQ_make_nint1 of 1000
#symload GSEQ_nint0 with GSEQ_make_nint0 of 1000
#symload GSEQ_nint1 with GSEQ_make_nint1 of 1000
//
fcast // fun
GASZ_make_nint0
(xs: nint): GASZ(nint, unit)
fcast // fun
GASZ_make_nint1
(xs: nint): GASZ(nint, nint)
#symload GASZ with GASZ_make_nint1 of 1000
#symload GASZ_nint0 with GASZ_make_nint0 of 1000
#symload GASZ_nint1 with GASZ_make_nint1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gint000.sats] *)
