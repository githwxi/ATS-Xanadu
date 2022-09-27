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
Start Time: June 19th, 2022
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
//
#symload lctn with s0exp_get_lctn
//
(* ****** ****** *)
//
#symload lctn with d0pat_get_lctn
#symload lctn with f0arg_get_lctn
#symload lctn with d0exp_get_lctn
//
(* ****** ****** *)

local
#symload + with add_loctn_loctn
in//local
//
#implfun
d0pat_anno_opt
( d0p1, opt2 ) =
(
case+ opt2 of
|
optn_nil() => d0p1
|
optn_cons(s0e2) =>
let
  val
  loc0 = d0p1.lctn()+s0e2.lctn()
in
  d0pat(loc0, D0Panno(d0p1, s0e2))
end // let
)(*case*)//end(d0pat_anno_opt(d0p1,opt2))
//
endloc(*local*)//end-(local(d0pat_anno_opt))

(* ****** ****** *)

local
//
datatype
d0pat =
D0PAT of
(
loctn, d0pat_node)
#absimpl
d0pat_tbox = d0pat
//
in (* in-of-local *)
//
#implfun
d0pat_make_node
(   loc,nod   ) = D0PAT(loc,nod)
//
#implfun
d0pat_get_lctn(d0p) =
let
  val+D0PAT(loc,nod) = d0p in loc
end
#implfun
d0pat_get_node(d0p) =
let
  val+D0PAT(loc,nod) = d0p in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
f0arg =
F0ARG of
(
loctn, f0arg_node)
#absimpl
f0arg_tbox = f0arg
//
in (* in-of-local *)
//
#implfun
f0arg_make_node
( loc,nod ) = F0ARG(loc, nod)
//
#implfun
f0arg_get_lctn
  ( f0a0 ) =
let
val+
F0ARG(loc0, node) = f0a0 in loc0
end (*let*)//end-of-[f0arg_get_lctn]
//
#implfun
f0arg_get_node
  ( f0a0 ) =
let
val+
F0ARG(loc0, node) = f0a0 in node
end (*let*)//end-of-[f0arg_get_node]
//
endloc (*local*) // end-of-local(f0arg)

(* ****** ****** *)

local
#symload + with add_loctn_loctn
in//local
//
#implfun
d0exp_anno_opt
( d0e1, opt2 ) =
(
case+ opt2 of
|
optn_nil() => d0e1
|
optn_cons(s0e2) =>
let
  val
  loc0 = d0e1.lctn()+s0e2.lctn()
in
  d0exp(loc0, D0Eanno(d0e1, s0e2))
end // let
)(*case*)//end(d0exp_anno_opt(d0e1,opt2))
//
endloc(*local*)//end-(local(d0exp_anno_opt))

(* ****** ****** *)

local
//
datatype
d0exp =
D0EXP of
(
loctn, d0exp_node)
#absimpl
d0exp_tbox = d0exp
//
in (* in-of-local *)
//
#implfun
d0exp_make_node
(   loc,nod   ) = D0EXP(loc,nod)
//
#implfun
d0exp_get_lctn(d0e) =
let
  val+D0EXP(loc,nod) = d0e in loc
end
#implfun
d0exp_get_node(d0e) =
let
  val+D0EXP(loc,nod) = d0e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0gua =
D0GUA of
(
loctn, d0gua_node)
#absimpl
d0gua_tbox = d0gua
//
in (* in-of-local *)
//
#implfun
d0gua_make_node
(   loc,nod   ) = D0GUA(loc,nod)
//
#implfun
d0gua_get_lctn(d0g) =
let
  val+D0GUA(loc,nod) = d0g in loc
end(*let*)//end-of[d0gua_get_lctn]
#implfun
d0gua_get_node(d0g) =
let
  val+D0GUA(loc,nod) = d0g in nod
end(*let*)//end-of[d0gua_get_node]
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0cls =
D0CLS of
(
loctn, d0cls_node)
#absimpl
d0cls_tbox = d0cls
//
in (* in-of-local *)
//
#implfun
d0cls_make_node
(   loc,nod   ) = D0CLS(loc,nod)
//
#implfun
d0cls_get_lctn(dcl) =
let
  val+D0CLS(loc,nod) = dcl in loc
end(*let*)//end-of[d0cls_get_lctn]
#implfun
d0cls_get_node(dcl) =
let
  val+D0CLS(loc,nod) = dcl in nod
end(*let*)//end-of[d0cls_get_node]
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0gpt =
D0GPT of
(
loctn, d0gpt_node)
#absimpl
d0gpt_tbox = d0gpt
//
in (* in-of-local *)
//
#implfun
d0gpt_make_node
(   loc,nod   ) = D0GPT(loc,nod)
//
#implfun
d0gpt_get_lctn(d0g) =
let
  val+D0GPT(loc,nod) = d0g in loc
