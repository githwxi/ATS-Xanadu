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
This implementation is preliminary for
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
S2E = "./staexp2.sats"
(* ****** ****** *)
#staload
D2E = "./dynexp2.sats"
#staload
D3E = "./dynexp3.sats"
(* ****** ****** *)
//
#typedef s2typ = $S2E.s2typ
#typedef l2t2p = $S2E.l2t2p
//
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
#typedef
 s2typlst  =  $S2E.s2typlst
#typedef
 l2t2plst  =  $S2E.l2t2plst
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
fun
d3parsed_of_trtmp3b
( dpar : d3parsed ): (d3parsed)
//
(* ****** ****** *)
//
fun
tr3benv_make_nil
( (*void*) ): tr3benv
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
fun
tr3benv_pshlet0
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
trtmp3b_d3pat
( env0:
! tr3benv,d3p0:d3pat):d3pat//fun
//
fun
trtmp3b_l3d3p
( env0:
! tr3benv,ld3p:l3d3p):l3d3p//fun
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
trtmp3b_d3gua
( env0:
! tr3benv,dgua:d3gua):d3gua//fun
//
fun
trtmp3b_d3cls
( env0:
! tr3benv,dcls:d3cls):d3cls//fun
//
(* ****** ****** *)
//
fun
trtmp3b_d3patlst
( env0:
! tr3benv,d3ps:d3patlst):d3patlst
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
trtmp3b_d3gualst
( env0:
! tr3benv,d3gs:d3gualst):d3gualst
//
fun
trtmp3b_d3clslst
( env0:
! tr3benv,dcls:d3clslst):d3clslst
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b.sats] *)
