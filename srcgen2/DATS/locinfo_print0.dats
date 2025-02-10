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
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
lcsrc_fprint
  (out, src) = let
//
#impltmp
g_print$out<>() = out
//
in//let
case+ src of
|
LCSRCnone0() => print("()")
|
LCSRCfpath(fpx) =>
prints("LCSRCfpath(", fpx, ")")
|
LCSRCsome1(txt) =>
prints("LCSRCsome1(", txt, ")")
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
prints
( (ntot+1)
, "(line=", nrow+1
, ",offs=", ncol+1, ")") where
{
  #impltmp g_print$out<>() = out
}
end(*let*)//end of [postn_fprint(...)]

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
(
prints
(lsrc, "@(", pbeg, "--", pend, ")"))
end(*let*)//end of [loctn_fprint(out,loc)]

(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-05-18:
*)
#implfun
fprint_loctn_as_stamp
  (out, loc) =
(
  print(ntot)) where
{
//
  #impltmp
  g_print$out<>() = out
//
  val pbeg = loc.pbeg()
  val ntot = postn_get_ntot(pbeg)
//
}(*where*) // end of [fprint_loctn_as_stamp]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_locinfo_print0.dats] *)
