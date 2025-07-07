(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat Jul  5 02:08:23 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trxltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_trxltck
(d3e0, env0) =
let
//
val loc0 = d3e0.lctn()
val t2q0 = d3e0.styp()
//
val () =
prerrsln("\
d3exp_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3exp_trxltck: d3e0 = ", d3e0)
//
in//let
//
case+
d3e0.node() of
//
|D3E1int(tint) =>
d3exp1(loc0, t2q0, D3E1int(tint))
|D3E1btf(sbtf) =>
d3exp1(loc0, t2q0, D3E1btf(sbtf))
|D3E1chr(tchr) =>
d3exp1(loc0, t2q0, D3E1chr(tchr))
|D3E1flt(tflt) =>
d3exp1(loc0, t2q0, D3E1flt(tflt))
|D3E1str(tstr) =>
d3exp1(loc0, t2q0, D3E1str(tstr))
//
end(*let*)//end-of-[d3exp1_trxltck(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_dynexp.dats] *)
(***********************************************************************)
