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
Thu 16 Feb 2023 06:35:54 AM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2exp_get_node
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload lctn with d2exp_get_lctn
#symload lctn with d2ecl_get_lctn
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload lctn with d3exp_get_lctn
#symload lctn with d3ecl_get_lctn
(* ****** ****** *)
//
#implfun
d3pat_none0
(  loc0  ) =
d3pat_make_node
(loc0,D3Pnone0((*void*)))
#implfun
d3pat_none1
(  dpat  ) =
d3pat_make_node
(
dpat.lctn(),D3Pnone1(dpat))
#implfun
d3pat_none2
(  dpat  ) =
d3pat_make_node
(
dpat.lctn(),D3Pnone2(dpat))
//
(* ****** ****** *)
//
#implfun
d3exp_none0
(  loc0  ) =
d3exp_make_node
(loc0,D3Enone0((*void*)))
#implfun
d3exp_none1
(  dexp  ) =
d3exp_make_node
(
dexp.lctn(),D3Enone1(dexp))
#implfun
d3exp_none2
(  dexp  ) =
d3exp_make_node
(
dexp.lctn(),D3Enone2(dexp))
//
(* ****** ****** *)
//
#implfun
d3ecl_none0
(  loc0  ) =
d3ecl_make_node
(loc0,D3Cnone0((*void*)))
#implfun
d3ecl_none1
(  d2cl  ) =
d3ecl_make_node
(
d2cl.lctn(),D3Cnone1(d2cl))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
#implfun
the_d3imp_stamp_new
  ((*nil*)) = stamper.getinc((*0*))
endloc // end of [the_d3imp_stamp_new]
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
d3pat =
D3PAT of
( loctn
, s2typ, d3pat_node)
datavwtp
d3pat_vt =
D3PAT_vt of
( loctn
, s2typ, d3pat_node)
//
#absimpl d3pat_tbox = d3pat
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3pat_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
D3PAT(loc, t2p, nod) endlet
//
(* ****** ****** *)
//
#implfun
d3pat_get_lctn(d3p) =
let
val+
D3PAT(loc,t2p,nod) = d3p in loc
end
#implfun
d3pat_get_node(d3p) =
let
val+
D3PAT(loc,t2p,nod) = d3p in nod
end
#implfun
d3pat_get_styp(d3p) =
let
val+
D3PAT(loc,t2p,nod) = d3p in t2p
end
//
(* ****** ****** *)
//
#implfun
d3pat_set_styp
( d3p0, t2p0 ) =
let
//
val
d3p0 =
$UN.castlin10{d3pat_vt}(d3p0)
val+
@D3PAT_vt
(loc0,
!styp,node) = d3p0 in styp := t2p0
end (*let*) // end of [d3pat_set_styp]
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3pat)]

(* ****** ****** *)
//
#implfun
d3pat_make_tpnd
( loc0, t2p0, node ) =
let
  val
  d3p0 = d3pat(loc0, node)
in
  (d3pat_set_styp(d3p0, t2p0); d3p0)
end(*let*)//end-of-[d3pat_make_tpnd(...)]
//
(* ****** ****** *)

local
//
datatype
d3exp =
D3EXP of
( loctn
, s2typ, d3exp_node)
datavwtp
d3exp_vt =
D3EXP_vt of
( loctn
, s2typ, d3exp_node)
//
#absimpl d3exp_tbox = d3exp
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3exp_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
D3EXP(loc, t2p, nod) endlet
//
(* ****** ****** *)
//
#implfun
d3exp_get_lctn(d3e) =
let
val+
D3EXP(loc,t2p,nod) = d3e in loc
end
#implfun
d3exp_get_styp(d3e) =
let
val+
D3EXP(loc,t2p,nod) = d3e in t2p
end
#implfun
d3exp_get_node(d3e) =
let
val+
D3EXP(loc,t2p,nod) = d3e in nod
end
//
(* ****** ****** *)
//
#implfun
d3exp_set_styp
( d3e0, t2p0 ) =
let
//
val
d3e0 =
$UN.castlin10{d3exp_vt}(d3e0)
val+
@D3EXP_vt
(loc0,
!styp,node) = d3e0 in styp := t2p0
end (*let*) // end of [d3exp_set_styp]
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3exp)]

