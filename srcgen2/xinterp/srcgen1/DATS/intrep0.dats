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
//
Fri Nov 24 13:31:57 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
(* ****** ****** *)
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
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
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
//
#implfun
irpat_none0
(  loc0  ) =
irpat_make_node
(loc0,IRPnone0((*void*)))
#implfun
irpat_none1
(  d3p0  ) =
irpat_make_node
(
d3p0.lctn(),IRPnone1(d3p0))
//
(* ****** ****** *)
//
#implfun
irexp_none0
(  loc0  ) =
irexp_make_node
(loc0,IREnone0((*void*)))
#implfun
irexp_none1
(  d3e0  ) =
irexp_make_node
(
d3e0.lctn(),IREnone1(d3e0))
//
(* ****** ****** *)
//
#implfun
irdcl_none0
(  loc0  ) =
irdcl_make_node
(loc0,IRDnone0((*void*)))
#implfun
irdcl_none1
(  d3cl  ) =
irdcl_make_node
(
d3cl.lctn(),IRDnone1(d3cl))
//
#implfun
irdcl_d3ecl
(  d3cl  ) =
irdcl_make_node
(
d3cl.lctn(),IRDd3ecl(d3cl))
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
irpat =
IRPAT of
( loctn
, s2typ, irpat_node)
datavwtp
irpat_vt =
IRPAT_vt of
( loctn
, s2typ, irpat_node)
//
#absimpl irpat_tbox = irpat
//
in (* in-of-local *)
//
#implfun
irpat_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
IRPAT(loc, t2p, nod) end
//
#implfun
irpat_get_lctn(irp) =
let
val+
IRPAT
(loc,t2p,nod) = irp in loc end
#implfun
irpat_get_node(irp) =
let
val+
IRPAT
(loc,t2p,nod) = irp in nod end
//
(*
#implfun
irpat_get_type(irp) =
let
val+
IRPAT
(loc,t2p,nod) = irp in t2p end
*)
//
endloc (*local*) // end of [local(irpat)]

(* ****** ****** *)

local
//
datatype
irexp =
IREXP of
( loctn
, s2typ, irexp_node)
datavwtp
irexp_vt =
IREXP_vt of
( loctn
, s2typ, irexp_node)
//
#absimpl irexp_tbox = irexp
//
in (* in-of-local *)
//
#implfun
irexp_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
IREXP(loc, t2p, nod) end
//
#implfun
irexp_get_lctn(ire) =
let
val+
IREXP
(loc,t2p,nod) = ire in loc end
#implfun
irexp_get_node(ire) =
let
val+
IREXP
(loc,t2p,nod) = ire in nod end
//
(*
#implfun
irexp_get_type(ire) =
let
val+
IREXP
(loc,t2p,nod) = ire in t2p end
*)
//
endloc (*local*) // end of [local(irexp)]

(* ****** ****** *)
//
local
//
datatype
irgua =
IRGUA of
(
loctn, irgua_node)
#absimpl
irgua_tbox = irgua
//
in (* in-of-local *)
//
#implfun
irgua_make_node
(   loc,nod   ) = IRGUA(loc,nod)
//
#implfun
irgua_get_lctn(irg) =
let
  val+
  IRGUA(loc,nod) = irg in loc end
#implfun
irgua_get_node(irg) =
let
  val+
  IRGUA(loc,nod) = irg in nod end
//
endloc (*local*) // end of [local(irgua)]
//
(* ****** ****** *)
//
local
//
datatype
irgpt =
IRGPT of
(
loctn, irgpt_node)
#absimpl
irgpt_tbox = irgpt
//
in (* in-of-local *)
//
#implfun
irgpt_make_node
(   loc,nod   ) = IRGPT(loc,nod)
//
#implfun
irgpt_get_lctn(gpt) =
let
  val+
  IRGPT(loc,nod) = gpt in loc end
#implfun
irgpt_get_node(gpt) =
let
  val+
  IRGPT(loc,nod) = gpt in nod end
