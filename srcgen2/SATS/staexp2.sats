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
Sun Aug 14 15:45:52 EDT 2022
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
#staload
SYM = "./xsymbol.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#abstbox t2abs_tbox // ptr
#abstbox t2dat_tbox // ptr
#typedef t2abs = t2abs_tbox
#typedef t2dat = t2dat_tbox
(* ****** ****** *)
#abstbox s2exp_tbox // ptr
#abstbox s2hnf_tbox // ptr
#abstbox t2ype_tbox // ptr
#typedef s2exp = s2exp_tbox
#typedef s2hnf = s2hnf_tbox
#typedef t2ype = t2ype_tbox
(* ****** ****** *)
#staload S0E = "./staexp0.sats"
#staload S1E = "./staexp1.sats"
(* ****** ****** *)
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
#typedef sort1lst = $S1E.sort1lst
#typedef s1explst = $S1E.s1explst
(* ****** ****** *)

datatype t2bas =
| T2Bpre of (sym_t)
  // pred: int, ...
| T2Babs of (t2abs)
  // for abstract sorts
| T2Bdat of (t2dat)
  // for user-defined datasorts
| T2Bimp of
  (int(*knd*), sym_t) // impred. sorts
// end of [ datatype(t2bas) ]

(* ****** ****** *)

datatype sort2 =
//
|
S2Tid0 of sym_t (* base sort *)
|
S2Tint of (int) (* base sort *)
//
|
S2Tbas of (t2bas) (* base sort *)
//
(*
|
S2Txtv of (t2xtv) // for unification
*)
//
|
S2Ttup of (sort2lst) (* tuple sort *)
//
|
S2Tf0un of ((*void*))
|
S2Tf1un of
(sort2lst(*arg*),sort2(*res*))//function
//
|
S2Tapps of
(sort2(*fun*),sort2lst(*arg*))//app-list
//
|
S2Tnone0 of () // HX: error or special
|
S2Tnone1 of sort1 // HX: error indication
//
where
{
  #typedef sort2lst = list(sort2)
  #typedef sort2opt = optn(sort2)
  #typedef sort2lstlst = list(sort2lst)
  #typedef sort2lstopt = optn(sort2lst)
} (* where *) // end of [ datatype(sort2)]
//
(* ****** ****** *)
//
fun
t2abs_fprint:(FILR,t2abs)->void
fun
t2bas_fprint:(FILR,t2bas)->void
fun
t2dat_fprint:(FILR,t2dat)->void
fun
sort2_fprint:(FILR,sort2)->void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp2.sats] *)