end(*let*)//end-of[d0gpt_get_lctn]
#implfun
d0gpt_get_node(d0g) =
let
  val+D0GPT(loc,nod) = d0g in nod
end(*let*)//end-of[d0gpt_get_node]
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
q0arg =
Q0ARG of
(
loctn, q0arg_node)
#absimpl
q0arg_tbox = q0arg
//
in (* in-of-local *)
//
#implfun
q0arg_make_node
(   loc,nod   ) = Q0ARG(loc,nod)
//
#implfun
q0arg_get_lctn(q0a) =
let
  val+Q0ARG(loc,nod) = q0a in loc
end
#implfun
q0arg_get_node(q0a) =
let
  val+Q0ARG(loc,nod) = q0a in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s0qag =
S0QAG of
(
loctn, s0qag_node)
#absimpl
s0qag_tbox = s0qag
//
in (* in-of-local *)
//
#implfun
s0qag_make_node
(   loc,nod   ) = S0QAG(loc,nod)
//
#implfun
s0qag_get_lctn(sqa) =
let
  val+S0QAG(loc,nod) = sqa in loc
end
#implfun
s0qag_get_node(sqa) =
let
  val+S0QAG(loc,nod) = sqa in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t0qag =
T0QAG of
(
loctn, t0qag_node)
#absimpl
t0qag_tbox = t0qag
//
in (* in-of-local *)
//
#implfun
t0qag_make_node
(   loc,nod   ) = T0QAG(loc,nod)
//
#implfun
t0qag_get_lctn(tqa) =
let
  val+T0QAG(loc,nod) = tqa in loc
end
#implfun
t0qag_get_node(tqa) =
let
  val+T0QAG(loc,nod) = tqa in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
t0iag =
T0IAG of
(
loctn, t0iag_node)
#absimpl
t0iag_tbox = t0iag
//
in (* in-of-local *)
//
#implfun
t0iag_make_node
(   loc,nod   ) = T0IAG(loc,nod)
//
#implfun
t0iag_get_lctn(tia) =
let
  val+T0IAG(loc,nod) = tia in loc
end
#implfun
t0iag_get_node(tia) =
let
  val+T0IAG(loc,nod) = tia in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
a0typ =
A0TYP of
(
loctn, a0typ_node)
#absimpl
a0typ_tbox = a0typ
//
in (* in-of-local *)
//
#implfun
a0typ_make_node
(   loc,nod   ) = A0TYP(loc,nod)
//
#implfun
a0typ_get_lctn(a0t) =
let
  val+A0TYP(loc,nod) = a0t in loc
end
#implfun
a0typ_get_node(a0t) =
let
  val+A0TYP(loc,nod) = a0t in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0arg =
D0ARG of
(
loctn, d0arg_node)
#absimpl
d0arg_tbox = d0arg
//
in (* in-of-local *)
//
#implfun
d0arg_make_node
(   loc,nod   ) = D0ARG(loc,nod)
//
#implfun
d0arg_get_lctn(d0a) =
let
  val+D0ARG(loc,nod) = d0a in loc
end
#implfun
d0arg_get_node(d0a) =
let
  val+D0ARG(loc,nod) = d0a in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0ecl =
D0ECL of
(
loctn, d0ecl_node)
#absimpl
d0ecl_tbox = d0ecl
//
in (* in-of-local *)
//
#implfun
d0ecl_make_node
(   loc,nod   ) = D0ECL(loc,nod)
//
#implfun
d0ecl_get_lctn(dcl) =
let
  val+D0ECL(loc,nod) = dcl in loc
