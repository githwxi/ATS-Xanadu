(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat Apr 18 08:50:06 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xsymmap.sats"
#staload
"./../../../SATS/xlabel0.sats"
(* ****** ****** *)
#staload
"./../../../SATS/locinfo.sats"
#staload
"./../../../SATS/lexing0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/tryd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0exp_tryd3i0
(i0e0, enw0) =
let
//
val () =
prerrsln("\
i0exp_tryd3i0: i0e0 = ", i0e0)
//
in//let
//
case+
i0e0.node() of
//
(* ****** ****** *)
|I0Eint _ => ( i0e0 )
|I0Ebtf _ => ( i0e0 )
|I0Echr _ => ( i0e0 )
|I0Eflt _ => ( i0e0 )
|I0Estr _ => ( i0e0 )
(* ****** ****** *)
|I0Ei00 _ => ( i0e0 )
|I0Eb00 _ => ( i0e0 )
|I0Ec00 _ => ( i0e0 )
|I0Ef00 _ => ( i0e0 )
|I0Es00 _ => ( i0e0 )
(* ****** ****** *)
//
|I0Etop _ => ( i0e0 )
//
(* ****** ****** *)
//
|I0Evar _ => ( i0e0 )
//
(* ****** ****** *)
//
|I0Econ _ => ( i0e0 )
|I0Ecst _ => ( i0e0 )
//
(* ****** ****** *)
//
(*
|I0Etimp _ => f0_timp(i0e0, enw0)
*)
//
(* ****** ****** *)
//
(*
|I0Esapp _ => f0_sapp(i0e0, enw0)
|I0Esapq _ => f0_sapq(i0e0, enw0)
*)
//
(* ****** ****** *)
//
|I0Elet0 _ => f0_let0(i0e0, enw0)
//
(* ****** ****** *)
//
|I0Elam0 _ => f0_lam0(i0e0, enw0)
|I0Efix0 _ => f0_fix0(i0e0, enw0)
//
(* ****** ****** *)
//
|
I0Erturn _ => f0_rturn(i0e0, enw0)
//
(* ****** ****** *)
(* ****** ****** *)
|
_(*otherwise*) => i0exp_none2(i0e0)
//
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
//
//
fun
f0_let0
(i0e0: i0exp
,enw0: !enwd3i0): i0exp =
let
//
val
loc0 = i0e0.lctn((*0*))
val
i0t0 = i0e0.ityp((*0*))
//
val-
I0Elet0
(dcls, i0e1) = i0e0.node()
//
val (  ) = // HX: lvl0+0
(
  enwd3i0_pshlet0(  enw0  ))
val dcls =
(
i0dclist_tryd3i0(dcls, enw0))
//
in//let
//
let
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
val (  ) =
(
  enwd3i0_poplet0(   enw0   ))
in//let
(
i0exp(
loc0, i0t0, I0Elet0(dcls, i0e1)))
end//let
//
end(*let*)//end-of-[f0_let0(d3e0,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_lam0
(
i0e0: i0exp,
enw0: !enwd3i0): i0exp =
let
//
val
loc0 = i0e0.lctn((*0*))
val
i0t0 = i0e0.ityp((*0*))
//
val-
I0Elam0
(lvl0
,tknd, fias
,i0e1, i0vs) = i0e0.node()
//
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
//
in//let
//
i0exp(loc0, i0t0,
  I0Elam0(lvl0,tknd,fias,i0e1,i0vs))
//
end(*let*)//end-of-[f0_lam0(i0e0,enw0)]
//
fun
f0_fix0
(
i0e0: i0exp,
enw0: !enwd3i0): i0exp =
let
//
val
loc0 = i0e0.lctn((*0*))
val
i0t0 = i0e0.ityp((*0*))
//
val-
I0Efix0
(lvl0
,tknd
,dpid, fias
,i0e1, i0vs) = i0e0.node()
//
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
//
in//let
//
i0exp
(
loc0,
i0t0,
I0Efix0(
  lvl0, tknd, dpid,fias,i0e1, i0vs))
//
end(*let*)//end-of-[f0_fix0(i0e0,enw0)]
//
(* ****** ****** *)
//
fun
f0_rturn
(
i0e0: i0exp,
enw0: !enwd3i0): i0exp =
let
//
val
loc0 = i0e0.lctn((*0*))
val
i0t0 = i0e0.ityp((*0*))
//
val-
I0Erturn
(ical, i0e1) = i0e0.node()
//
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
//
in//let
//
(
i0exp(
  loc0, i0t0, I0Erturn(ical, i0e1)))
//
end(*let*)//end-of-[f0_rturn(i0e0,enw0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i0exp_tryd3i0(i0e0,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_tryd3i0_dynexp.dats] *)
(***********************************************************************)
