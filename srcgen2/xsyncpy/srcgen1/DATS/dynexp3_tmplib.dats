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
Sat May 17 10:53:55 PM EDT 2025
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
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "\
./../../../SATS/locinfo.sats"
#staload "\
./../../../SATS/staexp2.sats"
#staload "\
./../../../SATS/statyp2.sats"
#staload "\
./../../../SATS/dynexp2.sats"
#staload "\
./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-09-07:
Sun Sep  7 03:04:00 AM EDT 2025
*)
//
//
#impltmp
< r0:vt >
d3pat1_d2v$folditm =
(
gseq_folditm<xs><x0><r0>(*void*))
where
{
#typedef x0 = d2var
#typedef xs = d3pat1
#impltmp
gseq_foritm<xs><x0> = d3pat1_d2v$foritm<>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
d3pat1_d2v$foritm
  (  d3p0  ) =
(
  f0_main(d3p0)) where
{
//
fun
f0_main
(d3p0: d3pat1): void =
(
case+
d3p0.node() of
//
|D3P1var
(d2v1) => foritm$work(d2v1)
//
|D3P1bang(d3p1) => f0_main(d3p1)
|D3P1flat(d3p1) => f0_main(d3p1)
|D3P1free(d3p1) => f0_main(d3p1)
//
|D3P1sapp
( d3p1, s2vs ) => f0_main(d3p1)
|D3P1sapq
( d3p1, s2as ) => f0_main(d3p1)
//
|D3P1tapq
( d3p1, tjas ) => f0_main(d3p1)
//
(*
|D3P1dap1
(    d3p1    ) => f0_main(d3p1)
*)
|D3P1dapp
(d3f1,npf1,d3ps) => f0_d3ps(d3ps)
//
|D3P1rfpt
(d3p1,tkas,d3p2) =>
(
  f0_main(d3p1); f0_main(d3p2)  )
//
|D3P1tup0
(  npf1, d3ps  ) => f0_d3ps(d3ps)
|D3P1tup1
(tknd,npf1,d3ps) => f0_d3ps(d3ps)
|D3P1rcd2
(tknd,npf1,ldps) => f0_ldps(ldps)
//
|D3P1annot
(d3p1
,s1e2,s2e2,t2q2) => f0_main(d3p1)
//
| _(*otherwise*) => (  (*void*)  )
//
)(*case+*)//end-of-[ f0_main(d3p0) ]
//
and
f0_d3ps
(d3ps: d3pat1lst): void =
(
//
case+ d3ps of
|list_nil() => ()
|list_cons(d3p1, d3ps) =>
let
  val () =
  f0_main(d3p1) in f0_d3ps(d3ps)
end
)(*case+*)//end-of-[ f0_d3ps(d3p0) ]
//
and
f0_ldps
(ldps: l3d3p1lst): void =
(
//
case+ ldps of
|list_nil() => ()
|list_cons(ldp1, ldps) =>
(
  f0_ldps(ldps)) where
{
  val () =
  f0_main(d3lab_get_itm(ldp1)) }
)(*case+*)//end-of-[ f0_ldps(ldps) ]
//
}(*where*)//end-of-[d3pat1_d2v$foritm(d3p0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3_tmplib.dats] *)
(***********************************************************************)
