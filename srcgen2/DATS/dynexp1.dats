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
Sun Jul 24 18:06:09 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload lctn with d0exp_get_lctn
#symload lctn with d0ecl_get_lctn
(* ****** ****** *)

#implfun
d1pat_none0
(  loc0  ) =
d1pat_make_node
(loc0,D1Pnone0((*void*)))
#implfun
d1pat_none1
(  dpat  ) =
d1pat_make_node
(
dpat.lctn(),D1Pnone1(dpat))

(* ****** ****** *)

#implfun
d1exp_none0
(  loc0  ) =
d1exp_make_node
(loc0,D1Enone0((*void*)))
#implfun
d1exp_none1
(  dexp  ) =
d1exp_make_node
(
dexp.lctn(),D1Enone1(dexp))

(* ****** ****** *)

#implfun
d1ecl_none1
(  d0cl  ) =
d1ecl_make_node
(
d0cl.lctn(),D1Cnone1(d0cl))

(* ****** ****** *)

local
//
datatype
d1pat =
D1PAT of
(loctn, d1pat_node)
//
#absimpl d1pat_tbox = d1pat
//
in (* in-of-local *)
//
#implfun
d1pat_make_node
(   loc,nod   ) = D1PAT(loc,nod)
//
#implfun
d1pat_get_lctn(d1p) =
let
  val+D1PAT(loc,nod) = d1p in loc
end
#implfun
d1pat_get_node(d1p) =
let
  val+D1PAT(loc,nod) = d1p in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1gua =
D1GUA of
(loctn, d1gua_node)
//
#absimpl d1gua_tbox = d1gua
//
in (* in-of-local *)
//
#implfun
d1gua_make_node
(   loc,nod   ) = D1GUA(loc,nod)
//
#implfun
d1gua_get_lctn(d1g) =
let
  val+D1GUA(loc,nod) = d1g in loc
end
#implfun
d1gua_get_node(d1g) =
let
  val+D1GUA(loc,nod) = d1g in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1gpt =
D1GPT of
(loctn, d1gpt_node)
//
#absimpl d1gpt_tbox = d1gpt
//
in (* in-of-local *)
//
#implfun
d1gpt_make_node
(   loc,nod   ) = D1GPT(loc,nod)
//
#implfun
d1gpt_get_lctn(d1g) =
let
  val+D1GPT(loc,nod) = d1g in loc
end
#implfun
d1gpt_get_node(d1g) =
let
  val+D1GPT(loc,nod) = d1g in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1cls =
D1CLS of
(loctn, d1cls_node)
//
#absimpl d1cls_tbox = d1cls
//
in (* in-of-local *)
//
#implfun
d1cls_make_node
(   loc,nod   ) = D1CLS(loc,nod)
//
#implfun
d1cls_get_lctn(dcl) =
let
  val+D1CLS(loc,nod) = dcl in loc
end
#implfun
d1cls_get_node(dcl) =
let
  val+D1CLS(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1exp =
D1EXP of
(loctn, d1exp_node)
//
#absimpl d1exp_tbox = d1exp
//
in (* in-of-local *)
//
#implfun
d1exp_make_node
(   loc,nod   ) = D1EXP(loc,nod)
//
#implfun
d1exp_get_lctn(d1e) =
let
  val+D1EXP(loc,nod) = d1e in loc
end
#implfun
d1exp_get_node(d1e) =
let
  val+D1EXP(loc,nod) = d1e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)
//
#implfun
t1qua_get_lctn
(    tqua    ) =
(
case+ tqua of
T1QUAsome(loc0, s1qs) => loc0)
#implfun
t1inv_get_lctn
(    tinv    ) =
(
case+ tqua of
T1INVsome(loc0,t1qs,d1ps) => loc0)
//
(* ****** ****** *)
//
#implfun
f1unarrw_get_lctn
(    arrw    ) =
(
case+ arrw of
| F1UNARRWdflt(loc0) => loc0
| F1UNARRWlist(loc0, s1es) => loc0)
//
(* ****** ****** *)

local
//
datatype
f1arg =
F1ARG of
(
loctn, f1arg_node)
#absimpl
f1arg_tbox = f1arg
//
in (* in-of-local *)
//
#implfun
f1arg_make_node
(   loc,nod   ) = F1ARG(loc,nod)
//
#implfun
f1arg_get_lctn(tia) =
let
  val+F1ARG(loc,nod) = tia in loc
