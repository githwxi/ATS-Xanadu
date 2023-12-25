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
Sat Dec  9 11:14:33 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"./../HATS/xinterp_dats.hats"
//
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xinterp.dats"
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irpat_valck
(irp0 , irv0) =
(
case+
irp0.node() of
//
|IRPany _ => true
|IRPvar _ => true
//
|IRPint(int1) =>
(
case+ irv0 of
|IRVint(int2) =>
(int1 = int2) | _ => false)
//
|IRPbtf(btf1) =>
(
case+ irv0 of
|IRVbtf(btf2) =>
(btf1 = btf2) | _ => false)
//
|IRPtup0 _ => f0_tup0(irp0, irv0)
|IRPtup1 _ => f0_tup1(irp0, irv0)
//
|_(*otherwise*) => (    false    )
//
) where
{
//
fun
f0_tup0
(irp0: irpat
,irv0: irval): bool =
let
//
val-
IRPtup0(irps) = irp0.node()
in//let
(
case+ irv0 of
| IRVtup0(irvs) =>
(
  irpatlst_valck_arr(irps,irvs) )
| _ (*non-IRVtup0*) => (  false  ) )
end(*let*)//end-of-[f0_tup0(irp0,irv0)]
//
fun
f0_tup1
(irp0: irpat
,irv0: irval): bool =
let
//
val-
IRPtup1
( knd1, irps) = irp0.node()
//
in//let
(
case+ irv0 of
| IRVtup1(knd2, irvs) =>
(
  irpatlst_valck_arr(irps, irvs) )
| _ (*non-IRVtup1*) => (  false  ) )
end(*let*)//end-of-[f0_tup1(irp0,irv0)]
//
}(*where*)//end-of-[irpat_valck(irp0,irv0)]
//
(* ****** ****** *)
//
local
//
fun
<irvalseq:t0>
irpatlst_valck
(irps: irpatlst
,irvs: irvalseq): bool =
let
//
#typedef x0 = irpat
#typedef y0 = irval
#typedef xs = irpatlst
#typedef ys = irvalseq
//
#impltmp
z2forall$test<x0,y0> = irpat_valck
//
in//let
gseq_z2forall<xs,ys><x0,y0>(irps, irvs)
end(*let*)//end-of-[ f0_tup0(irp0, irv0) ]
//
in//local
//
#implfun
irpatlst_valck_arr(irps, irvs) =
(
  irpatlst_valck<irvalarr>(irps, irvs) )//fun
#implfun
irpatlst_valck_lst(irps, irvs) =
(
  irpatlst_valck<irvalist>(irps, irvs) )//fun
