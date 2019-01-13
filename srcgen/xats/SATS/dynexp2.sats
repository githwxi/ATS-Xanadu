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
SYM = "./symbol.sats"
#staload
LOC = "./location.sats"
//
  typedef sym_t = $SYM.sym_t
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
#staload
S1E = "./staexp1.sats"
//
  typedef s1exp = $S1E.s1exp
//
(* ****** ****** *)
//
#staload
D1E = "./dynexp1.sats"
//
  typedef d1exp = $D1E.d1exp
  typedef d1ecl = $D1E.d1ecl
//
  typedef d1eclist = $D1E.d1eclist
//
(* ****** ****** *)

#staload "./staexp2.sats"

(* ****** ****** *)
//
abstbox t2ype_tbox = ptr
typedef t2ype = t2ype_tbox
//
(* ****** ****** *)
//
fun
t2ype_none(loc_t): t2ype
fun
t2ype_some(loc_t, s2exp): t2ype
//
fun
t2ype_get_topt(t2ype): s2expopt
fun
t2ype_set_some(t2ype, s2exp): void
//
overload .topt with t2ype_get_topt
overload .some with t2ype_set_some
//
(* ****** ****** *)
//
fun
print_t2ype: print_type(t2ype)
fun
prerr_t2ype: prerr_type(t2ype)
fun
fprint_t2ype: fprint_type(t2ype)
//
overload print with print_t2ype
overload prerr with prerr_t2ype
overload fprint with fprint_t2ype
//
(* ****** ****** *)
//
abstype d2con_tbox = ptr
typedef d2con = d2con_tbox
//
typedef d2conlst = List0(d2con)
typedef d2conopt = Option(d2con)
//
(*
vtypedef d2conlst_vt = List0_vt(d2con)
vtypedef d2conopt_vt = Option_vt(d2con)
*)
//
(* ****** ****** *)
//
abstype d2cst_tbox = ptr
typedef d2cst = d2cst_tbox
//
typedef d2cstlst = List0(d2cst)
typedef d2cstopt = Option(d2cst)
//
(*
vtypedef d2cstlst_vt = List0_vt(d2cst)
vtypedef d2cstopt_vt = Option_vt(d2cst)
*)
//
(* ****** ****** *)
//
abstype d2var_tbox = ptr
typedef d2var = d2var_tbox
//
typedef d2varlst = List0(d2var)
typedef d2varopt = Option(d2var)
//
(*
vtypedef d2varlst_vt = List0_vt(d2var)
vtypedef d2varopt_vt = Option_vt(d2var)
*)
//
(* ****** ****** *)
//
fun
d2con_stamp_new(): stamp
fun
d2cst_stamp_new(): stamp
fun
d2var_stamp_new(): stamp
//
(* ****** ****** *)
//
fun
d2con_get_loc: d2con -> loc_t
fun
d2cst_get_loc: d2cst -> loc_t
fun
d2var_get_loc: d2var -> loc_t
//
overload .loc with d2con_get_loc
overload .loc with d2cst_get_loc
overload .loc with d2var_get_loc
//
(* ****** ****** *)
//
fun
d2con_get_sym: d2con -> sym_t
fun
d2cst_get_sym: d2cst -> sym_t
fun
d2var_get_sym: d2var -> sym_t
//
overload .sym with d2con_get_sym
overload .sym with d2cst_get_sym
overload .sym with d2var_get_sym
//
(* ****** ****** *)
//
fun
d2con_get_type(d2con): s2exp
fun
d2cst_get_type(d2cst): s2exp
//
overload .type with d2con_get_type
overload .type with d2cst_get_type
//
(* ****** ****** *)
//
fun
d2con_get_stamp(d2con): stamp
fun
d2cst_get_stamp(d2cst): stamp
fun
d2var_get_stamp(d2var): stamp
//
overload .stamp with d2con_get_stamp
overload .stamp with d2cst_get_stamp
overload .stamp with d2var_get_stamp
//
(* ****** ****** *)
//
fun
d2con_make_idtp
(id: token, s2e: s2exp): d2con
//
fun
d2cst_make_idtp
(id: token, s2e: s2exp): d2cst
//
(* ****** ****** *)
//
fun
print_d2con: print_type(d2con)
fun
prerr_d2con: prerr_type(d2con)
fun
fprint_d2con: fprint_type(d2con)
//
overload print with print_d2con
overload prerr with prerr_d2con
overload fprint with fprint_d2con
//
(* ****** ****** *)
//
fun
print_d2cst: print_type(d2cst)
fun
prerr_d2cst: prerr_type(d2cst)
fun
fprint_d2cst: fprint_type(d2cst)
//
overload print with print_d2cst
overload prerr with prerr_d2cst
overload fprint with fprint_d2cst
//
(* ****** ****** *)
//
fun
print_d2var: print_type(d2var)
fun
prerr_d2var: prerr_type(d2var)
fun
fprint_d2var: fprint_type(d2var)
//
overload print with print_d2var
overload prerr with prerr_d2var
overload fprint with fprint_d2var
//
(* ****** ****** *)

abstbox d2exp_tbox = ptr
typedef d2exp = d2exp_tbox
typedef d2explst = List0(d2exp)
typedef d2expopt = Option(d2exp)

(* ****** ****** *)

