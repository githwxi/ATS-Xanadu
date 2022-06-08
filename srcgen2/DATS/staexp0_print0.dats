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

(* end of [ATS3/XATSOPT_staexp0_print0.dats] *)
