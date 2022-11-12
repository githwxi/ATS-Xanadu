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
Sat 27 Aug 2022 02:42:37 AM EDT
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload lctn with d1exp_get_lctn
#symload lctn with d1ecl_get_lctn
(* ****** ****** *)
//
#implfun
d2pat_none0
(  loc0  ) =
d2pat_make_node
(loc0,D2Pnone0((*void*)))
//
#implfun
d2pat_none1
(  dpat  ) =
d2pat_make_node
(
dpat.lctn(),D2Pnone1(dpat))
//
(* ****** ****** *)
//
#implfun
d2pat_any
(  loc0  ) =
(
 d2pat(loc0, D2Pany()))
//
(* ****** ****** *)
//
#implfun
d2pat_var
(loc0, dvar) =
(
 d2pat(loc0, D2Pvar(dvar)))
//
(* ****** ****** *)
#implfun
d2pat_sapp
(loc0, d2f0, s2vs) =
d2pat_make_node
(loc0, D2Psapp(d2f0, s2vs))
(* ****** ****** *)
//
#implfun
d2pat_dapp
(loc0, d2f0, npf1, d2as) =
(
d2pat_make_node
( loc0
, D2Pdapp(d2f0, npf1, d2as)))
//
(* ****** ****** *)
//
#implfun
d2exp_none0
(  loc0  ) =
d2exp_make_node
(loc0,D2Enone0((*void*)))
//
#implfun
d2exp_none1
(  dexp  ) =
d2exp_make_node
(
dexp.lctn(),D2Enone1(dexp))
//
(* ****** ****** *)
//
#implfun
d2exp_var
(loc0, dvar) =
(
 d2exp(loc0, D2Evar(dvar)))
//
(* ****** ****** *)
//
#implfun
d2exp_sapp
(loc0, d2f0, s2es) =
d2exp_make_node
(loc0, D2Esapp(d2f0, s2es))
#implfun
d2exp_tapp
(loc0, d2f0, s2es) =
d2exp_make_node
(loc0, D2Etapp(d2f0, s2es))
//
(* ****** ****** *)
//
#implfun
d2exp_a2pp
(loc0, d2f0, d2a1, d2a2) =
(
d2exp_dapp
(loc0, d2f0, npf1, d2as)
) where
{
val
npf1 = -1
val
d2as = list_pair(d2a1, d2a2)}
//
#implfun
d2exp_dapp
(loc0, d2f0, npf1, d2as) =
(
d2exp_make_node
( loc0
, D2Edapp(d2f0, npf1, d2as)))
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_d2con_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_d2con_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_d2cst_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_d2cst_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_d2var_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_d2var_stamp_new]
//
(* ****** ****** *)

local
//
(* ****** ****** *)
#typedef
tag_t = sint
#typedef
t2qas = t2qaglst
(* ****** ****** *)
//
fun
dconid_sym
(tok0: token): sym_t =
(
case-
tok0.node() of
| T_IDALP(nam1) =>
  symbl_make_name(nam1)
| T_IDSYM(nam1) =>
  symbl_make_name(nam1) )
//
(* ****** ****** *)
//
datatype
d2con =
D2CON of
( loc_t // lctn
, sym_t // name
, tag_t // ctag
, t2qas // tqas
, s2exp // sexp
, s2typ // type
, stamp // stmp // unicity
)
//
#absimpl d2con_tbox = d2con
//
(* ****** ****** *)
//
in//local
//
#implfun
d2con_get_lctn
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas
,s2e0
,t2p0,stmp) = d2c0 in loc0 end
//
#implfun
d2con_get_name
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas
,s2e0
,t2p0,stmp) = d2c0 in sym0 end
//
#implfun
d2con_get_stmp
  (  d2c0  ) =
