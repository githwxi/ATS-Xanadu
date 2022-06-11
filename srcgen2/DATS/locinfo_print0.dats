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
Start Time: June 07th, 2022
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
//
#implfun
lcsrc_fprint
  (out, src) =
let
#impltmp
g_print$out<>() = out
in//let
case+ src of
|
LCSRCnone0() => print("()")
|
LCSRCfpath(fpx) => print(fpx)
|
LCSRCsome1(txt) => print("(", txt, ")")
end (*let*) // end of [lcsrc_fprint]
//
(* ****** ****** *)

#implfun
postn_fprint
  (out, pos) = let
//
val ntot = pos.ntot()
val nrow = pos.nrow()
val ncol = pos.ncol()
//
in//let
print
( (ntot+1)
, "(line=", nrow+1
, ",offs=", ncol+1, ")") where
{
  #impltmp g_print$out<>() = out
}
end(*let*) // end of [postn_fprint]

(* ****** ****** *)

#implfun
loctn_fprint
  (out, loc) = let
//
val lsrc = loc.lsrc()
val pbeg = loc.pbeg()
val pend = loc.pend()
//
#impltmp g_print$out<>() = out
//
in//let
print(lsrc, "@(", pbeg, "--", pend, ")")
end(*let*) // end of [loctn_fprint]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_locinfo_print0.dats] *)