//
endloc (*local*) // end of [local(irgpt)]
//
(* ****** ****** *)
//
local
//
datatype
ircls =
IRCLS of
(
loctn, ircls_node)
#absimpl
ircls_tbox = ircls
//
in (* in-of-local *)
//
#implfun
ircls_make_node
(   loc,nod   ) = IRCLS(loc,nod)
//
#implfun
ircls_get_lctn(cls) =
let
  val+
  IRCLS(loc,nod) = cls in loc end
#implfun
ircls_get_node(cls) =
let
  val+
  IRCLS(loc,nod) = cls in nod end
//
endloc (*local*) // end of [local(ircls)]
//
(* ****** ****** *)

local
//
datatype
irdcl =
IRDCL of
( loctn, irdcl_node)
datavwtp
irdcl_vt =
IRDCL_vt of
( loctn, irdcl_node)
//
#absimpl irdcl_tbox = irdcl
//
in (* in-of-local *)
//
#implfun
irdcl_make_node
(   loc,nod   ) =
(
  IRDCL(loc, nod) )
//
#implfun
irdcl_get_lctn(ird) =
let
  val+IRDCL(loc,nod) = ird in loc
end
#implfun
irdcl_get_node(ird) =
let
  val+IRDCL(loc,nod) = ird in nod
end
//
endloc (*local*) // end of [local(irdcl)]

(* ****** ****** *)

local
//
datatype
irvaldcl =
IRVALDCL of
( loc_t
, irpat, teqirexp)
//
#absimpl
irvaldcl_tbox = irvaldcl
//
in//local
//
(* ****** ****** *)
#implfun
irvaldcl_get_lctn
  (  dval  ) = let
val+
IRVALDCL
( lctn
, dpat, tdxp) = dval in lctn
end// let// irvaldcl_get_lctn
(* ****** ****** *)
#implfun
irvaldcl_get_dpat
  (  dval  ) = let
val+
IRVALDCL
( lctn
, dpat, tdxp) = dval in dpat
end// let// irvaldcl_get_dpat
(* ****** ****** *)
#implfun
irvaldcl_get_tdxp
  (  dval  ) = let
val+
IRVALDCL
( lctn
, dpat, tdxp) = dval in tdxp
end// let// irvaldcl_get_tdxp
(* ****** ****** *)
#implfun
irvaldcl_make_args
(lctn, dpat, tdxp) =
(
  IRVALDCL(lctn, dpat, tdxp))
(* ****** ****** *)
//
endloc (*local*) // end of [ local(irvaldcl) ]

(* ****** ****** *)

local
//
datatype
irvardcl =
IRVARDCL of
( loc_t
, d2var
, d2varopt, teqirexp)
//
#absimpl
irvardcl_tbox = irvardcl
//
in//local
//
(* ****** ****** *)
#implfun
irvardcl_get_lctn
  (  dvar  ) = let
val+
IRVARDCL
( lctn
, dpid
, vpid, dini) = dvar in lctn
end// let// irvardcl_get_lctn
(* ****** ****** *)
#implfun
irvardcl_get_dpid
  (  dvar  ) = let
val+
IRVARDCL
( lctn
, dpid
, vpid, dini) = dvar in dpid
end// let// irvardcl_get_dpid
(* ****** ****** *)
#implfun
irvardcl_get_vpid
  (  dvar  ) = let
val+
IRVARDCL
( lctn
, dpid
, vpid, dini) = dvar in vpid
end// let// irvardcl_get_vpid
(* ****** ****** *)
#implfun
irvardcl_get_dini
  (  dval  ) = let
val+
IRVARDCL
( lctn
, dpit
, dpip, dini) = dval in dini
end// let// irvardcl_get_dini
(* ****** ****** *)
#implfun
irvardcl_make_args
(lctn,dpid,vpid,dini) =
(
IRVARDCL(lctn,dpid,vpid,dini))
(* ****** ****** *)
//
endloc (*local*) // end of [ local(irvardcl) ]

(* ****** ****** *)

