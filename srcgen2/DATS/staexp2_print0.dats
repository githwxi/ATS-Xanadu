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
Sat 27 Aug 2022 02:13:22 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload name with s2cst_get_name
#symload lctn with s2cst_get_lctn
(* ****** ****** *)
#symload node with s2arg_get_node
(* ****** ****** *)
#symload node with s2exp_get_node
#symload sort with s2exp_get_sort
(* ****** ****** *)
#symload node with l2s2e_get_node
(* ****** ****** *)
(* ****** ****** *)

#implfun
t2abs_fprint
(out, tabs) =
let
//
#impltmp
g_print$out<>() = out
//
val sym =
  t2abs_get_name(tabs)
val tmp =
  t2abs_get_stmp(tabs)
//
in//let
  prints(sym, "(", tmp, ")")
end(*let*)//end-of-[t2abs_fprint(out,tabs)]

(* ****** ****** *)

#implfun
t2dat_fprint
(out, tdat) =
let
//
#impltmp
g_print$out<>() = out
//
val sym =
  t2dat_get_name(tdat)
val tmp =
  t2dat_get_stmp(tdat)
//
in//let
  prints(sym, "(", tmp, ")")
end(*let*)//end-of-[t2dat_fprint(out,tdat)]

(* ****** ****** *)

#implfun
t2bas_fprint
(out, tbas) =
let
#impltmp
g_print$out<>() = out
in//let
case+ tbas of
T2Bpred(name) =>
prints("T2Bpred(", name, ")")
|
T2Btabs(tabs) =>
prints("T2Btabs(", tabs, ")")
|
T2Btdat(tdat) =>
prints("T2Btdat(", tdat, ")")
|
T2Bimpr(knd0, name) =>
prints("T2Bimpr(", knd0, ";", name, ")")
end (*let*)//end-of-[t2bas_fprint(out,tbas)]

(* ****** ****** *)