//
end(*local*) // end-of-local(irpatlst_valck_...)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irpat_match
( env0
, irp0, irv0) =
(
case+
irp0.node() of
//
|IRPvar
( d2v1 ) =>
(
irvar_match
(env0,d2v1,irv0))
//
|IRPint(int) => ((*void*))
|IRPbtf(btf) => ((*void*))
|IRPchr(chr) => ((*void*))
|IRPflt(flt) => ((*void*))
|IRPstr(str) => ((*void*))
//
|IRPtup0 _ =>
(
  f0_tup0(env0, irp0, irv0))
|IRPtup1 _ =>
(
  f0_tup1(env0, irp0, irv0))
//
| _(*otherwise*) => (  (*void*)  )
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_tup0
(env0:
!xintenv
,irp0: irpat
,irv0: irval): void =
let
//
val-
IRPtup0(irps) = irp0.node()
//
in//let
(
case+ irv0 of
|
IRVtup0(irvs) =>
irpatlst_match_arr
(env0, irps, irvs) | _ => ( (*0*) ) )
end(*let*)//end-of-[ f0_tup0(irp0, irv0) ]
//
(* ****** ****** *)
//
fun
f0_tup1
(env0:
!xintenv
,irp0: irpat
,irv0: irval): void =
let
//
(*
val () =
prerrln
("f0_tup1: irp0 = ", irp0)
val () =
prerrln
("f0_tup1: irv0 = ", irv0)
*)
//
val-
IRPtup1
( knd1, irps) = irp0.node()
//
in//let
(
case+ irv0 of
|
IRVtup1
(knd2, irvs) =>
irpatlst_match_arr
(env0, irps, irvs) | _ => ( (*0*) ) )
end(*let*)//end-of-[ f0_tup1(irp0, irv0) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
prerrln("irpat_match: irp0 = ", irp0)
val () =
prerrln("irpat_match: irv0 = ", irv0)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[irpat_match(env0,irp0,irv0)]
//
(* ****** ****** *)
//
#implfun
irvar_match
( env0
, d2v0, irv0) =
(
xintenv_d2vins_any(env0, d2v0, irv0)
) where
{
//
val () =
prerrln("irvar_match: d2v0 = ", d2v0)
val () =
prerrln("irvar_match: irv0 = ", irv0)
//
}(*where*)//end-of-[irvar_match(env0,d2v0,irv0)]
//
(* ****** ****** *)
//
#implfun
ircst_match
( env0
, d2c0, irv0) =
(
xintenv_d2cins_any(env0, d2c0, irv0)
) where
{
//
val () =
prerrln("ircst_match: d2c0 = ", d2c0)
val () =
prerrln("ircst_match: irv0 = ", irv0)
//
}(*where*)//end-of-[ircst_match(env0,d2c0,irv0)]
//
(* ****** ****** *)
//
#implfun
fiarg_match
( env0
, fia0, irvs) =
(
case+ fia0 of
|
FIARG(irps) =>
irpatlst_match_lst(env0, irps, irvs))
where
{
//
(*
val () =
prerrln("fiarg_match: fia0 = ", fia0)
val () =
prerrln("fiarg_match: irvs = ", irvs)
*)
//
}(*where*)//end-of-[fiarg_match(env0,fia0,irvs)]
//
(* ****** ****** *)
//
local
//
fun
<irvalseq:t0>
irpatlst_match
( env0:
! xintenv
, irps: irpatlst
, irvs: irvalseq): void =
let
//
#typedef x0 = irpat
#typedef y0 = irval
#vwtpdef e1 = xintenv
#typedef xs = irpatlst
#typedef ys = irvalseq
//
val e1 = $UN.datacopy(env0)
//
#impltmp
z2foreach$work
<x0, y0>
(x0, y0) =
let
val e1 =
$UN.castlin10{e1}(e1)
val () =
irpat_match(e1, x0, y0)
val e1 = $UN.delinear(e1) in () end
//
(*
val () =
prerrln("irpatlst_match: irps = ", irps)
val () =
prerrln("irpatlst_match: irvs = ", irvs)
*)
//
in//let
  gseq_z2foreach<xs,ys><x0,y0>(irps, irvs)
end(*let*)//end-of-[irpatlst_match<...>(...)]
//
in//local
//
#implfun
irpatlst_match_arr
(env0, irps, irvs) =
let
(*
val () =
prerrln
("irpatlst_match_arr: irps = ", irps)
val () =
prerrln
("irpatlst_match_arr: irvs = ", irvs)
*)
in//let
  irpatlst_match<irvalarr>(env0, irps, irvs)
end//let//end-of-[irpatlst_match_arr(env0,...)]
//
#implfun
irpatlst_match_lst
(env0, irps, irvs) =
let
(*
val () =
prerrln
("irpatlst_match_lst: irps = ", irps)
val () =
prerrln
("irpatlst_match_lst: irvs = ", irvs)
*)
in//let
  irpatlst_match<irvalist>(env0, irps, irvs)
end//let//end-of-[irpatlst_match_lst(env0,...)]
//
(*
(*
HX-2023-12-24: This style should work!!!
*)
#implfun
irpatlst_match_arr = irpatlst_match<irvalarr>
#implfun
irpatlst_match_lst = irpatlst_match<irvalist>
*)
//
end(*local*) // end-of-local(irpatlst_match_...)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep_utils0.dats] *)
