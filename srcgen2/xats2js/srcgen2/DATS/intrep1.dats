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
Sat Apr 11 02:14:28 PM EDT 2026
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
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
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
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
i1val_nil
(  loc0  ) =
i1val_make_node
(loc0,I1Vnil((*void*)))
//
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
//
#implfun
i1cmp_lctn$get
(  icmp  ) =
(
i1val_lctn$get(icmp.ival()))
//
#implfun
i1cmp_ival$get
(  icmp  ) =
(
case+ icmp of
|I1CMPcons(ilts, ival) => ival)
//
#implfun
i1cmp_ilts$get
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
val
stamper = stamper_new((*0*))
//
in//local
fun//fun
the_i1tnm_stamp_new
  ((*void*)): stamp = stamper.getinc()
endloc // end-of-[the_i1tnm_stamp_new()]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
local
//
datatype
i1opr =
I1OPR of (symbl)
#absimpl
i1opr_tbox = i1opr
//
in//local
//
#implfun
i1opr_fprint
(iopr, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
val+I1OPR(name) = iopr
//
in//let
  prints("I1OPR(", name, ")") endlet
//
end(*local*)//end-of-[local(i1opr_tbox)]
//
(* ****** ****** *)
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
i1tnm_stmp$get
  ( itnm ) =
let
val+
I1TNM(stmp) = itnm in stmp end
//
(* ****** ****** *)
//
#implfun
i1tnm_new0() =
(
  I1TNM(stmp)) where
{ val
  stmp = the_i1tnm_stamp_new()
}(*where*)//end-of-[i1tnm_new0()]
//
(* ****** ****** *)
//
#implfun
i1tnm_fprint
(itnm, out0) =
let
//
#impltmp
g_print$out<>() = out0
//
val+I1TNM(stmp) = itnm
//
in//let
  prints("I1TNM(", stmp, ")") endlet
//
(* ****** ****** *)
//
end(*local*)//end-of-[local(i1tnm_tbox)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_intrep1.dats] *)
(***********************************************************************)
