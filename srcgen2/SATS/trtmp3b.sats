(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat Aug 12 16:32:39 EDT 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(*
HX-2023-08-12:
Template resolution is the engine
of programming productivity for ATS3!
This implementation is primarily for
the moment; some form of internet-based
search will be attempted later :)
*)
(* ****** ****** *)
#absvtbx
tr3benv_vtbx
#vwtpdef
tr3benv = tr3benv_vtbx
(* ****** ****** *)
#staload
TMP = "./xstamp0.sats"
(* ****** ****** *)
#staload
S2E = "./staexp2.sats"
(* ****** ****** *)
#staload
D2E = "./dynexp2.sats"
#staload
D3E = "./dynexp3.sats"
(* ****** ****** *)
#typedef stamp = $TMP.stamp
(* ****** ****** *)
//
#typedef s2typ = $S2E.s2typ
#typedef l2t2p = $S2E.l2t2p
//
(* ****** ****** *)
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef timpl = $D3E.timpl
(* ****** ****** *)
#typedef
 s2typlst  =  $S2E.s2typlst
#typedef
 l2t2plst  =  $S2E.l2t2plst
(* ****** ****** *)
#typedef
 d2cstlst  =  $D2E.d2cstlst
(* ****** ****** *)
#typedef
 t2jaglst  =  $D2E.t2jaglst
(* ****** ****** *)
#typedef
 teqd3exp  =  $D3E.teqd3exp
(* ****** ****** *)
#typedef
 d3patlst  =  $D3E.d3patlst
#typedef
 d3explst  =  $D3E.d3explst
#typedef
 d3expopt  =  $D3E.d3expopt
(* ****** ****** *)
#typedef
 l3d3plst  =  $D3E.l3d3plst
#typedef
 l3d3elst  =  $D3E.l3d3elst
(* ****** ****** *)
#typedef
 d3gualst  =  $D3E.d3gualst
#typedef
 d3clslst  =  $D3E.d3clslst
(* ****** ****** *)
#typedef
 d3eclist  =  $D3E.d3eclist
(* ****** ****** *)
#typedef
 d3valdcl  =  $D3E.d3valdcl
#typedef
 d3vardcl  =  $D3E.d3vardcl
#typedef
 d3fundcl  =  $D3E.d3fundcl
(* ****** ****** *)
#typedef
 d3parsed  =  $D3E.d3parsed
#typedef
 d3topenv  =  $D3E.d3topenv
(* ****** ****** *)
#typedef
d3valdclist = $D3E.d3valdclist
#typedef
d3vardclist = $D3E.d3vardclist
#typedef
d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
#typedef
d3explstopt = $D3E.d3explstopt
#typedef
d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
//
#absvtbx tmpstk_vtbx // ptr
#vwtpdef tmpstk = tmpstk_vtbx
//
(* ****** ****** *)
fun
tmpstk_nilq( !tmpstk ): bool
(* ****** ****** *)
//
fun
tmpstk_poptop0
  ( stk: &tmpstk >> _ ): sint
//
(* ****** ****** *)
//
fun
tmpstk_poplet0
  ( stk: &tmpstk >> _ ): sint
//
fun
tmpstk_pshlet0
  ( stk: &tmpstk >> _ ): void
//
(* ****** ****** *)
//
fun
tmpstk_pshloc1
  ( stk: &tmpstk >> _ ): void
fun
tmpstk_pshloc2
  ( stk: &tmpstk >> _ ): void
//
fun
tmpstk_locjoin
  ( stk: &tmpstk >> _ ): sint
//
(* ****** ****** *)
//
fun
tmpstk_getstmp
  ( stk: !tmpstk >> _ ): stamp
//
(* ****** ****** *)
//
fun
tmpstk_insert_dcl
  (&tmpstk >> _, d3ecl): void
//
(* ****** ****** *)
fun
tmpstk_search_cst
( stk:
! tmpstk, d2c:d2cst): d3eclist
(* ****** ****** *)
//
fun
d3parsed_of_trtmp3b
  ( dpar: d3parsed ): d3parsed
