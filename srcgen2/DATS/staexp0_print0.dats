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
sq0eid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
SQ0EIDnone(id0) =>
print("SQ0EIDnone(", id0, ")")
|
SQ0EIDsome(tok, id0) =>
print
("SQ0EIDsome(", tok, ";", id0, ")")
end (*let*) // end of [sq0eid_fprint]
//
#implfun
dq0eid_fprint
(out, qid) =
let
#impltmp
g_print$out<>() = out
in//let
case+ qid of
|
DQ0EIDnone(id0) =>
print("DQ0EIDnone(", id0, ")")
|
DQ0EIDsome(tok, id0) =>
print
("DQ0EIDsome(", tok, ";", id0, ")")
end (*let*) // end of [dq0eid_fprint]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp0_print0.dats] *)
