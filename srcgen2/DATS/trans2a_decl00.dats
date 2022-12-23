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
Sun 20 Nov 2022 11:06:32 AM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*TRANS2a*) = "./trans2a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
//
#implfun
trans2a_d2ecl
( env0, d2cl ) = let
//
(*
val
loc0 = d2cl.lctn()
val () =
prerrln
("trans2a_d2ecl: d2cl = ", d2cl)
*)
//
in//let
//
case+
d2cl.node() of
//
| D2Cdefine _ => d2cl
| D1Cmacdef _ => d2cl
//
|
D1Clocal0 _ =>
(
f0_local0(env0, d2cl))
//
| D1Cabssort _ => d2cl
| D1Cstacst0 _ => d2cl
//
| D1Csortdef _ => d2cl
| D1Csexpdef _ => d2cl
//
| D1Cabstype _ => d2cl
//
| _(*otherwise*) =>
let
  val loc0 = d2cl.lctn()
in//let
  d2ecl_make_node(loc0, D2Cnone2( d2cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where
{
//
(* ****** ****** *)
//
fun
f0_local0
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Clocal0
(head, body) = d2cl.node()
//
val (  ) =
tr2aenv_pshloc1(env0)
val head =
trans2a_d2eclist(env0, head)
val (  ) =
tr2aenv_pshloc2(env0)
val body =
trans2a_d2eclist(env0, body)
//
val (  ) = tr2aenv_locjoin(env0)
//
in//let
  d2ecl(loc0, D2Clocal0(head, body))
end (*let*) // end of [f0_local0(env0,d2cl)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans2a_d2ecl(env0,d2cl)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2eclist
( env0, dcls ) =
list_trans2a_fnp(env0, dcls, trans2a_d2ecl)
//
(* ****** ****** *)
//
#implfun
trans2a_s2qaglst
  (env0, sqas) =
list_trans2a_fnp(env0, sqas, trans2a_s2qag)
#implfun
trans2a_t2qaglst
  (env0, tqas) =
list_trans2a_fnp(env0, tqas, trans2a_t2qag)
//
#implfun
trans2a_t2iaglst
  (env0, tias) =
list_trans2a_fnp(env0, tias, trans2a_t2iag)
//
(* ****** ****** *)
//
#implfun
trans2a_d2arglst
  (env0, d2as) =
list_trans2a_fnp(env0, d2as, trans2a_d2arg)
//
(* ****** ****** *)
//
#implfun
trans2a_d2eclistopt
( env0, dopt ) =
optn_trans2a_fnp(env0, dopt, trans2a_d2eclist)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_decl00.dats] *)
