(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 16 Mar 2024 12:43:42 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
//
#staload "./intrep0.sats"
//
(* ****** ****** *)
#typedef sym_t = sym_t
#typedef loc_t = loc_t
#typedef loctn = loctn
(* ****** ****** *)
#typedef lcsrc = lcsrc
(* ****** ****** *)
//
#typedef fpath = fpath
#typedef fpathopt = fpathopt
//
(* ****** ****** *)
//
datatype
i1lab(x0:type) =
|
I1LAB of (label, x0(*elt*))
//
(* ****** ****** *)
//
fun
<x0:type>
i1lab_fprint
( out: FILR
, lab: i1lab( x0 )): (void)
//
(* ****** ****** *)
(* ****** ****** *)
#abstype i1arg_tbox // p0tr
#abstype i1opr_tbox // p0tr
#abstype i1tnm_tbox // p0tr
(* ****** ****** *)
#typedef i1arg = i1arg_tbox
#typedef i1opr = i1opr_tbox
#typedef i1tnm = i1tnm_tbox
(* ****** ****** *)
#abstype i1val_tbox // p0tr
(* ****** ****** *)
#abstype fjarg_tbox // p0tr
(* ****** ****** *)
#abstype i1dcl_tbox // p0tr
(* ****** ****** *)
#abstbox t1imp_tbox // p0tr
(* ****** ****** *)
//
#typedef i1val = i1val_tbox
#typedef i1dcl = i1dcl_tbox
//
#typedef fjarg = fjarg_tbox
#typedef t1imp = t1imp_tbox
//
(* ****** ****** *)
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
#typedef d2sub = (d2var, i1val)
(* ****** ****** *)
(* ****** ****** *)
//
#typedef i1arglst = list(i1arg)
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
#typedef i1dclist = list(i1dcl)
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
fun
i1opr_make(name:sym_t): i1opr
//
fun
i1tnm_new0( (*void*) ): i1tnm
//
(* ****** ****** *)
//
fun
i1opr_fprint(FILR, i1opr): void
fun
i1tnm_fprint(FILR, i1tnm): void
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i1let =
(*
|I1LETnew0 of (i1tnm)
*)
|I1LETnew1 of (i1tnm, i1bfi)
//
(* ****** ****** *)
(* ****** ****** *)
//
and i1bnd =
|
I1BNDnone of ( (*void*) )
|
I1BNDsome of (i1tnm, d2sublst)
//
and i1cmp =
|I1CMPcons of (i1letlst, i1val)
//
(* ****** ****** *)
(* ****** ****** *)
//
and i1bfi =
//
|I1BFIopr of
( i1opr(*opnm*)
, i1valist(*args*))//primopr
//
|I1BFIdapp of
( i1val(*fun0*)
, i1valist(*args*))//funcall
//
|I1BFIift0 of
( i1val(*test*)
, i1cmpopt(*then*)
, i1cmpopt(*else*))//ifthnels
//
|I1BFItup0 of (i1valist)//flat
|I1BFItup1 of (token, i1valist)
|I1BFIrcd2 of (token, l1i1vlst)
//
(* ****** ****** *)
(* ****** ****** *)
//
and
i1val_node =
//
|I1Vnil of ()
//
|I1Vint of token
|I1Vbtf of sym_t
|I1Vchr of token
|I1Vflt of token
|I1Vstr of token
//
(* ****** ****** *)
//
(*
|I1Vcst of (d2cst)
|I1Vcon of (d2con)
*)
//
(* ****** ****** *)
|I1Varg of (i1arg)
(* ****** ****** *)
|I1Vtnm of (i1tnm)
(* ****** ****** *)
|I1Vcon of (d2con)
|I1Vcst of (d2cst)
|I1Vvar of (d2var)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vtimp of
(i0exp(*tapp*), t1imp)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
|I1Vtup0 of (i1valist)
|I1Vtup1 of (token, i1valist)
|I1Vrcd2 of (token, l1i1vlst)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vpcon of (d2con, i1val, sint)
|I1Vproj of (token, i1val, sint)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vlam0 of
( token(*knd*)
, fjarglst(*args*), i1cmp(*body*))
|I1Vfix0 of
( token(*knd*)
, d2var(*fid*)
, fjarglst(*args*), i1cmp(*body*))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vnone0 of () |I1Vnone1 of (i0exp)
//
(* ****** ****** *)
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
} //(*where*)//end-of-(i1let/bfi/val)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1let_fprint:(FILR,i1let)->void
fun
i1bfi_fprint:(FILR,i1bfi)->void
//
fun
i1bnd_fprint:(FILR,i1bnd)->void
fun
i1cmp_fprint:(FILR,i1cmp)->void
//
fun
i1val_fprint:(FILR,i1val)->void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1cmp_get_ival(i1cmp): ( i1val )
fun
i1cmp_get_ilts(i1cmp): (i1letlst)
//
#symload ival with i1cmp_get_ival
#symload ilts with i1cmp_get_ilts
//
(* ****** ****** *)
//
fun
i1val_get_lctn(i1val): ( loc_t )
fun
i1val_get_node(i1val): i1val_node
//
#symload lctn with i1val_get_lctn
#symload node with i1val_get_node
//
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
i1val_none0(loc0: loc_t): (i1val)
fun
i1val_none1(iexp: i0exp): (i1val)
//
(* ****** ****** *)
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
datatype
fjarg_node =
|
FJARGdapp of i1bndlst
//
#typedef
fjarglst = list(fjarg)
#typedef
fjarglstopt = optn(fjarglst)
//
(* ****** ****** *)
//
fun
fjarg_fprint
(out:FILR,farg:fjarg): ( void )
//
(* ****** ****** *)
fun
fjarg_get_lctn(fjarg): loc_t
fun
fjarg_get_node(fjarg): fjarg_node
(* ****** ****** *)
#symload lctn with fjarg_get_lctn
#symload node with fjarg_get_node
(* ****** ****** *)
fun
fjarg_make_node
(loc:loc_t, nod:fjarg_node):fjarg
#symload fjarg with fjarg_make_node
(* ****** ****** *)
(* ****** ****** *)
//
datatype
t1imp_node =
|T1IMPall1 of
(d2cst(*implment*), i1dclopt)
|T1IMPallx of
(d2cst(*implment*), i1dclopt)
//
(* ****** ****** *)
//
fun
t1imp_fprint
(
  out:FILR, timp:t1imp):(void)
