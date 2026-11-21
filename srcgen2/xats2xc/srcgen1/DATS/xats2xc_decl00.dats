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
(*
Fri Nov 20 10:21:34 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // FIL =
"./../../../SATS/filpath.sats"
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2xc.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/xats2xc.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i1dcl_lctn$get
#symload node with i1dcl_node$get
(* ****** ****** *)
#symload node with t1imp_node$get
#symload stmp with t1imp_stmp$get
(* ****** ****** *)
(* ****** ****** *)
//
fun
endlfpr
(out0: FILR): void =
(
 strn_fprint("\n",out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tjagsfpr
( out0: FILR
, t2js: t2jaglst): void =
let
#impltmp
g_print$out
< (*tmp*) >
( (*nil*) ) = out0 in
  g_print<t2jaglst>(t2js) end
//let//endof(tjagsfpr(out0,t2js))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_xcaemit
(dcl0, env0) =
let
(*
//
val () =
prerrsln("\
i1dcl_xcaemit: dcl0 = ", dcl0)
//
*)
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
//
|
_(* otherwise *) =>
let
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1dcl_fprint(dcl0, filr); endlfpr(filr)
end//let
//
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
val loc0 = dcl0.lctn()
(* ****** ****** *)
(* ****** ****** *)
//
val (  ) =
let
val filr =
envx2cc_filr$get(env0)
val nind =
envx2cc_nind$get(env0)
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
loctn_fprint(loc0, filr); endlfpr(filr)
end//let
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1dcl_xcaemit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2xc/srcgen1/DATS/xats2xc_decl00.dats] *)
(***********************************************************************)
(***********************************************************************)
