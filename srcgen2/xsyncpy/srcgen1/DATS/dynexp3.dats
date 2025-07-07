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
, t2p0
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
, t2p0
, node) = dpat in t2p0
end//end-of-[d3pat1_styp$get]
//
#implfun
d3pat1_node$get
  ( dpat ) =
let
val+
D3PAT1
( loc0
, t2p0
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
t2p0 = s2typ_none0((*0*))
in//let
  D3PAT1(loc0, t2p0, node) end
*)
//
#implfun
d3pat1_make_lctn$styp$node
( loc0, t2p0, node ) =
let
  D3PAT1(loc0, t2p0, node) end
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
d3exp1 =
D3EXP1 of
(loctn
,s2typ1, d3exp1_node)
datavwtp
d3exp1_vt =
D3EXP1_vt of
(loctn
,s2typ1, d3exp1_node)
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
, t2p0
, node) = dexp in loc0
end//end-of-[d3exp1_lctn$get]
//
#implfun
d3exp1_styp$get
  ( dexp ) =
let
val+
D3EXP1
( loc0
, t2p0
, node) = dexp in t2p0
end//end-of-[d3exp1_styp$get]
//
#implfun
d3exp1_node$get
  ( dexp ) =
let
val+
D3EXP1
( loc0
, t2p0
, node) = dexp in node
end//end-of-[d3exp1_node$get]
//
(* ****** ****** *)
//
(*
#implfun
d3exp1_make_lctn$node
( loc0, node ) =
let
val
t2p0 = s2typ_none0((*0*))
in//let
  D3EXP1(loc0, t2p0, node) end
*)
//
#implfun
d3exp1_make_lctn$styp$node
( loc0, t2p0, node ) =
let
  D3EXP1(loc0, t2p0, node) end
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
#absimpl
f3arg1_tbox = f3arg1
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
d3gua1 =
D3GUA1 of
(
loctn, d3gua1_node)
#absimpl
d3gua1_tbox = d3gua1
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
#absimpl
d3gpt1_tbox = d3gpt1
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
datatype
d3cls1 =
D3CLS1 of
(
loctn, d3cls1_node)
#absimpl
d3cls1_tbox = d3cls1
//
in//local
//
#implfun
d3cls1_lctn$get(cls) =
let
  val+D3CLS1(loc,nod) = cls in loc
end
#implfun
d3cls1_node$get(cls) =
let
  val+D3CLS1(loc,nod) = cls in nod
end
//
#implfun
d3cls1_make_lctn$node
(  loc0, node  ) = D3CLS1(loc0,node)
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
( loctn, d3ecl1_node)
datavwtp
d3ecl1_vt =
D3ECL1_vt of
( loctn, d3ecl1_node)
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
, dpat
, tdxp, wsxp) = dval in lctn end
//
#implfun
d3valdcl1_dpat$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat
, tdxp, wsxp) = dval in dpat end
//
#implfun
d3valdcl1_tdxp$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat
, tdxp, wsxp) = dval in tdxp end
//
#implfun
d3valdcl1_wsxp$get
  (  dval  ) = let
val+
D3VALDCL1
( lctn
, dpat
, tdxp, wsxp) = dval in wsxp end
//
(* ****** ****** *)
//
#implfun
d3valdcl1_make_args
(lctn, dpat, tdxp, wsxp) =
(
  D3VALDCL1(lctn, dpat, tdxp, wsxp))
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
, dpid, vpid
, sres, dini) = dvar in lctn end
//
#implfun
d3vardcl1_dpid$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid, vpid
, sres, dini) = dvar in dpid end
//
#implfun
d3vardcl1_vpid$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid, vpid
, sres, dini) = dvar in vpid end
//
#implfun
d3vardcl1_sres$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid, vpid
, sres, dini) = dvar in sres end
//
#implfun
d3vardcl1_dini$get
  (  dvar  ) = let
val+
D3VARDCL1
( lctn
, dpid, vpid
, sres, dini) = dvar in dini end
//
(* ****** ****** *)
//
#implfun
d3vardcl1_make_args
( lctn
, dpid, vpid, sres, dini) =
(
D3VARDCL1(lctn, dpid, vpid, sres, dini))
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
, f3arg1lst, s2res
, teqd3exp1, wths2exp)
//
#absimpl
d3fundcl1_tbox = d3fundcl1
//
in//local

#implfun
d3fundcl1_lctn$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in lctn end

#implfun
d3fundcl1_dpid$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in dpid end

#implfun
d3fundcl1_farg$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in farg end

#implfun
d3fundcl1_sres$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in sres end

(* ****** ****** *)

#implfun
d3fundcl1_tdxp$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in tdxp end

#implfun
d3fundcl1_wsxp$get
  (  dfun  ) = let
val+
D3FUNDCL1
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in wsxp end
//
(* ****** ****** *)
//
#implfun
d3fundcl1_make_args
( lctn
, dpid, farg, sres, tdxp, wsxp) =
(
D3FUNDCL1
(lctn, dpid, farg, sres, tdxp, wsxp))
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
