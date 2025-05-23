(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 02 Mar 2024 06:04:06 PM EST
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
i0pat_var
(  dvar  ) =
let
val
loc0 = dvar.lctn()
in//in
i0pat(loc0,I0Pvar(dvar))
end//let//end-(i0pat_var)
//
#implfun
i0pat_none0
(  loc0  ) =
i0pat_make_node
(loc0,I0Pnone0((*void*)))
#implfun
i0pat_none1
(  d3p0  ) =
i0pat_make_node
(
d3p0.lctn(),I0Pnone1(d3p0))
//
(* ****** ****** *)
//
#implfun
i0exp_addr
(  iexp ) =
i0exp_make_node
(loc0,I0Eaddr(iexp))
where
{
 val loc0 = iexp.lctn()}
//
#implfun
i0exp_none0
(  loc0  ) =
i0exp_make_node
(loc0,I0Enone0((*void*)))
#implfun
i0exp_none1
(  d3e0  ) =
i0exp_make_node
(
d3e0.lctn(),I0Enone1(d3e0))
//
(* ****** ****** *)
//
#implfun
i0dcl_none1
(  d3cl  ) =
i0dcl_make_node
(
d3cl.lctn(),I0Dnone1(d3cl))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0pat =
I0PAT of
(loctn, i0pat_node)
datavwtp
i0pat_vt =
I0PAT_vt of
(loctn, i0pat_node)
//
#absimpl i0pat_tbox = i0pat
//
in (* in-of-local *)
//
#implfun
i0pat_make_node
(   loc,nod   ) =
(
  I0PAT(loc, nod) )
//
#implfun
i0pat_get_lctn(i0p) =
let
val+
I0PAT(loc,nod) = i0p in loc end
#implfun
i0pat_get_node(i0p) =
let
val+
I0PAT(loc,nod) = i0p in nod end
//
endloc (*local*) // end of [local(i0pat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0exp =
I0EXP of
(loctn, i0exp_node)
datavwtp
i0exp_vt =
I0EXP_vt of
(loctn, i0exp_node)
//
#absimpl i0exp_tbox = i0exp
//
in (* in-of-local *)
//
#implfun
i0exp_make_node
(   loc,nod   ) =
(
  I0EXP(loc, nod) )
//
#implfun
i0exp_get_lctn(i0e) =
let
val+
I0EXP(loc,nod) = i0e in loc end
#implfun
i0exp_get_node(i0e) =
let
val+
I0EXP(loc,nod) = i0e in nod end
//
endloc (*local*) // end of [local(i0exp)]
//
(* ****** ****** *)
(* ****** ****** *)
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
(   loc,nod   ) = FIARG(loc,nod)
//
#implfun
fiarg_get_lctn(fia) =
let
  val+FIARG(loc,nod) = fia in loc
end
#implfun
fiarg_get_node(fia) =
let
  val+FIARG(loc,nod) = fia in nod
end
//
endloc (*local*) // end of [local(fiarg)]
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
i0gua =
I0GUA of
(
loctn, i0gua_node)
#absimpl
i0gua_tbox = i0gua
//
in (* in-of-local *)
//
#implfun
i0gua_make_node
(   loc,nod   ) = I0GUA(loc,nod)
//
#implfun
i0gua_get_lctn(gua) =
let
  val+I0GUA(loc,nod) = gua in loc
end
#implfun
i0gua_get_node(gua) =
let
  val+I0GUA(loc,nod) = gua in nod
end
//
endloc (*local*) // end of [local(i0gua)]

(* ****** ****** *)

local
//
datatype
i0gpt =
I0GPT of
(
loctn, i0gpt_node)
#absimpl
i0gpt_tbox = i0gpt
//
in (* in-of-local *)
//
#implfun
i0gpt_make_node
(   loc,nod   ) = I0GPT(loc,nod)
//
#implfun
i0gpt_get_lctn(gpt) =
let
  val+I0GPT(loc,nod) = gpt in loc
end
#implfun
i0gpt_get_node(gpt) =
let
  val+I0GPT(loc,nod) = gpt in nod
end
//
endloc (*local*) // end of [local(i0gpt)]

(* ****** ****** *)

local
//
datatype
i0cls =
I0CLS of
(
loctn, i0cls_node)
#absimpl
i0cls_tbox = i0cls
//
in (* in-of-local *)
//
#implfun
i0cls_make_node
(   loc,nod   ) = I0CLS(loc,nod)
//
#implfun
i0cls_get_lctn(cls) =
let
  val+I0CLS(loc,nod) = cls in loc
end
#implfun
i0cls_get_node(cls) =
let
  val+I0CLS(loc,nod) = cls in nod
end
//
endloc (*local*) // end of [local(i0cls)]

(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
t0imp =
T0IMP of
(
stamp, t0imp_node)
datatype
t0imp_vt =
T0IMP_vt of
(
stamp, t0imp_node)
//
#absimpl
t0imp_tbox = t0imp
//
in (* in-of-local *)
//
#implfun
t0imp_make_node
(   stm,nod   ) = T0IMP(stm,nod)
//
(* ****** ****** *)
//
#implfun
t0imp_get_stmp(tmp) =
let
  val+T0IMP(stm,nod) = tmp in stm
end
#implfun
t0imp_get_node(tmp) =
let
  val+T0IMP(stm,nod) = tmp in nod
end
//
(* ****** ****** *)
//
end (*local*) // end of [local(t0imp)]

(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0dcl =
I0DCL of
(loctn, i0dcl_node)
datavwtp
i0dcl_vt =
I0DCL_vt of
(loctn, i0dcl_node)
//
#absimpl i0dcl_tbox = i0dcl
//
in (* in-of-local *)
//
#implfun
i0dcl_make_node
(   loc,nod   ) =
(
  I0DCL(loc, nod) )
//
#implfun
i0dcl_get_lctn(dcl) =
let
val+
I0DCL(loc,nod) = dcl in loc end
#implfun
i0dcl_get_node(dcl) =
let
val+
I0DCL(loc,nod) = dcl in nod end
//
endloc (*local*) // end of [local(i0dcl)]
//
(* ****** ****** *)
(* ****** ****** *)

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

#implfun
i0valdcl_get_lctn
  (  ival  ) = let
val+
I0VALDCL
( lctn
, dpat, tdxp) = ival in lctn end

#implfun
i0valdcl_get_dpat
  (  ival  ) = let
val+
I0VALDCL
( lctn
, dpat, tdxp) = ival in dpat end

#implfun
i0valdcl_get_tdxp
  (  ival  ) = let
val+
I0VALDCL
( lctn
, dpat, tdxp) = ival in tdxp end

(* ****** ****** *)
//
#implfun
i0valdcl_make_args
(lctn, dpat, tdxp) =
(
  I0VALDCL(lctn, dpat, tdxp(*opt*)))
//
(* ****** ****** *)

endloc (*local*) // end of [local(i0valdcl)]

(* ****** ****** *)

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

#implfun
i0vardcl_get_lctn
  (  ivar  ) = let
val+
I0VARDCL
( lctn
, dpid, dini) = ivar in lctn end

#implfun
i0vardcl_get_dpid
  (  ivar  ) = let
val+
I0VARDCL
( lctn
, dpid, dini) = ivar in dpid end

#implfun
i0vardcl_get_dini
  (  ivar  ) = let
val+
I0VARDCL
( lctn
, dpid, dini) = ivar in dini end

(* ****** ****** *)
//
#implfun
i0vardcl_make_args
( lctn, dpid, dini) =
(
  I0VARDCL(lctn, dpid, dini(*opt*)) )
//
(* ****** ****** *)

endloc (*local*) // end of [ local(i0vardcl) ]

(* ****** ****** *)

local
//
datatype
i0fundcl =
I0FUNDCL of
( loc_t
, d2var
, fiarglst, teqi0exp)
//
#absimpl
i0fundcl_tbox = i0fundcl
//
in//local

#implfun
i0fundcl_get_lctn
  (  ifun  ) = let
val+
I0FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in lctn end

#implfun
i0fundcl_get_dpid
  (  ifun  ) = let
val+
I0FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in dpid end

#implfun
i0fundcl_get_farg
  (  ifun  ) = let
val+
I0FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in farg end

(* ****** ****** *)

#implfun
i0fundcl_get_tdxp
  (  ifun  ) = let
val+
I0FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in tdxp end

(* ****** ****** *)
//
#implfun
i0fundcl_make_args
(lctn, dpid, farg, tdxp) =
(
  I0FUNDCL(lctn, dpid, farg, tdxp))
//
(* ****** ****** *)

endloc (*local*) // end of [ local(i0fundcl) ]

(* ****** ****** *)
(* ****** ****** *)

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

(* ****** ****** *)
//
#implfun
i0parsed_get_stadyn
  (ipar) =
(
  stadyn ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_get_stadyn]
//
#implfun
i0parsed_get_nerror
  (ipar) =
(
  nerror ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_get_nerror]
//
#implfun
i0parsed_get_source
  (ipar) =
(
  source ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_get_source]
//
(* ****** ****** *)

#implfun
i0parsed_get_parsed
  (ipar) =
(
  parsed ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_get_parsed]

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

endloc (*local*) // end of [ local(i0parsed) ]

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0.dats] *)
(***********************************************************************)
