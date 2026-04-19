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
//
(*
Author: Hongwei Xi
//
Sat Apr 18 08:50:06 PM EDT 2026
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
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xsymmap.sats"
#staload
"./../../../SATS/xlabel0.sats"
(* ****** ****** *)
#staload
"./../../../SATS/locinfo.sats"
#staload
"./../../../SATS/lexing0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/tryd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dcl_tryd3i0
(idcl, enw0) =
let
//
val () =
prerrsln("\
i0dcl_tryd3i0: idcl = ", idcl)
//
in//let
//
case+
idcl.node() of
//
(* ****** ****** *)
|_(* otherwise *) => i0dcl_none2(idcl)
(* ****** ****** *)
//
end where//let//endof(i0dcl_tryd3i0(...))
{
}(*where*)//end-of-[i0dcl_tryd3i0(d3cl,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_tryd3i0_decl00.dats] *)
(***********************************************************************)
