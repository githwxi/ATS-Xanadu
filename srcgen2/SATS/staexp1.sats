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
Sun Jul 24 17:58:32 EDT 2022
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
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
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
#staload S0E = "./staexp0.sats"
(* ****** ****** *)
//
(*
datatype
s1ymb_node =
| S1YMBtoken of (token)
*)
//
(* ****** ****** *)
//
datatype
s1lab(x0:type) =
|
S1LAB of
(label, x0(*elt*))
//
fun
<x0:t0>
s1lab_get_itm
(slab: s1lab(x0)): x0
#symload
itm with s1lab_get_itm
//
(* ****** ****** *)
#typedef
s0lab(x0:t0)=$S0E.s0lab(x0)
(* ****** ****** *)
//
fun
<x0:type>
s1lab_fprint
(out: FILR, lab: s1lab(x0)): void
//
(* ****** ****** *)
//
datatype g1nam =
//
| G1Nnil of ()
//
| G1Nid0 of sym_t
//
| G1Nint of sint
| G1Nchr of char
| G1Nflt of double
| G1Nstr of string
//
| G1Nlist of (g1namlst)
//
(*
| G1Nnone0 of () // HX: EMPTY
*)
| G1Nnone1 of (g0nam) // ERROR!
//
where
{
#typedef g0nam = $S0E.g0nam
#typedef g1namlst = list(g1nam)
#typedef g1namopt = optn(g1nam)
} (*where*) // end-of(datatype(g1nam))
//
(* ****** ****** *)
#abstbox g1exp_tbox // ptr
(* ****** ****** *)
#abstype g1arg_tbox // ptr
#abstype g1mag_tbox // ptr
(* ****** ****** *)
//
#typedef i1dnt = token
#typedef t1int = token
#typedef t1chr = token
#typedef t1flt = token
#typedef t1str = token
#typedef i0dnt = $S0E.i0dnt
#typedef t0int = $S0E.t0int
#typedef t0chr = $S0E.t0chr
#typedef t0flt = $S0E.t0flt
#typedef t0str = $S0E.t0str
//
(* ****** ****** *)
#typedef i1dntlst = list(token)
#typedef i1dntopt = optn(token)
#typedef i0dntlst = $S0E.i0dntlst
#typedef i0dntopt = $S0E.i0dntopt
(* ****** ****** *)
//
#typedef g0exp = $S0E.g0exp
//
#typedef g1exp = g1exp_tbox
#typedef g1arg = g1arg_tbox
#typedef g1mag = g1mag_tbox
//
#typedef g1explst = list(g1exp)
#typedef g1expopt = optn(g1exp)
#typedef g1arglst = list(g1arg)
#typedef g1maglst = list(g1mag)
(* ****** ****** *)
//
(* ****** ****** *)
//
datatype
g1exp_node =
//
| G1Eint of (token)
(*
| G1Ebtf of (token)
*)
| G1Echr of (token)
| G1Eflt of (token)
| G1Estr of (token)
//
| G1Eid0 of (sym_t)
//
| G1Eb0sh of () // bslash
| G1Eb1sh of g1exp // bslash
//
| G1Ea0pp of ((*nil*))//apply
//
| G1Ea1pp of
  (g1exp(*fun*), g1exp(*arg*))
| G1Ea2pp of
  (g1exp(*fun*), g1exp, g1exp)
