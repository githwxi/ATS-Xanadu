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
sort2_delin(sort2): sort2
//
fun
s2typ1_delin(s2typ1): s2typ1
//
fun
s2typ1_t0pize(s2typ1): s2typ1
fun
s2typ1_t1pize(s2typ1): s2typ1
//
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
envltck_dvar$find
( env0:
! envltck, dvar: d2var): d3typ1
fun
envltck_dvar$take
( env0:
! envltck, dvar: d2var): d3typ1
//
(* ****** ****** *)
//
fun
envltck_dtyp$eval
( env0:
! envltck, t3q0: d3typ1): s2typ1
fun
envltck_dtyplst$eval
( env0:
! envltck, t3qs: d3typ1lst): s2typ1lst
//
(* ****** ****** *)
//
fun
envltck_dvar$updt
( env0:
! envltck
, dvar: d2var, styp: d3typ1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envltck_make_nil((*0*)): envltck
//
fun
envltck_free_top(envltck): (void)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun // local
dvdtplst_d2vs$inner
(dvts: dvdtplst
,d2vs: d2varlst): dvdtplst
fun // environ
dvdtplst_d2vs$outer
(dvts: dvdtplst
,d2vs: d2varlst): dvdtplst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envltck_pshlam0(!envltck): (void)
fun
envltck_poplam0(!envltck): (void)
//
fun
envltck_dvslam0(!envltck): d2varlst
fun
envltck_vtslam0(!envltck): dvdtplst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envltck_pshlet0(!envltck): (void)
fun
envltck_poplet0(!envltck): (void)
//
fun
envltck_dvslet0(!envltck): d2varlst
fun
envltck_vtslet0(!envltck): dvdtplst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envltck_pshift0(!envltck): (void)
fun
envltck_popift0(!envltck): (void)
//
fun
envltck_dvsift0(!envltck): d2varlst
fun
envltck_vtsift0(!envltck): dvdtplst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envltck_dvar$push
(env0: !envltck
,dvar: d2var, t2q1: s2typ1): void
fun
envltck_dpat$push
(env0: !envltck, d3p0: d3pat1): void
fun
envltck_farg$push
(env0: !envltck, f3a0: f3arg1): void
//
fun
envltck_d3ps$push
(env0: !envltck, d3ps: d3pat1lst): void
fun
envltck_f3as$push
(env0: !envltck, f3as: f3arg1lst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
envltck_dvts$updt
(env0: !envltck, dvts: dvdtplst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_trxltck
(d3p0: d3pat1, env0: !envltck): d3axp1
//
fun
f3arg1_trxltck
(f3a0: f3arg1, env0: !envltck): f3axp1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_trxltck
(d3e0: d3exp1, env0: !envltck): d3exp1
//
(* ****** ****** *)
//
fun
d31cas_trxltck
(dcls: d3cls1, env0: !envltck): d3cls1
//
fun
d31ift_trxltck
( dopt
: d3exp1opt, env0: !envltck): d3exp1opt
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
d3pat1lst_trxltck
(d3ps: d3pat1lst, env0: !envltck): d3axp1lst
//
(* ****** ****** *)
//
fun
f3arg1lst_trxltck
(f3as: f3arg1lst, env0: !envltck): f3axp1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1lst_trxltck
(d3es: d3exp1lst, env0: !envltck): d3exp1lst
//
fun
loctn$d3arg1lst_tpcks$trxltck
(loc0: loctn
,d3es: d3exp1lst
,t2ps: s2typ1lst, env0: !envltck): d3exp1lst
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
teqd3exp1_trxltck
(tdxp: teqd3exp1, env0: !envltck): teqd3exp1
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
fun
d3fundcl1_trxltck
(dvar: d3fundcl1, env0: !envltck): d3fundcl1
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
fun
d3fundcl1lst_trxltck
(d3fs: d3fundcl1lst, env0: !envltck): d3fundcl1lst
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
