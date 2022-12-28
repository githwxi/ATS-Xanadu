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
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
#symload name with s2cst_get_name
(* ****** ****** *)
//
#implfun
trans2a_d2ecl
( env0, d2cl ) = let
//
// (*
val
loc0 = d2cl.lctn()
val () =
prerrln
("trans2a_d2ecl: d2cl = ", d2cl)
// *)
//
in//let
//
case+
d2cl.node() of
//
| D2Cd1ecl _ => d2cl
//
| D2Cstatic _ =>
(
f0_static(env0, d2cl))
| D2Cextern _ =>
(
f0_extern(env0, d2cl))
//
| D2Clocal0 _ =>
(
f0_local0(env0, d2cl))
//
| D2Cabssort _ => d2cl
| D2Cstacst0 _ => d2cl
//
| D2Csortdef _ => d2cl
| D2Csexpdef _ => d2cl
//
| D2Cabstype _ => d2cl
(*
| D2Cabsopen _ => d2cl
*)
|
D2Cabsimpl _ => f0_absimpl(env0, d2cl)
//
|
D2Cvaldclst _ => f0_valdclst(env0, d2cl)
|
D2Cvardclst _ => f0_vardclst(env0, d2cl)
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
f0_static
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cstatic
(tknd, dcl1) =  d2cl.node()
val
dcl1 = trans2a_d2ecl(env0, dcl1)
in//let
  d2ecl(loc0, D2Cstatic(tknd, dcl1))
end (*let*) // end of [f0_static(env0,d2cl)]
//
fun
f0_extern
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cextern
(tknd, dcl1) = d2cl.node()
val
dcl1 = trans2a_d2ecl(env0, dcl1)
in//let
  d2ecl(loc0, D2Cextern(tknd, dcl1))
end (*let*) // end of [f0_extern(env0,d2cl)]
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
fun
f0_absimpl
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val-
D2Cabsimpl
( tknd
, simp, sdef) = d2cl.node()
//
in//let
//
let
val () =
case+ simp of
|
SIMPLall1
(sqid, s2cs) => ()
|
SIMPLopt2
(sqid, scs1, scs2) =>
(
case+ scs2 of
|list_nil() => ()
|list_cons(s2c1, _) =>
let
val
sdef = s2exp_stpize(sdef)
val () =
tr2aenv_insert_any
(env0, s2c1.name(), sdef) end) in d2cl
end (*let*)
//
end (*let*) // end of [f0_absimpl(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cvaldclst
(tknd, d2vs) = d2cl.node()
//
val () =
prerrln
("f0_valdclst: d2cl = ", d2cl)
//
val
d2vs =
trans2a_d2valdclist(env0, d2vs)
//
in//let
  d2ecl(loc0, D2Cvaldclst(tknd, d2vs))
end (*let*) // end of [f0_valdclst(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cvardclst
(tknd, d2vs) = d2cl.node()
//
val () =
prerrln
("f0_vardclst: d2cl = ", d2cl)
//
val
d2vs =
trans2a_d2vardclist(env0, d2vs)
//
in//let
  d2ecl(loc0, D2Cvardclst(tknd, d2vs))
end (*let*) // end of [f0_vardclst(env0,d2cl)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans2a_d2ecl(env0,d2cl)]
//
(* ****** ****** *)

#implfun
trans2a_d2valdcl
  (env0, dval) = let
//
val loc0 =
d2valdcl_get_lctn(dval)
val dpat =
d2valdcl_get_dpat(dval)
val tdxp =
d2valdcl_get_tdxp(dval)
val wsxp =
d2valdcl_get_wsxp(dval)
//
val dpat =
trans2a_d2pat(env0, dpat)
val tdxp =
(
case+ tdxp of
|
TEQD2EXPnone() =>
TEQD2EXPnone((*void*))
|
TEQD2EXPsome(teq1, d2e2) =>
let
val d2e2 =
trans2a_d2exp(env0, d2e2)
in//let
  TEQD2EXPsome(teq1, d2e2) end
) : teqd2exp // end-[val(tdxp)]
//
in//let
d2valdcl_make_args(loc0, dpat, tdxp, wsxp)
end//let
(*let*)//end-of-[trans2a_d2valdcl(env0,dval)]

(* ****** ****** *)
//
#implfun
trans2a_d2eclist
  (env0, dcls) =
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
trans2a_d2valdclist
  (env0, dcls) =
list_trans2a_fnp(env0, dcls, trans2a_d2valdcl)
#implfun
trans2a_d2vardclist
  (env0, dcls) =
list_trans2a_fnp(env0, dcls, trans2a_d2vardcl)
#implfun
trans2a_d2fundclist
  (env0, dcls) =
list_trans2a_fnp(env0, dcls, trans2a_d2fundcl)
#implfun
trans2a_d2cstdclist
  (env0, dcls) =
list_trans2a_fnp(env0, dcls, trans2a_d2cstdcl)
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