end
#implfun
f1arg_get_node(tia) =
let
  val+F1ARG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
q1arg =
Q1ARG of
(
loctn, q1arg_node)
#absimpl
q1arg_tbox = q1arg
//
in (* in-of-local *)
//
#implfun
q1arg_make_node
(   loc,nod   ) = Q1ARG(loc,nod)
//
#implfun
q1arg_get_lctn(tia) =
let
  val+Q1ARG(loc,nod) = tia in loc
end
#implfun
q1arg_get_node(tia) =
let
  val+Q1ARG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s1qag =
S1QAG of
(
loctn, s1qag_node)
#absimpl
s1qag_tbox = s1qag
//
in (* in-of-local *)
//
#implfun
s1qag_make_node
(   loc,nod   ) = S1QAG(loc,nod)
//
#implfun
s1qag_get_lctn(tia) =
let
  val+S1QAG(loc,nod) = tia in loc
end
#implfun
s1qag_get_node(tia) =
let
  val+S1QAG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t1qag =
T1QAG of
(
loctn, t1qag_node)
#absimpl
t1qag_tbox = t1qag
//
in (* in-of-local *)
//
#implfun
t1qag_make_node
(   loc,nod   ) = T1QAG(loc,nod)
//
#implfun
t1qag_get_lctn(tia) =
let
  val+T1QAG(loc,nod) = tia in loc
end
#implfun
t1qag_get_node(tia) =
let
  val+T1QAG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t1iag =
T1IAG of
(
loctn, t1iag_node)
#absimpl
t1iag_tbox = t1iag
//
in (* in-of-local *)
//
#implfun
t1iag_make_node
(   loc,nod   ) = T1IAG(loc,nod)
//
#implfun
t1iag_get_lctn(tia) =
let
  val+T1IAG(loc,nod) = tia in loc
end
#implfun
t1iag_get_node(tia) =
let
  val+T1IAG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
a1typ =
A1TYP of
(
loctn, a1typ_node)
#absimpl
a1typ_tbox = a1typ
//
in (* in-of-local *)
//
#implfun
a1typ_make_node
(   loc,nod   ) = A1TYP(loc,nod)
//
#implfun
a1typ_get_lctn(tia) =
let
  val+A1TYP(loc,nod) = tia in loc
