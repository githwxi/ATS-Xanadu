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
d1pat_none1
(  dpat  ) =
d1pat_make_node
(
dpat.lctn(),D1Pnone1(dpat))


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

#implfun
d1exp_none1
(  dexp  ) =
d1exp_make_node
(
dexp.lctn(),D1Enone1(dexp))

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
d1cstdcl =
D1CSTDCL of
( loc_t
, d0pid
, d1arglst,s1res,d1res)
//
#absimpl
d1cstdcl_tbox = d1cstdcl
//
in//local
//
#implfun
d1cstdcl_get_lctn
(  dcst  ) =
let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in lctn end
//
#implfun
d1cstdcl_get_darg
(  dcst  ) =
let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in darg end
//
#implfun
d1cstdcl_get_dpid
(  dcst  ) =
let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in dpid end
//
#implfun
d1cstdcl_get_sres
(  dcst  ) =
let
val+
D1CSTDCL
( lctn
, dpid
, darg
, sres, dres) = dcst in sres end
//
#implfun
d1cstdcl_get_dres
(  dcst  ) =
let
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
