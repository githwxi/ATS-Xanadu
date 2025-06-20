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
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../../SATS/locinfo.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3pat1 =
D3PAT1 of
(loctn
,s2typ, d3pat1_node)
datavwtp
d3pat1_vt =
D3PAT1_vt of
(loctn
,s2typ, d3pat1_node)
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
#implfun
d3pat1_make_lctn$node
( loc0, node ) =
let
val
t2p0 = s2typ_none0((*0*))
in//let
  D3PAT1(loc0, t2p0, node) end
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
,s2typ, d3exp1_node)
datavwtp
d3exp1_vt =
D3EXP1_vt of
(loctn
,s2typ, d3exp1_node)
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
#implfun
d3exp1_make_lctn$node
( loc0, node ) =
let
val
t2p0 = s2typ_none0((*0*))
in//let
  D3EXP1(loc0, t2p0, node) end
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
in (* in-of-local *)
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
local
//
#staload
"./../DATS/dynexp3_print0.dats"
//
in//local
//
#implfun
d3pat1_fprint
(dpat, out0) =
(
g_print<d3pat1>(dpat)
) where
{
#impltmp g_print$out<>() = out0
}(*where*)//end-of-[d3pat1_fprint(dpat,out0)]
//
#implfun
d3exp1_fprint
(dexp, out0) =
(
g_print<d3exp1>(dexp)
) where
{
#impltmp g_print$out<>() = out0
}(*where*)//end-of-[d3exp1_fprint(dexp,out0)]
//
#implfun
d3ecl1_fprint
(d3cl, out0) =
(
g_print<d3ecl1>(d3cl)
) where
{
#impltmp g_print$out<>() = out0
}(*where*)//end-of-[d3ecl1_fprint(d3cl,out0)]
//
(* ****** ****** *)
//
end//local[staload("./../DATS/dynexp3_print0.dats")]
//
(* ****** ****** *)
(* ****** ****** *)
//
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
