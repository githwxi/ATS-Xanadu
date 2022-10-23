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
Sun 23 Oct 2022 12:48:41 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload "./xsymbol.sats"
#staload "./filpath.sats"
//
(* ****** ****** *)
//
#staload
S2E = "./staexp2.sats"
#typedef sort2 = $S2E.sort2
#typedef s2exp = $S2E.s2exp
#typedef s2tex = $S2E.s2tex
#typedef s2itm = $S2E.s2itm
//
(* ****** ****** *)
//
#staload
D2E = "./dynexp2.sats"
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef d2itm = $D2E.d2itm
#typedef d2ptm = $D2E.d2ptm
//
(* ****** ****** *)
//
fun
the_sortenv_toplst
  ( (*void*) ): list@(sym_t, s2tex)
fun
the_sexpenv_toplst
  ( (*void*) ): list@(sym_t, s2itm)
fun
the_dexpenv_toplst
  ( (*void*) ): list@(sym_t, d2itm)
//
(* ****** ****** *)
//
fun
the_sortenv_toplst_add0(sym_t, s2tex): void
fun
the_sexpenv_toplst_add0(sym_t, s2itm): void
fun
the_dexpenv_toplst_add0(sym_t, d2itm): void
//
(* ****** ****** *)
fun
the_sortenv_toplst_print(): void
fun
the_sortenv_toplst_prerr(): void
fun
the_sortenv_toplst_fprint( out:FILR ): void
(* ****** ****** *)
fun
the_sexpenv_toplst_print(): void
fun
the_sexpenv_toplst_prerr(): void
fun
the_sexpenv_toplst_fprint( out:FILR ): void
(* ****** ****** *)
fun
the_dexpenv_toplst_print(): void
fun
the_dexpenv_toplst_prerr(): void
fun
the_dexpenv_toplst_fprint( out:FILR ): void
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xglobal.sats] *)