//
| G1Elist of g1explst (*temp*)
//
|
G1Eift0 of
( g1exp(*cond*)
, g1exp(*then*), g1exp(*else*))
//
| G1Enone0 of () // HX: EMPTY
| G1Enone1 of (g0exp) // HX: ERROR!
//
|
G1Eerrck of (int(*lvl*), g1exp)//HX:tread-error
//
(* ****** ****** *)
fun
g1nam_fprint:(FILR,g1nam)->void
fun
g1exp_fprint:(FILR,g1exp)->void
(* ****** ****** *)
fun
g1exp_get_lctn(g1exp): loc_t
fun
g1exp_get_node(g1exp): g1exp_node
(* ****** ****** *)
#symload lctn with g1exp_get_lctn
#symload node with g1exp_get_node
(* ****** ****** *)
fun
g1exp_none0(loc:loc_t): g1exp
fun
g1exp_none1(g0e1:g0exp): g1exp
fun
g1exp_make_node
(loc:loc_t,nod:g1exp_node): g1exp
(* ****** ****** *)
#symload g1exp with g1exp_make_node
(* ****** ****** *)
//
datatype
g1arg_node =
|G1ARGnode of (token)
//
(* ****** ****** *)
//
datatype
g1mag_node =
(*
|G1MAGnone of ((*void*))
*)
|G1MAGsarg of (g1arglst)
|G1MAGdarg of (g1arglst)
//
where
{
(*
#typedef g1arglst = list(g1arg)
*)
}
(* ****** ****** *)
fun
g1arg_fprint:(FILR,g1arg)->void
fun
g1mag_fprint:(FILR,g1mag)->void
(* ****** ****** *)
fun
g1arg_get_lctn(g1arg): loc_t
fun
g1mag_get_lctn(g1mag): loc_t
fun
g1arg_get_node(g1arg): g1arg_node
fun
g1mag_get_node(g1mag): g1mag_node
(* ****** ****** *)
#symload lctn with g1arg_get_lctn
#symload lctn with g1mag_get_lctn
#symload node with g1arg_get_node
#symload node with g1mag_get_node
(* ****** ****** *)
fun
g1arg_make_node
(loc:loc_t,nod:g1arg_node): g1arg
fun
g1mag_make_node
(loc:loc_t,nod:g1mag_node): g1mag
(* ****** ****** *)
#symload g1arg with g1arg_make_node
#symload g1mag with g1mag_make_node
(* ****** ****** *)
//
#abstbox sort1_tbox // ptr
#abstbox s1exp_tbox // ptr
//
(* ****** ****** *)
#abstbox s1tdf_tbox // ptr
#abstbox s1tcn_tbox // ptr
#abstbox d1tst_tbox // ptr
(* ****** ****** *)
#abstbox s1arg_tbox // ptr
#abstbox s1mag_tbox // ptr
#abstbox t1arg_tbox // ptr
#abstbox t1mag_tbox // ptr
(* ****** ****** *)
#abstbox s1qua_tbox // ptr
(* ****** ****** *)
#abstbox s1uni_tbox // ptr
#abstbox d1tcn_tbox // ptr
#abstbox d1typ_tbox // ptr
(* ****** ****** *)
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
(* ****** ****** *)
//
#typedef sort1 = sort1_tbox
#typedef sort1lst = list(sort1)
#typedef sort1opt = optn(sort1)
//
#typedef s1exp = s1exp_tbox
#typedef s1explst = list(s1exp)
#typedef s1expopt = optn(s1exp)
//
(* ****** ****** *)
#typedef l1s1e = s1lab(s1exp)
#typedef l1s1elst = list(l1s1e)
(* ****** ****** *)
//
#typedef s1tdf = s1tdf_tbox
#typedef s1tcn = s1tcn_tbox
#typedef d1tst = d1tst_tbox
#typedef s1tcnlst = list(s1tcn)
#typedef d1tstlst = list(d1tst)
//
(* ****** ****** *)
//
#typedef s1arg = s1arg_tbox
#typedef s1mag = s1mag_tbox
#typedef s1arglst = list(s1arg)
#typedef s1maglst = list(s1mag)
//
(* ****** ****** *)
//
#typedef t1arg = t1arg_tbox
#typedef t1mag = t1mag_tbox
#typedef t1arglst = list(t1arg)
#typedef t1maglst = list(t1mag)
//
(* ****** ****** *)
#typedef s1qua = s1qua_tbox
#typedef s1qualst = list(s1qua)
(* ****** ****** *)
//
#typedef s1uni = s1uni_tbox
#typedef d1tcn = d1tcn_tbox
#typedef d1typ = d1typ_tbox
#typedef s1unilst = list(s1uni)
#typedef d1tcnlst = list(d1tcn)
#typedef d1typlst = list(d1typ)
//
(* ****** ****** *)
//
datatype
s1qid =
| S1QIDnone of (i1dnt)
| S1QIDsome of (token, i1dnt)
datatype
d1qid =
| D1QIDnone of (i1dnt)
| D1QIDsome of (token, i1dnt)
//
fun
s1qid_get_lctn(s1qid): loc_t
fun
d1qid_get_lctn(d1qid): loc_t
//
#symload lctn with s1qid_get_lctn
#symload lctn with d1qid_get_lctn
//
fun s1qid_fprint:(FILR,s1qid)->void
fun d1qid_fprint:(FILR,d1qid)->void
//
(* ****** ****** *)
//
datatype
sort1_node =
//
| S1Tid0 of sym_t
//
| S1Tint of token
//
// HX-2018-08: operators
//
| S1Ta0pp of () // apply
//
(*
| S1Ttype of int(*kind*)
  (*prop/view/type/tbox/vwtp/vtbx*)
*)
//
| S1Ta1pp of
  (sort1(*fun*), sort1)
