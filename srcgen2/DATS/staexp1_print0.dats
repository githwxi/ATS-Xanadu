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
#staload
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#symload node with g1exp_get_node
#symload lctn with g1exp_get_lctn
(* ****** ****** *)
#symload node with sort1_get_node
#symload lctn with sort1_get_lctn
(* ****** ****** *)
#symload node with s1exp_get_node
#symload lctn with s1exp_get_lctn
(* ****** ****** *)

#implfun
g1nam_fprint
( out, g1n ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ g1n of
//
| G1Nnil() =>
  print("G1Nnil(",")")
//
| G1Nid0(id0) =>
  print("G1Nid0(",id0,")")
//
| G1Nint(int) =>
  print("G1Nint(",int,")")
| G1Nflt(flt) =>
  print("G1Nflt(",flt,")")
| G1Nstr(str) =>
  print("G1Nstr(",str,")")
//
| G1Nlist(g1ns) =>
  print("G1Nlist(",g1ns,")")
//
(*
| G1Nnone0() =>
  print("G1Nnone0(",")")
*)
| G1Nnone1(g1n1) =>
  print("G1Nnone1(",g1n1,")")
//
end (*let*) // end of [g1nam_fprint(out,g1n)]

(* ****** ****** *)

#implfun
g1exp_fprint
( out, g1e ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
g1e.node() of
//
end (*let*) // end of [g1exp_fprint(out,g1e)]

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
//
#implfun
s1qua_fprint
( out, s1q ) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s1q.node() of
|
S1QUAprop
(  s1e  ) =>
print("S1QUAprop(",s1e,")")
|
S1QUAvars
(toks, topt) =>
print("S1QUAvars(",toks,";",topt,")")
end (*let*) // end-of-[s1qua_fprint(out,err)]
//
(* ****** ****** *)
//
#implfun
s1uni_fprint
( out, s1u ) =
let
#impltmp
g_print$out<>() = out
in//let
case+
s1u.node() of
|
S1UNIsome(s1qs) =>
print("S1UNIsome(",s1qs,")")
end (*let*) // end-of-[s1uni_fprint(out,err)]
//
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
print("S1Eb1sh(",s1e,")")
//
|
S1Earrw(ses) =>
print("S1Earrw(",ses,")")
//
|
S1Ea0pp() =>
print
(    "S1Ea0pp(", ")"    )
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
S1Euni0(s1qs) =>
print("S1Euni0(",s1qs,")")
|
S1Eexi0(knd0, s1qs) =>
print("S1Eexi0(",knd0,";",s1qs,")")
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