let
val+
D2CON
(loc0
,sym0
,ctag
,tqas
,s2e0
,t2p0,stmp) = d2c0 in stmp end
//
(* ****** ****** *)
//
#implfun
d2con_make_idtp
(tok0,tqas,sexp) =
let
val ctag = (-1)
val loc0 = tok0.lctn()
val sym0 = dconid_sym(tok0)
val t2p0 = s2typ_none2(sexp)
val stmp = the_d2con_stamp_new()
in//let
  D2CON
  ( loc0
  , sym0
  , ctag, tqas, sexp, t2p0, stmp)
end (*let*) // end of [d2con_make_idtp]
//
end (*local*) // end of [local(d2con_tbox)]

(* ****** ****** *)

local
//
(* ****** ****** *)
#typedef
t2qas = t2qaglst
(* ****** ****** *)
//
datatype
d2var =
D2VAR of
( loc_t // lctn
, sym_t // name
, t2qas // tqas
, s2exp // sexp
, s2typ // type
, stamp // stmp // unicity
) (* end of [d2var] *)
//
#absimpl d2var_tbox = d2var
//
in//local
//
#implfun
d2var_get_lctn
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0
,t2p0,stmp) = d2v0 in loc0 end
//
#implfun
d2var_get_name
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0
,t2p0,stmp) = d2v0 in sym0 end
//
#implfun
d2var_get_stmp
  (  d2v0  ) =
let
val+
D2VAR
(loc0
,sym0
,tqas
,s2e0
,t2p0,stmp) = d2v0 in stmp end
//
(* ****** ****** *)
//
#implfun
d2var_new2_name
(  loc0,sym0  ) =
let
val tqas = list_nil()
val s2e0 = s2exp_none0()
val t2p0 = s2typ_none0()
val stmp = the_d2var_stamp_new()
in//let
  D2VAR
  ( loc0
  , sym0, tqas, s2e0, t2p0, stmp)
end (*let*) // end of [d2var_new2_name]
//
end (*local*) // end of [local(d2var_tbox)]

(* ****** ****** *)

local
//
datatype
d2pat =
D2PAT of
(loctn, d2pat_node)
//
#absimpl d2pat_tbox = d2pat
//
in (* in-of-local *)
//
#implfun
d2pat_make_node
(   loc,nod   ) = D2PAT(loc,nod)
//
#implfun
d2pat_get_lctn(d2p) =
let
  val+D2PAT(loc,nod) = d2p in loc
end
#implfun
d2pat_get_node(d2p) =
let
  val+D2PAT(loc,nod) = d2p in nod
end
//
endloc (*local*) // end of [local(d2pat)]

(* ****** ****** *)

local
//
datatype
f2arg =
F2ARG of
(
loctn, f2arg_node)
#absimpl
f2arg_tbox = f2arg
//
in (* in-of-local *)
//
#implfun
f2arg_make_node
(   loc,nod   ) = F2ARG(loc,nod)
//
#implfun
f2arg_get_lctn(f2a) =
let
  val+F2ARG(loc,nod) = f2a in loc
end
#implfun
f2arg_get_node(f2a) =
let
  val+F2ARG(loc,nod) = f2a in nod
end
//
endloc (*local*) // end of [local(f2arg)]

(* ****** ****** *)

local
//
datatype
d2gua =
D2GUA of
(
loctn, d2gua_node)
#absimpl
d2gua_tbox = d2gua
//
in (* in-of-local *)
//
#implfun
d2gua_make_node
(   loc,nod   ) = D2GUA(loc,nod)
//
#implfun
d2gua_get_lctn(d2g) =
let
  val+D2GUA(loc,nod) = d2g in loc
end
#implfun
d2gua_get_node(d2g) =
let
  val+D2GUA(loc,nod) = d2g in nod
end
//
endloc (*local*) // end of [local(d2gua)]

(* ****** ****** *)

local
//
datatype
d2gpt =
D2GPT of
(
loctn, d2gpt_node)
#absimpl
d2gpt_tbox = d2gpt
//
in (* in-of-local *)
//
#implfun
d2gpt_make_node
(   loc,nod   ) = D2GPT(loc,nod)
//
#implfun
d2gpt_get_lctn(gpt) =
let
  val+D2GPT(loc,nod) = gpt in loc
