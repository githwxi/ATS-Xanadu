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
Sun Aug 14 15:47:10 EDT 2022
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
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
//
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
#typedef lcsrc = $LOC.lcsrc
//
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
#staload
S1E = "./staexp1.sats"
#staload
D1E = "./dynexp1.sats"
#staload
S2E = "./staexp2.sats"
(* ****** ****** *)
#typedef d1qid = $S1E.d1qid
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2var = $S2E.s2var
#typedef s2exp = $S2E.s2exp
(* ****** ****** *)
#abstbox d2con_tbox // ptr
#abstbox d2cst_tbox // ptr
#abstbox d2var_tbox // ptr
#typedef d2con = d2con_tbox
#typedef d2cst = d2cst_tbox
#typedef d2var = d2var_tbox
(* ****** ****** *)
#abstbox d2pat_tbox // ptr
#abstbox d2exp_tbox // ptr
#abstbox d2ecl_tbox // ptr
#typedef d2pat = d2pat_tbox
#typedef d2exp = d2exp_tbox
#typedef d2ecl = d2ecl_tbox
(* ****** ****** *)
#abstbox f2arg_tbox // ptr
#typedef f2arg = f2arg_tbox
(* ****** ****** *)
#abstbox d2gua_tbox // ptr
#abstbox d2gpt_tbox // ptr
#abstbox d2cls_tbox // ptr
#typedef d2gua = d2gua_tbox
#typedef d2gpt = d2gpt_tbox
#typedef d2cls = d2cls_tbox
(* ****** ****** *)
#typedef s2varlst = list(s2var)
(* ****** ****** *)
#typedef d2conlst = list(d2con)
#typedef d2cstlst = list(d2cst)
#typedef d2varlst = list(d2var)
(* ****** ****** *)
#typedef d2patlst = list(d2pat)
#typedef d2explst = list(d2exp)
(* ****** ****** *)
//
datatype
d2lab(x0:type) =
|
D2LAB of
(label, x0(*elt*))
//
(* ****** ****** *)
#typedef
d1lab(x0:t0)=$D1E.d1lab(x0)
(* ****** ****** *)
#typedef l2d2p = d2lab(d2pat)
#typedef l2d2e = d2lab(d2exp)
(* ****** ****** *)
#typedef l2d2plst = list(l2d2p)
#typedef l2d2elst = list(l2d2e)
(* ****** ****** *)
//
datatype
d2itm =
//
| D2ITMvar of (d2var)
| D2ITMcon of (d2conlst)
| D2ITMcst of (d2cstlst)
//
| D2ITMsym of (sym_t, d2ptmlst)
//
and // datatype
d2ptm =
|
D2PTMnone of (d1qid)
|
D2PTMsome of (int(*pval*), d2itm)
//
where
{
#typedef d2itmlst = list(d2itm)
#typedef d2itmopt = optn(d2itm)
#typedef d2ptmlst = list(d2ptm)
}
//
(* ****** ****** *)
fun
d2itm_fprint:(FILR,d2itm)->void
fun
d2ptm_fprint:(FILR,d2ptm)->void
(* ****** ****** *)
//
datatype
d2pat_node =
//
| D2Pnil of ()
| D2Pany of ()
| D2Parg of ()
//
| D2Pvar of d2var
| D2Pcon1 of (d2con)
| D2Pcon2 of (d2conlst)
//
| D2Pint of (token)
| D2Pbtf of (token)
| D2Pchr of (token)
| D2Pflt of (token)
| D2Pstr of (token)
//
| D2Pi00 of (sint) // sint
| D2Pb00 of (bool) // bool
| D2Pc00 of (char) // char
| D2Ps00 of (strn) // string
//
| D2Pbang of (d2pat) // !
| D2Pflat of (d2pat) // @
| D2Pfree of (d2pat) // ~
//
| D2Psym0 of
  (d1pat(*sym*), d2itmlst)
//
| D2Psapp of
  (d2pat, s2varlst(*sarg*))
//
|D2Pd0ap of (d2pat) // nullary
|D2Pd1ap of (d2pat) // argless
//
|
D2Pdapp of
( d2pat
, int(*npf*), d2patlst(*darg*))
//
|
D2Pdtup of
( token, sint(*npf*), d2patlst)
|
D2Pdrcd of
( token, sint(*npf*), l2d2plst)
//
| D2Panno of (d2pat, s1exp, s2exp)
//
(*
| D2Pg1mac of (g1mac) // HX: error!
*)
//
| D2Pnone0 of () | D2Pnone1 of (d1pat)
//
(* ****** ****** *)
fun
d2pat_fprint:(FILR,d2pat)->void
(* ****** ****** *)
fun
d2pat_get_lctn(d2pat): loc_t
fun
d2pat_get_node(d2pat): d2pat_node
(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp2.sats] *)
