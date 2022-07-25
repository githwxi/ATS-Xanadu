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
Sun Jul 24 18:07:52 EDT 2022
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
#staload "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)

#implfun
sort1_fprint
( out, s1t ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s1t.node() of
|
S1Tid0(id0) =>
print("S1Tid0(",id0,")")
//
|
S1Tint(int) =>
print("S1Tint(",int,")")
//
// HX-2018-08: operators
//
|
S1Ta0pp(   ) =>
(
  print(  "S1Ta0pp(",")"  )
)
//
(*
| S1Ttype of int(*kind*)
  (*prop/view/type/tbox/vwtp/vtbx*)
*)
//
|
S1Ta1pp
(s1f0, s1t1) =>
print
("S1Ta1pp(",s1f0,";",s1t1,")")
|
S1Ta2pp
(s1f0, s1t1, s1t2) =>
print
("S1Ta2pp(",s1f0,";",s1t1,";",s1t2,")")
|
S1Tlist(s1ts) =>
print( "S1Tlist(", s1ts ,")" )
|
S1Tqual(tok1,s1t2) =>
print("S1Tqual(",tok1,";",s1t2,")")
//
end (*let*) // end of [sort1_fprint(out,s1t)]

(* ****** ****** *)

#implfun
s1exp_fprint
( out, s1e ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s1e.node() of
//
|
S1Eid0(id0) =>
print("S1Eid0(",id0,")")
//
|
S1Eint(int) =>
print("S1Eint(",int,")")
|
S1Echr(chr) =>
print("S1Echr(",chr,")")
|
S1Eflt(flt) =>
print("S1Eflt(",flt,")")
|
S1Estr(str) =>
print("S1Estr(",str,")")
//
|
S1Eb0sh(   ) =>
print( "S1Eb0sh(" , ")" )
|
S1Eb1sh(s1e) =>
print( "S1Eb1sh(",s1e,")" )
//
|
S1Ea0pp() =>
print("S1Ea0pp(",")")
|
S1Ea1pp
(s1f0, s1e1) =>
print
("S1Ea1pp(",s1f0,";",s1e1,")")
|
S1Ea2pp
(s1f0, s1e1, s1e2) =>
print
("S1Ea2pp(",s1f0,";",s1e1,";",s1e2,")")
|
S1El1st(s1es) =>
print( "S1El1st(", s1es ,")" )
|
S1El2st(ses1, ses2) =>
print("S1El2st(", ses1, ";", ses2 ,")")
//
|
S1Et1up(knd0, s1es) =>
print("S1Et1up(",knd0,";",s1es,")")
|
S1Et2up(knd0, ses1, ses2) =>
print
("S1Et2up(",knd0,";",ses1,";",ses2,")")
//
|
S1Equal(tok1,s1e2) =>
(
  print(  "S1Equal(",tok1,";",s1e2,")"  )
)
//
end (*let*) // end of [s1exp_fprint(out,s1e)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp1_print0.dats] *)