(* ****** ****** *)
//
#implfun
d3exp_make_tpnd
( loc0, t2p0, node ) =
let
  val
  d3e0 = d3exp(loc0, node)
in
  (d3exp_set_styp(d3e0, t2p0); d3e0)
end(*let*)//end-of-[d3exp_make_tpnd(...)]
//
(* ****** ****** *)

local
//
datatype
f3arg =
F3ARG of
(
loctn, f3arg_node)
#absimpl
f3arg_tbox = f3arg
//
in (* in-of-local *)
//
#implfun
f3arg_make_node
(   loc,nod   ) = F3ARG(loc,nod)
//
#implfun
f3arg_get_lctn(f3a) =
let
  val+F3ARG(loc,nod) = f3a in loc
end
#implfun
f3arg_get_node(f3a) =
let
  val+F3ARG(loc,nod) = f3a in nod
end
//
endloc (*local*) // end of [local(f3arg)]

(* ****** ****** *)

local
//
datatype
d3gua =
D3GUA of
(
loctn, d3gua_node)
#absimpl
d3gua_tbox = d3gua
//
in (* in-of-local *)
//
#implfun
d3gua_make_node
(   loc,nod   ) = D3GUA(loc,nod)
//
#implfun
d3gua_get_lctn(d3g) =
let
  val+D3GUA(loc,nod) = d3g in loc
end
#implfun
d3gua_get_node(d3g) =
let
  val+D3GUA(loc,nod) = d3g in nod
end
//
endloc (*local*) // end of [local(d3gua)]

(* ****** ****** *)

local
//
datatype
d3gpt =
D3GPT of
(
loctn, d3gpt_node)
#absimpl
d3gpt_tbox = d3gpt
//
in (* in-of-local *)
//
#implfun
d3gpt_make_node
(   loc,nod   ) = D3GPT(loc,nod)
//
#implfun
d3gpt_get_lctn(gpt) =
let
  val+D3GPT(loc,nod) = gpt in loc
end
#implfun
d3gpt_get_node(gpt) =
let
  val+D3GPT(loc,nod) = gpt in nod
end
//
endloc (*local*) // end of [local(d3gpt)]

(* ****** ****** *)

local
//
datatype
d3cls =
D3CLS of
(
loctn, d3cls_node)
#absimpl
d3cls_tbox = d3cls
//
in (* in-of-local *)
//
#implfun
d3cls_make_node
(   loc,nod   ) = D3CLS(loc,nod)
//
#implfun
d3cls_get_lctn(cls) =
let
  val+D3CLS(loc,nod) = cls in loc
end
#implfun
d3cls_get_node(cls) =
let
  val+D3CLS(loc,nod) = cls in nod
end
//
endloc (*local*) // end of [local(d3cls)]

(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
timpl =
TIMPL of
(
stamp, timpl_node)
datatype
timpl_vt =
TIMPL_vt of
(
stamp, timpl_node)
//
#absimpl
timpl_tbox = timpl
//
in (* in-of-local *)
//
#implfun
timpl_make_node
(   stm,nod   ) = TIMPL(stm,nod)
//
(* ****** ****** *)
//
#implfun
timpl_get_stmp(tmp) =
let
  val+TIMPL(stm,nod) = tmp in stm
end
#implfun
timpl_get_node(tmp) =
let
  val+TIMPL(stm,nod) = tmp in nod
end
//
(* ****** ****** *)
//
end (*local*) // end of [local(timpl)]

(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
d3ecl =
D3ECL of
(loctn, d3ecl_node)
//
#absimpl d3ecl_tbox = d3ecl
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3ecl_make_node
(   loc,nod   ) = D3ECL(loc,nod)
//
(* ****** ****** *)
//
#implfun
d3ecl_get_lctn(dcl) =
let
  val+D3ECL(loc,nod) = dcl in loc
end
#implfun
d3ecl_get_node(dcl) =
let
  val+D3ECL(loc,nod) = dcl in nod
end
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3ecl)]

(* ****** ****** *)

local
//
datatype
d3valdcl =
D3VALDCL of
( loc_t
, d3pat
, teqd3exp, wths2exp)
//
#absimpl
d3valdcl_tbox = d3valdcl
//
in//local

#implfun
d3valdcl_get_lctn
  (  dval  ) = let
