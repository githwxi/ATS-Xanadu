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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun Feb 22 10:24:37 AM EST 2026
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
//
#staload
"./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "\
./../../../SATS/locinfo.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0typ1 =
I0TYP1 of
(sort2, i0typ1_node)
datavwtp
i0typ1_vt =
I0TYP1_vt of
(sort2, i0typ1_node)
//
#absimpl i0typ1_tbox = i0typ1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i0typ1_sort$get
  ( ityp ) =
let
val+
I0TYP1
( i0t0
, node) = ityp in i0t0
end//end-of-[i0typ1_sort$get]
//
#implfun
i0typ1_node$get
  ( ityp ) =
let
val+
I0TYP1
( i0t0
, node) = ityp in node
end//end-of-[i0typ1_node$get]
//
(* ****** ****** *)
//
#implfun
i0typ1_make_sort$node
  ( s2t0, node ) =
(
  I0TYP1(s2t0, node) )//implfun
//
(* ****** ****** *)
//
endloc(*local*)//end-of-[local(i0typ1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0pat1 =
I0PAT1 of
(loctn
,i0typ1, i0pat1_node)
datavwtp
i0pat1_vt =
I0PAT1_vt of
(loctn
,i0typ1, i0pat1_node)
//
#absimpl i0pat1_tbox = i0pat1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i0pat1_lctn$get
  ( ipat ) =
let
val+
I0PAT1
( loc0
, i0t0
, node) = ipat in loc0
end//end-of-[i0pat1_lctn$get]
//
#implfun
i0pat1_ityp$get
  ( ipat ) =
let
val+
I0PAT1
( loc0
, i0t0
, node) = ipat in i0t0
end//end-of-[i0pat1_ityp$get]
//
#implfun
i0pat1_node$get
  ( ipat ) =
