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
Start Time: June 22nd, 2022
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)
//
fun
d0ecl_errck
(lvl: sint
,dcl: d0ecl): d0ecl =
(
d0ecl
(dcl.lctn(), D0Cerrck(lvl, dcl))
)//end-of-[d0ecl_errck(_,_)]
//
(* ****** ****** *)
fun
d0ecl_errvl_a1
(dcl: d0ecl): sint =
(
case+ dcl.node() of
|
D0Cerrck
(lvl, _) => lvl | _ => 0
)
#symload
d0ecl_errvl with d0ecl_errvl_a1
#symload errvl with d0ecl_errvl_a1
(* ****** ****** *)
//
#extern
fun
d0ecl_errvl_dcls
(dcls: d0eclist): sint
#symload
d0ecl_errvl with d0ecl_errvl_dcls
#symload errvl with d0ecl_errvl_dcls
//
#implfun
d0ecl_errvl_dcls(dcls) =
(
case+ dcls of
|
list_nil
((*nil*)) => 0(*lvl*)
|
list_cons
(dcl1,dcls) => max(errvl(dcl1),errvl(dcls)))
//
(* ****** ****** *)

fun
d0ecl_sexpdef_errck
( loc
: loc_t
, tknd
: token
, seid
: s0eid
, smas
: s0maglst
, tres
: sort0opt
, teq1: token
, s0e2: s0exp): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc, D0Csexpdef(tknd, seid, smas, tres, teq1, s0e2)))
end (*let*) // end of [d0ecl_sexpdef_errck]

(* ****** ****** *)

#implfun
preadx0_d0ecl
  (dcl, err) =
(
case+
dcl.node() of
//
|
D0Csexpdef _ =>
f0_sexpdef(dcl, err)
//
|
D0Ctkskp _ =>
(err := err+1; d0ecl_errck(1, dcl))
|
D0Ctkerr _ =>
(err := err+1; d0ecl_errck(1, dcl))
//
|
D0Cerrck _ =>
(err := err+1; d0ecl_errck(1, dcl))
//
| _(* else *) => dcl // HX: placeholder
//
) where
{
//
fun
f0_sexpdef
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Csexpdef
( tknd
, seid, smas
, tres, teq1, def2) = dcl.node()
//
val seid =
preadx0_i0dnt(seid, err)
val smas =
preadx0_s0maglst(smas, err)
val tres =
preadx0_sort0opt(tres, err)
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => (err := err+1)
)
val def2 = preadx0_s0exp(def2, err)
//
in//let
if
(err = e00)
then dcl else
d0ecl_sexpdef_errck
(dcl.lctn(), tknd, seid, smas, tres, teq1, def2)
end (*let*) // end of [f0_sexpdef]
//
} (*where*) // end of [preadx0_d0ecl(dcl,err)]

(* ****** ****** *)

#implfun
preadx0_d0eclist
  (dcls, err) =
(
case+ dcls of
|
list_nil() =>
list_nil((*nil*))
|
list_cons
(dcl1, dcs1) => let
//
  val e00 = err
  val dcl1 = preadx0_d0ecl(dcl1, err)
  val dcs1 = preadx0_d0eclist(dcs1, err)
//
in//let
if err = e00 then dcls else list_cons(dcl1, dcs1)
endlet // end of [list_cons(dcl1,dcls)]
) (*case*) // end-of-[preadx0_d0eclist(dcls,err)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_decl00.dats] *)
