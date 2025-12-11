(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat May 17 10:53:55 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp2.sats"
#staload
"./../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "\
./../../../SATS/locinfo.sats"
#staload "\
./../../../SATS/staexp2.sats"
#staload "\
./../../../SATS/statyp2.sats"
#staload "\
./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3typ1_none0() =
(
d3typ1_none$make
(s2typ1_none0((*void*))))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-09-17:
A convenience function
*)
#implfun
d3exp1_styp$get
  ( dexp ) =
let
val t3q0 =
dexp.dtyp() in t3q0.styp()
end//end-of-[d3exp1_dtyp$get]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3typ1 =
D3TYP1 of
(s2typ1, d3typ1_node)
datavwtp
d3pat1_vt =
D3TYP1_vt of
(s2typ1, d3typ1_node)
//
#absimpl d3typ1_tbox = d3typ1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3typ1_styp$get
  ( dtyp ) =
let
val+
D3TYP1
( t2q0
, node) = dtyp in t2q0
end//end-of-[d3typ1_styp$get]
//
//
#implfun
d3typ1_node$get
  ( dtyp ) =
let
val+
D3TYP1
( t2q0
, node) = dtyp in node
end//end-of-[d3typ1_node$get]
//
(* ****** ****** *)
//
#implfun
d3typ1_make_styp$node
  (t2q0, node) = D3TYP1(t2q0, node)
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3typ1)]
//
(* ****** ****** *)
//
#implfun
d3typ1_none$make
  (  t2q0  ) =
let
val node = T3P1none() in
  d3typ1_make_styp$node(t2q0, node) end
//
#implfun
d3typ1_styp$make
  (  t2q0  ) =
let
val node = T3P1styp(t2q0) in
  d3typ1_make_styp$node(t2q0, node) end
//
#implfun
d3typ1_dlft$make
  (  t3q0  ) =
(
case+
t3q0.node() of
|
T3P1styp(t2q0) =>
d3typ1_styp$make(s2typ1_lft(t2q0))
|
_(*otherwise*) =>
let
val t2q0 = t3q0.styp()
val node = T3P1dlft(t3q0) in
  d3typ1_make_styp$node(t2q0, node) end
)(*case+*)//end-of-[d3typ1_dlft$make(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3pat1 =
D3PAT1 of
(loctn
,s2typ1, d3pat1_node)
datavwtp
d3pat1_vt =
D3PAT1_vt of
(loctn
,s2typ1, d3pat1_node)
//
#absimpl d3pat1_tbox = d3pat1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3pat1_lctn$get
  ( dpat ) =
let
val+
D3PAT1
( loc0
, t2q0
, node) = dpat in loc0
end//end-of-[d3pat1_lctn$get]
//
#implfun
d3pat1_styp$get
  ( dpat ) =
let
val+
D3PAT1
( loc0
, t2q0
, node) = dpat in t2q0
end//end-of-[d3pat1_styp$get]
//
#implfun
d3pat1_node$get
  ( dpat ) =
let
val+
D3PAT1
( loc0
, t2q0
, node) = dpat in node
end//end-of-[d3pat1_node$get]
//
(* ****** ****** *)
//
(*
#implfun
d3pat1_make_lctn$node
( loc0, node ) =
let
val
t2q0 = s2typ_none0((*0*))
in//let
  D3PAT1(loc0, t2q0, node) end
*)
//
#implfun
d3pat1_make_lctn$styp$node
( loc0, t2q0, node ) =
let
  D3PAT1(loc0, t2q0, node) end
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3pat1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3axp1 =
D3AXP1 of
(loctn
,s2typ1, d3axp1_node)
datavwtp
d3axp1_vt =
D3AXP1_vt of
(loctn
,s2typ1, d3axp1_node)
//
#absimpl d3axp1_tbox = d3axp1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3axp1_lctn$get
  ( daxp ) =
let
val+
D3AXP1
( loc0
, t2q0
, node) = daxp in loc0
end//end-of-[d3axp1_lctn$get]
//
#implfun
d3axp1_styp$get
  ( daxp ) =
let
val+
D3AXP1
( loc0
, t2q0
, node) = daxp in t2q0
end//end-of-[d3axp1_styp$get]
//
#implfun
d3axp1_node$get
  ( daxp ) =
