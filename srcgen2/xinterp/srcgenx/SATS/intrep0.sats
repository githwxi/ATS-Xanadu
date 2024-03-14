(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Fri Nov 24 03:22:05 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
(*
HX-2023-11-24:
level-0 intermediate representation
*)
//
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
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/filpath.sats"
#staload
"./../../../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
#staload S1E =
"./../../../SATS/staexp1.sats"
(* ****** ****** *)
#staload S2E =
"./../../../SATS/staexp2.sats"
#staload T2P =
"./../../../SATS/statyp2.sats"
#staload D2E =
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
#staload D3E =
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef stamp = stamp
#typedef sym_t = sym_t
#typedef label = label
#typedef loctn = loctn
#typedef loc_t = loctn
(* ****** ****** *)
#typedef g1exp = $S1E.g1exp
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef s2vts = $T2P.s2vts
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2var = $D2E.d2var
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
(* ****** ****** *)
#typedef dimpl = $D2E.dimpl
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
#typedef timpl = $D3E.timpl
(* ****** ****** *)
#typedef d2varlst = list(d2var)
#typedef d2varopt = optn(d2var)
(* ****** ****** *)
#typedef d2cstlst = list(d2cst)
#typedef d2conlst = list(d2con)
(* ****** ****** *)
#typedef s2qaglst = list(s2qag)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
(* ****** ****** *)
//
#typedef d3patlst = $D3E.d3patlst
//
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
//
(* ****** ****** *)
#typedef l3d3plst = $D3E.l3d3plst
#typedef l3d3elst = $D3E.l3d3elst
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d3gualst = $D3E.d3gualst
#typedef d3clslst = $D3E.d3clslst
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
#typedef d3valdclist = $D3E.d3valdclist
#typedef d3vardclist = $D3E.d3vardclist
#typedef d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
#typedef d3parsed = $D3E.d3parsed
(* ****** ****** *)
#typedef d3explstopt = $D3E.d3explstopt
#typedef d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
(* ****** ****** *)
//
datatype
irlab(x0:type) =
|
IRLAB of (label, x0(*elt*))
//
(* ****** ****** *)
fun
<x0:type>
irlab_fprint
( out: FILR
, lab: irlab( x0 )): (void)
(* ****** ****** *)
(* ****** ****** *)
#abstbox irpat_tbox // p0tr
#typedef irpat = irpat_tbox
(* ****** ****** *)
#abstbox irexp_tbox // p0tr
#typedef irexp = irexp_tbox
(* ****** ****** *)
#typedef l0irp = irlab(irpat)
#typedef l0ire = irlab(irexp)
(* ****** ****** *)
#typedef irpatlst = list(irpat)
#typedef l0irplst = list(l0irp)
(* ****** ****** *)
#typedef irexpopt = optn(irexp)
#typedef irexplst = list(irexp)
#typedef l0irelst = list(l0ire)
(* ****** ****** *)
//
datatype
fiarg =
|FIARG of (irpatlst)
//
#typedef
fiarglst = list(fiarg)
#typedef
fiarglstopt = optn(fiarglst)
//
(*
#abstbox fiarg_tbox // p0tr
#typedef fiarg = fiarg_tbox
*)
//
(* ****** ****** *)
#abstbox irgua_tbox // p0tr
#abstbox irgpt_tbox // p0tr
#abstbox ircls_tbox // p0tr
#typedef irgua = irgua_tbox
#typedef irgpt = irgpt_tbox
#typedef ircls = ircls_tbox
(* ****** ****** *)
(*
fun
fiarg_fprint
(out:FILR,fia0:fiarg): void
*)
(* ****** ****** *)
#abstbox irdcl_tbox // p0tr
#typedef irdcl = irdcl_tbox
(* ****** ****** *)
//
#abstbox irvaldcl_tbox//p0tr
#abstbox irvardcl_tbox//p0tr
#abstbox irfundcl_tbox//p0tr
//
(* ****** ****** *)
//
#abstbox irparsed_tbox//p0tr
//
(* ****** ****** *)
#typedef irgualst = list(irgua)
#typedef irclslst = list(ircls)
(* ****** ****** *)
#typedef irdclist = list(irdcl)
(* ****** ****** *)
#typedef irvaldcl = irvaldcl_tbox
#typedef irvardcl = irvardcl_tbox
#typedef irfundcl = irfundcl_tbox
(* ****** ****** *)
#typedef irparsed = irparsed_tbox
(* ****** ****** *)
#typedef irvaldclist = list(irvaldcl)
#typedef irvardclist = list(irvardcl)
#typedef irfundclist = list(irfundcl)
(* ****** ****** *)
#typedef irdclistopt = optn(irdclist)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
irpat_node =
//
|IRPnil of ()
|IRPany of ()
//
|IRPint of sint
|IRPbtf of bool
|IRPchr of char
//
|IRPflt of token
|IRPstr of token
//
|IRPvar of d2var
//
|IRPbang of (irpat)
//
(*
|IRPflat of (irpat)
|IRPfree of (irpat)
*)
//
|IRPcapp of
( d2con, irpatlst )
//
|IRPtup0 of (irpatlst)
|IRPtup1 of (token, irpatlst)
|IRPrcd2 of (token, l0irplst)
//
|IRPnone0 of ((*0*)) | IRPnone1 of (d3pat)
//
(* ****** ****** *)
//
fun
irpat_fprint
(out:FILR, irp0:irpat): void
//
(* ****** ****** *)
//
fun
irpat_get_lctn(irpat):( loc_t )
fun
irpat_get_node(irpat):irpat_node
//
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
(*
fun
irpat_get_type(irpat):( s2typ )
#symload type with irexp_get_type
*)
(* ****** ****** *)
fun
irpat_none0(loc0: loctn): (irpat)
fun
irpat_none1(d3p0: d3pat): (irpat)
(* ****** ****** *)
fun
irpat_make_node
(loc:loctn, nod:irpat_node): irpat
(* ****** ****** *)
#symload irpat with irpat_make_node
(* ****** ****** *)
//
datatype
irexp_node =
//
|IREint of token
|IREbtf of sym_t
|IREchr of token
|IREflt of token
|IREstr of token
//
|IREi00 of (sint) // sint
|IREb00 of (bool) // bool
|IREc00 of (char) // char
|IREf00 of (dflt) // float
|IREs00 of (strn) // string
//
|IREtop of (sym_t)
//
|IREvar of (d2var)
//
|IREcon of (d2con)
|IREcst of (d2cst)
//
|IREtimp of
(d3exp(*cst*), irdcl)
//
|IREdap0 of
( irexp(*con*) )
|IREdapp of
( irexp(*fun*)
, irexplst(*arglst*))
//
|IREpcon of
( token
, label, irexp(*con*))
|IREproj of
( token
, label, irexp(*tup*))
//
|IRElet0 of
(irdclist, irexp(*scope*))
//
|IREift0 of
(irexp(*test*)
,irexpopt(*th*), irexpopt(*el*))
//
|IREcas0 of
(token(*+/0/-*), irexp, irclslst)
//
|IREseqn of
(irexplst(*init*), irexp(*last*))
//
|IREtup0 of (irexplst)
|IREtup1 of (token(*knd*), irexplst)
|IRErcd2 of (token(*knd*), l0irelst)
//
|IRElam0 of
(token(*knd*),fiarglst(*arg*), irexp)
|IREfix0 of
(token(*knd*)
,d2var(*fid*),fiarglst(*arg*), irexp)
//
|IREaddr of (irexp)//left-val-address
|IREflat of (irexp)//left-val-content
//
(* ****** ****** *)
|IREfold of (irexp)//open-con-folding
(* ****** ****** *)
|IREfree of (irexp)//free-builtin-fun
(* ****** ****** *)
//
|IREdp2tr of (irexp)//p2tr-dereference
|IREdl0az of (irexp)//l0azy-eval-thunk
|IREdl1az of (irexp)//l1azy-eval-thunk
//
|IREwhere of (irexp, irdclist)
//
|IREassgn of
( irexp(*lft*), irexp(*val*) )
//
|IREraise of
( token(*knd*), irexp(*exn*) )
//
|IREl0azy of ( irexp(*thunk*) )
|IREl1azy of ( irexp, irexplst(*frees*))
//
|IREnone0 of ((*0*)) |IREnone1 of (d3exp)
//
// HX-2023-??-??: end-of-[datatype(irexp_node)]
//
(* ****** ****** *)
//
fun
irexp_fprint
(out:FILR, ire0:irexp): void
//
(* ****** ****** *)
//
fun
irexp_get_lctn(irexp):( loc_t )
fun
irexp_get_node(irexp):irexp_node
//
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
(*
fun
irexp_get_type(irexp):( s2typ )
#symload type with irexp_get_type
*)
(* ****** ****** *)
fun
irexp_none0(loc0: loctn): (irexp)
fun
irexp_none1(d3e0: d3exp): (irexp)
(* ****** ****** *)
fun
irexp_make_node
(loc:loctn, nod:irexp_node): irexp
(* ****** ****** *)
#symload irexp with irexp_make_node
(* ****** ****** *)
//
datatype
irgua_node =
| IRGUAexp of (irexp)
| IRGUAmat of (irexp, irpat)
//
(* ****** ****** *)
//
datatype
ircls_node =
| IRCLSgpt of irgpt
| IRCLScls of (irgpt, irexp)
and
irgpt_node =
| IRGPTpat of (irpat)
| IRGPTgua of (irpat, irgualst)
//
(* ****** ****** *)
//
fun
irgua_fprint:(FILR,irgua)->void
fun
irgpt_fprint:(FILR,irgpt)->void
fun
ircls_fprint:(FILR,ircls)->void
//
(* ****** ****** *)
//
fun
irgua_get_lctn(irgua): loc_t
fun
irgua_get_node(irgua): irgua_node
//
#symload lctn with irgua_get_lctn
#symload node with irgua_get_node
//
(* ****** ****** *)
//
fun
irgpt_get_lctn(irgpt): loc_t
fun
irgpt_get_node(irgpt): irgpt_node
//
#symload lctn with irgpt_get_lctn
#symload node with irgpt_get_node
//
(* ****** ****** *)
//
fun
ircls_get_lctn(ircls): loc_t
fun
ircls_get_node(ircls): ircls_node
//
#symload lctn with ircls_get_lctn
#symload node with ircls_get_node
//
(* ****** ****** *)
//
fun
irgua_make_node
(loc0:loc_t,node:irgua_node):irgua
fun
irgpt_make_node
(loc0:loc_t,node:irgpt_node):irgpt
fun
ircls_make_node
(loc0:loc_t,node:ircls_node):ircls
#symload irgua with irgua_make_node
#symload irgpt with irgpt_make_node
#symload ircls with ircls_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
irdcl_node =
//
|IRDd3ecl of (d3ecl)
//
|IRDtmpsub of
 (s2vts(*tmpsub*), irdcl)
//
|IRDlocal0 of
( irdclist(*local-head*)
, irdclist(*local-body*))
//
|IRDinclude of
( sint(*s/d*)
, token
, g1exp // src
, fpathopt
, irdclistopt) // inclusion
//
|
IRDvaldclst of
(token(*VAL(vlk)*), irvaldclist)
|
IRDvardclst of
(token(*VAR(vlk)*), irvardclist)
|
IRDfundclst of
( token(*FUN(fnk)*)
, t2qaglst, d2cstlst, irfundclist)
//
|
IRDimplmnt0 of
( token(*impkind*)
, stamp(*unicity*)
, s2qaglst // s2vs
, t2qaglst // s2vs+t2is
, dimpl, t2iaglst, fiarglst, irexp)
//
|IRDnone0 of ((*0*)) |IRDnone1 of (d3ecl)
//
(* ****** ****** *)
//
fun
irdcl_fprint
(out:FILR, ird0:irdcl): void
//
(* ****** ****** *)
//
fun
irdcl_get_lctn(irdcl):( loc_t )
fun
irdcl_get_node(irdcl):irdcl_node
//
(* ****** ****** *)
fun
irdcl_none0(loc0: loc_t): irdcl
fun
irdcl_none1(d3cl: d3ecl): irdcl
(* ****** ****** *)
fun
irdcl_d3ecl(d3cl: d3ecl): irdcl
(* ****** ****** *)
fun
irdcl_make_node
(loc:loctn, nod:irdcl_node):irdcl
(* ****** ****** *)
#symload irdcl with irdcl_make_node
(* ****** ****** *)
(* ****** ****** *)
fun
irvaldcl_fprint
(out: FILR, dval: irvaldcl): void
fun
irvardcl_fprint
(out: FILR, dvar: irvardcl): void
fun
irfundcl_fprint
(out: FILR, dfun: irfundcl): void
(* ****** ****** *)
fun
irvaldcl_get_lctn:(irvaldcl)->loc_t
fun
irvardcl_get_lctn:(irvardcl)->loc_t
fun
irfundcl_get_lctn:(irfundcl)->loc_t
(* ****** ****** *)
#symload lctn with irvaldcl_get_lctn
#symload lctn with irvardcl_get_lctn
#symload lctn with irfundcl_get_lctn
(* ****** ****** *)
//
datatype
teqirexp =
|
TEQIREXPnone of ((*void*))
|
TEQIREXPsome of (token(*EQ0*), irexp)
//
(* ****** ****** *)
//
(*
fun
teqirexp_fprint
(out:FILEref, tdxp:teqirexp): void
*)
//
(* ****** ****** *)
fun
irvaldcl_get_dpat:(irvaldcl)->irpat
fun
irvaldcl_get_tdxp:(irvaldcl)->teqirexp
(* ****** ****** *)
#symload dpat with irvaldcl_get_dpat
#symload tdxp with irvaldcl_get_tdxp//opt
(* ****** ****** *)
fun
irvardcl_get_dpid:(irvardcl)->d2var
fun
irvardcl_get_vpid:(irvardcl)->d2varopt
fun
irvardcl_get_dini:(irvardcl)->teqirexp
(* ****** ****** *)
#symload dpid with irvardcl_get_dpid
#symload vpid with irvardcl_get_vpid//opt
#symload dini with irvardcl_get_dini//opt
(* ****** ****** *)
fun
irfundcl_get_dpid:(irfundcl)->d2var
fun
irfundcl_get_farg:(irfundcl)->fiarglst
fun
irfundcl_get_tdxp:(irfundcl)->teqirexp
(* ****** ****** *)
#symload dpid with irfundcl_get_dpid
#symload farg with irfundcl_get_farg//lst
#symload tdxp with irfundcl_get_tdxp//opt
(* ****** ****** *)
//
fun
irvaldcl_make_args
( lctn:loc_t
, irp0:irpat, tdxp:teqirexp):irvaldcl
//
fun
irvardcl_make_args
( lctn:loc_t
, dpid:d2var
, vpid:d2varopt, tdxp:teqirexp):irvardcl
//
fun
irfundcl_make_args
( lctn:loc_t
, dpid:d2var
, farg:fiarglst, tdxp:teqirexp):irfundcl
//
#symload irvaldcl with irvaldcl_make_args
#symload irvardcl with irvardcl_make_args
#symload irfundcl with irfundcl_make_args
//
(* ****** ****** *)
//
fun
irparsed_of_trxd3ir
( dpar : d3parsed ): irparsed
//
(* ****** ****** *)
//
fun
irparsed_get_stadyn
( dpar : irparsed ): ( sint )
fun
irparsed_get_nerror
( dpar : irparsed ): ( sint )
//
fun
irparsed_get_source
( dpar : irparsed ): ( lcsrc )
fun
irparsed_get_parsed
( dpar : irparsed ): ( irdclistopt )
//
#symload stadyn with irparsed_get_stadyn
#symload nerror with irparsed_get_nerror
#symload source with irparsed_get_source
#symload parsed with irparsed_get_parsed
//
(* ****** ****** *)
//
fun
irparsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, parsed:irdclistopt): irparsed//end-fun
//
#symload irparsed with irparsed_make_args
//
(* ****** ****** *)
(* ****** ****** *)
#absvtbx trdienv_vtbx // p0tr
#vwtpdef trdienv = trdienv_vtbx
(* ****** ****** *)
(* ****** ****** *)
fun
trdienv_make_nil(): trdienv
fun
trdienv_free_top(trdienv): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trxd3ir_fnp
( e1:
! trdienv
, xs: list(x0)
, (!trdienv, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trxd3ir_fnp
( e1:
! trdienv
, xs: optn(x0)
, (!trdienv, x0) -> y0): optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3ir_d3pat
(env0: !trdienv, d3p0: d3pat): irpat
fun
trxd3ir_d3exp
(env0: !trdienv, d3e0: d3exp): irexp
(* ****** ****** *)
fun
trxd3ir_l3d3p
(env0: !trdienv, ld3p: l3d3p): l0irp
fun
trxd3ir_l3d3e
(env0: !trdienv, ld3e: l3d3e): l0ire
(* ****** ****** *)
//
(*
fun
trxd3ir_f3arg
(env0: !trdienv, f3a0: f3arg): fiarg
*)
//
(* ****** ****** *)
//
fun
trxd3ir_d3gua
(env0: !trdienv, d3g0: d3gua): irgua
fun
trxd3ir_d3gpt
(env0: !trdienv, dgpt: d3gpt): irgpt
fun
trxd3ir_d3cls
(env0: !trdienv, dcls: d3cls): ircls
//
(* ****** ****** *)
fun
trxd3ir_d3ecl
(env0: !trdienv, d3cl: d3ecl): irdcl
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3ir_d3patlst
(env0: !trdienv, d3ps: d3patlst): irpatlst
(* ****** ****** *)
//
fun
trxd3ir_d3explst
(env0: !trdienv, d3es: d3explst): irexplst
fun
trxd3ir_d3expopt
(env0: !trdienv, dopt: d3expopt): irexpopt
//
(* ****** ****** *)
fun
trxd3ir_l3d3plst
(env0: !trdienv, ldps: l3d3plst): l0irplst
fun
trxd3ir_l3d3elst
(env0: !trdienv, ldes: l3d3elst): l0irelst
(* ****** ****** *)
fun
trxd3ir_f3arglst
(env0: !trdienv, f3as: f3arglst): fiarglst
(* ****** ****** *)
//
fun
trxd3ir_d3gualst
(env0: !trdienv, d3gs: d3gualst): irgualst
fun
trxd3ir_d3clslst
(env0: !trdienv, dcls: d3clslst): irclslst
//
(* ****** ****** *)
//
fun
trxd3ir_teqd3exp
(env0: !trdienv, tdxp: teqd3exp): teqirexp
//
(* ****** ****** *)
(* ****** ****** *)
fun
trxd3ir_d3eclist
(env0: !trdienv, dcls: d3eclist): irdclist
(* ****** ****** *)
fun
trxd3ir_d3valdcl
(env0: !trdienv, dval: d3valdcl): irvaldcl
fun
trxd3ir_d3vardcl
(env0: !trdienv, dvar: d3vardcl): irvardcl
(* ****** ****** *)
fun
trxd3ir_d3fundcl
(env0: !trdienv, dfun: d3fundcl): irfundcl
(* ****** ****** *)
fun
trxd3ir_d3valdclist
(env0: !trdienv, d3vs: d3valdclist): irvaldclist
fun
trxd3ir_d3vardclist
(env0: !trdienv, d3vs: d3vardclist): irvardclist
(* ****** ****** *)
fun
trxd3ir_d3fundclist
(env0: !trdienv, d3fs: d3fundclist): irfundclist
(* ****** ****** *)
fun
trxd3ir_d3eclistopt
(env0: !trdienv, dcls: d3eclistopt): irdclistopt
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
