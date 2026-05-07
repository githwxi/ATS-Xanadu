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
|I0Etimp _ => f0_timp(i0e0, enw0)
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
|I0Edap0 _ => f0_dap0(i0e0, enw0)
|I0Edapp _ => f0_dapp(i0e0, enw0)
//
(* ****** ****** *)
//
|I0Elet0 _ => f0_let0(i0e0, enw0)
//
(* ****** ****** *)
//
|I0Eift0 _ => f0_ift0(i0e0, enw0)
(*
|I0Ecas0 _ => f0_cas0(i0e0, enw0)
*)
//
(* ****** ****** *)
//
|I0Elam0 _ => f0_lam0(i0e0, enw0)
|I0Efix0 _ => f0_fix0(i0e0, enw0)
//
(* ****** ****** *)
|
I0Erturn _ => f0_rturn(i0e0, enw0)
//
(* ****** ****** *)
//
|
I0Ewhere _ => f0_where(i0e0, enw0)
//
(* ****** ****** *)
//
|
I0Et2ped _ => f0_t2ped(i0e0, enw0)
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
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_timp
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
I0Etimp
(i0e1, timp) = i0e0.node()
//
(*
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
*)
val timp =
(
  t0imp_tryd3i0(timp, enw0))
//
in//let
//
(
i0exp(
loc0, i0t0, I0Etimp(i0e1, timp)))
//
end(*let*)//end-of-[f0_timp(i0e0,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dap0
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
I0Edap0
(   i0e1   ) = i0e0.node()
//
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
//
in//let
(
i0exp(loc0, i0t0, I0Edap0(i0e1)))
end(*let*)//end-of-[f0_dap0(i0e0,enw0)]
//
(* ****** ****** *)
//
fun
f0_dapp
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
I0Edapp
(i0f0
,npf1, i0es) = i0e0.node()
//
val i0f0 =
(
  i0exp_tryd3i0(i0f0, enw0))
val i0es =
(
  i0explst_tryd3i0(i0es, enw0))
//
in//let
//
i0exp(loc0,
  i0t0, I0Edapp(i0f0, npf1, i0es))
//
end(*let*)//end-of-[f0_dapp(i0e0,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_let0
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
end(*let*)//end-of-[f0_let0(i0e0,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_ift0
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
I0Eift0
(i0e1
,ithn, iels) = i0e0.node()
//
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
//
val ithn =
(
i0expopt_tryd3i0(ithn, enw0))
val iels =
(
i0expopt_tryd3i0(iels, enw0))
//
in//let
//
(
i0exp(loc0,
i0t0, I0Eift0(i0e1, ithn, iels)))
//
end(*let*)//end-of-[f0_ift0(i0e0,env0)]
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
val (  ) =
prerrsln("\
f0_lam0(d3i0): lvl0 = ", lvl0)
val (  ) =
prerrsln("\
f0_lam0(d3i0): i0vs = ", i0vs)
val (  ) =
prerrsln("\
f0_lam0(d3i0): i0e0 = ", i0e0)
//
val i0ws =
(
lvl0$i0vs_tryd3i0
(lvl0, i0vs, enw0))//val(i0ws)
//
val (  ) =
prerrsln("\
f0_lam0(d3i0): i0ws = ", i0ws)
//
in//let
//
let
val i0e1 =
(
  i0exp_tryd3i0( i0e1, enw0 ))
in//let
//
i0exp(
loc0, i0t0, I0Ecenv(i0e0, i0ws))
where
{
val
i0e0 =
i0exp(loc0, i0t0,
  I0Elam0(lvl0,tknd,fias,i0e1,i0vs))}
//
end//let
//
end(*let*)//end-of-[f0_lam0(i0e0,enw0)]
//
(* ****** ****** *)
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
(*
HX-2026-05-06:
[dpid] is a let-bound name!
*)
val (  ) = // HX: lvl0+0
(
  enwd3i0_pshlet0(  enw0  ))
//
val (  ) =
prerrsln("\
f0_fix0(d3i0): lvl0 = ", lvl0)
val (  ) =
prerrsln("\
f0_fix0(d3i0): i0vs = ", i0vs)
val (  ) =
prerrsln("\
f0_fix0(d3i0): i0e0 = ", i0e0)
//
val i0ws =
(
lvl0$i0vs_tryd3i0
(lvl0, i0vs, enw0))//val(i0ws)
val (  ) =
(
enwd3i0_dfix$insert
(enw0, dpid, i0ws))//val((__))
//
val (  ) =
prerrsln("\
f0_fix0(d3i0): i0ws = ", i0ws)
//
in//let
//
let
val i0e1 =
(
  i0exp_tryd3i0( i0e1, enw0 ))
val (  ) =
(
  enwd3i0_poplet0(   enw0   ))
in//let
//
i0exp(
loc0, i0t0, I0Ecenv(i0e0, i0ws))
where
{
val
i0e0 =
i0exp(
loc0, i0t0,
I0Efix0(
lvl0, tknd, dpid, fias, i0e1, i0vs))}
//
end//let
//
end(*let*)//end-of-[f0_fix0(i0e0,enw0)]
//
(* ****** ****** *)
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
(* ****** ****** *)
//
fun
f0_where
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
I0Ewhere
(i0e1, dcls) = i0e0.node()
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
loc0, i0t0, I0Ewhere(i0e1, dcls)))
end//let
//
end(*let*)//end-of-[f0_where(i0e0,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_t2ped
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
I0Et2ped
(i0e1, t2p2) = i0e0.node()
//
val i0e1 =
(
  i0exp_tryd3i0(i0e1, enw0))
//
in//let
//
(
i0exp(
loc0, i0t0, I0Et2ped(i0e1, t2p2)))
//
end(*let*)//end-of-[f0_t2ped(i0e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i0exp_tryd3i0(i0e0,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
lvl0$i0vs_tryd3i0
(lvl0, i0vs, enw0) =
let
val i0ws =
i0varfst_mknil((*0*))
val i0ws =
f0_main(i0vs, i0ws, enw0)
in//let
list_vt2t(i0varfst_listize(i0ws))
end where
{
//
fun
f0_main
(
i0vs: i0varlst,
i0ws: i0varfst,
enw0: !enwd3i0): i0varfst =
(
case+ i0vs of
|list_nil
( (*0*) ) => (i0ws)
|list_cons
(i0v1, i0vs) =>
(
f0_main(i0vs, i0ws, enw0))
where
{
//
val lvl1 =
i0var_lvl0$get(i0v1)
//
val i0ws =
(
if
(lvl1 > lvl0)
then (i0ws) else
let
val bvk1 =
i0var_bvk0$get(i0v1)
in//let
if // if
not(
i0var_fixq(i0v1))
then
(
if // if
i0var_topq(i0v1)
then (i0ws) else
  i0varfst_addvar(i0ws, i0v1)
) else // end-of-(then)
(
(
  i0varfst_addlst(i0ws, ivs2))
where
{
val dfix = i0v1.dvar((*0*))
val ivs2 =
enwd3i0_dfix$search(enw0, dfix)})
end(*let*)//else//end-of-(val(i0ws))
)
}(*where*)//end-of-[list_cons(i0v1,i0vs)]
)(*case+*)//end-of-[f0_main(i0vs,i0ws,enw0)]
//
}(*where*)//end-of-[lvl0$i0vs_tryd3i0(i0vs,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_tryd3i0_dynexp.dats] *)
(***********************************************************************)