let
val+
D3AXP1
( loc0
, t2q0
, node) = daxp in node
end//end-of-[d3axp1_node$get]
//
(* ****** ****** *)
//
(*
#implfun
d3axp1_make_lctn$node
( loc0, node ) =
let
val
t2q0 = s2typ_none0((*0*))
in//let
  D3AXP1(loc0, t2q0, node) end
*)
//
#implfun
d3axp1_make_lctn$styp$node
( loc0, t2q0, node ) =
let
  D3AXP1(loc0, t2q0, node) end
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3axp1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3exp1 =
D3EXP1 of
(loctn
,d3typ1, d3exp1_node)
datavwtp
d3exp1_vt =
D3EXP1_vt of
(loctn
,d3typ1, d3exp1_node)
//
#absimpl d3exp1_tbox = d3exp1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3exp1_lctn$get
  ( dexp ) =
let
val+
D3EXP1
( loc0
, t3q0
, node) = dexp in loc0
end//end-of-[d3exp1_lctn$get]
//
#implfun
d3exp1_dtyp$get
  ( dexp ) =
let
val+
D3EXP1
( loc0
, t3q0
, node) = dexp in t3q0
end//end-of-[d3exp1_styp$get]
//
#implfun
d3exp1_node$get
  ( dexp ) =
let
val+
D3EXP1
( loc0
, t3q0
, node) = dexp in node
end//end-of-[d3exp1_node$get]
//
(* ****** ****** *)
//
#implfun
d3exp1_dvdtp
(dexp, vtps) =
let
//
val loc0 =
d3exp1_lctn$get(dexp)
val t3q0 =
d3exp1_dtyp$get(dexp)
//
in//let
//
d3exp1_make_lctn$dtyp$node
(
loc0,t3q0,D3E1dvdtp(dexp,vtps))
//
end//let//end-of-[d3exp1_dvdtp]
//
(* ****** ****** *)
(*
#implfun
d3exp1_make_lctn$node
( loc0, node ) =
let
val
t3q0 = d3typ1_none0((*0*))
in//let
  D3EXP1(loc0, t3q0, node) end
*)
//
#implfun
d3exp1_make_lctn$dtyp$node
( loc0, t3q0, node ) =
let
  D3EXP1(loc0, t3q0, node) end
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3exp1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
f3arg1 =
F3ARG1 of
(
loctn, f3arg1_node)
//
#absimpl f3arg1_tbox = f3arg1
//
in//local
//
#implfun
f3arg1_lctn$get(f3a) =
let
val+F3ARG1(loc,nod) = f3a in loc
end
#implfun
f3arg1_node$get(f3a) =
let
val+F3ARG1(loc,nod) = f3a in nod
end
//
#implfun
f3arg1_make_lctn$node
(  loc0, node  ) = F3ARG1(loc0,node)
//
endloc (*local*) // end of [local(f3arg1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
f3axp1 =
F3AXP1 of
(
loctn, f3axp1_node)
//
#absimpl f3axp1_tbox = f3axp1
//
in//local
//
#implfun
f3axp1_lctn$get(f3a) =
let
val+F3AXP1(loc,nod) = f3a in loc
end
#implfun
f3axp1_node$get(f3a) =
let
val+F3AXP1(loc,nod) = f3a in nod
end
//
#implfun
f3axp1_make_lctn$node
(  loc0, node  ) = F3AXP1(loc0,node)
//
endloc (*local*) // end of [local(f3axp1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3gua1 =
D3GUA1 of
(
loctn, d3gua1_node)
//
#absimpl d3gua1_tbox = d3gua1
//
in//local
//
#implfun
d3gua1_lctn$get(d3g) =
let
val+D3GUA1(loc,nod) = d3g in loc
end
#implfun
d3gua1_node$get(d3g) =
let
val+D3GUA1(loc,nod) = d3g in nod
end
//
#implfun
d3gua1_make_lctn$node
(  loc0, node  ) = D3GUA1(loc0,node)
//
endloc (*local*) // end-of-[local(d3gua1)]
//
(* ****** ****** *)
//
local
//
datatype
d3gpt1 =
D3GPT1 of
(
loctn, d3gpt1_node)
//
#absimpl d3gpt1_tbox = d3gpt1
//
in//local
//
#implfun
d3gpt1_lctn$get(gpt) =
let
val+D3GPT1(loc,nod) = gpt in loc
end
#implfun
d3gpt1_node$get(gpt) =
let
val+D3GPT1(loc,nod) = gpt in nod
end
//
#implfun
d3gpt1_make_lctn$node
(  loc0, node  ) = D3GPT1(loc0,node)
//
endloc (*local*) // end of [local(d3gpt1)]
//
(* ****** ****** *)
//
local
//
(*
HX-2025-11-25:
Note that [d3typ1]
is for the pattern guard;
it is T3Pnone if it is
"absorbed" into some name!
*)
datatype
d3cls1 =
D3CLS1 of
(loctn
,d3cls1_node
,d3typ1opt//dgrt
,dvstp1lst, dvdtp1lst)
//
#absimpl d3cls1_tbox = d3cls1
//
in//local
//
#implfun
d3cls1_lctn$get(cls) =
let
val+
D3CLS1
(loc, nod
,grt, vts1, vts2) = cls in loc
end//let//end-of-[d3cls1_lctn$get(...)]
#implfun
d3cls1_dgrt$get(cls) =
let
val+
D3CLS1
(loc, nod
,grt, vts1, vts2) = cls in grt
end//let//end-of-[d3cls1_dgrt$get(...)]
#implfun
d3cls1_node$get(cls) =
let
val+
D3CLS1
(loc, nod
,grt, vts1, vts2) = cls in nod
end//let//end-of-[d3cls1_node$get(...)]
//
#implfun
d3cls1_vts1$get(cls) =
let
val+
D3CLS1
(loc, nod
,grt, vts1, vts2) = cls in vts1
end//let//end-of-[d3cls1_vts1$get(...)]
#implfun
d3cls1_vts2$get(cls) =
let
val+
D3CLS1
(loc, nod
,grt, vts1, vts2) = cls in vts2
end//let//end-of-[d3cls1_vts2$get(...)]
//
#implfun
d3cls1_make_lctn$node
  (  loc0, node  ) =