| S1Ta2pp of
  (sort1(*fun*), sort1, sort1)
//
| S1Tlist of sort1lst // HX: temp
//
|
S1Tqual0 of (token(*NS*), sort1)
//
|
S1Tnone0 of () | S1Tnone1 of (sort0)
//
|
S1Terrck of (int(*lvl*), sort1)//HX:tread-error
//
// end of [sort1_node] // end of [datatype]
//
(* ****** ****** *)
//
fun
sort1_fprint:(FILR,sort1)->void
//
(* ****** ****** *)
//
fun
sort1_get_lctn(sort1): loc_t
fun
sort1_get_node(sort1): sort1_node
//
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
//
(* ****** ****** *)
//
fun
sort1_none0(loc:loc_t): sort1
fun
sort1_none1(s0t:sort0): sort1
fun
sort1_make_node
(loc:loc_t,nod:sort1_node): sort1
#symload sort1 with sort1_make_node
//
(* ****** ****** *)
//
datatype
s1exp_node =
//
| S1Eid0 of sym_t
//
| S1Eint of token
| S1Echr of token
| S1Eflt of token
| S1Estr of token
//
// HX-2018-08: operators:
//
| S1Eb0sh of () // bslash
| S1Eb1sh of s1exp // bslash
//
| S1Earrw of s1explst // imply
//
| S1Ea0pp of ((*nil*)) // apply
//
| S1Ea1pp of
  (s1exp(*fun*), s1exp)
| S1Ea2pp of
  (s1exp(*fun*), s1exp, s1exp)
//
| S1El1st of s1explst // temp-list
| S1El2st of
  (s1explst, s1explst) // temp-list
