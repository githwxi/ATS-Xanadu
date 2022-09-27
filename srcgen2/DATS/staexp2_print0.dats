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

#implfun
s2cst_fprint
(out, s2c0) =
let
#impltmp
g_print$out<>() = out
in//let
  print(s2cst_get_name(s2c0))
; print(": ", s2cst_get_sort(s2c0))
end (*let*) // end of [s2cst_fprint(out, s2c0)]

(* ****** ****** *)

#implfun
s2var_fprint
(out, s2v0) =
let
#impltmp
g_print$out<>() = out
in//let
  print(s2var_get_name(s2v0))
; print(": ", s2var_get_sort(s2v0))
end (*let*) // end of [s2var_fprint(out, s2v0)]

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
print("S2Tid0(", tid, ")")
|
S2Tint(int) =>
print("S2Tint(", int, ")")
//
|
S2Tbas(t2b) =>
print("S2Tbas(", t2b, ")")
//
|
S2Ttup(s2ts) =>
print("S2Ttup(", s2ts ,")")
//
|
S2Tf0un(  ) =>
print(   "S2Tf0un(", ")"   )
|
S2Tf1un(s2ts,s2t1) =>
print("S2Tf1un(",s2ts,";",s2t1,")")
//
|
S2Tapps(s2f0,s2ts) =>
print("S2Tapps(",s2f0,";",s2ts,")")
//
|
S2Tnone0() => print("S2Tnone0(",")")
|
S2Tnone1(s1t1) => print("S2Tnone1(",s1t1,")")
//
end (*let*) // end of [sort2_fprint(out, s2t0)]

(* ****** ****** *)

#implfun
s2exp_fprint
(out, s2e0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ s2e0 of
//
|S2Eint(int) =>
print("S2Eint(",int,")")
|S2Ebtf(btf) =>
print("S2Ebtf(",btf,")")
|S2Echr(chr) =>
print("S2Echr(",chr,")")
|S2Estr(str) =>
print("S2Estr(",str,")")
//
|S2Ecst(s2c) =>
print("S2Ecst(",s2c,")")
|S2Evar(s2v) =>
print("S2Evar(",s2v,")")
//
|
S2Eany(knd) =>
print("S2Eany(",knd,")")
//
|S2Etop0(s2e) =>
print("S2Etop0(",s2e,")")
|S2Etopz(s2e) =>
print("S2Etopz(",s2e,")")
//
|
S2Eapps(s2f0,s2es) =>
print("S2Eapps(",s2f0,";",s2es,")")
|
S2Elam0(s2vs,s2e1) =>
print("S2Elam0(",s2vs,";",s2e1,")")
//
|
S2Efun0
( f2cl
, npf1, s2es, s2r0) =>
(
print("S2Efun0(",f2cl,";");
print(npf1,";",s2es,";",s2r0,")") )
//
|
S2Emet0(s2es,s2e1) =>
print("S2Emet0(",s2es,";",s2e1,")")
//
|
S2Eexi0
(s2vs, s2ps, s2e1) =>
( print("S2Eexi0(")
; print(s2vs,";",s2ps,";",s2e1,")"))
|
S2Euni0
(s2vs, s2ps, s2e1) =>
( print("S2Euni0(")
; print(s2vs,";",s2ps,";",s2e1,")"))
//
|
S2Etype(s2tp) =>
print("S2Etype(", s2tp, ")")
//
|
S2Etext(name, s2es) =>
print("S2Etext(",name,";",s2es,")")
//
|
S2Ecimp(loc0,s2e1) =>
print("S2Ecimp(",loc0,";",s2e1,")")
|
S2Ecprf(loc0,s2e1) =>
print("S2Ecprf(",loc0,";",s2e1,")")
|
S2Ecast
(loc0, s2e1, s2t2) =>
( print("S2Ecast(")
; print(loc0,";",s2e1,";",s2t2,")"))
//
|
S2Enone0() => print("S2Enone0(",")")
|
S2Enone1
(loc0, s1e1) => print("S2Enone1(",s1e1,")")
|
S2Enone2
(loc0, s2e1) => print("S2Enone2(",s2e1,")")
//
end (*let*) // end of [s2exp_fprint(out, s2e0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2_print0.dats] *)