let
val dgrt = optn_nil((*t3q0*))
val vts1 = list_nil((*void*))
val vts2 = list_nil((*void*))
in//let
D3CLS1
(loc0, node, dgrt, vts1, vts2) end
//
#implfun
d3cls1_make_lctn$node$rest
( loc0, node
, dgrt, vts1, vts2 ) =
(
D3CLS1(loc0, node, dgrt, vts1, vts2))
//
endloc (*local*) // end of [local(d3cls1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3ecl1 =
D3ECL1 of
(loctn, d3ecl1_node)
datavwtp
d3ecl1_vt =
D3ECL1_vt of
(loctn, d3ecl1_node)
//
#absimpl d3ecl1_tbox = d3ecl1
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
d3ecl1_lctn$get
  ( d3cl ) =
let
val+
D3ECL1
( loc0
, node) = d3cl in loc0
end//end-of-[d3ecl1_lctn$get]
//
#implfun
d3ecl1_node$get
  ( d3cl ) =
let
val+
D3ECL1
( loc0
, node) = d3cl in node
end//end-of-[d3ecl1_node$get]
//
(* ****** ****** *)
//
#implfun
d3ecl1_make_lctn$node
( loc0, node ) =
(
  D3ECL1(loc0, node))//implfun
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3ecl1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3valdcl1 =
D3VALDCL1 of
( loc_t
, d3pat1
, d3typ1opt // dgrt
, teqd3exp1, wths2exp)
//
#absimpl
d3valdcl1_tbox = d3valdcl1
//
in//local
//
#implfun
d3valdcl1_lctn$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat, dgrt
, tdxp, wsxp) = dval in lctn end
//
#implfun
d3valdcl1_dpat$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat, dgrt
, tdxp, wsxp) = dval in dpat end
//
#implfun
d3valdcl1_dgrt$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat, dgrt
, tdxp, wsxp) = dval in dgrt end
//
#implfun
d3valdcl1_tdxp$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat, dgrt
, tdxp, wsxp) = dval in tdxp end
//
#implfun
d3valdcl1_wsxp$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat, dgrt
, tdxp, wsxp) = dval in wsxp end
//
(* ****** ****** *)
//
#implfun
d3valdcl1_make_arg4
(lctn, dpat, tdxp, wsxp) =
let
val
dgrt = optn_nil(*t3q0*) in
D3VALDCL1(lctn, dpat, dgrt, tdxp, wsxp)
end//let//end-of-[d3valdcl1_make_arg4(...)]
//
#implfun
d3valdcl1_make_arg5
(lctn, dpat, dgrt, tdxp, wsxp) =
(
  D3VALDCL1(lctn, dpat, dgrt, tdxp, wsxp))
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(d3valdcl1)]
//
(* ****** ****** *)
//
local
//
datatype
d3vardcl1 =
D3VARDCL1 of
( loc_t
, d2var
, s2typ1
, d2varopt
, s2expopt, teqd3exp1)
//
#absimpl
d3vardcl1_tbox = d3vardcl1
//
in//local
//
#implfun
d3vardcl1_lctn$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid
, t2q1
, vpid
, sres, dini) = dvar in lctn end
//
#implfun
d3vardcl1_dpid$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid
, t2q1
, vpid
, sres, dini) = dvar in dpid end
//
#implfun
d3vardcl1_styp$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid
, t2q1
, vpid
, sres, dini) = dvar in t2q1 end
//
#implfun
d3vardcl1_vpid$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid
, t2q1
, vpid
, sres, dini) = dvar in vpid end
//
#implfun
d3vardcl1_sres$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid
, t2q1, vpid
, sres, dini) = dvar in sres end
//
#implfun
d3vardcl1_dini$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid
, t2q1
, vpid
, sres, dini) = dvar in dini end
//
(* ****** ****** *)
//
#implfun
d3vardcl1_make_args
( lctn
, dpid, t2q1, vpid, sres, dini) =
(
D3VARDCL1
(lctn, dpid, t2q1, vpid, sres, dini))
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(d3vardcl1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3fundcl1 =
D3FUNDCL1 of
( loc_t
, d2var
, s2typ1
, f3arg1lst
, f3axp1lst
, s2res(*return*)
, teqd3exp1, wths2exp
, dvstp1lst, dvdtp1lst)
//
#absimpl
d3fundcl1_tbox = d3fundcl1
//
in//local
//
#implfun
d3fundcl1_lctn$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in lctn
end // end of [d3fundcl1_lctn$get(...)]
//
#implfun
d3fundcl1_dpid$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in dpid
end // end of [d3fundcl1_dpid$get(...)]
//
#implfun
d3fundcl1_styp$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in t2q1
end // end of [d3fundcl1_styp$get(...)]
//
(* ****** ****** *)
//
#implfun
d3fundcl1_farg$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in farg
end // end of [d3fundcl1_farg$get(...)]
//
#implfun
d3fundcl1_faxp$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in faxp
end // end of [d3fundcl1_faxp$get(...)]
//
(* ****** ****** *)
//
#implfun
d3fundcl1_sres$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in sres
end // end of [d3fundcl1_sres$get(...)]

(* ****** ****** *)
//
#implfun
d3fundcl1_tdxp$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in tdxp
end // end of [d3fundcl1_tdxp$get(...)]
//
#implfun
d3fundcl1_wsxp$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in wsxp
end // end of [d3fundcl1_wsxp$get(...)]
//
#implfun
d3fundcl1_vts1$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in vts1
end // end of [d3fundcl1_vts1$get(...)]
#implfun
d3fundcl1_vts2$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, t2q1
, farg
, faxp, sres
, tdxp
, wsxp, vts1, vts2) = dfun in vts2
end // end of [d3fundcl1_vts2$get(...)]
//
(* ****** ****** *)
//
#implfun
d3fundcl1_make_args
( lctn
, dpid, t2q1
, farg, faxp, sres
, tdxp, wsxp, vts1, vts2) =
(
D3FUNDCL1
( lctn
, dpid,t2q1
, farg,faxp,sres,tdxp,wsxp,vts1,vts2)
) // end-of-[d3fundcl1_make_args(...)]
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(d3fundcl1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3parsed1 =
D3PARSED1 of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d3ecl1lstopt)//program
//
#absimpl
d3parsed1_tbox = d3parsed1
//
in//local
//
(* ****** ****** *)
//
#implfun
d3parsed1_stadyn$get
  (dpar) =
(
  stadyn ) where
{
val+
D3PARSED1
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d3parsed1_stadyn$get]
//
//
#implfun
d3parsed1_nerror$get
  (dpar) =
(
  nerror ) where
{
val+
D3PARSED1
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d3parsed1_nerror$get]
//
#implfun
d3parsed1_source$get
  (dpar) =
(
  source ) where
{
val+
D3PARSED1
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d3parsed1_source$get]
//
#implfun
d3parsed1_parsed$get
  (dpar) =
(
  parsed ) where
{
val+
D3PARSED1
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d3parsed1_parsed$get]
//
(* ****** ****** *)
//
#implfun
d3parsed1_make_args
( stadyn
, nerror, source, parsed) =
(
D3PARSED1
( stadyn
, nerror, source, parsed)) where
{
//
(*
val () =
prerrsln
("d3parsed1_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[d3parsed1_make_args]
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(d3parsed1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3parsed1_fprint
  (dpar, out0) =
let
//
#impltmp
g_print$out<>() = out0
in//let
g_print<d3ecl1lstopt>(dopt)
end//let
where
{
  val dopt = d3parsed1_parsed$get(dpar)
}(*where*)//end-of-[d3parsed1_fprint(dpar,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3.dats] *)
(***********************************************************************)
