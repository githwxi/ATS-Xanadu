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
#typedef
s0lab(a:type) = $S0E.s0lab(a)
//
(* ****** ****** *)
//
datatype g1nam =
//
| G1Nnil of ()
//
| G1Nid0 of sym_t
//
| G1Nint of (int)
| G1Nflt of double
| G1Nstr of string
//
| G1Nlist of (g1namlst)
//
| G1Nnone0 of () // HX: EMPTY
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
#abstype g1mac_tbox // ptr
(* ****** ****** *)
#abstbox g1mag_tbox // ptr
(* ****** ****** *)
//
#typedef g0exp = $S0E.g0exp
//
#typedef g1exp = g1exp_tbox
#typedef g1mac = g1mac_tbox
#typedef g1arg = token(*sym*)
#typedef g1mag = g1mag_tbox
//
#typedef g1explst = list(g1exp)
#typedef g1expopt = optn(g1exp)
//
#typedef g1arglst = list(g1arg)
#typedef g1maglst = list(g1mag)
//
(* ****** ****** *)
//
datatype
g1exp_node =
//
| G1Eid0 of (sym_t)
//
| G1Eint of (token)
| G1Echr of (token)
| G1Eflt of (token)
| G1Estr of (token)
//
| G1Eif0 of
  ( g1exp(* cond *)
  , g1exp(* then *)
  , g1exp(* else *) )
//
| G1Eapp of ((*void*))
//
| G1Eapp1 of
  (g1exp(*fun*), g1exp)
| G1Eapp2 of
  (g1exp(*fun*), g1exp, g1exp)
//
| G1Elist of g1explst (*temp*)
//
| G1Enone0 of () // HX: EMPTY
| G1Enone1 of (g0exp) // HX: ERROR!
//
(* ****** ****** *)
//
datatype
g1mag_node =
(*
| G1MAGnone of ((*void*))
*)
| G1MAGsarg of (g1arglst)
| G1MAGdarg of (g1arglst)
//
(* ****** ****** *)
fun
g1nam_fprint:(FILR,g1nam)->void
fun
g1exp_fprint:(FILR,g1exp)->void
fun
g1mag_fprint:(FILR,g1mag)->void
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
g1mag_get_lctn(g1mag): loc_t
fun
g1mag_get_node(g1mag): g1mag_node
(* ****** ****** *)
#symload lctn with g1mag_get_lctn
#symload node with g1mag_get_node
(* ****** ****** *)
fun
g1exp_make_node
(loc:loc_t,nod:g1exp_node): g1exp
fun
g1mag_make_node
(loc:loc_t,nod:g1mag_node): g1mag
(* ****** ****** *)
#symload g1exp with g1exp_make_node
#symload g1mag with g1mag_make_node
(* ****** ****** *)
//
#abstbox sort1_tbox // ptr
#abstbox s1exp_tbox // ptr
//
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
//
#typedef l0s1e = s0lab(s1exp)
#typedef l0s1elst = list(l0s1e)
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
| S1Tapp of () // apply
//
(*
| S1Ttype of int(*kind*)
  (*prop/view/type/tbox/vwtp/vtbx*)
*)
//
| S1Tapp1 of
  (sort1(*fun*), sort1)
| S1Tapp2 of
  (sort1(*fun*), sort1, sort1)
//
| S1Tlist of sort1lst // HX: temp
| S1Tqual of (token(*NS*), sort1)
//
// end of [ datatype(sort1_node) ]
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
sort1_make_node
(loc:loc_t,nod:sort1_node): sort1
#symload sort1 with sort1_make_node
//
(* ****** ****** *)
//
#abstbox s1tcn_tbox // ptr
#typedef s1tcn = s1tcn_tbox
#typedef s1tcnlst = list(s1tcn)
//
(* ****** ****** *)
//
datatype s1tcn_node =
|
S1TCN of (token, sort1opt) 
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
#abstbox d1tst_tbox // ptr
#typedef d1tst = d1tst_tbox
#typedef d1tstlst = list(d1tst)
//
(* ****** ****** *)
//
datatype d1tst_node =
|
D1TST of
(token(*T_DATASORT*), s1tcnlst)
//
(* ****** ****** *)
fun
d1tst_fprint:(FILR,d1tst)->void
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
#abstbox s1arg_tbox // ptr
#typedef s1arg = s1arg_tbox
#typedef s1arglst = list(s1arg)
//
(* ****** ****** *)
datatype
s1arg_node =
|
S1ARGsome of (token, sort1opt)
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
#abstbox s1mag_tbox // ptr
#typedef s1mag = s1mag_tbox
#typedef s1maglst = list(s1mag)
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
#abstbox s1tdf_tbox // ptr
#typedef s1tdf = s1tdf_tbox
//
datatype
s1tdf_node =
| S1TDFsort of sort1
| S1TDFsbst of (s1arg, s1explst)
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
#typedef
tokenopt = $LEX.tokenopt
//
#abstbox t1arg_tbox // ptr
#typedef t1arg = t1arg_tbox
#typedef t1arglst = list(t1arg)
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
#abstbox t1mag_tbox // ptr
#typedef t1mag = t1mag_tbox
#typedef t1maglst = list(t1mag)
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
#abstbox s1qua_tbox // ptr
#typedef s1qua = s1qua_tbox
#typedef s1qualst = list(s1qua)
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
  | S1UNIsome of (s1qualst)
//
#abstbox s1uni_tbox // ptr
#typedef s1uni = s1uni_tbox
#typedef s1unilst = list(s1uni)
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
| S1Eapp of () // apply
//
| S1Ebs0 of () // backslash
| S1Ebs1 of s1exp // backslash
//
| S1Eimp of s1explst // imply
//
| S1Eapp1 of
  (s1exp(*fun*), s1exp)
| S1Eapp2 of
  (s1exp(*fun*), s1exp, s1exp)
//
| S1Elist of s1explst // temp
| S1Elist of
  (s1explst, s1explst) // temp
//
| S1Etup1 of // HX: tuple1
  ( int, s1explst(*prop/type*))
| S1Etup1 of // HX: tuple2
  ( int(*kind*)
  , s1explst(*prop*), s1explst(*type*))
//
| S1Ercd2 of // HX: record1
  ( int, l0s1elst(*prop/type*))
| S1Ercd2 of // HX: record2
  ( int(*kind*)
  , l0s1elst(*prop*), l0s1elst(*type*))
//
| S1Euni0 of (s1qualst)
| S1Eexi0 of (int(*#*), s1qualst)
//
| S1Elam0 of
  (s1maglst
  , sort1opt(*tres*), s1exp(*body*))
//
| S1Eanno of (s1exp, sort1)
//
| S1Equal of ( token(*$NS.*), s1exp )
//
// end of [s1exp_node] // end of [datatype]

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
s1exp_get_node(s1exp): s1exp_node
//
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
//
(* ****** ****** *)
//
fun
s1exp_make_node
(loc:loc_t,nod:s1exp_node): s1exp
#symload s1exp with s1exp_make_node
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp1.sats] *)
