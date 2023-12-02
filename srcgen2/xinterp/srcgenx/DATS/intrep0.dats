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
IRPAT(loc,t2p,nod) = irp in loc
end
#implfun
irpat_get_node(irp) =
let
val+
IRPAT(loc,t2p,nod) = irp in nod
end
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
IREXP(loc,t2p,nod) = ire in loc
end
#implfun
irexp_get_node(ire) =
let
val+
IREXP(loc,t2p,nod) = ire in nod
end
//
endloc (*local*) // end of [local(irexp)]

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
  (dpar) =
let
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

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_intrep0.dats] *)
