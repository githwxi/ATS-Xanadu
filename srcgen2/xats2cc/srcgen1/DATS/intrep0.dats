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
//
Mon Mar  9 02:43:10 PM EDT 2026
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
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d2var_get_lctn
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
i0typ_none0
((*void*)) =
i0typ_make_node
(s2t0, I0Tnone0())
where{
val s2t0 = sort2_none0()}
//
#implfun
i0typ_none1
(  t2p0  ) =
i0typ_make_node
(t2p0.sort(),I0Tnone1(t2p0))
//
(* ****** ****** *)
//
#implfun
i0var_none1
(  d2v0  ) =
let
val lvl0 = ( -1 )
val i0t0 =
i0typ_none0((*0*))
in//let
(
  i0var(d2v0, lvl0, i0t0))
end//let//endof(i0var_none1)
//
#implfun
i0exp_none1
(  d3e0  ) =
let
val loc0 = d3e0.lctn()
val i0t0 =
i0typ_none1(d3e0.styp())
in//let
i0exp_make_ityp$node
(loc0,i0t0,I0Enone1(d3e0))
end//let//endof(i0exp_none1)
//
(* ****** ****** *)
//
#implfun
i0dcl_none1
(  d3cl  ) =
i0dcl_make_node
(d3cl.lctn(),I0Dnone1(d3cl))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0typ =
I0TYP of
(sort2, i0typ_node)
(*
datavwtp
i0typ_vt =
I0TYP_VT of
(sort2, i0typ_node)
*)
//
#absimpl i0typ_tbox = i0typ
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i0typ_make_node
( sort, node ) =
(
  I0TYP(sort, node))
