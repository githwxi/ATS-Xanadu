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
Tue 25 Jul 2023 08:42:01 PM EDT
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
//
#implfun
d3ecl_d2ceq
(d3cl, d2c0) =
(
case+
d3cl.node() of
|
D3Cfundclst _ => f0_fundclst(d3cl)
|
D3Cimplmnt0 _ => f0_implmnt0(d3cl)
//
| _(* otherwise *) => (   false   )
//
) where
{
//
fun
f0_fundclst
(d3cl: d3ecl): bool =
let
val-
D3Cfundclst
( tknd, tqas
, d2cs, d3fs) = d3cl.node()
in//let
list_exists(d2cs) where
{
#impltmp
exists$test
<  d2cst  >(d2c1) = (d2c0 = d2c1)
}
end (*let*) // end of [f0_fundclst(...)]

fun
f0_implmnt0
(d3cl: d3ecl): bool = false
//
} (*where*) // end of [d3ecl_d2ceq(...)]
//
(* ****** ****** *)
//
#implfun
d3ecl_impltmpq
  ( d3cl ) =
(
case+
d3cl.node() of
//
|
D3Ctmplocal _ => ( true )
//
|
D3Cfundclst
( tknd, tqas
, d2cs, d3fs) => list_consq(tqas)
//
|
D3Cimplmnt0
( tknd
, stmp
, sqas,tqas
, dimp,tias
, f3as,sres,dexp) => dimpl_tmpq(dimp)
//
| _(* otherwise *) => (    false    ))
//(*case+*)//end-of-[d3ecl_impltmpq(d3cl)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp3_utils0.dats] *)