//
(* ****** ****** *)
//
fun
tr3benv_make_nil
( (* void *) ): tr3benv
//
fun
tr3benv_free_top
( env0 : tr3benv ) : (  void  )
//
(* ****** ****** *)
//
fun
tr3benv_poplet0
(env0: !tr3benv): void//end-fun
//
fun
tr3benv_pshlet0
(env0: !tr3benv): void//end-fun
//
(* ****** ****** *)
//
fun
tr3benv_pshloc1
(env0: !tr3benv): void//end-fun
fun
tr3benv_pshloc2
(env0: !tr3benv): void//end-fun
//
fun
tr3benv_locjoin
(env0: !tr3benv): void//end-fun
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trtmp3b_fnp
( e1:
! tr3benv
, xs
: list(x0)
, fopr:
  (!tr3benv, x0)->y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trtmp3b_fnp
( e1:
! tr3benv
, xs: optn(x0)
, fopr:
  (!tr3benv, x0)->y0): optn(y0)
//
(* ****** ****** *)
//
fun
trtmp3b_d3exp
( env0:
! tr3benv,d3e0:d3exp):d3exp//fun
//
fun
trtmp3b_l3d3e
( env0:
! tr3benv,ld3e:l3d3e):l3d3e//fun
//
(* ****** ****** *)
//
fun
trtmp3b_d3gpt
( env0:
! tr3benv,dgpt:d3gpt):d3gpt//fun
//
fun
trtmp3b_d3cls
( env0:
! tr3benv,dcls:d3cls):d3cls//fun
//
(* ****** ****** *)
//
fun
trtmp3b_d3ecl
( env0:
! tr3benv,d3cl:d3ecl):d3ecl//fun
//
(* ****** ****** *)
//
fun
trtmp3b_teqd3exp
( env0:
! tr3benv,tdxp:teqd3exp):teqd3exp
//
(* ****** ****** *)
//
fun
trtmp3b_d3explst
( env0:
! tr3benv,d3es:d3explst):d3explst
//
fun
trtmp3b_d3expopt
( env0:
! tr3benv,dopt:d3expopt):d3expopt
//
(* ****** ****** *)
//
fun
trtmp3b_l3d3elst
( env0:
! tr3benv,ldes:l3d3elst):l3d3elst
//
(* ****** ****** *)
//
fun
trtmp3b_d3clslst
( env0:
! tr3benv,dcls:d3clslst):d3clslst
//
(* ****** ****** *)
//
fun
trtmp3b_d3eclist
( env0:
! tr3benv,dcls:d3eclist):d3eclist
//
(* ****** ****** *)
//
fun
trtmp3b_d3valdcl
( env0:
! tr3benv,dval:d3valdcl):d3valdcl
//
fun
trtmp3b_d3vardcl
( env0:
! tr3benv,dvar:d3vardcl):d3vardcl
//
(* ****** ****** *)
//
fun
trtmp3b_d3fundcl
( env0:
! tr3benv,dfun:d3fundcl):d3fundcl
//
(* ****** ****** *)
//
fun
trtmp3b_d3valdclist
( env0:
! tr3benv,d3vs:d3valdclist):d3valdclist
//
fun
trtmp3b_d3vardclist
( env0:
! tr3benv,d3vs:d3vardclist):d3vardclist
//
(* ****** ****** *)
//
fun
trtmp3b_d3fundclist
( env0:
! tr3benv,d3fs:d3fundclist):d3fundclist
//
(* ****** ****** *)
//
fun
trtmp3b_d3explstopt
( env0:
! tr3benv,dopt:d3explstopt):d3explstopt
//
(* ****** ****** *)
//
fun
trtmp3b_d3eclistopt
( env0:
! tr3benv,dopt:d3eclistopt):d3eclistopt
//
(* ****** ****** *)
//
fun
tr3benv_getstmp(env0: !tr3benv): stamp
//
fun
tr3benv_tapq_resolve
( env0:
! tr3benv, dcst: d2cst, t2js: t2jaglst): timpl
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b.sats] *)
