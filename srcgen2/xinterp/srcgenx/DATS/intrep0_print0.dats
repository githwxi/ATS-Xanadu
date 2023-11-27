(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Fri Nov 24 13:33:19 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../../SATS/xbasics.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irpat_fprint
(out, irp0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
irp0.node() of
//
|IRPany _ => print("IRPany(", ")")
//
|IRPint(int) => print("IRPint(", int, ")")
|IRPchr(btf) => print("IRPchr(", btf, ")")
|IRPchr(chr) => print("IRPchr(", chr, ")")
|IRPchr(str) => print("IRPstr(", str, ")")
//
|IRPvar(d2v) => print("IRPvar(", d2v, ")")
//
|IRPnone0() => print( "IRPnone0(",")" )
|IRPnone1(d3p1) => print( "IRPnone1(", d3p1, ")" )
//
end//let//end-of-[irpat_fprint(out, irp0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irexp_fprint
(out, ire0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
ire0.node() of
//
|IREany _ => print("IREany(", ")")
//
|IREint(int) => print("IREint(", int, ")")
|IREchr(btf) => print("IREchr(", btf, ")")
|IREchr(chr) => print("IREchr(", chr, ")")
|IREchr(str) => print("IREstr(", str, ")")
//
|IREvar(d2v) => print("IREvar(", d2v, ")")
//
|IREdapp
( ire1
, npf1, ires) =>
(
print
("IREift0(", ire1, ";", npf1, ";", ires, ")"))
//
|IREift0
( ire1
, ithn, iels) =>
(
print
("IREift0(", ire1, ";", ithn, ";", iels, ")"))
//
//
|IREnone0() => print( "IREnone0(",")" )
|IREnone1(d3e1) => print( "IREnone1(", d3e1, ")" )
//
end//let//end-of-[irexp_fprint(out, ire0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irdcl_fprint
(out, ird0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
ird0.node() of
//
|IRDlocal0
(head, body) =>
print("IRPlocal0(", head, ";", body, ")")
//
|IRDnone1(d3cl) => print( "IRDnone1(", d3cl, ")" )
//
end//let//end-of-[irdcl_fprint(out, ird0)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_intrep0_print0.dats] *)
