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
Sun Jun  1 10:05:49 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude\
/HATS/prelude_dats.hats"
#include
"xatslib/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trx3cpy.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
#symload lctn with d3pat_get_lctn
#symload lctn with d3exp_get_lctn
#symload lctn with d3ecl_get_lctn
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat_trx3cpy
(d3p0, env0) =
(
case+
d3p0.node() of
//
|D3Pint(tint) =>
d3pat1(loc0, D3P1int(tint))
|D3Pbtf(sbtf) =>
d3pat1(loc0, D3P1btf(sbtf))
|D3Pchr(tchr) =>
d3pat1(loc0, D3P1chr(tchr))
|D3Pflt(tflt) =>
d3pat1(loc0, D3P1flt(tflt))
|D3Pstr(tstr) =>
d3pat1(loc0, D3P1str(tstr))
//
|
_(*otherwise*) =>
(
  d3pat1(loc0, D3P1d3pat(d3p0)))
) where
{
//
val loc0 = d3p0.lctn()
//
(*
val (  ) =
printsln("d3pat_trx3cpy: loc0 = ", loc0)
val (  ) =
printsln("d3pat_trx3cpy: d3p0 = ", d3p0)
*)
//
}(*where*)//end-of-[d3pat_trx3cpy(d3p0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp_trx3cpy
(d3e0, env0) =
(
case+
d3e0.node() of
//
|D3Eint(tint) =>
d3exp1(loc0, D3E1int(tint))
|D3Ebtf(sbtf) =>
d3exp1(loc0, D3E1btf(sbtf))
|D3Echr(tchr) =>
d3exp1(loc0, D3E1chr(tchr))
|D3Eflt(tflt) =>
d3exp1(loc0, D3E1flt(tflt))
|D3Estr(tstr) =>
d3exp1(loc0, D3E1str(tstr))
//
|
_(*otherwise*) =>
(
  d3exp1(loc0, D3E1d3exp(d3e0)))
) where
{
//
val loc0 = d3e0.lctn()
//
(*
val (  ) =
printsln("d3exp_trx3cpy: loc0 = ", loc0)
val (  ) =
printsln("d3exp_trx3cpy: d3e0 = ", d3e0)
*)
//
}(*where*)//end-of-[d3exp_trx3cpy(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
f3arg_trx3cpy
(farg, env0) =
let
//
val loc0 = farg.lctn()
//
(*
val () =
prerrsln
("f3arg_trx3cpy: loc0 = ", loc0)
val () =
prerrsln
("f3arg_trx3cpy: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
//
|
F3ARGdapp
(npf1, d3ps) =>
let
val loc0 = farg.lctn()
val d3ps =
(
  d3patlst_trx3cpy(d3ps, env0))
in//let
f3arg1(loc0,F3ARG1dapp(npf1,d3ps))
end(*let*)//end-of-[F3ARG1dapp(...)]
//
|
F3ARGsapp
(s2vs, s2ps) =>
(
f3arg1(loc0,F3ARG1sapp(s2vs,s2ps)))
|
F3ARGmets
(   s2es   ) =>
(
f3arg1(loc0, F3ARG1mets(  s2es  )))
//
end(*let*)//end-of-[f3arg_trx3cpy(f3a0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_dynexp.dats] *)
(***********************************************************************)