end
#implfun
d2gpt_get_node(gpt) =
let
  val+D2GPT(loc,nod) = gpt in nod
end
//
endloc (*local*) // end of [local(d2gpt)]

(* ****** ****** *)

local
//
datatype
d2cls =
D2CLS of
(
loctn, d2cls_node)
#absimpl
d2cls_tbox = d2cls
//
in (* in-of-local *)
//
#implfun
d2cls_make_node
(   loc,nod   ) = D2CLS(loc,nod)
//
#implfun
d2cls_get_lctn(cls) =
let
  val+D2CLS(loc,nod) = cls in loc
end
#implfun
d2cls_get_node(cls) =
let
  val+D2CLS(loc,nod) = cls in nod
end
//
endloc (*local*) // end of [local(d2cls)]

(* ****** ****** *)

local
//
datatype
d2exp =
D2EXP of
(loctn, d2exp_node)
//
#absimpl d2exp_tbox = d2exp
//
in (* in-of-local *)
//
#implfun
d2exp_make_node
(   loc,nod   ) = D2EXP(loc,nod)
//
#implfun
d2exp_get_lctn(d2e) =
let
  val+D2EXP(loc,nod) = d2e in loc
end
#implfun
d2exp_get_node(d2e) =
let
  val+D2EXP(loc,nod) = d2e in nod
end
//
endloc (*local*) // end of [local(d2exp)]

(* ****** ****** *)

local
//
datatype
d2ecl =
D2ECL of
(loctn, d2ecl_node)
//
#absimpl d2ecl_tbox = d2ecl
//
in (* in-of-local *)
//
#implfun
d2ecl_make_node
(   loc,nod   ) = D2ECL(loc,nod)
//
#implfun
d2ecl_get_lctn(dcl) =
let
  val+D2ECL(loc,nod) = dcl in loc
