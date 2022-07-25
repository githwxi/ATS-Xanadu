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
Sun Jul 24 17:59:26 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
#staload
FP0 = "./filpath.sats"
//
#typedef
fpath = $FP0.fpath
#typedef
fpathopt = $FP0.fpathopt
//
(* ****** ****** *)
//
#staload
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"
//
(* ****** ****** *)
#staload "./xbasics.sats"
#staload "./staexp1.sats"
(* ****** ****** *)
//
#abstype d1pat_tbox // ptr
#abstype d1exp_tbox // ptr
//
(* ****** ****** *)
//
#typedef d1pat = d1pat_tbox
#typedef d1patlst = list(d1pat)
#typedef d1patopt = optn(d1pat)
//
#typedef d1exp = d1exp_tbox
#typedef d1explst = list(d1exp)
#typedef d1expopt = optn(d1exp)
//
(* ****** ****** *)
#typedef
l0d1p = $D0E.d0lab(d1pat)
#typedef
l0d1e = $D0E.d0lab(d1exp)
#typedef l0d1plst = list(l0d1p)
#typedef l0d1elst = list(l0d1e)
(* ****** ****** *)
//
#abstbox d1gua_tbox // ptr
#abstbox d1gpt_tbox // ptr
#abstbox d1cls_tbox // ptr
//
#typedef d1gua = d1gua_tbox
#typedef d1gpt = d1gpat_tbox
#typedef d1cls = d1cls_tbox
//
#typedef d1gualst = list(d1gua)
#typedef d1clslst = list(d1cls)
//
(* ****** ****** *)
//
#abstype d1ecl_tbox // ptr
#typedef d1ecl = d1ecl_tbox
#typedef d1eclist = list(d1ecl)
#typedef d1eclopt = optn(d1ecl)
//
#vwtpdef d1eclist_vt = list_vt(d1ecl)
//
#typedef d1eclistopt = optn(d1eclist)
//
(* ****** ****** *)
//
datatype
d1pat_node =
//
| D1Pid0 of token
//
| D1Pint of token
| D1Pchr of token
| D1Pflt of token
| D1Pstr of token
//
| D1Pa0pp of () // apply
//
| D1Pb0sh of () // backslash
| D1Pb1sh of d1pat // backslash
//
(*
| D1Papps of
  (d1pat, d1patlst) // apply
*)
| D1Pa1pp of
  (d1pat(*fun*), d1pat)
| D1Pa2pp of
  (d1pat(*fun*), d1pat, d1pat)
//
| D1Psarg of
  (s1arglst(*static*))
//
| D1Pl1st of d1patlst // temp-list
| D1Pl2st of
  (d1patlst, d1patlst) // temp-list
//
| D1Pt1up of
  (token(*knd*), d1patlst)
| D1Pt2up of
  (token(*knd*), d1patlst, d1patlst)
//
| D1Pr1cd of
  (token(*knd*), l0d1plst)
| D1Pr2cd of
  (token(*knd*), l0d1plst, l0d1plst)
//
| D1Panno of
  ( d1pat
  , s1exp(*given*)) // HX: annotation
//
// end of [d1pat_node] // end of [datatype]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp1.sats] *)
