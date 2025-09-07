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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue 25 Jul 2023 08:42:01 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload lctn with simpl_get_lctn
#symload node with simpl_get_node
(* ****** ****** *)
#symload lctn with dimpl_get_lctn
#symload node with dimpl_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-09-06:
Sat Sep  6 09:34:04 PM EDT 2025
*)
//
#impltmp
< r0:vt >
d3pat_d2v$foldl =
(
gseq_foldl<xs><x0><r0>(*void*))
where
{
#typedef x0 = d2var
#typedef xs = d3pat
#impltmp
gseq_foritm<xs><x0> = d3pat_d2v$foritm<>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
d3pat_d2v$foritm
  (  d3p0  ) =
(
  f0_main(d3p0)) where
{
//
fun
f0_main
(d3p0: d3pat): void =
(
case+
d3p0.node() of
//
|D3Pvar
(d2v1) => foritm$work(d2v1)
//
|D3Pbang(d3p1) => f0_main(d3p1)
|D3Pflat(d3p1) => f0_main(d3p1)
|D3Pfree(d3p1) => f0_main(d3p1)
//
|D3Psapp
( d3p1, s2vs ) => f0_main(d3p1)
|D3Psapq
( d3p1, s2as ) => f0_main(d3p1)
//
|D3Ptapq
( d3p1, tjas ) => f0_main(d3p1)
//
|D3Pdap1
(    d3p1    ) => f0_main(d3p1)
//
|D3Pdapp
(d3f1,npf1,d3ps) => f0_d3ps(d3ps)
//
| _(*otherwise*) => (  (*void*)  )
//
)(*case+*)//end-of-[ f0_main(d3p0) ]
//
and
f0_d3ps
(d3ps: d3patlst): void =
(
//
case+ d3ps of
|list_nil() => ()
|list_cons(d3p1, d3ps) =>
let
val () =
f0_main(d3p1) in f0_d3ps(d3ps) end
//
)(*case+*)//end-of-[ f0_d3ps(d3p0) ]
//
}(*where*)//end-of-[d3pat_d2v$foritm(d3p0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_dynexp3_tmplib.dats] *)
(***********************************************************************)
