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
//
(*
Author: Hongwei Xi
(*
Sat Nov  1 11:44:09 PM EDT 2025
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
"./../SATS/fpeltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#define ERRLVL 2
//
fun
auxmain
(
out0: FILR,
d3p0: d3pat1): void =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3p0.node() of
//
(* ****** ****** *)
//
|D3P1bang
(   d3p1   ) =>
let
val () =
fpeltck_d3pat1(out0, d3p1)
end//let
//
|D3P1flat
(   d3p1   ) =>
let
val () =
fpeltck_d3pat1(out0, d3p1)
end//let
//
|D3P1free
(   d3p1   ) =>
let
val () =
fpeltck_d3pat1(out0, d3p1)
end//let
//
(* ****** ****** *)
//
|D3P1dapp
(d3f0
,npf1, d3ps) =>
let
val () =
fpeltck_d3pat1(out0, d3f0)
val () =
fpeltck_d3pat1lst(out0, d3ps)
end//let
//
(* ****** ****** *)
//
|D3P1argtp
(d3p1, t2q2) =>
let
val () =
(
  fpeltck_d3pat1(out0, d3p1))
end//let
//
(* ****** ****** *)
//
|D3P1errck(_, _) =>
let
val () =
(
fpeltck_d3pat1(out0, d3p0))end//let
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
//
val loc0 =
d3p0.lctn((*0*))
val (  ) = prerrsln("\
fpeltck_d3pat1:auxmain: loc0 = ", loc0)
val (  ) = prerrsln("\
fpeltck_d3pat1:auxmain: d3p0 = ", d3p0)
//
endlet//end-of-(_______otherwise_______)
//
(* ****** ****** *)
//
end(*let*)//end-of-[auxmain(out0, d3p0)]
//
in//local
//
#implfun
fpeltck_d3pat1
( out0, d3p0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
(*
val () =
let
val loc0 = d3p0.lctn((*0*))
in//let
prerrsln
("fpeltck_d3pat1: loc0 = ", loc0)
val () =
prerrsln
("fpeltck_d3pat1: d3p0 = ", d3p0)
end//let
*)
//
in//let
//
case+
d3p0.node() of
|
D3P1errck
(lvl0, d3p1) =>
(
auxmain(out0, d3p1); 
if
(lvl0>=ERRLVL)
then ((*void*)) else
let
val loc0 = d3p0.lctn()
in//let
printsln();
printsln("\
FPELTCK-ERROR:", loc0, ":", d3p0)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fpeltck_d3pat1(out0,d3p0))
//
endloc(*local*)//end-of(local(fpeltck_d3pat1))
//
(* ****** ****** *)
//
#implfun
fpeltck_d3pat1lst
  (out0, d3ps) =
(
list_fpeltck_fnp(out0, d3ps, fpeltck_d3pat1))
//
#implfun
fpeltck_d3pat1opt
  (out0, dopt) =
(
optn_fpeltck_fnp(out0, dopt, fpeltck_d3pat1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fpeltck_d3axp1
( out0, d3a0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3a0.node() of
|
D3A1errck _ =>
let
val loc0 = d3a0.lctn()
in//let
printsln();
printsln("\
FPELTCK-ERROR:", loc0, ":", d3a0)
end//let
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fpeltck_d3axp1(out0,d3a0))
//
(* ****** ****** *)
//
#implfun
fpeltck_d3axp1lst
  (out0, d3as) =
(
list_fpeltck_fnp(out0, d3as, fpeltck_d3axp1))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#define ERRLVL 3
//
fun
auxmain
(
out0: FILR,
d3e0: d3exp1): void =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
d3e0.node() of
//
(* ****** ****** *)
//
|D3E1dap0
(   d3f0   ) =>
let
val () =
(
fpeltck_d3exp1(out0, d3f0))
end//let//end-of-[D3E1dap0(...)]
//
|D3E1dapp
(d3f0
,npf1, d3es) =>
let
val () =
(
fpeltck_d3exp1(out0, d3f0))
val () =
fpeltck_d3exp1lst(out0, d3es)
end//let//end-of-[D3E1dapp(...)]
//
|D3E1daft
(d3e1, taft) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e1))
end//let//end-of-[D3E1daft(...)]
//
(* ****** ****** *)
//
|D3E1let0
(dcls, d3e1) =>
(
fpeltck_d3exp1(out0, d3e1))
where
{
val () =
(
fpeltck_d3ecl1lst(out0, dcls))
}(*where*)//end-of-[D3Elet0(...)]
//
|D3E1let1
(dcls
,d3e1, dvts) =>
(
fpeltck_d3exp1(out0, d3e1))
where
{
val () =
(
fpeltck_d3ecl1lst(out0, dcls))
}(*where*)//end-of-[D3Elet1(...)]
//
(* ****** ****** *)
//
|D3E1ift0
(d3e1
,dthn, dels) =>
let
val () =
(
fpeltck_d3exp1(out0, d3e1))
val () =
(
fpeltck_d3exp1opt(out0, dthn))
val () =
(
fpeltck_d3exp1opt(out0, dels))
end(*let*)//end-of-[D3E1ift0(...)]
//
|D3E1cas0
(tknd
,d3e1, dcls) =>
let
val () =
(
fpeltck_d3exp1(out0, d3e1))
val () =
(
fpeltck_d3cls1lst(out0, dcls))
end(*let*)//end-of-[D3E1cas0(...)]
//
(* ****** ****** *)
//
|D3E1seqn
(d3es, d3e1) =>
(
fpeltck_d3exp1(out0, d3e1))
where
{
val () =
(
fpeltck_d3exp1lst(out0, d3es))
}(*where*)//end-of-[D3E1seqn(...)]
//
(* ****** ****** *)
//
|D3E1lam0
(tknd
,farg, sres
,arrw, d3e1) =>
(
fpeltck_d3exp1(out0, d3e1))
where
{
val () =
(
fpeltck_f3arg1lst(out0, farg))
}(*where*)//end-of-[D3E1lam0(...)]
//
|D3E1lam1
(tknd
,farg, faxp
,sres, arrw
,d3e1, dvts) =>
(
fpeltck_d3exp1(out0, d3e1))
where
{
//
val () =
(
fpeltck_f3arg1lst(out0, farg))
val () =
(
fpeltck_f3axp1lst(out0, faxp))
//
}(*where*)//end-of-[D3E1lam1(...)]
//
(* ****** ****** *)
//
|D3E1dvdtp
(d3e1, dvts) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e1) )
end(*let*)//end-of-[D3E1dvdtp(...)]
//
|D3E1annot
(d3e1, s1e2
,s2e2, t2p2) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e1) )
end(*let*)//end-of-[D3E1annot(...)]
//
(* ****** ****** *)
//
|D3E1labck
(d3e1, lab2) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e1) )
end(*let*)//end-of-[D3E1labck(...)]
//
|D3E1t2pck
(d3e1
,t2q1, t2q2) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e1) )
end(*let*)//end-of-[D3E1t2pck(...)]
|D3E1t2ped
(d3e1
,t2q1, t2q2) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e1) )
end(*let*)//end-of-[D3E1t2ped(...)]
//
(* ****** ****** *)
//
|
D3E1errck(_, _) =>
let
val () =
(
  fpeltck_d3exp1(out0, d3e0) )
