(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Apr 20 12:56:21 PM EDT 2025
*)
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
#staload
SYM = "./../SATS/xsymbol.sats"
#staload
LAM = "./../SATS/xlabel0.sats"
#staload
MAP = "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/gmacro1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
(* ****** ****** *)
//
datatype g1val =
//
| G1Vint of (sint)
| G1Vbtf of (bool)
| G1Vchr of (char)
| G1Vflt of (dflt)
| G1Vstr of (strn)
//
| G1Vid0 of (sym_t)
//
| G1Vnone of ((*void*))
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
gmacenv = $MAP.topmap(g1mac)
(* ****** ****** *)
//
#extern
fun
g1val_fprint
(gval: g1val, out0: FILR): void
//
#implfun
g1val_fprint
(gval, out0) =
(
case+ gval of
//
|G1Vint
( int ) =>
prints("G1Vint(", int, ")")
|G1Vbtf
( btf ) =>
prints("G1Vbtf(", btf, ")")
|G1Vchr
( chr ) =>
prints("G1Vchr(", chr, ")")
|G1Vflt
( flt ) =>
prints("G1Vflt(", flt, ")")
|G1Vstr
( str ) =>
prints("G1Vstr(", str, ")")
//
|G1Vid0
( sym ) =>
prints("G1Vid0(", sym, ")")
//
|G1Vnone//HX: for non-values
( (*none*) ) => prints("G1Vnone()")
) where
{
#impltmp g_print$out<>() = ( out0 )
}(*where*)//end-of-[g1val_fprint(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
g1exp_eval // HX: first-order!
(genv: gmacenv, gexp: g1exp): g1val
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans12_utils0.dats] *)