//
(* ****** ****** *)
//
#implfun
i0typ_sort$get
(   ityp   ) =
let
val+
I0TYP
(s2t0, node) = ityp in s2t0 end
//
(* ****** ****** *)
//
#implfun
i0typ_node$get
(   ityp   ) =
let
val+
I0TYP
(s2t0, node) = ityp in node end
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(i0typ)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0pat =
I0PAT of
( loctn
, i0typ, i0pat_node)
(*
datavwtp
i0pat_vt =
I0PAT_vt of
( loctn
, i0typ, i0pat_node)
*)
//
#absimpl i0pat_tbox = i0pat
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i0pat_make_ityp$node
( loc0, ityp, node ) =
(
I0PAT(loc0, ityp, node))
//
#implfun
i0pat_lctn$get
(   ipat   ) =
let
val+
I0PAT
(loc0
,i0t0, node) = ipat in loc0 end
//
#implfun
i0pat_ityp$get(ipat) =
let
val+
I0PAT
(loc0
,i0t0, node) = ipat in i0t0 end
//
#implfun
i0pat_node$get(ipat) =
let
val+
I0PAT
(loc0
,i0t0, node) = ipat in node end
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(i0pat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0var =
I0VAR of
( sint
, d2var, i0typ)
(*
datatype
i0var_vt =
I0VAR_vt of
( sint
, d2var, i0typ)
*)
//
#absimpl i0var_tbox = i0var
//
in//local
//
#implfun
i0var_make_dvar$info
( dvar, lvl0, ityp ) =
(
I0VAR(lvl0, dvar, ityp))
//
#implfun
i0var_lvl0$get
(   ivar   ) =
let
val+
I0VAR
(lvl0
,dvar, ityp) = ivar in lvl0 end
//
#implfun
i0var_dvar$get
(   ivar   ) =
let
val+
I0VAR
(lvl0
,dvar, ityp) = ivar in dvar end
//
#implfun
i0var_ityp$get
(   ivar   ) =
let
val+
I0VAR
(lvl0
,dvar, ityp) = ivar in ityp end
//
endloc (*local*) // end-of-[local(i0var)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0exp =
I0EXP of
( loctn
, i0typ, i0exp_node)
(*
datavwtp
i0exp_vt =
I0EXP_vt of
( loctn
, i0typ, i0exp_node)
*)
//
#absimpl i0exp_tbox = i0exp
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i0exp_make_ityp$node
( loc0, ityp, node ) =
(
I0EXP(loc0, ityp, node))
//
#implfun
i0exp_lctn$get
(   iexp   ) =
let
val+
I0EXP
(loc0
,i0t0, node) = iexp in loc0 end
//
#implfun
i0exp_ityp$get(iexp) =
let
val+
I0EXP
(loc0
,i0t0, node) = iexp in i0t0 end
//
#implfun
i0exp_node$get(iexp) =
let
val+
I0EXP
(loc0
,i0t0, node) = iexp in node end
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(i0exp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
local
//
datatype
fiarg =
FIARG of
(
loctn, fiarg_node)
#absimpl
fiarg_tbox = fiarg
//
in (* in-of-local *)
//
#implfun
fiarg_make_node
( loc0, node ) = FIARG(loc0, node)
//
#implfun
fiarg_lctn$get(fia0) =
let
val+FIARG(loc0,node) = fia0 in loc0
end
#implfun
fiarg_node$get(fia0) =
let
val+FIARG(loc0,node) = fia0 in node
end
//
endloc (*local*) // end of [local(fiarg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0dcl =
I0DCL of
( loctn, i0dcl_node)
//
#absimpl i0dcl_tbox = i0dcl
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i0dcl_make_node
(  loc0, node  ) =
(
I0DCL(loc0, node) )
//
#implfun
i0dcl_lctn$get(dcl0) =
let
val+
I0DCL
(loc0,node) = dcl0 in loc0 end
//
#implfun
i0dcl_node$get(dcl0) =
let
val+
I0DCL
(loc0,node) = dcl0 in node end
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[local(i0dcl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0valdcl =
I0VALDCL of
( loc_t
, i0pat, teqi0exp)
//
#absimpl
i0valdcl_tbox = i0valdcl
//
in//local
//
#implfun
i0valdcl_lctn$get
  (  ival  ) = let
val+
I0VALDCL
( lctn
, ipat, tdxp) = ival in lctn end
//
#implfun
i0valdcl_ipat$get
  (  ival  ) = let
val+
I0VALDCL
( lctn
, ipat, tdxp) = ival in ipat end
//
#implfun
i0valdcl_tdxp$get
  (  ival  ) = let
val+
I0VALDCL
( lctn
, ipat, tdxp) = ival in tdxp end
//
(* ****** ****** *)
//
#implfun
i0valdcl_make_args
(lctn, ipat, tdxp) =
(
  I0VALDCL(lctn, ipat, tdxp(*opt*)))
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(i0valdcl)]
//
(* ****** ****** *)
//
local
//
datatype
i0vardcl =
I0VARDCL of
( loc_t
, d2var, teqi0exp)
//
#absimpl
i0vardcl_tbox = i0vardcl
//
in//local
//
#implfun
i0vardcl_lctn$get
  (  ivar  ) = let
val+
I0VARDCL
( lctn
, dpid, dini) = ivar in lctn end
//
#implfun
i0vardcl_dpid$get
  (  ivar  ) = let
val+
I0VARDCL
( lctn
, dpid, dini) = ivar in dpid end
//
#implfun
i0vardcl_dini$get
  (  ivar  ) = let
val+
I0VARDCL
( lctn
, dpid, dini) = ivar in dini end
//
(* ****** ****** *)
//
#implfun
i0vardcl_make_args
( lctn, dpid, dini) =
(
  I0VARDCL(lctn, dpid, dini(*opt*)) )
//
(* ****** ****** *)
//
endloc (*local*) // end of [ local(i0vardcl) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0parsed =
I0PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
i0dclistopt)//program
//
#absimpl
i0parsed_tbox = i0parsed
//
in//local
//
(* ****** ****** *)
//
#implfun
i0parsed_stadyn$get
  (ipar) =
(
  stadyn ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_stadyn$get]
//
#implfun
i0parsed_nerror$get
  (ipar) =
(
  nerror ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_nerror$get]
//
#implfun
i0parsed_source$get
  (ipar) =
(
  source ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_source$get]
//
(* ****** ****** *)
//
#implfun
i0parsed_parsed$get
  (ipar) =
(
  parsed ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_parsed$get]
//
(* ****** ****** *)
//
#implfun
i0parsed_make_args
( stadyn
, nerror
, source, parsed) =
(
I0PARSED
( stadyn
, nerror, source, parsed)) where
{
//
(*
val () =
prerrsln
("i0parsed_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[i0parsed_make_args]
//
(* ****** ****** *)
//
endloc (*local*) // end of [ local(i0parsed) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_intrep0.dats] *)
(***********************************************************************)