let
val+
I0PAT1
( loc0
, i0t0
, node) = ipat in node
end//end-of-[i0pat1_node$get]
//
(* ****** ****** *)
//
(*
#implfun
i0pat1_make_lctn$node
( loc0, node ) =
let
val
i0t0 = i0typ_none0((*0*))
in//let
  I0PAT1(loc0, i0t0, node) end
*)
//
#implfun
i0pat1_make_lctn$ityp$node
( loc0, i0t0, node ) =
let
  I0PAT1(loc0, i0t0, node) end
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(i0pat1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0exp1 =
I0EXP1 of
(loctn
,i0typ1, i0exp1_node)
datavwtp
i0exp1_vt =
I0EXP1_vt of
(loctn
,i0typ1, i0exp1_node)
//
#absimpl i0exp1_tbox = i0exp1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i0exp1_lctn$get
  ( iexp ) =
let
val+
I0EXP1
( loc0
, i0t0
, node) = iexp in loc0
end//end-of-[i0exp1_lctn$get]
//
#implfun
i0exp1_ityp$get
  ( iexp ) =
let
val+
I0EXP1
( loc0
, i0t0
, node) = iexp in i0t0
end//end-of-[i0exp1_ityp$get]
//
#implfun
i0exp1_node$get
  ( iexp ) =
let
val+
I0EXP1
( loc0
, i0t0
, node) = iexp in node
end//end-of-[i0exp1_node$get]
//
(* ****** ****** *)
//
(*
#implfun
i0exp1_make_lctn$node
( loc0, node ) =
let
val
i0t0 = i0typ_none0((*0*))
in//let
  I0EXP1(loc0, i0t0, node) end
*)
//
#implfun
i0exp1_make_lctn$ityp$node
( loc0, i0t0, node ) =
let
  I0EXP1(loc0, i0t0, node) end
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(i0exp1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0dcl1 =
I0DCL1 of
(loctn, i0dcl1_node)
datavwtp
i0dcl1_vt =
I0DCL1_vt of
(loctn, i0dcl1_node)
//
#absimpl i0dcl1_tbox = i0dcl1
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
i0dcl1_lctn$get
  ( idcl ) =
let
val+
I0DCL1
( loc0
, node) = idcl in loc0
end//end-of-[i0dcl1_lctn$get]
//
#implfun
i0dcl1_node$get
  ( idcl ) =
let
val+
I0DCL1
( loc0
, node) = idcl in node
end//end-of-[i0dcl1_node$get]
//
(* ****** ****** *)
//
#implfun
i0dcl1_make_lctn$node
( loc0, node ) =
(
  I0DCL1(loc0, node))//implfun
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(i0dcl1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0valdcl1 =
I0VALDCL1 of
( loc_t
, i0pat1
, d3typ1opt // dgrt
, teqi0exp1, wths2exp)
//
#absimpl
i0valdcl1_tbox = i0valdcl1
//
in//local
//
#implfun
i0valdcl1_lctn$get
  (  ival  ) = let
val+
I0VALDCL1
( lctn
, ipat, dgrt
, tixp, wsxp) = ival in lctn end
//
#implfun
i0valdcl1_ipat$get
  (  ival  ) = let
val+
I0VALDCL1
( lctn
, ipat, dgrt
, tixp, wsxp) = ival in ipat end
//
#implfun
i0valdcl1_tixp$get
  (  ival  ) = let
val+
I0VALDCL1
( lctn
, ipat, dgrt
, tixp, wsxp) = ival in tixp end
//
(* ****** ****** *)
//
#implfun
i0valdcl1_make_arg5
(lctn, ipat, dgrt, tixp, wsxp) =
(
I0VALDCL1(lctn, ipat, dgrt, tixp, wsxp))
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(i0valdcl1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
local
//
datatype
i0vardcl1 =
I0VARDCL1 of
( loc_t
, d2var
, i0typ1
, d2varopt
, s2expopt, teqi0exp1)
//
#absimpl
i0vardcl1_tbox = i0vardcl1
//
in//local
//
#implfun
i0vardcl1_lctn$get
  (  ivar  ) = let
val+
I0VARDCL1
( lctn
, dpid
, i0t1
, vpid
, sres, dini) = ivar in lctn end
//
#implfun
i0vardcl1_dpid$get
  (  ivar  ) = let
val+
I0VARDCL1
( lctn
, dpid
, i0t1
, vpid
, sres, dini) = ivar in dpid end
//
#implfun
i0vardcl1_ityp$get
  (  ivar  ) = let
val+
I0VARDCL1
( lctn
, dpid
, i0t1
, vpid
, sres, dini) = ivar in i0t1 end
//
#implfun
i0vardcl1_vpid$get
  (  ivar  ) = let
val+
I0VARDCL1
( lctn
, dpid
, i0t1
, vpid
, sres, dini) = ivar in vpid end
//
#implfun
i0vardcl1_sres$get
  (  ivar  ) = let
val+
I0VARDCL1
( lctn
, dpid
, i0t1
, vpid
, sres, dini) = ivar in sres end
//
#implfun
i0vardcl1_dini$get
  (  ivar  ) = let
val+
I0VARDCL1
( lctn
, dpid
, i0t1
, vpid
, sres, dini) = ivar in dini end
//
(* ****** ****** *)
//
#implfun
i0vardcl1_make_args
( lctn
, dpid, i0t1, vpid, sres, dini) =
(
I0VARDCL1
(lctn, dpid, i0t1, vpid, sres, dini))
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(i0vardcl1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0fundcl1 =
I0FUNDCL1 of
( loc_t
, d2var
, i0typ1
//
, d2varlst // denv
//
, f3arg1lst
, f3axp1lst
, dvdtp1lst
, s2res(*return*)
, teqi0exp1, wths2exp
, dvstp1lst, dvdtp1lst)
//
#absimpl
i0fundcl1_tbox = i0fundcl1
//
in//local
//
(* ****** ****** *)
//
#implfun
i0fundcl1_lctn$get
  (  dfun  ) = let
val+
I0FUNDCL1
( lctn
, dpid
, i0t1
//
, denv//d2vs
//
, farg, faxp
, evts
, sres, tixp
, wsxp, vts1, vts2) = dfun in lctn
end // end of [i0fundcl1_lctn$get(...)]
//
(* ****** ****** *)
//
#implfun
i0fundcl1_dpid$get
  (  dfun  ) = let
val+
I0FUNDCL1
( lctn
, dpid
, i0t1
//
, denv//d2vs
//
, farg, faxp
, evts
, sres, tixp
, wsxp, vts1, vts2) = dfun in dpid
end // end of [i0fundcl1_dpid$get(...)]
//
(* ****** ****** *)
//
#implfun
i0fundcl1_ityp$get
  (  dfun  ) = let
val+
I0FUNDCL1
( lctn
, dpid
, i0t1
//
, denv//d2vs
//
, farg, faxp
, evts
, sres, tixp
, wsxp, vts1, vts2) = dfun in i0t1
end // end of [i0fundcl1_ityp$get(...)]
//
(* ****** ****** *)
//
#implfun
i0fundcl1_denv$get
  (  dfun  ) = let
val+
I0FUNDCL1
( lctn
, dpid
, i0t1
//
, denv//d2vs
//
, farg, faxp
, evts
, sres, tixp
, wsxp, vts1, vts2) = dfun in denv
end // end of [i0fundcl1_denv$get(...)]
//
(* ****** ****** *)
//
#implfun
i0fundcl1_farg$get
  (  dfun  ) = let
val+
I0FUNDCL1
( lctn
, dpid, i0t1
, denv
, farg, faxp
, evts
, sres, tixp
, wsxp, vts1, vts2) = dfun in farg
end // end of [i0fundcl1_farg$get(...)]
//
(* ****** ****** *)
//
#implfun
i0fundcl1_tixp$get
  (  dfun  ) = let
val+
I0FUNDCL1
( lctn
, dpid
, i0t1
, denv//d2vs
, farg, faxp
, evts
, sres, tixp
, wsxp, vts1, vts2) = dfun in tixp
end // end of [i0fundcl1_tixp$get(...)]
//
(* ****** ****** *)
//
#implfun
i0fundcl1_make_args
( lctn
, dpid, i0t1
, denv
, farg, faxp
, evts, sres, tixp
, wsxp, vts1, vts2) =
(
I0FUNDCL1
( lctn
, dpid, i0t1
, denv
, farg, faxp
, evts, sres, tixp, wsxp,vts1,vts2)
) // end-of-[i0fundcl1_make_args(...)]
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(i0fundcl1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_intrep0.dats] *)
(***********************************************************************)
