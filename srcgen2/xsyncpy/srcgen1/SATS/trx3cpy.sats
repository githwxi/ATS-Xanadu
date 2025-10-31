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
Tue May 20 12:46:19 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
#absvtbx
env3cpy_vtbx
#vwtpdef
env3cpy = env3cpy_vtbx
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp2.sats"
#staload
"./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3parsed_trx3cpy
( dpar : d3parsed ): (d3parsed1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
env3cpy_make_nil((*0*)): env3cpy
fun
env3cpy_free_nil(env3cpy): (void)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ_trx3cpy
(t2p0: s2typ, env0: !env3cpy): s2typ1
fun
l2t2p_trx3cpy
(lt2p: l2t2p, env0: !env3cpy): l2t2p1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
t2iag_trx3cpy
(tiag: t2iag, env0: !env3cpy): t2iag1
fun
t2jag_trx3cpy
(tjag: t2jag, env0: !env3cpy): t2jag1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat_trx3cpy
(d3p0: d3pat, env0: !env3cpy): d3pat1
fun
d3exp_trx3cpy
(d3e0: d3exp, env0: !env3cpy): d3exp1
//
(* ****** ****** *)
//
fun
f3arg_trx3cpy
(f3a0: f3arg, env0: !env3cpy): f3arg1
//
(* ****** ****** *)
//
fun
d3gua_trx3cpy
(dgua: d3gua, env0: !env3cpy): d3gua1
fun
d3gpt_trx3cpy
(dgpt: d3gpt, env0: !env3cpy): d3gpt1
fun
d3cls_trx3cpy
(dcls: d3cls, env0: !env3cpy): d3cls1
//
(* ****** ****** *)
//
fun
d3ecl_trx3cpy
(d3cl: d3ecl, env0: !env3cpy): d3ecl1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typlst_trx3cpy
(t2ps: s2typlst, env0: !env3cpy): s2typ1lst
fun
l2t2plst_trx3cpy
(ltps: l2t2plst, env0: !env3cpy): l2t2p1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
t2iaglst_trx3cpy
(t2is: t2iaglst, env0: !env3cpy): t2iag1lst
fun
t2jaglst_trx3cpy
(t2js: t2jaglst, env0: !env3cpy): t2jag1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3patlst_trx3cpy
(d3ps: d3patlst, env0: !env3cpy): d3pat1lst
//
fun
d3expopt_trx3cpy
(dopt: d3expopt, env0: !env3cpy): d3exp1opt
fun
d3explst_trx3cpy
(d3es: d3explst, env0: !env3cpy): d3exp1lst
//
(* ****** ****** *)
//
fun
f3arglst_trx3cpy
(f3as: f3arglst, env0: !env3cpy): f3arg1lst
//
(* ****** ****** *)
//
fun
d3gualst_trx3cpy
(d3gs: d3gualst, env0: !env3cpy): d3gua1lst
fun
d3clslst_trx3cpy
(d3cs: d3clslst, env0: !env3cpy): d3cls1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3eclist_trx3cpy
(dcls: d3eclist, env0: !env3cpy): d3ecl1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
teqd3exp_trx3cpy
(tdxp: teqd3exp, env0: !env3cpy): teqd3exp1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3valdcl_trx3cpy
(dval: d3valdcl, env0: !env3cpy): d3valdcl1
fun
d3vardcl_trx3cpy
(dvar: d3vardcl, env0: !env3cpy): d3vardcl1
//
fun
d3fundcl_trx3cpy
(dfun: d3fundcl, env0: !env3cpy): d3fundcl1
//
(* ****** ****** *)
//
fun
d3valdclist_trx3cpy
(d3vs: d3valdclist, env0: !env3cpy): d3valdcl1lst
fun
d3vardclist_trx3cpy
(d3vs: d3vardclist, env0: !env3cpy): d3vardcl1lst
//
fun
d3fundclist_trx3cpy
(d3fs: d3fundclist, env0: !env3cpy): d3fundcl1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s3taloadopt_trx3cpy
(dopt: s3taloadopt, env0: !env3cpy): s3taload1opt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3eclistopt_trx3cpy
(dopt: d3eclistopt, env0: !env3cpy): d3ecl1lstopt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_trx3cpy.sats] *)
(***********************************************************************)