end
#implfun
a1typ_get_node(tia) =
let
  val+A1TYP(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1arg =
D1ARG of
(
loctn, d1arg_node)
#absimpl
d1arg_tbox = d1arg
//
in (* in-of-local *)
//
#implfun
d1arg_make_node
(   loc,nod   ) = D1ARG(loc,nod)
//
#implfun
d1arg_get_lctn(tia) =
let
  val+D1ARG(loc,nod) = tia in loc
end
#implfun
d1arg_get_node(tia) =
let
  val+D1ARG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1ecl =
D1ECL of
(loctn, d1ecl_node)
//
#absimpl d1ecl_tbox = d1ecl
//
in (* in-of-local *)
//
#implfun
d1ecl_make_node
(   loc,nod   ) = D1ECL(loc,nod)
//
#implfun
d1ecl_get_lctn(dcl) =
let
  val+D1ECL(loc,nod) = dcl in loc
end
#implfun
d1ecl_get_node(dcl) =
let
  val+D1ECL(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d1valdcl =
D1VALDCL of
( loc_t
, d1pat
, teqd1exp, wths1exp)
//
#absimpl
d1valdcl_tbox = d1valdcl
//
in//local

#implfun
d1valdcl_get_lctn
  (  dval  ) = let
val+
D1VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in lctn end

#implfun
d1valdcl_get_dpat
  (  dval  ) = let
val+
D1VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in dpat end

#implfun
d1valdcl_get_tdxp
  (  dval  ) = let
val+
D1VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in tdxp end

#implfun
d1valdcl_get_wsxp
  (  dval  ) = let
val+
D1VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in wsxp end

(* ****** ****** *)

#implfun
d1valdcl_make_args
(lctn, dpat, tdxp, wsxp) =
(
  D1VALDCL(lctn, dpat, tdxp, wsxp)
)

endloc (*local*) // end of [ local(d1valdcl) ]

(* ****** ****** *)

local
//
datatype
d1vardcl =
D1VARDCL of
( loc_t
, d1pid
, d1pidopt
, s1expopt, teqd1exp)
//
#absimpl
d1vardcl_tbox = d1vardcl
//
in//local

#implfun
d1vardcl_get_lctn
  (  dvar  ) = let
val+
D1VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in lctn end

#implfun
d1vardcl_get_dpid
  (  dvar  ) = let
val+
D1VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dpid end

#implfun
d1vardcl_get_vpid
  (  dvar  ) = let
val+
D1VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in vpid end

#implfun
d1vardcl_get_sres
  (  dvar  ) = let
val+
D1VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in sres end

#implfun
d1vardcl_get_dini
  (  dvar  ) = let
val+
D1VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dini end

(* ****** ****** *)

#implfun
d1vardcl_make_args
( lctn
, dpid, vpid, sres, dini) =
(
D1VARDCL(lctn, dpid, vpid, sres, dini)
)

endloc (*local*) // end of [ local(d1vardcl) ]

(* ****** ****** *)

local
//
datatype
d1fundcl =
D1FUNDCL of
( loc_t
, d1pid
, f1arglst
, s1res
, teqd1exp, wths1exp)
//
#absimpl
d1fundcl_tbox = d1fundcl
//
in//local

#implfun
d1fundcl_get_lctn
  (  dfun  ) = let
val+
D1FUNDCL
( lctn
, dpid
, farg
, sres
, tdxp, wsxp) = dfun in lctn end

#implfun
d1fundcl_get_dpid
  (  dfun  ) = let
val+
D1FUNDCL
( lctn
, dpid
, farg
, sres
, tdxp, wsxp) = dfun in dpid end

#implfun
d1fundcl_get_farg
  (  dfun  ) = let
val+
D1FUNDCL
( lctn
, dpid
, farg
, sres
, tdxp, wsxp) = dfun in farg end

#implfun
d1fundcl_get_sres
  (  dfun  ) = let
val+
D1FUNDCL
( lctn
, dpid
, farg
, sres
, tdxp, wsxp) = dfun in sres end

#implfun
d1fundcl_get_tdxp
  (  dfun  ) = let
val+
D1FUNDCL
( lctn
, dpid
, farg
, sres
, tdxp, wsxp) = dfun in tdxp end

#implfun
d1fundcl_get_wsxp
  (  dfun  ) = let
val+
D1FUNDCL
( lctn
, dpid
, farg
, sres
, tdxp, wsxp) = dfun in wsxp end

(* ****** ****** *)

#implfun
d1fundcl_make_args
( lctn
, dpid, farg
, sres, tdxp, wsxp) =
(
D1FUNDCL(lctn,dpid,farg,sres,tdxp,wsxp)
)

endloc (*local*) // end of [ local(d1fundcl) ]

(* ****** ****** *)

local
//
datatype
d1cstdcl =
D1CSTDCL of
( loc_t
, d1pid
, d1arglst,s1res,d1res)
//
#absimpl
d1cstdcl_tbox = d1cstdcl
//
in//local
//
#implfun
d1cstdcl_get_lctn
  (  dcst  ) = let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in lctn end
//
#implfun
d1cstdcl_get_darg
  (  dcst  ) = let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in darg end
//
#implfun
d1cstdcl_get_dpid
  (  dcst  ) = let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dpid end
//
#implfun
d1cstdcl_get_sres
  (  dcst  ) = let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in sres end
//
#implfun
d1cstdcl_get_dres
  (  dcst  ) = let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dres end
//
#implfun
d1cstdcl_make_args
(lctn, dpid, darg, sred, dres) =
D1CSTDCL(lctn, dpid, darg, sred, dres)
//
endloc (*local*) // end of [ local(d1cstdcl) ]

(* ****** ****** *)

local
//
datatype
d1parsed =
D1PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d1eclistopt)//program
//
#absimpl
d1parsed_tbox = d1parsed
//
in//local

(* ****** ****** *)

#implfun
d1parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D1PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d1parsed_get_stadyn]

(* ****** ****** *)

#implfun
d1parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D1PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d1parsed_get_nerror]

(* ****** ****** *)

#implfun
d1parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D1PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d1parsed_get_source]

(* ****** ****** *)

#implfun
d1parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D1PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d1parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d1parsed_make_args
(stadyn,nerror,source,parsed) =
(
D1PARSED(stadyn,nerror,source,parsed)
) where
{
(*
val () =
prerrln
("d1parsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[d1parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d1parsed) ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp1.dats] *)
