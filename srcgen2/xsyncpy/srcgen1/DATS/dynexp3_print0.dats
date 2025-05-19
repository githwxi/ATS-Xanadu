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
Sat May 17 10:54:57 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<d3pat1>(d3p0) =
(
d3pat1_print(d3p0)
) where
{
//
fun
d3pat1_print
(d3p0: d3pat1): void =
(
case+
d3p0.node() of
//
|D3P1any() =>
(
prints("D3P1any(", ")"))
//
|D3P1var(d2v1) =>
(
prints("D3P1var(", d2v1, ")"))
//
|D3P1dapp
(d3f0
,npf1, d3ps) =>
(
prints
("D3P1dapp("
, d3f0, ";", npf1, ";", d3ps, ")"))
//
|D3P1rfpt
(d3p1
,tkas, d3p2) =>
(
prints
("D3P1dapp("
, d3p1, ";", tkas, ";", d3p2, ")"))
//
|D3P1tup0
(npf1, d3ps) =>
(
prints(
"D3P1tup0(", npf1, ";", d3ps, ")"))
|D3P1tup1
(tknd
,npf1, d3ps) =>
(
prints
("D3P1tup1("
, tknd, ";", npf1, ";", d3ps, ")"))
//
|D3P1d3pat
(   dpat   ) =>
(
  prints( "D3P1d3pat(", dpat, ")" ))
//
|D3P1errck
(lvl0, d3p1) =>
(
prints("D3P1errck(", lvl0, ";", d3p1, ")"))
//
) where
{
  #impltmp
  g_print<d3pat1> = d3pat1_print
}(*where*)//end-of-[d3pat1_print(d3p0)]
//
}(*where*)//end-of-[g_print<d3pat1>(d3p0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<d3exp1>(d3e0) =
(
d3exp1_print(d3e0)
) where
{
//
fun
d3exp1_print
(d3e0: d3exp1): void =
(
case+
d3e0.node() of
//
|D3E1errck
(lvl0, d3e1) =>
(
prints("D3E1errck(", lvl0, ";", d3e1, ")"))
//
) where
{
  #impltmp
  g_print<d3exp1> = d3exp1_print
}(*where*)//end-of-[d3exp1_print(d3e0)]
//
}(*where*)//end-of-[g_print<d3exp1>(d3e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3_print0.dats] *)
(***********************************************************************)