#implfun
sort2_fprint
(out, s2t0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ s2t0 of
|
S2Tid0(tid) =>
prints("S2Tid0(", tid, ")")
|
S2Tint(int) =>
prints("S2Tint(", int, ")")
//
|
S2Tbas(t2b) =>
prints("S2Tbas(", t2b, ")")
//
|
S2Ttup(s2ts) =>
prints("S2Ttup(", s2ts ,")")
//
|
S2Tfun0(  ) =>
prints(   "S2Tfun0(", ")"   )
|
S2Tfun1(s2ts,s2t1) =>
prints("S2Tfun1(",s2ts,";",s2t1,")")
//
|
S2Tapps(s2f0,s2ts) =>
prints("S2Tapps(",s2f0,";",s2ts,")")
//
|
S2Tnone0() =>
(
  prints("S2Tnone0(",")"))
|
S2Tnone1(s1t1) =>
(
  prints("S2Tnone1(",s1t1,")"))
//
|
S2Terrck(lvl0,s2t1) =>
(
  prints("S2Terrck(",lvl0,";",s2t1,")"))
//
end (*let*) // end of [sort2_fprint(out, s2t0)]

(* ****** ****** *)

#implfun
s2arg_fprint
(out, s2a0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s2a0.node() of
|S2Avar(s2v1) =>
prints("S2Avar(", s2v1, ")")
|S2Atck(s2v1, s2t2) =>
prints("S2Atck(",s2v1,";",s2t2,")")
//
end (*let*) // end of [s2arg_fprint(out, s2a0)]
//
(* ****** ****** *)

#implfun
s2tex_fprint
(out, s2tx) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ s2tx of
|
S2TEXsrt(s2t1) =>
prints("S2TEXsrt(", s2t1, ")")
|
S2TEXsub(s2vs, s2ps) =>
prints("S2TEXsub(", s2vs, ";", s2ps, ")")
//
end (*let*) // end of [s2tex_fprint(out, s2tx)]

(* ****** ****** *)

#implfun
s2cst_fprint
(out, s2c0) =
let
#impltmp
g_print$out<>() = out
in//let
  print(s2cst_get_name(s2c0))
(*
; prints(":", s2cst_get_sort(s2c0))
*)
end (*let*)//end of [s2cst_fprint(out, s2c0)]

(* ****** ****** *)

#implfun
s2var_fprint
(out, s2v0) =
let
#impltmp
g_print$out<>() = out
in//let
  print(s2var_get_name(s2v0))
; prints("[", s2v0.stmp(), "]")
(*
; prints("[", s2v0.sort(), "]")
*)
end (*let*) // end of [s2var_fprint(out, s2v0)]

(* ****** ****** *)

#implfun
s2exp_fprint
(out, s2e0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s2e0.node() of
//
|S2Eint(int) =>
prints("S2Eint(",int,")")
|S2Ebtf(btf) =>
prints("S2Ebtf(",btf,")")
|S2Echr(chr) =>
prints("S2Echr(",chr,")")
|S2Estr(str) =>
prints("S2Estr(",str,")")
//
|S2Ecst(s2c) =>
prints("S2Ecst(",s2c,")")
|S2Evar(s2v) =>
prints("S2Evar(",s2v,")")
//
|
S2Eany(knd) =>
prints("S2Eany(",knd,")")
//
|S2Etop0(s2e) =>
prints("S2Etop0(",s2e,")")
|S2Etop1(s2e) =>
prints("S2Etop1(",s2e,")")
//
|
S2Ecsts(s2cs) =>
(
prints("S2Ecsts(",s2cs,")")
) where
{
#impltmp
g_print<s2cst>(x) =
prints
(x.name(),"(", x.lctn(), ")")
}
//
|
S2Earg1(knd0,s2e1) =>
prints("S2Earg1(",knd0,";",s2e1,")")
|
S2Eatx2(s2e1,s2e2) =>
prints("S2Eatx2(",s2e1,";",s2e2,")")
//
|
S2Eapps(s2f0,s2es) =>
prints("S2Eapps(",s2f0,";",s2es,")")
|
S2Elam1(s2vs,s2e1) =>
prints("S2Elam1(",s2vs,";",s2e1,")")
//
|
S2Efun1
( f2cl
, npf1, s2es, s2r0) =>
(
prints("S2Efun1(",f2cl,";");
prints(npf1,";",s2es,";",s2r0,")") )
//
|
S2Emet0(s2es,s2e1) =>
prints("S2Emet0(",s2es,";",s2e1,")")
//
|
S2Eexi0
(s2vs, s2ps, s2e1) =>
( print("S2Eexi0(")
; prints(s2vs,";",s2ps,";",s2e1,")"))
|
S2Euni0
(s2vs, s2ps, s2e1) =>
( print("S2Euni0(")
; prints(s2vs,";",s2ps,";",s2e1,")"))
//
|
S2Elist(s2es) =>
prints("S2Elist(", s2es, ")")
|
S2Etype(s2tp) =>
prints("S2Etype(", s2tp, ")")
//
|
S2Etext(name, s2es) =>
prints("S2Etext(",name,";",s2es,")")
//
|
S2Etrcd
(knd0, npf1, lses) =>
prints("S2Etrcd(",knd0,";",npf1,";",lses,")")
//
|
S2Eimpr(loc0,s2e1) =>
prints("S2Eimpr(",loc0,";",s2e1,")")
|
S2Eprgm(loc0,s2e1) =>
prints("S2Eprgm(",loc0,";",s2e1,")")
//
|
S2Ecast
(loc0, s2e1, s2t2) =>
let
val
s2t1 = s2e1.sort()
in
  prints // prints
  ("S2Ecast(",loc0,";")
; prints(s2e1,";",s2t1,";",s2t2,")")
endlet
//
|
S2Enone0() => prints("S2Enone0(",")")
|
S2Enone1(s1e1) => prints("S2Enone1(",s1e1,")")
|
S2Enone2(s2e1) => prints("S2Enone2(",s2e1,")")
//
|S2Eerrck // HX: tread-error
(lvl0,s2e1) => prints("S2Eerrck(",lvl0,";",s2e1,")")
//
end (*let*) // end of [s2exp_fprint(out, s2e0)]

(* ****** ****** *)
//
#implfun
s2itm_fprint
(out, s2i0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ s2i0 of
//
|
S2ITMvar(s2v1) =>
prints("S2ITMvar(", s2v1, ")")
|
S2ITMcst(s2cs) =>
prints("S2ITMcst(", s2cs, ")")
//
|
S2ITMenv(envs) =>
prints("S2ITMenv(", "...", ")")
//
end (*let*) // end of [s2itm_fprint(out, s2i0)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_staexp2_print0.dats] *)
