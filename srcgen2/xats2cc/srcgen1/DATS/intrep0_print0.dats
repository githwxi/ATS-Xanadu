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
Mon Mar  9 02:57:23 PM EDT 2026
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
//
#symload node with i0typ_node$get
#symload node with i0pat_node$get
#symload node with i0exp_node$get
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0typ_fprint
(ityp, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
in//let
//
case+
ityp.node() of
//
end(*let*)//end-of-[i0typ_fprint(ityp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pat_fprint
(ipat, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
in//let
//
case+
ipat.node() of
//
end(*let*)//end-of-[i0pat_fprint(ipat,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0exp_fprint
(iexp, out0) =
let
//
#impltmp
g_print$out
<(*0*)>((*0*)) = out0
//
in//let
//
case+
iexp.node() of
//
end(*let*)//end-of-[i0exp_fprint(iexp,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0_print0.dats] *)
(***********************************************************************)