val+
D3VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in lctn end

#implfun
d3valdcl_get_dpat
  (  dval  ) = let
val+
D3VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in dpat end

#implfun
d3valdcl_get_tdxp
  (  dval  ) = let
val+
D3VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in tdxp end

#implfun
d3valdcl_get_wsxp
  (  dval  ) = let
val+
D3VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in wsxp end

(* ****** ****** *)

#implfun
d3valdcl_make_args
(lctn, dpat, tdxp, wsxp) =
(
  D3VALDCL(lctn, dpat, tdxp, wsxp)
)

endloc (*local*) // end of [local(d3valdcl)]

(* ****** ****** *)

local
//
datatype
d3vardcl =
D3VARDCL of
( loc_t
, d2var
, d2varopt
, s2expopt, teqd3exp)
//
#absimpl
d3vardcl_tbox = d3vardcl
//
in//local

#implfun
d3vardcl_get_lctn
  (  dvar  ) = let
val+
D3VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in lctn end

#implfun
d3vardcl_get_dpid
  (  dvar  ) = let
val+
D3VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dpid end

#implfun
d3vardcl_get_vpid
  (  dvar  ) = let
val+
D3VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in vpid end

#implfun
d3vardcl_get_sres
  (  dvar  ) = let
val+
D3VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in sres end

#implfun
d3vardcl_get_dini
  (  dvar  ) = let
val+
D3VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dini end

(* ****** ****** *)

#implfun
d3vardcl_make_args
( lctn
, dpid, vpid, sres, dini) =
(
D3VARDCL(lctn, dpid, vpid, sres, dini)
)

endloc (*local*) // end of [ local(d3vardcl) ]

(* ****** ****** *)

local
//
datatype
d3fundcl =
D3FUNDCL of
( loc_t
, d2var
, f3arglst
, s2res
, teqd3exp, wths2exp)
//
#absimpl
d3fundcl_tbox = d3fundcl
//
in//local

#implfun
d3fundcl_get_lctn
  (  dfun  ) = let
val+
D3FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in lctn end

#implfun
d3fundcl_get_dpid
  (  dfun  ) = let
val+
D3FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in dpid end

#implfun
d3fundcl_get_farg
  (  dfun  ) = let
val+
D3FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in farg end

#implfun
d3fundcl_get_sres
  (  dfun  ) = let
val+
D3FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in sres end

(* ****** ****** *)

#implfun
d3fundcl_get_tdxp
  (  dfun  ) = let
val+
D3FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in tdxp end

#implfun
d3fundcl_get_wsxp
  (  dfun  ) = let
val+
D3FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in wsxp end

(* ****** ****** *)

#implfun
d3fundcl_make_args
( lctn
, dpid, farg, sres, tdxp, wsxp) =
(
D3FUNDCL
(lctn, dpid, farg, sres, tdxp, wsxp))

(* ****** ****** *)

endloc (*local*) // end of [ local(d3fundcl) ]

(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
d3parsed =
D3PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d1topenv // t1penv
,
d2topenv // t2penv
,
d3topenv // t3penv
,
d3eclistopt)//program
//
#absimpl
d3parsed_tbox = d3parsed
//
in//local

(* ****** ****** *)

#implfun
d3parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d3parsed_get_stadyn]

(* ****** ****** *)

#implfun
d3parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d3parsed_get_nerror]

(* ****** ****** *)

#implfun
d3parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d3parsed_get_source]

(* ****** ****** *)

#implfun
d3parsed_get_t1penv
  (dpar) =
(
  t1penv ) where
{
val+
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d3parsed_get_t1penv]

(* ****** ****** *)

#implfun
d3parsed_get_t2penv
  (dpar) =
(
  t2penv ) where
{
val+
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d3parsed_get_t2penv]

(* ****** ****** *)

#implfun
d3parsed_get_t3penv
  (dpar) =
(
  t3penv ) where
{
val+
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d3parsed_get_t3penv]

(* ****** ****** *)

#implfun
d3parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d3parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d3parsed_make_args
( stadyn
, nerror, source
, t1penv, t2penv
, t3penv, parsed) =
(
D3PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed)) where
{
//
(*
val () =
prerrln
("d3parsed_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[d3parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d3parsed) ]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_dynexp3.dats] *)
