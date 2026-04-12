(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat Apr 11 01:40:42 AM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
#define
XATS2CC "\
XATSOPT/xats2cc/srcgen1"
*)
(* ****** ****** *)
(* ****** ****** *)
//
#include
".\
/../../..\
/HATS/xatsopt_sats.hats"
//
#staload
".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef sym_t = sym_t
#typedef label = label
#typedef loc_t = loc_t
#typedef loctn = loctn
#typedef lcsrc = lcsrc
#typedef fpath = fpath
#typedef token = token
//
(* ****** ****** *)
#typedef g1nam = g1nam
(* ****** ****** *)
//
#typedef
  fpathopt= optn(fpath)
#typedef
  fpathlst= list(fpath)
//
(* ****** ****** *)

(* ****** ****** *)
(* ****** ****** *)
//
datatype
i1lab(x0:type) =
|
I1LAB of (label,x0(*elt*))
//
(* ****** ****** *)
//
fun
<x0:type>
i1lab_fprint
(lab
:i1lab(x0),out:FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype i1arg_tbox // p0tr
#abstype i1env_tbox // p0tr
*)
#abstype i1opr_tbox // p0tr
#abstype i1tnm_tbox // p0tr
//
(* ****** ****** *)
//
(*
#typedef i1arg = i1arg_tbox
#typedef i1env = i1env_tbox
*)
#typedef i1opr = i1opr_tbox
#typedef i1tnm = i1tnm_tbox
//
(* ****** ****** *)
(* ****** ****** *)
#abstype i1val_tbox // p0tr
(* ****** ****** *)
#abstype fjarg_tbox // p0tr
(* ****** ****** *)
#abstbox i1gua_tbox // p0tr
#abstbox i1gpt_tbox // p0tr
#abstbox i1cls_tbox // p0tr
(* ****** ****** *)
#abstype i1dcl_tbox // p0tr
(* ****** ****** *)
#abstbox t1imp_tbox // p0tr
(* ****** ****** *)
//
#typedef i1val = i1val_tbox
#typedef fjarg = fjarg_tbox
//
#typedef i1cls = i1cls_tbox
#typedef i1gua = i1gua_tbox
#typedef i1gpt = i1gpt_tbox
//
#typedef i1dcl = i1dcl_tbox
//
#typedef t1imp = t1imp_tbox
//
(* ****** ****** *)
//
#abstbox i1valdcl_tbox//p0tr
#abstbox i1vardcl_tbox//p0tr
#abstbox i1fundcl_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i1parsed_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
#typedef l1i1v = i1lab(i1val)
(* ****** ****** *)
#typedef d2sub = (d2var,i1val)
(* ****** ****** *)
(* ****** ****** *)
//
(*
#typedef i1arglst = list(i1arg)
#typedef i1envlst = list(i1env)
*)
//
#typedef i1tnmlst = list(i1tnm)
//
(* ****** ****** *)
//
#typedef i1valist = list(i1val)
#typedef i1valopt = optn(i1val)
//
#typedef l1i1vlst = list(l1i1v)
//
#typedef fjarglst = list(fjarg)
//
(* ****** ****** *)
#typedef i1gualst = list(i1gua)
#typedef i1clslst = list(i1cls)
(* ****** ****** *)
//
#typedef i1dclist = list(i1dcl)
#typedef i1dclopt = optn(i1dcl)
//
(* ****** ****** *)
#typedef i1valdcl = i1valdcl_tbox
#typedef i1vardcl = i1vardcl_tbox
#typedef i1fundcl = i1fundcl_tbox
(* ****** ****** *)
#typedef i1parsed = i1parsed_tbox
(* ****** ****** *)
#typedef i1valdclist = list(i1valdcl)
#typedef i1vardclist = list(i1vardcl)
#typedef i1fundclist = list(i1fundcl)
(* ****** ****** *)
#typedef i1dclistopt = optn(i1dclist)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i1let =
|I1LETnew0 of (i1ins)
|I1LETnew1 of (i1tnm, i1ins)
//
(* ****** ****** *)
//
and i1ins =
//
|I1INSopr of
(i1opr(*opnm*)
,i1valist(*args*))//primopr
//
(* ****** ****** *)
//
and i1bnd =
|I1BNDcons of
(i1tnm, i0pat, d2sublst)
//
and i1cmp =
|I1CMPcons of (i1letlst, i1val)
//
(* ****** ****** *)
//
and
i1val_node =
//
(* ****** ****** *)
|I1Vnil of ()
(* ****** ****** *)
//
|I1Vint of token
|I1Vbtf of sym_t
|I1Vchr of token
|I1Vflt of token
|I1Vstr of token
//
(* ****** ****** *)
//
|I1Vnone0 of () | I1Vnone1 of (i0exp)
//
(* ****** ****** *)
//
where
{
//
  #typedef d2sublst = list(d2sub)
//
  #typedef i1bndlst = list(i1bnd)
//
  #typedef i1cmplst = list(i1cmp)
  #typedef i1cmpopt = optn(i1cmp)
//
  #typedef i1letlst = list(i1let)
//
} //(*where*)//end-of-(i1let/ins/val)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1let_fprint
(ilet: i1let, out0: FILR): void
//
fun
i1bnd_fprint
(ibnd: i1bnd, out0: FILR): void
fun
i1cmp_fprint
(icmp: i1cmp, out0: FILR): void
//
fun
i1ins_fprint
(iins: i1ins, out0: FILR): void
//
fun
i1val_fprint
(ival: i1val, out0: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1cmp_lctn$get:(i1cmp)->(loc_t)
fun
i1cmp_ival$get:(i1cmp)->(i1val)
fun
i1cmp_ilts$get:(i1cmp)->i1letlst
//
#symload lctn with i1cmp_lctn$get
#symload ival with i1cmp_ival$get
#symload ilts with i1cmp_ilts$get
//
(* ****** ****** *)
fun
i1val_nil(loc0: loc_t): ( i1val )
(* ****** ****** *)
//
fun
i1val_con(dcon: d2con): ( i1val )
fun
i1val_cst(dcst: d2cst): ( i1val )
//
fun
i1val_var(dvar: d2var): ( i1val )
//
(* ****** ****** *)
//
fun
i1val_conq(ival: i1val): ( bool )
//
fun
i1val_cstq(ival: i1val): ( bool )
//
fun
i1val_cfnq(ival: i1val): ( bool )
//
fun
i1val_varq(ival: i1val): ( bool )
//
(* ****** ****** *)
//
fun
i1val_lctn$get
  ( ival: i1val ): ( loc_t )
fun
i1val_node$get
  ( ival: i1val ): ( i1val_node )
//
#symload lctn with i1val_lctn$get
#symload node with i1val_node$get
//
(* ****** ****** *)
//
fun
i1val_none0(loc0: loc_t): (i1val)
fun
i1val_none1(iexp: i0exp): (i1val)
//
fun
i1val_make_node
(loc0:loc_t,node:i1val_node):i1val
//
#symload i1val with i1val_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_SATS_intrep1.sats] *)
(***********************************************************************)
