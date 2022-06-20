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
Start Time: June 19th, 2022
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
#symload node with d0ecl_get_node
(* ****** ****** *)

#implfun
d0ecl_fprint
(out, dcl) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
|
D0Ctkerr(tok) =>
print("D0Ctkerr(",tok,")")
|
D0Ctkskp(tok) =>
print("D0Ctkskp(",tok,")")
|
D0Clocal
(tknd,head,tin1,body,tend) =>
(
print("D0Clocal(",tknd,";");
print(head,";",tin1,";");print(body,";",tend,")"))
|
D0Csortdef
(tknd,tid0,teq1,def2) =>
(
print("D0Csortdef(",tknd,";");
print(tid0,";",teq1,";",def2,")"))
//
|
D0Csexpdef
(tknd,sid0,smas,tres,teq1,def2) =>
(
print("D0Csexpdef(",tknd,";");
print(sid0,";",smas,";",tres,";");print(teq1,";",def2,")"))
//
end (*let*) // end of [d0ecl_fprint(out,dcl)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp0_print0.dats] *)
