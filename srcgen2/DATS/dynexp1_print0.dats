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
Sun Jul 24 18:09:47 EDT 2022
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
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)

#implfun
d1pat_fprint
( out, d1p ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d1p.node() of
|
D1Pid0(id0) =>
print("D1Pid0(",id0,")")
//
|
D1Pint(int) =>
print("D1Pint(",int,")")
|
D1Pchr(chr) =>
print("D1Pchr(",chr,")")
|
D1Pflt(flt) =>
print("D1Pflt(",flt,")")
|
D1Pstr(str) =>
print("D1Pstr(",str,")")
//
|
D1Pb0sh(   ) =>
print( "D1Pb0sh(" , ")" )
|
D1Pb1sh(d1p) =>
print("D1Pb1sh(",d1p,")")
//
|
D1Pa0pp(   ) =>
(
  print(  "D1Pa0pp(",")"  )
)
|
D1Pa1pp
(d1f0, d1p1) =>
print
("D1Pa1pp(",d1f0,";",d1p1,")")
|
D1Pa2pp
(d1f0, d1p1, d1p2) =>
print
("D1Pa2pp(",d1f0,";",d1p1,";",d1p2,")")
|
D1Pl1st(d1ps) =>
print( "D1Pl1st(", d1ps ,")" )
|
D1Pl2st(dps1, dps2) =>
print("D1Pl2st(", dps1, ";", dps2 ,")")
//
|
D1Panno(d1p1,s1e2) =>
print("D1Pqual(",d1p1,";",s1e2,")")
//
end (*let*) // end of [d1pat_fprint(out,d1p)]

(* ****** ****** *)

#implfun
d1exp_fprint
( out, d1e ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d1e.node() of
//
end (*let*) // end of [d1exp_fprint(out,d1e)]

(* ****** ****** *)

#implfun
d1ecl_fprint
( out, dcl ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
end (*let*) // end of [d1ecl_fprint(out,dcl)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp1_print0.dats] *)
