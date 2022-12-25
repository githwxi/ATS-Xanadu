(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 04 Nov 2022 05:04:08 PM EDT
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
//
#implfun
s2typ_f2cl
(  f2cl  ) =
s2typ_make_node
(s2t0, T2Pf2cl(f2cl)) where
{
  val s2t0 = sort2_none0()
} (*where*) // end of [s2typ_f2cl(...)]
//
(* ****** ****** *)
//
#implfun
s2typ_none0() =
s2typ
(s2t0, T2Pnone0()) where
{
  val s2t0 = sort2_none0()
} (*where*) // end of [s2typ_none0(...)]
//
(* ****** ****** *)
//
#implfun
s2typ_s2exp(s2e0) =
let
//
  val s2t0 = s2e0.sort()
//
(*
val (  ) = prerrln
("s2typ_s2exp: s2e0 = ", s2e0)
*)
in//let
  s2typ(s2t0, T2Ps2exp(s2e0))
end (*let*) // end of [s2typ_s2exp(s2e0)]
//
(* ****** ****** *)

local
//
datatype s2typ =
S2TYP of (sort2,s2typ_node)
//
#absimpl s2typ_tbox = s2typ
//
in//local
//
#implfun
s2typ_get_sort
   ( t2p0 ) = let
//
val
S2TYP(s2t0, node) = t2p0 in s2t0
//
end (*let*) // end of [s2typ_get_sort]
#implfun
s2typ_get_node
   ( t2p0 ) = let
//
val
S2TYP(s2t0, node) = t2p0 in node
//
end (*let*) // end of [s2typ_get_node]
//
#implfun
s2typ_make_node
( s2t0 , node ) = S2TYP(s2t0, node)
//
endloc (*local*) // end of [local(s2typ)]
//
(* ****** ****** *)
//
#implfun
l2t2p_get_sort
(   lx   ) = s2typ_get_sort(lx.itm())
#implfun
l2t2p_get_node
(   lx   ) = s2typ_get_node(lx.itm())
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2.dats] *)
