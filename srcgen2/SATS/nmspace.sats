(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 23 Sep 2022 01:45:14 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
#abstbox nmitm_tbox // ptr
#typedef nmitm = nmitm_tbox
//
(* ****** ****** *)
fun
the_nmspace_top0((*void*)): nmitm
(* ****** ****** *)
fun // let
the_nmspace_pop0((*void*)): void
fun // let, loc1, loc2
the_nmspace_push((*void*)): void
(* ****** ****** *)
fun // local
the_nmspace_locjoin((*void*)): void
(* ****** ****** *)
fun // staload
the_nmspace_filsave((*void*)): void
fun // staload
the_nmspace_filrest((*void*)): void
(* ****** ****** *)
//
fun
the_nmspace_cfrfind{a:tbox}
(fopr: nmitm -<cfr> optn_vt(a)): optn_vt(a)
// end of [the_nmspace_cfrfind]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_nmspace.sats] *)
