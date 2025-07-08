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
d3ecl1_trxltck
(d3cl: d3ecl1, env0: !envltck): d3ecl1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1lst_trxltck
(d3es: d3exp1lst, env0: !envltck): d3exp1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1lst_trxltck
(dcls: d3ecl1lst, env0: !envltck): d3ecl1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3valdcl1_trxltck
(dval: d3valdcl1, env0: !envltck): d3valdcl1
fun
d3vardcl1_trxltck
(dvar: d3vardcl1, env0: !envltck): d3vardcl1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s3taload1opt_trxltck
(dopt: s3taload1opt, env0: !envltck): s3taload1opt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3valdcl1lst_trxltck
(d3vs: d3valdcl1lst, env0: !envltck): d3valdcl1lst
fun
d3vardcl1lst_trxltck
(d3vs: d3vardcl1lst, env0: !envltck): d3vardcl1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1lstopt_trxltck
(dopt: d3ecl1lstopt, env0: !envltck): d3ecl1lstopt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_trxltck.sats] *)
(***********************************************************************)
