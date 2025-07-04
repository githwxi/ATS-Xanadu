(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Jul  1 04:19:29 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-07-02:
This part is for linear type-checking.
While the name "linear type" may have been
stuck forever, what it should be really called,
as far as the actual implementation is concerned,
is "reference-counted type"! The so-called linear
type-checking is essentially just a form of static
reference-counting.
*)
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx
dtpstk_vtbx // ptr
#vwtpdef
dtpstk = dtpstk_vtbx
//
(* ****** ****** *)
(* ****** ****** *)
(* ****** ****** *)
#absvtbx
envltck_vtbx
#vwtpdef
envltck = envltck_vtbx
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3parsed1_trxltck
( dpar : d3parsed1 ): (d3parsed1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envltck_make_nil((*0*)): envltck
fun
envltck_free_nil(envltck): (void)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_trxltck
(d3e0: d3exp1, env0: !envltck): d3exp1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1_trx3cpy
(d3cl: d3ecl1, env0: !envltck): d3ecl1
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_trxltck.sats] *)
(***********************************************************************)
