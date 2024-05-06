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
Sat 16 Mar 2024 01:05:12 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload // D2E =
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1val_con(dcon) =
let
val loc0 =
d2con_get_lctn(dcon)
in//let
i1val(loc0, I1Vcon(dcon))
end//let//i1val_con(dcon)
//
#implfun
i1val_cst(dcst) =
let
val loc0 =
d2cst_get_lctn(dcst)
in//let
i1val(loc0, I1Vcst(dcst))
end//let//i1val_cst(dcst)
//
(* ****** ****** *)
//
#implfun
i1val_var(dvar) =
let
val loc0 =
d2var_get_lctn(dvar)
in//let
i1val(loc0, I1Vvar(dvar))
end//let//i1val_var(dvar)
//
(* ****** ****** *)
//
#implfun
i1val_none0
(  loc0  ) =
i1val_make_node
(loc0,I1Vnone0((*void*)))
#implfun
i1val_none1
(  i0e0  ) =
i1val_make_node
(
i0e0.lctn(),I1Vnone1(i0e0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmp_get_ival
(  icmp  ) =
(
case+ icmp of
|I1CMPcons(ilts, ival) => ival)
//
#implfun
i1cmp_get_ilts
(  icmp  ) =
(
case+ icmp of
|I1CMPcons(ilts, ival) => ilts)
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
fjarg =
FJARG of
(
loctn, fjarg_node)
#absimpl
fjarg_tbox = fjarg
//
in (* in-of-local *)
//
#implfun
fjarg_make_node
(   loc,nod   ) = FJARG(loc,nod)
//
#implfun
fjarg_get_lctn(fja) =
let
  val+FJARG(loc,nod) = fja in loc
end
#implfun
fjarg_get_node(fja) =
let
  val+FJARG(loc,nod) = fja in nod
end
//
endloc (*local*) // end of [local(fjarg)]
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
t1imp =
T1IMP of
(
stamp, t1imp_node)
datatype
t1imp_vt =
T1IMP_vt of
(
stamp, t1imp_node)
//
#absimpl
t1imp_tbox = t1imp
//
in (* in-of-local *)
//
#implfun
t1imp_make_node
(   stm,nod   ) = T1IMP(stm,nod)
//
(* ****** ****** *)
//
#implfun
t1imp_get_stmp(tmp) =
let
  val+T1IMP(stm,nod) = tmp in stm
end
#implfun
t1imp_get_node(tmp) =
let
  val+T1IMP(stm,nod) = tmp in nod
end
//
(* ****** ****** *)
//
end (*local*) // end of [local(t1imp)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_none0
(  loc0  ) =
i1dcl_make_node
(loc0,I1Dnone0((*void*)))
#implfun
i1dcl_none1
(  dcl0  ) =
i1dcl_make_node
(
dcl0.lctn(),I1Dnone1(dcl0))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
val
stamper = stamper_new((*0*))
//
in//local
fun
the_i1tnm_stamp_new
  ((*void*)): stamp = stamper.getinc()
endloc // end-of-[the_i1tnm_stamp_new()]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i1opr =
I1OPR of (symbl)
#absimpl
i1opr_tbox = i1opr
//
in // in-of-local
//
#implfun
i1opr_fprint
(out, iopr) =
let
//
#impltmp
g_print$out<>() = out
//
val+I1OPR(name) = iopr
//
in//let
  print("I1OPR(", name, ")") endlet
//
end (*local*) // end of [local(i1opr_tbox)]
//
(* ****** ****** *)
//
local
//
datatype
i1tnm =
I1TNM of (stamp)
//
#absimpl i1tnm_tbox = i1tnm
//
in//local
//
#implfun
i1tnm_new0() =
(
  I1TNM(stmp)) where
{
  val stmp = the_i1tnm_stamp_new()
}
//
#implfun
i1tnm_fprint
(out, itnm) =
let
//
#impltmp
g_print$out<>() = out
//
val+I1TNM(stmp) = itnm
//
in//let
  print("I1TNM(", stmp, ")") endlet
//
end (*local*) // end of [local(i1tnm_tbox)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i1val =
I1VAL of
(loctn, i1val_node)
datavwtp
i1val_vt =
I1VAL_vt of
(loctn, i1val_node)
//
#absimpl i1val_tbox = i1val
//
in (* in-of-local *)
//
#implfun
i1val_make_node
(   loc,nod   ) =
(
  I1VAL(loc, nod) )
//
#implfun
i1val_get_lctn(i1v) =
let
val+
I1VAL(loc,nod) = i1v in loc end
#implfun
i1val_get_node(i1v) =
let
val+
I1VAL(loc,nod) = i1v in nod end
//
endloc (*local*) // end of [local(i1val)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i1dcl =
I1DCL of
(loctn, i1dcl_node)
datavwtp
i1dcl_vt =
I1DCL_vt of
(loctn, i1dcl_node)
//
#absimpl i1dcl_tbox = i1dcl
//
in (* in-of-local *)
//
#implfun
i1dcl_make_node
(   loc,nod   ) =
(
  I1DCL(loc, nod) )
//
#implfun
i1dcl_get_lctn(i1d) =
let
val+
I1DCL(loc,nod) = i1d in loc end
#implfun
i1dcl_get_node(i1d) =
let
val+
I1DCL(loc,nod) = i1d in nod end
//
endloc (*local*) // end of [local(i1dcl)]
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
i1valdcl =
I1VALDCL of
( loc_t
, i1bnd, teqi1cmp)
//
#absimpl
i1valdcl_tbox = i1valdcl
//
in//local

#implfun
i1valdcl_get_lctn
  (  ival  ) = let
val+
I1VALDCL
( lctn
, ibnd, tdxp) = ival in lctn end

#implfun
i1valdcl_get_dpat
  (  ival  ) = let
val+
I1VALDCL
( lctn
, ibnd, tdxp) = ival in ibnd end

#implfun
i1valdcl_get_tdxp
  (  ival  ) = let
val+
I1VALDCL
( lctn
, ibnd, tdxp) = ival in tdxp end

(* ****** ****** *)
//
#implfun
i1valdcl_make_args
(lctn, ibnd, tdxp) =
(
  I1VALDCL(lctn, ibnd, tdxp(*opt*)))
//
(* ****** ****** *)

endloc (*local*) // end of [local(i1valdcl)]

(* ****** ****** *)

local
//
datatype
i1vardcl =
I1VARDCL of
( loc_t
, d2var, teqi1cmp)
//
#absimpl
i1vardcl_tbox = i1vardcl
//
in//local

#implfun
i1vardcl_get_lctn
  (  ivar  ) = let
val+
I1VARDCL
( lctn
, dpid, dini) = ivar in lctn end

#implfun
i1vardcl_get_dpid
  (  ivar  ) = let
val+
I1VARDCL
( lctn
, dpid, dini) = ivar in dpid end

#implfun
i1vardcl_get_dini
  (  ivar  ) = let
val+
I1VARDCL
( lctn
, dpid, dini) = ivar in dini end

(* ****** ****** *)
//
#implfun
i1vardcl_make_args
( lctn, dpid, dini) =
(
  I1VARDCL(lctn, dpid, dini(*opt*)) )
//
(* ****** ****** *)

endloc (*local*) // end of [ local(i1vardcl) ]

(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
i1fundcl =
I1FUNDCL of
( loc_t
, d2var
, fjarglst, teqi1cmp)
//
#absimpl
i1fundcl_tbox = i1fundcl
//
in//local

#implfun
i1fundcl_get_lctn
  (  ifun  ) = let
val+
I1FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in lctn end

#implfun
i1fundcl_get_dpid
  (  ifun  ) = let
val+
I1FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in dpid end

#implfun
i1fundcl_get_farg
  (  ifun  ) = let
val+
I1FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in farg end

(* ****** ****** *)

#implfun
i1fundcl_get_tdxp
  (  ifun  ) = let
val+
I1FUNDCL
( lctn
, dpid
, farg, tdxp) = ifun in tdxp end

(* ****** ****** *)
//
#implfun
i1fundcl_make_args
(lctn, dpid, farg, tdxp) =
(
  I1FUNDCL(lctn, dpid, farg, tdxp))
//
(* ****** ****** *)

endloc (*local*) // end of [ local(i1fundcl) ]

(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
i1parsed =
I1PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
i1dclistopt)//program
//
#absimpl
i1parsed_tbox = i1parsed
//
in//local

(* ****** ****** *)
//
#implfun
i1parsed_get_stadyn
  (ipar) =
(
  stadyn ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_stadyn]
//
#implfun
i1parsed_get_nerror
  (ipar) =
(
  nerror ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_nerror]
//
#implfun
i1parsed_get_source
  (ipar) =
(
  source ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_source]
//
(* ****** ****** *)

#implfun
i1parsed_get_parsed
  (ipar) =
(
  parsed ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_parsed]

(* ****** ****** *)
//
#implfun
i1parsed_make_args
( stadyn
, nerror
, source, parsed) =
(
I1PARSED
( stadyn
, nerror, source, parsed)) where
{
//
(*
val () =
prerrln
("i1parsed_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[i1parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(i1parsed) ]

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep1.dats] *)
(***********************************************************************)
