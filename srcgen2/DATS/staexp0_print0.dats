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
Start Time: June 08th, 2022
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

#implfun
t0int_fprint
(out, int) =
let
#impltmp
g_print$out<>() = out
in//let
case+ int of
|
T0INTnone(tok) =>
print("T0INTnone(", tok, ")")
|
T0INTsome(tok) =>
print("T0INTsome(", tok, ")")
end (*let*) // end of [t0int_fprint]

(* ****** ****** *)

#implfun
t0chr_fprint
(out, chr) =
let
#impltmp
g_print$out<>() = out
in//let
case+ chr of
|
T0CHRnone(tok) =>
print("T0CHRnone(", tok, ")")
|
T0CHRsome(tok) =>
print("T0CHRsome(", tok, ")")
end (*let*) // end of [t0chr_fprint]

(* ****** ****** *)

#implfun
t0flt_fprint
(out, flt) =
let
#impltmp
g_print$out<>() = out
in//let
case+ flt of
|
T0FLTnone(tok) =>
print("T0FLTnone(", tok, ")")
|
T0FLTsome(tok) =>
print("T0FLTsome(", tok, ")")
end (*let*) // end of [t0flt_fprint]

(* ****** ****** *)

#implfun
t0str_fprint
(out, str) =
let
#impltmp
g_print$out<>() = out
in//let
case+ str of
|
T0STRnone(tok) =>
print("T0STRnone(", tok, ")")
|
T0STRsome(tok) =>
print("T0STRsome(", tok, ")")
end (*let*) // end of [t0str_fprint]

(* ****** ****** *)

#implfun
i0dnt_fprint
(out, id0) =
let
#impltmp
g_print$out<>() = out
in//let
case+
id0.node() of
|
I0DNTnone(tok) =>
print("I0DNTnone(", tok, ")")
|
I0DNTsome(tok) =>
print("I0DNTsome(", tok, ")")
end (*let*) // end of [i0dnt_fprint]

(* ****** ****** *)

#implfun
l0abl_fprint
(out, lab) =
let
#impltmp
g_print$out<>() = out
in//let
case+
lab.node() of
|
L0ABLnone(tok) =>
print("L0ABLnone(", tok, ")")
|
L0ABLsome(lab) =>
print("L0ABLsome(", lab, ")")
end (*let*) // end of [l0abl_fprint]

(* ****** ****** *)

#implfun
s0ymb_fprint
(out, sym) =
let
#impltmp
g_print$out<>() = out
in//let
case+
sym.node() of
|
S0YMBi0dnt(id0) =>
print("S0YMBi0dnt(", id0, ")")
(*
|
S0YMBdtlab of (token, l0abl)
*)
|
S0YMBbrckt(tk1, tk2) =>
print("S0YMBbrckt(", tk1, ";", tk2, ")")
end (*let*) // end of [s0ymb_fprint]

(* ****** ****** *)

(*
fun
<x0:type>
s0lab_fprint
(out: FILR, lab: s0lab(x0)): void
*)

(* ****** ****** *)
//
#implfun
s0qid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
S0QIDnone(id0) =>
print("S0QIDnone(", id0, ")")
|
S0QIDsome(tok, id0) =>
print
("S0QIDsome(", tok, ";", id0, ")")
end (*let*) // end of [s0qid_fprint]
//
#implfun
d0qid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
D0QIDnone(id0) =>
print("D0QIDnone(", id0, ")")
|
D0QIDsome(tok, id0) =>
print
("D0QIDsome(", tok, ";", id0, ")")
end (*let*) // end of [d0qid_fprint]
//
(* ****** ****** *)

#implfun
g0nam_fprint
(out, g0n) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
g0n.node() of
//
| G0Nid0(id0) =>
  print("G0Nid0(", id0, ")")
//
| G0Nint(tok) =>
  print("G0Nint(", tok, ")")
| G0Nchr(tok) =>
  print("G0Nchr(", tok, ")")
| G0Nflt(tok) =>
  print("G0Nflt(", tok, ")")
| G0Nstr(tok) =>
  print("G0Nstr(", tok, ")")
//
| G0Nlist(tk1, gns, tk2) =>
  print
  ("G0Nlist(", tk1, ";", gns, ";", tk2, ")")
//
| G0Nnone0(   ) => print("G0Nnone0(", ")")
| G0Nnone1(tok) => print("G0Nnone1(", tok, ")")
//
end (*let*) // end of [g0nam_fprint]

(* ****** ****** *)

#implfun
s0tcn_fprint
(out, tcn) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
tcn.node() of
|
S0TCNnode(id0, stq) =>
print("S0TCNnode(", id0, ";", stq, ")")
end (*let*) // end of [s0tcn_fprint]

(* ****** ****** *)

#implfun
d0tst_fprint
(out, dst) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dst.node() of
|
D0TSTnode(id0, teq, cns) =>
print("D0TST(", id0, ";", teq, ";", cns, ")")
end (*let*) // end of [d0tst_fprint]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp0_print0.dats] *)
