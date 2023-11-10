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
Thu Nov  9 11:29:45 EST 2023
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
HX-2023-11-09:
For handling recursive template
resolution. The non-recursive case
is handled in [trtmp3b].
*)
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
tr3cenv_vtbx
#vwtpdef
tr3cenv = tr3cenv_vtbx
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
#vwtpdef
d3eclist_vt = $D3E.d3eclist_vt
(* ****** ****** *)
#typedef
d3explstopt = $D3E.d3explstopt
#typedef
d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
//
#absvtbx tmpstq_vtbx // ptr
#vwtpdef tmpstq = tmpstq_vtbx
//
(* ****** ****** *)
//
fun
d3parsed_of_trtmp3c
  ( dpar: d3parsed ): d3parsed
//
(* ****** ****** *)
//
fun
tr3cenv_make_nil
( (* void *) ): tr3cenv
//
fun
tr3cenv_free_top
( env0 : tr3cenv ) : (  void  )
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c.sats] *)
