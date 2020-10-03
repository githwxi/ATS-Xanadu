(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: October, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
"./../SATS/staexp1.sats"
//
(* ****** ****** *)
(*
//
datatype
g1exp_node =
//
| G1Eid of (sym_t)
//
| G1Eint of (token)
| G1Estr of (token)
//
| G1Eapp of ((*void*))
//
| G1Eapp1 of
  (g1exp(*fun*), g1exp)
| G1Eapp2 of
  (g1exp(*fun*), g1exp, g1exp)
//
| G1Elist of g1explst (*temp*)
//
| G1Enone0 of () // HX: EMPTY
| G1Enone1 of (g0exp) // HX: ERROR!
//
*)
//
datatype
g1val =
| G1Vid of sym_t
//
| G1Vint of (int)
| G1Vstr of string
//
| G1Vapp1 of (g1val, g1val)
| G1Vapp2 of (g1val, g1val, g1val)
//
| G1Vlist of (g1valist)
//
| G1Vnone0 of () | G1Vnone1 of (g1exp)
//
where g1valist = List0(g1val)
//
(* ****** ****** *)

(* end of [xats_gmacro1_define.dats] *)