abstbox d2ecl_tbox = ptr
typedef d2ecl = d2ecl_tbox
typedef d2eclist = List0(d2ecl)
typedef d2eclopt = Option(d2ecl)

(* ****** ****** *)
//
datatype d2itm =
  | D2ITMvar of (d2var)
  | D2ITMcst of (d2cstlst)
  | D2ITMcon of (d2conlst)
//
(* ****** ****** *)
//
typedef d2itmopt = Option(d2itm)
vtypedef d2itmopt_vt = Option_vt(d2itm)
//
(* ****** ****** *)
//
fun
print_d2itm: print_type(d2itm)
fun
prerr_d2itm: prerr_type(d2itm)
fun
fprint_d2itm: fprint_type(d2itm)
//
overload print with print_d2itm
overload prerr with prerr_d2itm
overload fprint with fprint_d2itm
//
(* ****** ****** *)
//
abstype
tq2arg_tbox = ptr
//
typedef
tq2arg = tq2arg_tbox
typedef
tq2arglst = List0(tq2arg)
//
fun
tq2arg_get_loc(tq2arg): loc_t
fun
tq2arg_get_svss(tq2arg): s2varlstlst
//
overload .loc with tq2arg_get_loc
overload .svss with tq2arg_get_svss
//
(* ****** ****** *)
//
fun
print_tq2arg: print_type(tq2arg)
fun
prerr_tq2arg: prerr_type(tq2arg)
fun
fprint_tq2arg: fprint_type(tq2arg)
//
overload print with print_tq2arg
overload prerr with prerr_tq2arg
overload fprint with fprint_tq2arg
//
(* ****** ****** *)
//
fun
tq2arg_make
(loc: loc_t, svss: s2varlstlst): tq2arg
//
(* ****** ****** *)

datatype
d2exp_node =
//
| D2Eint of (token)
| D2Echr of (token)
| D2Eflt of (token)
| D2Estr of (token)
//
| D2Evar of (d2var)
//
| D2Econ1 of (d2con)
| D2Ecst1 of (d2cst)
| D2Econ2 of (d2conlst)
| D2Ecst2 of (d2cstlst)
//
| D2Eanno of (d2exp, s2exp)
//
| D2Enone0 of () | D2Enone1 of (d1exp)
//
(* ****** ****** *)
//
fun d2exp_none0(loc_t): d2exp
fun d2exp_none1(d1exp): d2exp
//
fun d2exp_int(loc_t, token): d2exp
fun d2exp_chr(loc_t, token): d2exp
fun d2exp_flt(loc_t, token): d2exp
fun d2exp_str(loc_t, token): d2exp
//
fun d2exp_var(loc_t, d2var): d2exp
//
fun d2exp_con1(loc_t, d2con): d2exp
fun d2exp_cst1(loc_t, d2cst): d2exp
fun d2exp_con2(loc_t, d2conlst): d2exp
fun d2exp_cst2(loc_t, d2cstlst): d2exp
//
fun
d2exp_make_node
(loc0: loc_t, node: d2exp_node): d2exp
//
(* ****** ****** *)
//
datatype
v2ardecl =
V2ARDECL of @{
  loc= loc_t
, d2v= d2var
, wth= d2varopt
, res= s2expopt
, ini= d2expopt
}
//
typedef
v2ardeclist = List0(v2ardecl)
//
(* ****** ****** *)
//
datatype
d2ecl_node =
//
| D2Cnone0 of ()
| D2Cnone1 of (d1ecl)
//
(*
| D2Clist of (d2eclist)
*)
//
| D2Clocal of
  (d2eclist(*head*), d2eclist(*body*))
//
| D2Cabssort of (d1ecl)
| D2Cstacst0 of (d1ecl)
| D2Csortdef of (d1ecl)
| D2Csexpdef of (d1ecl)
| D2Cabstype of (d1ecl)
| D2Cabsimpl of (d1ecl)
//
| D2Cdatasort of (d1ecl)
| D2Cdatatype of (d1ecl)
//
| D2Cdynconst of
  (token(*kind*), tq2arglst, d2cstlst)
//
| D2Cvardecl of (token(*knd*), v2ardeclist)
//
// end of [d2ecl_node]
//
and
abstdf2 =
  | ABSTDF2nil of () // unspecified
  | ABSTDF2lteq of s2exp // erasure
  | ABSTDF2eqeq of s2exp // definition
//
(* ****** ****** *)
//
fun
d2ecl_get_loc(d2ecl): loc_t
fun
d2ecl_get_node(d2ecl): d2ecl_node
//
overload .loc with d2ecl_get_loc
overload .node with d2ecl_get_node
//
fun
print_d2ecl: print_type(d2ecl)
fun
prerr_d2ecl: prerr_type(d2ecl)
fun
fprint_d2ecl: fprint_type(d2ecl)
//
overload print with print_d2ecl
overload prerr with prerr_d2ecl
overload fprint with fprint_d2ecl
//
(* ****** ****** *)
//
fun
d2ecl_none0(loc: loc_t): d2ecl
fun
d2ecl_none1(d1c: d1ecl): d2ecl
//
fun
d2ecl_make_node
(loc: loc_t, node: d2ecl_node): d2ecl
//
(* ****** ****** *)

(* end of [xats_dynexp2.sats] *)
