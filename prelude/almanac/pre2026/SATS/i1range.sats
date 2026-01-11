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
(*
Sun Jan 11 10:36:44 AM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-11:
i1range:
one-dimension int range
i1range(lb, ub)
stands for [lb, ub), that is,
left-inclusive and right-inclusive
*)
#abstype
i1range_t0 == (si, si)
#typedef i1range = i1range_t0
//
(*
HX-2026-01-11:
[i1ranges] is for
a list of *disjoint* intervals!
*)
#abstbox
i1ranges_t0 == lsrt(i1range)
#typedef i1ranges = i1ranges_t0
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast
i1range_encd
(lbub: (sint, sint)): i1range
fcast
i1range_decd(i1range): (si, si)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
i1range_lb$get(i1range): sint
fun i1range_ub$get(i1range): sint
//
#symload lb with i1range_lb$get
#symload ub with i1range_ub$get
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
i1range_make_lbub
(lb: sint, ub: sint): i1range
//
#symload
range with i1range_make_lbub
#symload
i1range with i1range_make_lbub
//
(* ****** ****** *)
(* ****** ****** *)
fun<>
i1range_length(i1range): (nint)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
i1range_get$at: gasq_get$at(i1range, si)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
i1range_forall: gseq_forall(i1range, si)
fun<>
i1range_rforall: gseq_rforall(i1range, si)
//
fun<>
i1range_strmize: gseq_strmize(i1range, si)
fun<>
i1range_rstrmize: gseq_strmize(i1range, si)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
list_make_i1range(i1range): list(si)
fun<>
list_vt_make_i1range(i1range): list_vt(si)
fun<>
strm_vt_make_i1range(i1range): strm_vt(si)
//
#symload list with list_make_i1range
#symload list_vt with list_vt_make_i1range
#symload strm_vt with strm_vt_make_i1range
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_pre2026_SATS_i1range.sats] *)
(***********************************************************************)
