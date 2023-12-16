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
#staload
SYM = "./xsymbol.sats"
#staload
FP0 = "./filpath.sats"
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
#typedef fpath = $FP0.fpath
(* ****** ****** *)
#staload
MAP = "./xsymmap.sats"
#typedef
topmap(a:t0)= $MAP.topmap(a)
(* ****** ****** *)
//
#staload
FIX = "./xfixity.sats"
//
#typedef fixty = $FIX.fixty
//
#vwtpdef
fixtyopt_vt = optn_vt(fixty)
//
(* ****** ****** *)
//
#staload
S1E = "./staexp1.sats"
#staload
G1M = "./gmacro1.sats"
#staload
D1E = "./dynexp1.sats"
//
#staload
S2E = "./staexp2.sats"
#staload
D2E = "./dynexp2.sats"
//
#staload
D3E = "./dynexp3.sats"
//
(* ****** ****** *)
//
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
#typedef g1mac = $G1M.g1mac
//
(* ****** ****** *)
//
#typedef sort2 = $S2E.sort2
#typedef s2exp = $S2E.s2exp
#typedef s2tex = $S2E.s2tex
#typedef s2itm = $S2E.s2itm
//
(* ****** ****** *)
//
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef d2itm = $D2E.d2itm
#typedef d2ptm = $D2E.d2ptm
//
(* ****** ****** *)
fun
the_XATSHOME(): strn
(* ****** ****** *)
fun
the_xsymbls_insert
  (sym: sym_t): void
fun
the_xsymbls_search
(key:sint): optn_vt(sym_t)
(* ****** ****** *)
fun
the_xatsopt_include
  ( (*void*) ): list(strn)
(* ****** ****** *)
//
fun
the_fxtyenv_pvsload
  ( (*void*) ): sint(*0/1*)
fun
the_fxtyenv_pvsfind
  (key: sym_t): fixtyopt_vt
//
(* ****** ****** *)
//
fun
filpath_pvsload
(knd0:sint,fpth:strn):void
//
fun
the_tr12env_pvsload
  ( (*void*) ): sint(*0/1*)
//
(* ****** ****** *)
//
fun
the_gmacenv_pvs
  ((*void*)): topmap(g1mac)
//
(* ****** ****** *)
//
fun
the_sortenv_pvs
  ((*void*)): topmap(s2tex)
fun
the_sexpenv_pvs
  ((*void*)): topmap(s2itm)
fun
the_dexpenv_pvs
  ((*void*)): topmap(d2itm)
//
(* ****** ****** *)
//
(*
HX: funs for merging with
*)
//
(* ****** ****** *)
//
fun
the_gmacenv_pvsmrgw
  (map: topmap(g1mac)): void
//
fun
the_sortenv_pvsmrgw
  (map: topmap(s2tex)): void
fun
the_sexpenv_pvsmrgw
  (map: topmap(s2itm)): void
fun
the_dexpenv_pvsmrgw
  (map: topmap(d2itm)): void
//
(* ****** ****** *)
//
fun
the_gmacenv_pvsfind
  (key: sym_t): optn_vt(g1mac)
//
fun
the_sortenv_pvsfind
  (key: sym_t): optn_vt(s2tex)
fun
the_sexpenv_pvsfind
  (key: sym_t): optn_vt(s2itm)
fun
the_dexpenv_pvsfind
  (key: sym_t): optn_vt(d2itm)
//
(* ****** ****** *)
//
(*
HX-2023-06-02: for static loading
*)
//
(* ****** ****** *)
//
#typedef d1parsed = $D1E.d1parsed
//
#typedef d2parsed = $D2E.d2parsed
//
#typedef d3parsed = $D3E.d3parsed
(*
#typedef d3topenv = $D3E.d3topenv
*)
//
(* ****** ****** *)
//
fun
the_d1parenv_pvs
  ((*void*)): topmap(d1parsed)
fun
the_d1parenv_pvsfind
  (key: sym_t): optn_vt(d1parsed)
fun
the_d1parenv_pvsadd0
  (key: sym_t, itm: d1parsed): void
//
(* ****** ****** *)
//
fun
the_d2parenv_pvs
  ((*void*)): topmap(d2parsed)
fun
the_d2parenv_pvsfind
  (key: sym_t): optn_vt(d2parsed)
fun
the_d2parenv_pvsadd0
  (key: sym_t, itm: d2parsed): void
//
(* ****** ****** *)
//
fun
the_d3parenv_pvs
  ((*void*)): topmap(d3parsed)
fun
the_d3parenv_pvsfind
  (key: sym_t): optn_vt(d3parsed)
fun
the_d3parenv_pvsadd0
  (key: sym_t, itm: d3parsed): void
//
//
fun
the_d3tmpenv_pvs
  ((*void*)): topmap(d3parsed)
fun
the_d3tmpenv_pvsfind
  (key: sym_t): optn_vt(d3parsed)
fun
the_d3tmpenv_pvsadd0
  (key: sym_t, itm: d3parsed): void
//
(* ****** ****** *)
//
fun
the_sortenv_allist
  ( (*void*) ): list@(sym_t, s2tex)
fun
the_sexpenv_allist
  ( (*void*) ): list@(sym_t, s2itm)
fun
the_dexpenv_allist
  ( (*void*) ): list@(sym_t, d2itm)
//
(* ****** ****** *)
fun
the_sortenv_allist_print(): void
fun
the_sortenv_allist_prerr(): void
fun
the_sortenv_allist_fprint( out:FILR ): void
(* ****** ****** *)
fun
the_sexpenv_allist_print(): void
fun
the_sexpenv_allist_prerr(): void
fun
the_sexpenv_allist_fprint( out:FILR ): void
(* ****** ****** *)
fun
the_dexpenv_allist_print(): void
fun
the_dexpenv_allist_prerr(): void
fun
the_dexpenv_allist_fprint( out:FILR ): void
(* ****** ****** *)
//
fun
the_sortenv_allist_add0(sym_t, s2tex): void
fun
the_sexpenv_allist_add0(sym_t, s2itm): void
fun
the_dexpenv_allist_add0(sym_t, d2itm): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xglobal.sats] *)