end
#implfun
d0ecl_get_node(dcl) =
let
  val+D0ECL(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
d0cstdcl =
D0CSTDCL of
( loc_t
, d0pid
, d0arglst,s0res,d0res)
//
#absimpl
d0cstdcl_tbox = d0cstdcl
//
in//local
//
#implfun
d0cstdcl_get_lctn
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in lctn end
//
#implfun
d0cstdcl_get_darg
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in darg end
//
#implfun
d0cstdcl_get_dpid
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dpid end
//
#implfun
d0cstdcl_get_sres
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in sres end
//
#implfun
d0cstdcl_get_dres
(  dcst  ) =
let
val+
D0CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dres end
//
#implfun
d0cstdcl_make_args
(lctn, dpid, darg, sred, dres) =
D0CSTDCL(lctn, dpid, darg, sred, dres)
//
endloc (*local*) // end of [ local(d0cstdcl) ]

(* ****** ****** *)

local
//
datatype
d0valdcl =
D0VALDCL of
( loc_t
, d0pat
, teqd0exp, wths0exp)
//
#absimpl
d0valdcl_tbox = d0valdcl
//
in//local

#implfun
d0valdcl_get_lctn
  (  dval  ) = let
val+
D0VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in lctn end

#implfun
d0valdcl_get_dpat
  (  dval  ) = let
val+
D0VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in dpat end

#implfun
d0valdcl_get_tdxp
  (  dval  ) = let
val+
D0VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in tdxp end

#implfun
d0valdcl_get_wsxp
  (  dval  ) = let
val+
D0VALDCL
( lctn
, dpat
, tdxp, wsxp) = dval in wsxp end

(* ****** ****** *)

#implfun
d0valdcl_make_args
(lctn, dpat, tdxp, wsxp) =
(
  D0VALDCL(lctn, dpat, tdxp, wsxp)
)

endloc (*local*) // end of [ local(d0valdcl) ]

(* ****** ****** *)

local
//
datatype
d0vardcl =
D0VARDCL of
( loc_t
, d0pid
, d0pidopt
, s0expopt, teqd0exp)
//
#absimpl
d0vardcl_tbox = d0vardcl
//
in//local

#implfun
d0vardcl_get_lctn
  (  dvar  ) = let
val+
D0VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in lctn end

#implfun
d0vardcl_get_dpid
  (  dvar  ) = let
val+
D0VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dpid end

#implfun
d0vardcl_get_vpid
  (  dvar  ) = let
val+
D0VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in vpid end

#implfun
d0vardcl_get_sres
  (  dvar  ) = let
val+
D0VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in sres end

#implfun
d0vardcl_get_dini
  (  dvar  ) = let
val+
D0VARDCL
( lctn
, dpid, vpid
, sres, dini) = dvar in dini end

(* ****** ****** *)

#implfun
d0vardcl_make_args
( lctn
, dpid, vpid, sres, dini) =
(
D0VARDCL(lctn, dpid, vpid, sres, dini)
)

endloc (*local*) // end of [ local(d0vardcl) ]

(* ****** ****** *)

local
//
datatype
d0fundcl =
D0FUNDCL of
( loc_t
, d0pid
, f0arglst, s0res
, teqd0exp, wths0exp)
//
#absimpl
d0fundcl_tbox = d0fundcl
//
in//local

(* ****** ****** *)

#implfun
d0fundcl_get_lctn
(  dfun  ) =
let
val+
D0FUNDCL
( lctn
, dpid, farg
, sres, tdxp, wsxp) = dfun in lctn
end (*let*) // end(d0fundcl_get_lctn)

#implfun
d0fundcl_get_dpid
(  dfun  ) =
let
val+
D0FUNDCL
( lctn
, dpid, farg
, sres, tdxp, wsxp) = dfun in dpid
end (*let*) // end(d0fundcl_get_dpid)

#implfun
d0fundcl_get_farg
(  dfun  ) =
let
val+
D0FUNDCL
( lctn
, dpid, farg
, sres, tdxp, wsxp) = dfun in farg
end (*let*) // end(d0fundcl_get_farg)

#implfun
d0fundcl_get_sres
(  dfun  ) =
let
val+
D0FUNDCL
( lctn
, dpid, farg
, sres, tdxp, wsxp) = dfun in sres
end (*let*) // end(d0fundcl_get_sres)

#implfun
d0fundcl_get_tdxp
(  dfun  ) =
let
val+
D0FUNDCL
( lctn
, dpid, farg
, sres, tdxp, wsxp) = dfun in tdxp
end (*let*) // end(d0fundcl_get_tdxp)

#implfun
d0fundcl_get_wsxp
(  dfun  ) =
let
val+
D0FUNDCL
( lctn
, dpid, farg
, sres, tdxp, wsxp) = dfun in wsxp
end (*let*) // end(d0fundcl_get_wsxp)

(* ****** ****** *)

#implfun
d0fundcl_make_args
( lctn
, dpid, farg, sres, tdxp, wsxp) =
(
D0FUNDCL(lctn,dpid,farg,sres,tdxp,wsxp)
)

endloc (*local*) // end of [ local(d0fundcl) ]

(* ****** ****** *)

local
//
datatype
d0parsed =
D0PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d0eclistopt)//program
//
#absimpl
d0parsed_tbox = d0parsed
//
in//local

(* ****** ****** *)

#implfun
d0parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D0PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d0parsed_get_stadyn]

(* ****** ****** *)

#implfun
d0parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D0PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d0parsed_get_nerror]

(* ****** ****** *)

#implfun
d0parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D0PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d0parsed_get_source]

(* ****** ****** *)

#implfun
d0parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D0PARSED
( stadyn
, nerror, source, parsed) = dpar
} (*where*)//end-of-[d0parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d0parsed_make_args
(stadyn,nerror,source,parsed) =
(
D0PARSED(stadyn,nerror,source,parsed)
) where
{
(*
val () =
prerrln
("d0parsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[d0parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d0parsed) ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp0.dats] *)