end(*let*)//end-of-[D3E1errck(...)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val loc0 =
d3e0.lctn((*0*))
val (  ) = prerrsln("\
fpeltck_d3exp1:auxmain: loc0 = ", loc0)
val (  ) = prerrsln("\
fpeltck_d3exp1:auxmain: d3e0 = ", d3e0)
endlet
//
(* ****** ****** *)
//
end(*let*)//end-of-[auxmain(out0, d3e0)]
//
in//local
//
#implfun
fpeltck_d3exp1
( out0, d3e0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
val () =
let
val loc0 = d3e0.lctn((*0*))
in//let
(*
prerrsln
("fpeltck_d3exp1: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fpeltck_d3exp1: d3e0 = ", d3e0)
*)
//
in//let
//
case+
d3e0.node() of
|
D3E1errck
(lvl0, d3e1) =>
(
auxmain(out0, d3e1); 
if
(lvl0>ERRLVL)
then ((*void*)) else
let
val loc0 = d3e0.lctn()
in//let
printsln();
printsln("\
FPELTCK-ERROR:", loc0, ":", d3e0)
end//let
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(fpeltck_d3exp1(out0,d3e0))
//
endloc(*local*)//end-of(local(fpeltck_d3exp1))
//
(* ****** ****** *)
//
#implfun
fpeltck_d3exp1lst
  (out0, d3es) =
(
list_fpeltck_fnp(out0, d3es, fpeltck_d3exp1))
//
#implfun
fpeltck_d3exp1opt
  (out0, dopt) =
(
optn_fpeltck_fnp(out0, dopt, fpeltck_d3exp1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fpeltck_f3arg1
( out0, f3a0 ) =
(
case+
f3a0.node() of
//
|F3ARG1dapp
(npf1, d3ps) =>
fpeltck_d3pat1lst(out0, d3ps)
//
|F3ARG1sapp _ => () |F3ARG1mets _ => ()
//
)(*case+*)//end-of-[fpeltck_f3arg1(out0,f3a0)]
//
#implfun
fpeltck_f3arg1lst
  (out0, f3as) =
(
  list_fpeltck_fnp(out0, f3as, fpeltck_f3arg1))
//
(* ****** ****** *)
//
#implfun
fpeltck_f3axp1
( out0, f3a0 ) =
(
case+
f3a0.node() of
//
|F3AXP1dapp
(npf1, d3as) =>
fpeltck_d3axp1lst(out0, d3as)
//
|F3AXP1sapp _ => () |F3AXP1mets _ => ()
//
)(*case+*)//end-of-[fpeltck_f3axp1(out0,f3a0)]
//
#implfun
fpeltck_f3axp1lst
  (out0, f3as) =
(
  list_fpeltck_fnp(out0, f3as, fpeltck_f3axp1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fpeltck_d3gpt1
( out0, dgpt ) =
(
case+
dgpt.node() of
|
D3GPT1pat
(  d3p1  ) =>
(
  fpeltck_d3pat1(out0, d3p1))
|
D3GPT1gua
(d3p1, d3gs) =>
let
val () = fpeltck_d3pat1(out0, d3p1)
(*
val () = fpeltck_d3gua1lst(out0, d3gs)
*)
end(*let*)//end-of-[D3GPT1gua(d3p1,d3gs)]
)(*case+*)//end-of-(fpeltck_d3gpt1(out,dgpt))
//
#implfun
fpeltck_d3cls1
( out0, dcls ) =
(
case+
dcls.node() of
|
D3CLS1gpt
(   dgpt   ) =>
(
  fpeltck_d3gpt1(out0, dgpt))
|
D3CLS1cls
(dgpt, d3e2) =>
let
val () = fpeltck_d3gpt1(out0, dgpt)
val () = fpeltck_d3exp1(out0, d3e2)
end//let//end-of-[D3CLS1cls(dgpt,d3e2)]
) where
{
//
(*
val loc0 = dcls.lctn()
val (  ) =
(
  printsln
  ("FPELTCK-ERROR:", loc0, ":", dcls))
*)
//
}(*where*)//end-of-(fpeltck_d3cls(out,dcls))
//
(* ****** ****** *)
//
#implfun
fpeltck_d3cls1lst
  (out0, dcls) =
(
  list_fpeltck_fnp(out0, dcls, fpeltck_d3cls1))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_fpeltck_dynexp.dats] *)
(***********************************************************************)
