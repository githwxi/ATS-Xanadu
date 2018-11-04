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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload "./symmap.sats"
//
(* ****** ****** *)

#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"

(* ****** ****** *)

symintr trans12

(* ****** ****** *)
//
typedef sort1 = $S1E.sort1
typedef sort1opt = $S1E.sort1opt
typedef sort1lst = $S1E.sort1lst
//
typedef s1exp = $S1E.s1exp
typedef s1eff = $S1E.s1eff
typedef s1expopt = $S1E.s1expopt
typedef s1explst = $S1E.s1explst
//
(* ****** ****** *)
//
typedef sort2 = $S2E.sort2
typedef sort2opt = $S2E.sort2opt
typedef sort2lst = $S2E.sort2lst
//
typedef s2exp = $S2E.s2exp
typedef s2eff = $S2E.s2eff
typedef s2expopt = $S2E.s2expopt
typedef s2explst = $S2E.s2explst
//
(* ****** ****** *)

typedef s2itm = $S2E.s2itm

(* ****** ****** *)
//
vtypedef s2imap = symmap(s2itm)
//
(*
vtypedef d2imap = symmap(d2itm)
vtypedef s2tmap = symmap(s2rxt)
*)
//
(* ****** ****** *)
//
fun
trans12_sort: sort1 -> sort2 
fun
trans12_sortopt: sort1opt -> sort2opt
fun
trans12_sortlst: sort1lst -> sort2lst
//
(*
overload trans12 with trans12_sort
overload trans12 with trans12_sortopt
overload trans12 with trans12_sortlst
*)
//
(* ****** ****** *)
//
fun
trans12_sexp: s1exp -> s2exp 
fun
trans12_sexpopt: s1expopt -> s2expopt
fun
trans12_sexplst: s1explst -> s2explst
//
(*
overload trans12 with trans12_sexp
overload trans12 with trans12_sexpopt
overload trans12 with trans12_sexplst
*)
//
(* ****** ****** *)

(* end of [xats_trans12.sats] *)