local
//
datatype
irfundcl =
IRFUNDCL of
( loc_t
, d2var
, fiarglst, teqirexp)
//
#absimpl
irfundcl_tbox = irfundcl
//
in//local
//
(* ****** ****** *)
#implfun
irfundcl_get_lctn
  (  dfun  ) = let
val+
IRFUNDCL
( lctn
, dpid
, farg, tdxp) = dfun in lctn end
(* ****** ****** *)
#implfun
irfundcl_get_dpid
  (  dfun  ) = let
val+
IRFUNDCL
( lctn
, dpid
, farg, tdxp) = dfun in dpid end
(* ****** ****** *)
#implfun
irfundcl_get_farg
  (  dfun  ) = let
val+
IRFUNDCL
( lctn
, dpid
, farg, tdxp) = dfun in farg end
(* ****** ****** *)
#implfun
irfundcl_get_tdxp
  (  dfun  ) = let
val+
IRFUNDCL
( lctn
, dpid
, farg, tdxp) = dfun in tdxp end
(* ****** ****** *)
#implfun
irfundcl_make_args
( lctn
, dpid, farg, tdxp) =
(
IRFUNDCL(lctn, dpid, farg, tdxp))
(* ****** ****** *)
//
endloc (*local*) // end of [ local(irfundcl) ]

(* ****** ****** *)

local
//
datatype
irparsed =
IRPARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
irdclistopt)//program
//
#absimpl
irparsed_tbox = irparsed
//
in//local

(* ****** ****** *)
//
#implfun
irparsed_get_stadyn
  (dpar) =
(
  stadyn ) where
{
val+
IRPARSED
(
stadyn,
nerror, source, parsed) = dpar
} (*where*)//end-of-[irparsed_get_stadyn]
//
(* ****** ****** *)
//
#implfun
irparsed_get_nerror
  (dpar) =
(
  nerror ) where
{
val+
IRPARSED
(
stadyn,
nerror, source, parsed) = dpar
} (*where*)//end-of-[irparsed_get_nerror]
//
(* ****** ****** *)
//
#implfun
irparsed_get_source
  (dpar) =
(
  source ) where
{
val+
IRPARSED
(
stadyn,
nerror, source, parsed) = dpar
} (*where*)//end-of-[irparsed_get_source]
//
(* ****** ****** *)
//
#implfun
irparsed_get_parsed
  (dpar) =
(
  parsed ) where
{
val+
IRPARSED
(
stadyn,
nerror, source, parsed) = dpar
} (*where*)//end-of-[irparsed_get_parsed]
//
(* ****** ****** *)
//
#implfun
irparsed_make_args
( stadyn
, nerror
, source, parsed) =
(
IRPARSED
( stadyn
, nerror, source, parsed)) where
{
(*
val () =
prerrln
("irparsed_make_args:nerror=",nerror)
*)
} (*where*) // end-of-[irparsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(irparsed) ]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irparsed_of_trxd3ir
  (dpar) = let
//
val stadyn =
d3parsed_get_stadyn(dpar)
val nerror =
d3parsed_get_nerror(dpar)
val source =
d3parsed_get_source(dpar)
val parsed =
d3parsed_get_parsed(dpar)
//
val env0 = trdienv_make_nil()
//
val parsed =
trxd3ir_d3eclistopt(env0, parsed)
//
in//let
(
  irparsed_make_args
  (stadyn, nerror, source, parsed)
) where
{
  val (  ) = trdienv_free_top(env0) }
end (*let*) // end of [irparsed_trxd3ir(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_trxd3ir_fnp
( e1, xs, fopr ) =
(
list_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = trdienv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_trxd3ir_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
optn_trxd3ir_fnp
( e1, xs, fopr ) =
(
optn_map_e1nv<x0><y0><e1>(xs, e1)) where
{
#vwtpdef e1 = trdienv
#impltmp
map$fopr_e1nv<x0><y0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [optn_trxd3ir_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_intrep0.dats] *)
(***********************************************************************)