//
|
S1Et1up of // HX: tuple1
( token, s1explst(*prop/type*))
|
S1Et2up of // HX: tuple2
( token(*kind*)
, s1explst(*prop*), s1explst(*type*))
//
|
S1Er1cd of // HX: record1
( token, l1s1elst(*prop/type*))
|
S1Er2cd of // HX: record2
( token(*kind*)
, l1s1elst(*prop*), l1s1elst(*type*))
//
| S1Euni0 of (s1qualst)
| S1Eexi0 of (token(*#*), s1qualst)
//
| S1Elams of
  ( s1maglst
  , sort1opt(*tres*), s1exp(*body*))
//
| S1Eannot of (s1exp, sort1)
//
| S1Equal0 of ( token(*$NS.*), s1exp )
//
| S1Enone0 of () | S1Enone1 of ( s0exp )
//
|
S1Eerrck of (int(*lvl*), s1exp)//HX:tread-error
//
// end of [s1exp_node] // end of [datatype]
//
(* ****** ****** *)
//
fun
s1exp_fprint:(FILR,s1exp)->void
//
(* ****** ****** *)
//
fun
s1exp_get_lctn(s1exp): loc_t
fun
l1s1e_get_lctn(l1s1e): loc_t
fun
s1exp_get_node(s1exp): s1exp_node
fun
l1s1e_get_node(l1s1e): s1exp_node
//
#symload lctn with s1exp_get_lctn
#symload lctn with l1s1e_get_lctn
#symload node with s1exp_get_node
#symload node with l1s1e_get_node
//
(* ****** ****** *)
//
fun
s1exp_none0(loc:loc_t): s1exp
fun
s1exp_none1(s0e:s0exp): s1exp
fun
s1exp_make_node
(loc:loc_t,nod:s1exp_node): s1exp
#symload s1exp with s1exp_make_node
//
(* ****** ****** *)
//
datatype s1tcn_node =
|
S1TCNnode of (token, sort1opt) 
//
(* ****** ****** *)
fun
s1tcn_fprint:(FILR,s1tcn)->void
(* ****** ****** *)
//
fun
s1tcn_get_lctn(s1tcn): loc_t
fun
s1tcn_get_node(s1tcn): s1tcn_node
//
#symload lctn with s1tcn_get_lctn
#symload node with s1tcn_get_node
//
(* ****** ****** *)
//
fun
s1tcn_make_node
(loc:loc_t,nod:s1tcn_node): s1tcn
#symload s1tcn with s1tcn_make_node
//
(* ****** ****** *)
//
datatype d1tst_node =
|
D1TSTnode of
(token(*T_DATASORT*), s1tcnlst)
//
(* ****** ****** *)
fun
d1tst_fprint:(FILR,d1tst)->void
(* ****** ****** *)
//
fun
d1tst_get_lctn(d1tst): loc_t
fun
d1tst_get_node(d1tst): d1tst_node
//
#symload lctn with d1tst_get_lctn
#symload node with d1tst_get_node
//
(* ****** ****** *)
//
fun
d1tst_make_node
(loc:loc_t,nod:d1tst_node): d1tst
#symload d1tst with d1tst_make_node
//
(* ****** ****** *)
//
datatype
s1tdf_node =
|
S1TDFsort of sort1
|
S1TDFtsub of (s1arg, s1explst)
//
(* ****** ****** *)
fun
s1tdf_fprint:(FILR,s1tdf)->void
(* ****** ****** *)
fun
s1tdf_get_lctn(s1tdf): loc_t
fun
s1tdf_get_node(s1tdf): s1tdf_node
//
#symload lctn with s1tdf_get_lctn
#symload node with s1tdf_get_node
//
(* ****** ****** *)
//
fun
s1tdf_make_node
(loc:loc_t,nod:s1tdf_node): s1tdf
#symload s1tdf with s1tdf_make_node
//
(* ****** ****** *)
//
datatype
s1arg_node =
|
S1ARGsome of (token, sort1opt)
//
(* ****** ****** *)
fun
s1arg_fprint:(FILR,s1arg)->void
(* ****** ****** *)
//
fun
s1arg_get_lctn(s1arg): loc_t
fun
s1arg_get_node(s1arg): s1arg_node
//
#symload lctn with s1arg_get_lctn
#symload node with s1arg_get_node
//
(* ****** ****** *)
//
fun
s1arg_make_node
(loc:loc_t,nod:s1arg_node): s1arg
#symload s1arg with s1arg_make_node
//
(* ****** ****** *)
//
datatype
s1mag_node =
S1MAGlist of (s1arglst)
//
(* ****** ****** *)
fun
s1mag_fprint:(FILR,s1mag)->void
(* ****** ****** *)
//
fun
s1mag_get_lctn(s1mag): loc_t
fun
s1mag_get_node(s1mag): s1mag_node
//
#symload lctn with s1mag_get_lctn
#symload node with s1mag_get_node
//
(* ****** ****** *)
//
fun
s1mag_make_node
(loc:loc_t,nod:s1mag_node): s1mag
#symload s1mag with s1mag_make_node
//
(* ****** ****** *)
//
#typedef
tokenopt = $LEX.tokenopt
//
datatype
t1arg_node =
(*
|
T1ARGnone of ()
*)
|
T1ARGsome of (sort1, tokenopt)
//
(* ****** ****** *)
fun
t1arg_fprint:(FILR,t1arg)->void
(* ****** ****** *)
//
fun
t1arg_get_lctn(t1arg): loc_t
fun
t1arg_get_node(t1arg): t1arg_node
//
#symload lctn with t1arg_get_lctn
#symload node with t1arg_get_node
//
(* ****** ****** *)
//
fun
t1arg_make_node
(loc:loc_t,nod:t1arg_node): t1arg
#symload t1arg with t1arg_make_node
//
(* ****** ****** *)
//
datatype
t1mag_node =
(*
|
T1MAGnone of token(*error*)
*)
|
T1MAGlist of t1arglst(*arglst*)
//
(* ****** ****** *)
fun
t1mag_fprint:(FILR,t1mag)->void
(* ****** ****** *)
//
fun
t1mag_get_lctn(t1mag): loc_t
fun
t1mag_get_node(t1mag): t1mag_node
//
#symload lctn with t1mag_get_lctn
#symload node with t1mag_get_node
//
(* ****** ****** *)
//
fun
t1mag_make_node
(loc:loc_t,nod:t1mag_node): t1mag
#symload t1mag with t1mag_make_node
//
(* ****** ****** *)
//
#typedef
tokenlst = $LEX.tokenlst
//
datatype
s1qua_node =
|
S1QUAprop of (s1exp)
|
S1QUAvars of
(tokenlst(*svars*), sort1opt)
//
(* ****** ****** *)
fun
s1qua_fprint:(FILR,s1qua)->void
(* ****** ****** *)
//
fun
s1qua_get_lctn(s1qua): loc_t
fun
s1qua_get_node(s1qua): s1qua_node
//
#symload lctn with s1qua_get_lctn
#symload node with s1qua_get_node
//
(* ****** ****** *)
//
fun
s1qua_make_node
(loc:loc_t,nod:s1qua_node): s1qua
#symload s1qua with s1qua_make_node
//
(* ****** ****** *)
//
datatype
s1uni_node =
|
S1UNIsome of (s1qualst)
//
(* ****** ****** *)
fun
s1uni_fprint:(FILR,s1uni)->void
(* ****** ****** *)
//
fun
s1uni_get_lctn(s1uni): loc_t
fun
s1uni_get_node(s1uni): s1uni_node
//
#symload lctn with s1uni_get_lctn
#symload node with s1uni_get_node
//
(* ****** ****** *)
//
fun
s1uni_make_node
(loc:loc_t,nod:s1uni_node): s1uni
#symload s1uni with s1uni_make_node
//
(* ****** ****** *)
//
datatype
d1tcn_node =
|
D1TCNnode of
( s1unilst
, token(*d0eid*)
, s1explst(*indices*)
, s1expopt(*argtypes*) )
//
(* ****** ****** *)
fun
d1tcn_fprint:(FILR,d1tcn)->void
(* ****** ****** *)
//
fun
d1tcn_get_lctn(d1tcn): loc_t
fun
d1tcn_get_node(d1tcn): d1tcn_node
//
#symload lctn with d1tcn_get_lctn
#symload node with d1tcn_get_node
//
(* ****** ****** *)
//
fun
d1tcn_make_node
(loc:loc_t,nod:d1tcn_node): d1tcn
#symload d1tcn with d1tcn_make_node
//
(* ****** ****** *)
//
datatype
d1typ_node =
|
D1TYPnode of
( token
, t1maglst
, sort1opt(*res*), d1tcnlst)
//
(* ****** ****** *)
fun
d1typ_fprint:(FILR,d1typ)->void
(* ****** ****** *)
//
fun
d1typ_get_lctn(d1typ): loc_t
fun
d1typ_get_node(d1typ): d1typ_node
//
#symload lctn with d1typ_get_lctn
#symload node with d1typ_get_node
//
(* ****** ****** *)
//
fun
d1typ_make_node
(loc:loc_t,nod:d1typ_node): d1typ
#symload d1typ with d1typ_make_node
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp1.sats] *)
