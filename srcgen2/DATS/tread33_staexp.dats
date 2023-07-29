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
(*
Fri 28 Jul 2023 09:39:54 PM EDT
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload node with s2typ_get_node
#symload sort with s2typ_get_sort
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
s2typ_errck
(lvl0: sint
,t2p0: s2typ): s2typ =
let
val s2t0 = t2p0.sort()
in//let
s2typ_make_node
(s2t0, T2Perrck(lvl0,t2p0))
end//let//end-of(s2typ_errck)
//
(* ****** ****** *)
//
#implfun
tread33_s2typ
( t2p0, err ) =
(
case+
t2p0.node() of
//
| _(* otherwise *) =>
let
val lvl0 = 1
in//let
(
err := err+1; s2typ_errck(lvl0,t2p0))
endlet // end of [ _(* otherwise *) ]
) where // end-of-[(*case+(t2p0)-of*)]
{
//
// (*
val (  ) =
prerrln("tread33_s2typ: t2p0 = ", t2p0)
// *)
//
} (*where*)//end[ tread33_s2typ(t2p0,err) ]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33_staexp.dats] *)
