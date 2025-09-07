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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue 07 Mar 2023 10:59:05 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#define
ATS_PACKNAME "\
ATS3.XANADU.xatsopt-20220500"
//
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
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#symload tknd with d2cst_get_tknd
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-09-07:
Sun Sep  7 12:50:47 AM EDT 2025
*)
//
#impltmp
< r0:vt >
d2pat_d2v$foldl =
(
gseq_foldl<xs><x0><r0>(*void*))
where
{
#typedef x0 = d2var
#typedef xs = d2pat
#impltmp
gseq_foritm<xs><x0> = d2pat_d2v$foritm<>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
d2pat_d2v$foritm
  (  d2p0  ) =
(
  f0_main(d2p0)) where
{
//
fun
f0_main
(d2p0: d2pat): void =
(
case+
d2p0.node() of
//
|D2Pvar
(d2v1) => foritm$work(d2v1)
//
|D2Pbang(d2p1) => f0_main(d2p1)
|D2Pflat(d2p1) => f0_main(d2p1)
|D2Pfree(d2p1) => f0_main(d2p1)
//
|D2Psapp
( d2p1, s2vs ) => f0_main(d2p1)
//
(*
|D2Pdap0
(    d2p1    ) => f0_main(d2p1)
|D2Pdap1
(    d2p1    ) => f0_main(d2p1)
*)
//
|D2Pdapp
(d2f1,npf1,d2ps) => f0_d2ps(d2ps)
//
|D2Prfpt
(d2p1,tkas,d2p2) =>
(
  f0_main(d2p1); f0_main(d2p2)  )
//
|D2Ptup0
(  npf1, d2ps  ) => f0_d2ps(d2ps)
|D2Ptup1
(tknd,npf1,d2ps) => f0_d2ps(d2ps)
|D2Prcd2
(tknd,npf1,ldps) => f0_ldps(ldps)
//
|D2Pannot
(d2p1,s1e1,s2e1) => f0_main(d2p1)
//
| _(*otherwise*) => (  (*void*)  )
//
)(*case+*)//end-of-[ f0_main(d2p0) ]
//
and
f0_d2ps
(d2ps: d2patlst): void =
(
//
case+ d2ps of
|list_nil() => ()
|list_cons(d2p1, d2ps) =>
let
  val () =
  f0_main(d2p1) in f0_d2ps(d2ps)
end
)(*case+*)//end-of-[ f0_d2ps(d2ps) ]
//
and
f0_ldps
(ldps: l2d2plst): void =
(
//
case+ ldps of
|list_nil() => ()
|list_cons(ldp1, ldps) =>
(
  f0_ldps(ldps)) where
{
  val () = f0_main(ldp1.itm()) }
)(*case+*)//end-of-[ f0_ldps(ldps) ]
//
}(*where*)//end-of-[d2pat_d2v$foritm(d2p0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_dynexp2_tmplib.dats] *)
(***********************************************************************)