//
(* ****** ****** *)
//
fun
t1imp_get_stmp
(timp: t1imp): stamp
fun
t1imp_get_node
(timp: t1imp): t1imp_node
//
#symload stmp with t1imp_get_stmp
#symload node with t1imp_get_node
//
fun
t1imp_make_node
(stm:stamp,nod:t1imp_node): t1imp
//
#symload t1imp with t1imp_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
teqi1cmp =
|
TEQI1CMPnone of ((*void*))
|
TEQI1CMPsome of (token(*EQ0*), i1cmp)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i1dcl_node =
//
(* ****** ****** *)
//
|
I1Dlocal0 of
( i1dclist(*local-head*)
, i1dclist(*local-body*))
|
I1Dinclude of
( sint(*s/d*)
, token
, g1exp // src
, fpathopt
, i1dclistopt) // inclusion
//
(* ****** ****** *)
//
|
I1Dvaldclst of
(token(*VAL(vlk)*), i1valdclist)
|
I1Dvardclst of
(token(*VAR(vlk)*), i1vardclist)
//
|
I1Dfundclst of
( token(*knd*), d2cstlst, i1fundclist)
//
(* ****** ****** *)
//
|I1Dimplmnt0 of
( token(*knd*)
, stamp, dimpl, fjarglst, i1cmp(*body*))
//
(* ****** ****** *)
//
|I1Dnone0 of ((*0*)) |I1Dnone1 of (i0dcl)
//
where
{
  #typedef i1dclistopt = optn(i1dclist) }
//(*where*) // end-of-[datatype(i1dcl_node)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_fprint
(out:FILR,idcl:i1dcl): ( void )
//
(* ****** ****** *)
//
fun
i1dcl_get_lctn(i1dcl): ( loc_t )
fun
i1dcl_get_node(i1dcl): i1dcl_node
//
(* ****** ****** *)
#symload lctn with i1dcl_get_lctn
#symload node with i1dcl_get_node
(* ****** ****** *)
fun
i1dcl_none0(loc_t): i1dcl
fun
i1dcl_none1(idcl: i0dcl): i1dcl
(* ****** ****** *)
fun
i1dcl_make_node
(loc0:loc_t,node:i1dcl_node):i1dcl
(* ****** ****** *)
#symload i1dcl with i1dcl_make_node
(* ****** ****** *)
(* ****** ****** *)
fun
i1valdcl_fprint
(out: FILR, ival: i1valdcl): void
fun
i1vardcl_fprint
(out: FILR, ivar: i1vardcl): void
(* ****** ****** *)
fun
i1fundcl_fprint
(out: FILR, ifun: i1fundcl): void
(* ****** ****** *)
(* ****** ****** *)
fun
i1valdcl_get_lctn:(i1valdcl)->loc_t
fun
i1vardcl_get_lctn:(i1vardcl)->loc_t
fun
i1fundcl_get_lctn:(i1fundcl)->loc_t
(* ****** ****** *)
(* ****** ****** *)
fun
i1valdcl_get_dpat:(i1valdcl)->i1bnd
fun
i1valdcl_get_tdxp:(i1valdcl)->teqi1cmp
(* ****** ****** *)
#symload dpat with i1valdcl_get_dpat
#symload tdxp with i1valdcl_get_tdxp(*opt*)
(* ****** ****** *)
fun
i1vardcl_get_dpid:(i1vardcl)->d2var
fun
i1vardcl_get_dini:(i1vardcl)->teqi1cmp
(* ****** ****** *)
#symload dpid with i1vardcl_get_dpid
#symload dini with i1vardcl_get_dini(*opt*)
(* ****** ****** *)
(* ****** ****** *)
fun
i1fundcl_get_dpid:(i1fundcl)->d2var
fun
i1fundcl_get_farg:(i1fundcl)->fjarglst
fun
i1fundcl_get_tdxp:(i1fundcl)->teqi1cmp
(* ****** ****** *)
#symload dpid with i1fundcl_get_dpid
#symload farg with i1fundcl_get_farg(*lst*)
#symload tdxp with i1fundcl_get_tdxp(*opt*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_make_args
( lctn:loc_t
, ibnd:i1bnd, tdxp:teqi1cmp):i1valdcl
fun
i1vardcl_make_args
( lctn:loc_t
, dpid:d2var, dini:teqi1cmp):i1vardcl
//
(* ****** ****** *)
//
fun
i1fundcl_make_args
( lctn:loc_t
, dpid:d2var
, farg:fjarglst, tdxp:teqi1cmp):i1fundcl
//
(* ****** ****** *)
//
#symload i1valdcl with i1valdcl_make_args
#symload i1vardcl with i1vardcl_make_args
#symload i1fundcl with i1fundcl_make_args
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_fprint
(out:FILR, ipar:i1parsed): void
//
(* ****** ****** *)
//
fun
i1parsed_get_stadyn:(i1parsed)->sint
fun
i1parsed_get_nerror:(i1parsed)->sint
//
fun
i1parsed_get_source:(i1parsed)->lcsrc
//
fun
i1parsed_get_parsed:(i1parsed)->i1dclistopt
//
(* ****** ****** *)
//
#symload stadyn with i1parsed_get_stadyn
#symload nerror with i1parsed_get_nerror
#symload source with i1parsed_get_source
#symload parsed with i1parsed_get_parsed
//
(* ****** ****** *)
//
fun
i1parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, parsed:i1dclistopt): i1parsed//end-fun
//
#symload i1parsed with i1parsed_make_args
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_intrep1.sats] *)
(***********************************************************************)
