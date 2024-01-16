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
Tue Dec 26 22:51:15 EST 2023
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
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d4pat_none0
(  loc0  ) =
d4pat_make_node
(loc0,D4Pnone0((*void*)))
#implfun
d4pat_none1
(  dpat  ) =
d4pat_make_node
(
dpat.lctn(),D4Pnone1(dpat))
#implfun
d4pat_none2
(  dpat  ) =
d4pat_make_node
(
dpat.lctn(),D4Pnone2(dpat))
//
(* ****** ****** *)
//
#implfun
d4exp_none0
(  loc0  ) =
d4exp_make_node
(loc0,D4Enone0((*void*)))
#implfun
d4exp_none1
(  dexp  ) =
d4exp_make_node
(
dexp.lctn(),D4Enone1(dexp))
#implfun
d4exp_none2
(  dexp  ) =
d4exp_make_node
(
dexp.lctn(),D4Enone2(dexp))
//
(* ****** ****** *)
//
#implfun
d4ecl_none0
(  loc0  ) =
d4ecl_make_node
(loc0,D4Cnone0((*void*)))
#implfun
d4ecl_none1
(  d3cl  ) =
d4ecl_make_node
(
d3cl.lctn(),D4Cnone1(d3cl))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d4pat =
D4PAT of
( loctn
, s2typ, d4pat_node)
datavwtp
d4pat_vt =
D4PAT_vt of
( loctn
, s2typ, d4pat_node)
//
#absimpl d4pat_tbox = d4pat
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d4pat_make_node
(   loc,nod   ) =
(
let
val t2p =
s2typ_none0() in
D4PAT(loc, t2p, nod) endlet)
//
(* ****** ****** *)
//
#implfun
d4pat_get_lctn(d4p) =
let
val+
D4PAT
(loc,t2p,nod) = d4p in loc end//let
#implfun
d4pat_get_styp(d4p) =
let
val+
D4PAT
(loc,t2p,nod) = d4p in t2p end//let
#implfun
d4pat_get_node(d4p) =
let
val+
D4PAT
(loc,t2p,nod) = d4p in nod end//let
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d4pat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d4exp =
D4EXP of
( loctn
, s2typ, d4exp_node)
datavwtp
d4exp_vt =
D4EXP_vt of
( loctn
, s2typ, d4exp_node)
//
#absimpl d4exp_tbox = d4exp
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d4exp_make_node
(   loc,nod   ) =
(
let
val t2p =
s2typ_none0() in
D4EXP(loc, t2p, nod) endlet)
//
(* ****** ****** *)
//
#implfun
d4exp_get_lctn(d4e) =
let
val+
D4EXP
(loc,t2p,nod) = d4e in loc end//let
#implfun
d4exp_get_styp(d4e) =
let
val+
D4EXP
(loc,t2p,nod) = d4e in t2p end//let
#implfun
d4exp_get_node(d4e) =
let
val+
D4EXP
(loc,t2p,nod) = d4e in nod end//let
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d4exp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
f4arg =
F4ARG of
(
loctn, f4arg_node)
#absimpl
f4arg_tbox = f4arg
//
in (* in-of-local *)
//
#implfun
f4arg_make_node
(   loc,nod   ) = F4ARG(loc,nod)
//
#implfun
f4arg_get_lctn(f4a) =
let
  val+F4ARG(loc,nod) = f4a in loc
end
#implfun
f4arg_get_node(f4a) =
let
  val+F4ARG(loc,nod) = f4a in nod
end
//
endloc (*local*) // end of [local(f4arg)]
//
(* ****** ****** *)
//
local
//
datatype
d4gua =
D4GUA of
(
loctn, d4gua_node)
#absimpl
d4gua_tbox = d4gua
//
in (* in-of-local *)
//
#implfun
d4gua_make_node
(   loc,nod   ) = D4GUA(loc,nod)
//
#implfun
d4gua_get_lctn(d4g) =
let
  val+D4GUA(loc,nod) = d4g in loc
end
#implfun
d4gua_get_node(d4g) =
let
  val+D4GUA(loc,nod) = d4g in nod
end
//
endloc (*local*) // end of [local(d4gua)]
//
(* ****** ****** *)
//
local
//
datatype
d4gpt =
D4GPT of
(
loctn, d4gpt_node)
#absimpl
d4gpt_tbox = d4gpt
//
in (* in-of-local *)
//
#implfun
d4gpt_make_node
(   loc,nod   ) = D4GPT(loc,nod)
//
#implfun
d4gpt_get_lctn(gpt) =
let
  val+D4GPT(loc,nod) = gpt in loc
end
#implfun
d4gpt_get_node(gpt) =
let
  val+D4GPT(loc,nod) = gpt in nod
end
//
endloc (*local*) // end of [local(d4gpt)]
//
(* ****** ****** *)
//
local
//
datatype
d4cls =
D4CLS of
(
loctn, d4cls_node)
#absimpl
d4cls_tbox = d4cls
//
in (* in-of-local *)
//
#implfun
d4cls_make_node
(   loc,nod   ) = D4CLS(loc,nod)
//
#implfun
d4cls_get_lctn(cls) =
let
  val+D4CLS(loc,nod) = cls in loc
end
#implfun
d4cls_get_node(cls) =
let
  val+D4CLS(loc,nod) = cls in nod
end
//
endloc (*local*) // end of [local(d4cls)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d4ecl =
D4ECL of
( loctn, d4ecl_node)
datavwtp
d4ecl_vt =
D4ECL_vt of
( loctn, d4ecl_node)
//
#absimpl d4ecl_tbox = d4ecl
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d4ecl_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in D4ECL(loc, nod)
endlet//end-of-[d4ecl_make_node(...)]
//
(* ****** ****** *)
//
#implfun
d4ecl_get_lctn(dcl) =
let
  val+D4ECL(loc,nod) = dcl in loc
end//let//end-of-[d4ecl_get_node(loc)]
#implfun
d4ecl_get_node(dcl) =
let
  val+D4ECL(loc,nod) = dcl in nod
end//let//end-of-[d4ecl_get_node(dcl)]
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d4ecl)]
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
d4parsed =
D4PARSED of
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
d4eclistopt)//program
//
#absimpl
d4parsed_tbox = d4parsed
//
in//local

(* ****** ****** *)

#implfun
d4parsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_stadyn]

(* ****** ****** *)

#implfun
d4parsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_nerror]

(* ****** ****** *)

#implfun
d4parsed_get_source
  (dpar) =
(
  source ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_source]

(* ****** ****** *)

#implfun
d4parsed_get_t1penv
  (dpar) =
(
  t1penv ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_t1penv]

(* ****** ****** *)

#implfun
d4parsed_get_t2penv
  (dpar) =
(
  t2penv ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_t2penv]

(* ****** ****** *)

#implfun
d4parsed_get_t3penv
  (dpar) =
(
  t3penv ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_t3penv]

(* ****** ****** *)

#implfun
d4parsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed) = dpar
} (*where*)//end-of-[d4parsed_get_parsed]

(* ****** ****** *)
//
#implfun
d4parsed_make_args
( stadyn
, nerror, source
, t1penv, t2penv
, t3penv, parsed) =
(
D4PARSED
( stadyn
, nerror, source, t1penv
, t2penv, t3penv, parsed)) where
{
(*
val () =
prerrln
("d4parsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[d4parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(d4parsed) ]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp4.dats] *)
