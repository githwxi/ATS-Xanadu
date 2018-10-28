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
STM = "./stamp0.sats"
//
typedef stamp = $STM.stamp
//
(* ****** ****** *)

#staload
SYM = "./symbol.sats"
#staload
LOC = "./location.sats"
//
typedef sym_t = $SYM.sym_t
typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)

abstbox t2dat_tbox = ptr
typedef t2dat = t2dat_tbox

(* ****** ****** *)

abstbox t2xtv_tbox = ptr
typedef t2xtv = t2xtv_tbox

(* ****** ****** *)

datatype
sort2 =
  | S2Tbas of (t2bas) (* base sort *)
  | S2Txtv of (t2xtv) // for unification
  | S2Ttup of (sort2lst) (* tuple sort *)
  | S2Tfun of
    (sort2lst(*arg*), sort2(*res*)) // function
  | S2Terr of ((*void*)) // HX: error indication
// end of [sort2]

and t2bas =
  | T2BASpre of (sym_t) // predicative: int, bool, ...
  | T2BASdef of (t2dat) // user-defined datasorts
  | T2BASimp of (int(*knd*), sym_t) // impredicative sorts
// end of [t2bas]

where sort2lst = List0(sort2)

(* ****** ****** *)

typedef
sort2opt = Option(sort2)
typedef
sort2lstst = List0(sort2lst)
typedef
sort2lstopt = Option(sort2lst)

(* ****** ****** *)
//
fun
print_sort2: print_type(sort2)
fun
prerr_sort2: prerr_type(sort2)
fun
fprint_sort2: fprint_type(sort2)
//
overload print with print_sort2
overload prerr with prerr_sort2
overload fprint with fprint_sort2
//
(* ****** ****** *)
//
fun
print_t2bas: print_type(t2bas)
fun
prerr_t2bas: prerr_type(t2bas)
fun
fprint_t2bas: fprint_type(t2bas)
//
overload print with print_t2bas
overload prerr with prerr_t2bas
overload fprint with fprint_t2bas
//
(* ****** ****** *)
//
fun
print_t2dat: print_type(t2dat)
fun
prerr_t2dat: prerr_type(t2dat)
fun
fprint_t2dat: fprint_type(t2dat)
//
overload print with print_t2dat
overload prerr with prerr_t2dat
overload fprint with fprint_t2dat
//
(* ****** ****** *)
(*
//
fun
print_t2xtv: print_type(t2xtv)
fun
prerr_t2xtv: prerr_type(t2xtv)
fun
fprint_t2xtv: fprint_type(t2xtv)
//
overload print with print_t2xtv
overload prerr with prerr_t2xtv
overload fprint with fprint_t2xtv
//
*)
(* ****** ****** *)
//
abstype s2cst_tbox
typedef s2cst = s2cst_tbox
typedef s2cstlst = List0(s2cst)
typedef s2cstopt = Option(s2cst)
//
(* ****** ****** *)
//
// HX: datasort
//
fun t2dat_stamp_new(): stamp
//
fun s2var_stamp_new(): stamp
fun s2xtv_stamp_new(): stamp
//
(* ****** ****** *)
//
fun
t2dat_new(sym: sym_t): t2dat
//
fun
t2dat_get_sym(s2td: t2dat): sym_t
fun
t2dat_get_stamp(s2td: t2dat): stamp
//
overload .sym with t2dat_get_sym
overload .stamp with t2dat_get_stamp
//
fun
t2dat_get_sconlst(s2td: t2dat): s2cstlst
//
overload .sconlst with t2dat_get_sconlst
//
(* ****** ****** *)
//
fun
t2xtv_new((*void*)): t2xtv
//
fun
t2xtv_get_stamp(s2tx: t2xtv): stamp
//
overload .stamp with t2xtv_get_stamp
//
fun
t2xtv_get_sort(s2tx: t2xtv): sort2
fun
t2xtv_get_sortopt(s2tx: t2xtv): sort2opt
//
overload .sort with t2xtv_get_sort
overload .sortopt with t2xtv_get_sortopt
//
(* ****** ****** *)

(* end of [xats_staexp2.sats] *)
