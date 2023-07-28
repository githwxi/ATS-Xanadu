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
Fri 28 Jul 2023 01:40:19 PM EDT
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
#staload
_(*TRANS3a*) = "./trans3a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
//
#implfun
trans3a_s2typ
( env0,t2p0 ) = let
//
val () =
prerrln
("trans3a_s2typ: t2p0 = ", t2p0)
//
in//let
//
case+
t2p0.node() of
| _(*otherwise*) => s2typ_none1(t2p0)
//
end where // end-of-let
{
} (*where*)//end of [trans3a_s2typ(env0,t2p0)]
//
(* ****** ****** *)
//
#implfun
trans3a_s2typlst
( env0, t2ps ) =
(
  list_trans3a_fnp(env0, t2ps, trans3a_s2typ))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a_staexp.dats] *)