end
#implfun
d2ecl_get_node(dcl) =
let
  val+D2ECL(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [local(d2ecl)]

(* ****** ****** *)

local
//
datatype
s2qag =
S2QAG of (loc_t, s2varlst)
//
#absimpl s2qag_tbox = s2qag
//
in (* in-of-local *)
//
#implfun
s2qag_get_lctn
  (  s2qa  ) =
let
val+
S2QAG
(loc0, s2vs) = s2qa in loc0 end
//
#implfun
s2qag_get_s2vs
  (  s2qa  ) =
let
val+
S2QAG
(loc0, s2vs) = s2qa in s2vs end
//
#implfun
s2qag_make_s2vs
( loc0 , s2vs ) = S2QAG(loc0, s2vs)
//
end (*local*) // end of [local(s2qag)]

(* ****** ****** *)

local
//
datatype
t2qag =
T2QAG of (loc_t, s2varlst)
//
#absimpl t2qag_tbox = t2qag
//
in (* in-of-local *)
//
#implfun
t2qag_get_lctn
  (  t2qa  ) =
let
val+
T2QAG
(loc0, s2vs) = t2qa in loc0 end
//
#implfun
t2qag_get_s2vs
  (  t2qa  ) =
let
val+
T2QAG
(loc0, s2vs) = t2qa in s2vs end
//
#implfun
t2qag_make_s2vs
( loc0 , s2vs ) = T2QAG(loc0, s2vs)
//
end (*local*) // end of [local(t2qag)]

(* ****** ****** *)

local
//
datatype
t2iag =
T2IAG of (loc_t, s2explst)
//
#absimpl t2iag_tbox = t2iag
//
in (* in-of-local *)
//
#implfun
t2iag_get_lctn
  (  t2ia  ) =
let
val+
T2IAG
(loc0, s2es) = t2ia in loc0 end
//
#implfun
t2iag_get_s2es
  (  t2ia  ) =
let
val+
T2IAG
(loc0, s2es) = t2ia in s2es end
//
#implfun
t2iag_make_s2es
( loc0 , s2es ) = T2IAG(loc0, s2es)
//
end (*local*) // end of [local(t2iag)]

(* ****** ****** *)

local
//
datatype
d2valdcl =
D2VALDCL of
( loc_t
, d2pat
, teqd2exp, wths2exp)
//
#absimpl
d2valdcl_tbox = d2valdcl
//
in//local

#implfun
d2valdcl_get_lctn
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in lctn end

#implfun
d2valdcl_get_dpat
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in dpat end

#implfun
d2valdcl_get_tdxp
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in tdxp end

#implfun
d2valdcl_get_wsxp
  (  dval  ) = let
val+
D2VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in wsxp end

(* ****** ****** *)

#implfun
d2valdcl_make_args
(lctn, dpat, tdxp, wsxp) =
(
  D2VALDCL(lctn, dpat, tdxp, wsxp)
)

endloc (*local*) // end of [local(d2valdcl)]

(* ****** ****** *)

local
//
datatype
d2vardcl =
D2VARDCL of
( loc_t
, d2var
, d2varopt
, s2expopt, teqd2exp)
//
#absimpl
d2vardcl_tbox = d2vardcl
//
in//local

#implfun
d2vardcl_get_lctn
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in lctn end

#implfun
d2vardcl_get_dpid
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dpid end

#implfun
d2vardcl_get_vpid
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in vpid end

#implfun
d2vardcl_get_sres
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in sres end

#implfun
d2vardcl_get_dini
  (  dvar  ) = let
val+
D2VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dini end

(* ****** ****** *)

#implfun
d2vardcl_make_args
( lctn
, dpid, vpid, sres, dini) =
(
D2VARDCL(lctn, dpid, vpid, sres, dini)
)

endloc (*local*) // end of [ local(d2vardcl) ]

(* ****** ****** *)

local
//
datatype
d2fundcl =
D2FUNDCL of
( loc_t
, d2var
, f2arglst
, s2res
, teqd2exp, wths2exp)
//
#absimpl
d2fundcl_tbox = d2fundcl
//
in//local

#implfun
d2fundcl_get_lctn
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in lctn end

#implfun
d2fundcl_get_dpid
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in dpid end

#implfun
d2fundcl_get_farg
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in farg end

#implfun
d2fundcl_get_sres
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in sres end

(* ****** ****** *)

#implfun
d2fundcl_get_tdxp
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in tdxp end

#implfun
d2fundcl_get_wsxp
  (  dfun  ) = let
val+
D2FUNDCL
( lctn
, dpid
, farg, sres
, tdxp, wsxp) = dfun in wsxp end

(* ****** ****** *)

#implfun
d2fundcl_make_args
( lctn
, dpid, farg, sres, tdxp, wsxp) =
(
D2FUNDCL
(lctn, dpid, farg, sres, tdxp, wsxp))

endloc (*local*) // end of [ local(d2fundcl) ]

(* ****** ****** *)

local
//
datatype
d2parsed =
D2PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d2topenv // topenv
,
d2eclistopt)//program
//
#absimpl
d2parsed_tbox = d2parsed
//
in//local

(* ****** ****** *)

#implfun
d2parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, topenv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_stadyn]

(* ****** ****** *)

#implfun
d2parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, topenv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_nerror]

(* ****** ****** *)

#implfun
d2parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, topenv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_source]

(* ****** ****** *)

#implfun
d2parsed_get_topenv
  (dpar) =
(
  topenv ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, topenv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_topenv]

(* ****** ****** *)

#implfun
d2parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D2PARSED
( stadyn
, nerror, source
, topenv, parsed) = dpar
} (*where*)//end-of-[d2parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d2parsed_make_args
(stadyn
,nerror,source,topenv,parsed) =
(
D2PARSED
(stadyn,nerror,source,topenv,parsed)
) where
{
(*
val () =
prerrln
("d2parsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[d2parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d2parsed) ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp2.dats] *)
