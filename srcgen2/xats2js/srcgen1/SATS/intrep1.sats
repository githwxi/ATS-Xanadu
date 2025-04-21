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
#typedef g1nam = g1nam
//
(* ****** ****** *)
//
#typedef fpathopt=fpathopt
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
( lab
: i1lab(x0),out:FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype i1arg_tbox // p0tr
*)
#abstype i1opr_tbox // p0tr
#abstype i1tnm_tbox // p0tr
//
(* ****** ****** *)
//
(*
#typedef i1arg = i1arg_tbox
*)
#typedef i1opr = i1opr_tbox
#typedef i1tnm = i1tnm_tbox
//
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
#typedef d2sub = (d2var, i1val)
(* ****** ****** *)
(* ****** ****** *)
//
(*
#typedef i1arglst = list(i1arg)
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
fun
i1tnm_get_stmp(i1tnm): stamp
//
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
i1opr_fprint(i1opr, FILR): void
//
(* ****** ****** *)
//
(*
fun
i1arg_fprint(i1arg, FILR): void
*)
//
fun
i1tnm_fprint(i1tnm, FILR): void
//
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
and i1bnd =
|
I1BNDcons of
(i1tnm, i0pat, d2sublst)
//
and i1cmp =
|I1CMPcons of (i1letlst, i1val)
//
(* ****** ****** *)
//
and i1ins =
//
|I1INSopr of
(i1opr(*opnm*)
,i1valist(*args*))//primopr
//
|I1INSdapp of
(i1val(*fun0*)
,i1valist(*args*))//funcall
//
|I1INStimp of
(i0exp(*tapp*)
,t1imp(*tmpinst*))//impltmp
//
|I1INSpcon of
(label(*int/sym*)
,i1val(*conroot*))//conproj
|I1INSpflt of
(label(*int/sym*)
,i1val(*tuproot*))//tfltprj
|I1INSproj of
(label(*int/sym*)
,i1val(*tuproot*))//tptrprj
//
(* ****** ****** *)
//
|I1INSlet0 of
(i1dclist, i1cmp )//letinend
//
(* ****** ****** *)
//
|I1INSift0 of
(i1val(*test*)
,i1cmpopt(*then*)
,i1cmpopt(*else*))//ifthnels
//
|I1INScas0 of
( token(*casknd*)
, i1val(*casval*), i1clslst)
//
(* ****** ****** *)
//
|I1INStup0 of (i1valist)//flat
|I1INStup1 of (token, i1valist)
|I1INSrcd2 of (token, l1i1vlst)
//
(* ****** ****** *)
//
|I1INSlam0 of
(token // kind
,fjarglst(*args*),i1cmp(*body*))
//
|I1INSfix0 of
(token // kind
,d2var // fix-var
,fjarglst(*args*),i1cmp(*body*))
//
(* ****** ****** *)
//
|I1INStry0 of
(token(*$TRY*)
,i1cmp
 (*normal*)
,i1val // HX: caught exception!
 (*excptn*),i1clslst(*handles*))
 
//
(* ****** ****** *)
//
|I1INSflat of
(i1val(*leftval*)) // de-leftval
//
(* ****** ****** *)
//
|I1INSfold of
(i1val(*datacon*)) // fold:no-op
//
|I1INSfree of
(i1val(*datacon*)) // malloc-free
//
(* ****** ****** *)
//
|I1INSdl0az of (i1val)//l0azy-fun
|I1INSdl1az of (i1val)//l1azy-fun
//
(* ****** ****** *)
//
|I1INSl0azy of 
(d1exp(*dknd*),i1cmp(*lazy-thunk*))
|I1INSl1azy of
(d1exp(*dknd*),i1cmp,i1cmplst(*frees*))
//
(* ****** ****** *)
//
|I1INSdp2tr of (i1val(*addof*)) // deref
//
(* ****** ****** *)
//
|I1INSraise of
(token(*tknd*), i1val(*except-con*))
//
|I1INSassgn of (i1val(*l-val*),i1val(*r-val*))
//
(* ****** ****** *)
(* ****** ****** *)
//
and
i1val_node =
//
|I1Vnil of ()
//
(* ****** ****** *)
//
|I1Vint of token
|I1Vbtf of sym_t
|I1Vchr of token
|I1Vflt of token
|I1Vstr of token
//
(* ****** ****** *)
|I1Vi00 of (sint)
|I1Vb00 of (bool)
|I1Vc00 of (char)
|I1Vf00 of (dflt)
|I1Vs00 of (strn)
(* ****** ****** *)
//
|I1Vtop of (sym_t)
//
(* ****** ****** *)
(*
|I1Varg of (i1arg)
*)
(* ****** ****** *)
|I1Vtnm of (i1tnm)
(* ****** ****** *)
|I1Vcon of (d2con)
|I1Vcst of (d2cst)
|I1Vvar of (d2var)
(* ****** ****** *)
(* ****** ****** *)
(*
//
|I1Vtimp of
(i0exp(*tapp*), t1imp)
//
*)
(* ****** ****** *)
(* ****** ****** *)
|I1Vaddr of (i1val(*addr*))
|I1Vaexp of (i0exp(*flat*))
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
|I1Vp0rj of (i1val, sint)
|I1Vp1cn of (i0pat, i1val, sint)
|I1Vp1rj of (token, i1val, sint)
|I1Vp2rj of (token, i1val, label)
//
(* ****** ****** *)
//
(*
HX-2024-05-15:
For flat/boxed left-values
*)
|I1Vlpft of (label, i1val)//flat
|I1Vlpbx of (label, i1val)//boxed
//
(*
HX-2024-07-18:
For consed left-values
*)
|I1Vlpcn of (label, i1val)//consd
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
|I1Vlam0 of
( token(*knd*)
, fjarglst(*args*), i1cmp(*body*))
//
|I1Vfix0 of
( token(*knd*)
, d2var(*fid*)
, fjarglst(*args*), i1cmp(*body*))
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
|I1Vl0azy of
(d1exp(*kind*), i1cmp(*body*))
|I1Vl1azy of
(d1exp(*kind*)
,i1cmp(*body*), i1cmplst(*frees*))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vextnam of
(
token(*$EXTNAM*), i1val, g1nam)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vnone0 of () | I1Vnone1 of (i0exp)
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
} //(*where*)//end-of-(i1let/ins/val)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1let_fprint:(i1let, FILR)->void
//
fun
i1bnd_fprint:(i1bnd, FILR)->void
fun
i1cmp_fprint:(i1cmp, FILR)->void
//
fun
i1ins_fprint:(i1ins, FILR)->void
//
fun
i1val_fprint:(i1val, FILR)->void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1cmp_get_lctn(i1cmp): ( loc_t )
//
fun
i1cmp_get_ival(i1cmp): ( i1val )
fun
i1cmp_get_ilts(i1cmp): (i1letlst)
//
#symload lctn with i1cmp_get_lctn
#symload ival with i1cmp_get_ival
#symload ilts with i1cmp_get_ilts
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
i1val_none0(loc0: loc_t): (i1val)
fun
i1val_none1(iexp: i0exp): (i1val)
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
FJARGdarg of i1bndlst
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
(farg:fjarg,out0:FILR): void
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
i1gua_node =
| I1GUAexp of (i1cmp)
| I1GUAmat of (i1cmp, i1bnd)
//
datatype
i1cls_node =
| I1CLSgpt of (i1gpt)
| I1CLScls of (i1gpt, i1cmp)
and
i1gpt_node =
| I1GPTpat of (i1bnd)
| I1GPTgua of (i1bnd, i1gualst)
//
(* ****** ****** *)
//
fun
i1gua_fprint
(igua:i1gua, out0:FILR): void
fun
i1gpt_fprint
(igpt:i1gpt, out0:FILR): void
fun
i1cls_fprint
(icls:i1cls, out0:FILR): void
//
(* ****** ****** *)
//
fun
i1gua_get_lctn(i1gua): loc_t
fun
i1gua_get_node(i1gua): i1gua_node
//
(* ****** ****** *)
//
fun
i1gpt_get_lctn(i1gpt): loc_t
fun
i1gpt_get_node(i1gpt): i1gpt_node
//
(* ****** ****** *)
//
fun
i1cls_get_lctn(i1cls): loc_t
fun
i1cls_get_node(i1cls): i1cls_node
//
(* ****** ****** *)
//
#symload lctn with i1gua_get_lctn
#symload lctn with i1gpt_get_lctn
#symload lctn with i1cls_get_lctn
//
#symload node with i1gua_get_node
#symload node with i1gpt_get_node
#symload node with i1cls_get_node
//
(* ****** ****** *)
//
fun
i1gua_make_node
(loc0:loc_t,node:i1gua_node):i1gua
fun
i1gpt_make_node
(loc0:loc_t,node:i1gpt_node):i1gpt
fun
i1cls_make_node
(loc0:loc_t,node:i1cls_node):i1cls
//
#symload i1gua with i1gua_make_node
#symload i1gpt with i1gpt_make_node
#symload i1cls with i1cls_make_node
//
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
t1imp_i1cmpq
(timp: t1imp): i1cmpopt
//
fun
t1imp_i1dclq
(timp: t1imp): i1dclopt
//
(* ****** ****** *)
//
fun
t1imp_fprint
(timp:t1imp, out0:FILR):(void)
//
(* ****** ****** *)
//
fun
t1imp_get_dcst
(timp: t1imp): (d2cst)
//
#symload dcst with t1imp_get_dcst
//
fun
t1imp_get_stmp
(timp: t1imp): (stamp)
fun
t1imp_get_node
(timp: t1imp): t1imp_node
//
#symload stmp with t1imp_get_stmp
#symload node with t1imp_get_node
//
(* ****** ****** *)
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
|I1Di0dcl of (i0dcl)
//
(* ****** ****** *)
//
|I1Dextern of
(token(*kind*), i1dcl)
|I1Dstatic of
(token(*kind*), i1dcl)
//
(* ****** ****** *)
//
|I1Ddclst0 of (i1dclist)
|I1Dlocal0 of
(i1dclist(*local-head*)
,i1dclist(*local-body*))
//
(* ****** ****** *)
//
|I1Dtmpsub of
(s2vts(*tmpsub*), i1dcl)
//
(* ****** ****** *)
//
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
(
idcl:i1dcl,out0:FILR): ( void )
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
(ival:i1valdcl, out0:FILR): void
fun
i1vardcl_fprint
(ivar:i1vardcl, out0:FILR): void
(* ****** ****** *)
fun
i1fundcl_fprint
(ifun:i1fundcl, out0:FILR): void
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
i1vardcl_get_dpid:(i1vardcl)->i1bnd
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
, dpat:i1bnd, tdxp:teqi1cmp):i1valdcl
fun
i1vardcl_make_args
( lctn:loc_t
, dpid:i1bnd, dini:teqi1cmp):i1vardcl
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
(ipar:i1parsed, out0:FILR): void
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
