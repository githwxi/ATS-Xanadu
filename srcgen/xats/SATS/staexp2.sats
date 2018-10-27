(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
#staload
LOC = "./location.sats"
//
  typedef sym_t = $SYM.sym_t
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)

abstype s2tdat_type
typedef s2tdat = s2tdat_type
abstype s2tVar_type
typedef s2tVar = s2tVar_type

(* ****** ****** *)

datatype
sort2 =
  | S2Tbas of (s2tbas) (* base sort *)
  | S2TVar of (s2tVar) // for unification
  | S2Ttup of (sort2lst) (* tuple sort *)
  | S2Tfun of
    (sort2lst(*arg*), sort2(*res*)) // function
  | S2Terr of ((*void*)) // HX: error indication
// end of [sort2]

and s2tbas =
  | S2TBASpre of (sym_t) // predicative: int, bool, ...
  | S2TBASdef of (s2tdat) // user-defined datasorts
  | S2TBASimp of (int(*knd*), sym_t) // impredicative sorts
// end of [s2tbas]

where sort2lst = List0(sort2)

(* ****** ****** *)

typedef sort2opt = Option(sort2)
typedef sort2lstst = List0(sort2lst)
typedef sort2lstopt = Option(sort2lst)

(* ****** ****** *)

(* end of [xats_staexp2.sats] *)
