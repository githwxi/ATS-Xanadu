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
Sun 26 Feb 2023 11:24:50 AM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME "\
ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread23.sats"
(* ****** ****** *)
#define FPEMSG_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload fpemsg with d3pat_fpemsg
#symload fpemsg with l3d3p_fpemsg
#symload fpemsg with d3exp_fpemsg
#symload fpemsg with l3d3e_fpemsg
(* ****** ****** *)
#symload fpemsg with d3ecl_fpemsg
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d3p: d3pat): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d3p.node() of
//
|D3Pvar _ => ( (*void*) )
//
|D3Pint _ => ( (*void*) )
|D3Pbtf _ => ( (*void*) )
|D3Pchr _ => ( (*void*) )
|D3Pflt _ => ( (*void*) )
|D3Pstr _ => ( (*void*) )
//
|D3Pcon _ => ( (*void*) )
//
|D3Pbang
( d3p1 ) =>
let
val () =
d3pat_fpemsg(out, d3p1) endlet
|D3Pflat
( d3p1 ) =>
let
val () =
d3pat_fpemsg(out, d3p1) endlet
|D3Pfree
( d3p1 ) =>
let
val () =
d3pat_fpemsg(out, d3p1) endlet
//
|
D3Ptapq
(d3f0, tjas) =>
let
val () =
d3pat_fpemsg(out, d3f0) endlet
//
|
D3Pdap1(d3f0) =>
let
val () =
d3pat_fpemsg(out, d3f0) endlet
//
|
D3Pdapp
(d3f0,npf1,d3ps) =>
let
val () =
d3pat_fpemsg(out, d3f0)
val () =
d3patlst_fpemsg(out, d3ps)
end (*let*) // end-of-(D3Pdapp)
//
|
D3Ptup0
(npf1, d3ps) =>
let
val () =
d3patlst_fpemsg(out, d3ps) endlet
//
|
D3Pannot
(d3p1,s1e2,s2e2) =>
let
val () = d3pat_fpemsg(out , d3p1)
endlet
//
|
D3Pt2pck
(d3p1, t2p2) =>
let
val () = d3pat_fpemsg(out , d3p1)
endlet // end of [ D3Pt2pck(_, _) ]
//
|D3Pnone0(    ) => (   (*void*)   )
|D3Pnone1(d2p1) => (   (*void*)   )
//
|
D3Perrck(_,_) => d3pat_fpemsg(out, d3p)
//
(*
| _
(*otherwise*) => d3pat_fpemsg(out, d3p)
*)
//
end (*let*) // end-of-(auxmain(out,d3p))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
#implfun
d3pat_fpemsg
( out, d3p0 ) =
let
//
#impltmp
g_print$out<>() = out
//
(*
val
loc0 = d3p0.lctn()
val () =
prerrsln
("d3pat_fpemsg: loc0 = ", loc0)
val () =
prerrsln
("d3pat_fpemsg: d3p0 = ", d3p0)
*)
//
in//let
//
case+
d3p0.node() of
|
D3Perrck(lvl, d3p1) =>
(
auxmain( out, d3p1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
let
val
loc0 = d3p0.lctn() in // let
printsln
("TREAD23-ERROR:",loc0,":",d3p0)
end // let // else // end-of-[if]
) (* end-of-[ D3Perrck(lvl,d2p1) ] *)
| // non-D3Perrck // ... // ... // ...
_ (* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(d3pat_fpemsg(out,d3p0))
//
endloc(*local*)//end-of(local(d3pat_fpemsg))
//
(* ****** ****** *)
//
#implfun
l3d3p_fpemsg
(out, ld3p) =
(
case+ ld3p of
|
D3LAB(lab,d3p1) => d3pat_fpemsg(out,d3p1)
) (*case+*)//end-of-(l3d3p_fpemsg(out,ld3p))
//
(* ****** ****** *)
//
local

fun
auxmain
( out: FILR
, d3e: d3exp): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d3e.node() of
//
|D3Eint _ => ()
|D3Ebtf _ => ()
|D3Echr _ => ()
|D3Eflt _ => ()
|D3Estr _ => ()
//
|D3Evar _ => ()
//
|D3Econ _ => ()
|D3Ecst _ => ()
//
|D3Etop _ => ()
//
|
D3Etapp
(d3f0, s2es) =>
let
val () =
d3exp_fpemsg(out, d3f0) endlet
|
D3Etapq
(d3f0, tjas) =>
let
val () =
d3exp_fpemsg(out, d3f0) endlet
//
|
D3Edap0(d3f0) =>
let
val () =
d3exp_fpemsg(out, d3f0) endlet
|
D3Edapp
( d3f0
, npf1, d3es) =>
let
val () =
d3exp_fpemsg(out, d3f0)
val () =
d3explst_fpemsg(out, d3es) endlet
//
|
D3Eproj
( tknd
, lab1, d3e2) =>
let
val () =
  d3exp_fpemsg(out, d3e2) endlet
//
|
D3Elet0
(d3cs, d3e1) =>
(
d3exp_fpemsg
(out, d3e1)) where
{
val
( ) = d3eclist_fpemsg(out, d3cs)}
//
|
D3Eift0
(d3e1,dthn,dels) =>
let
val () =
d3exp_fpemsg(out, d3e1)
val () =
d3expopt_fpemsg(out, dthn)
val () =
d3expopt_fpemsg(out, dels) endlet
//
|
D3Ecas0
(tknd,d3e1,dcls) =>
let
val () =
d3exp_fpemsg(out, d3e1)
val () =
d3clslst_fpemsg(out, dcls) endlet
//
|
D3Eseqn
(d3es, d3e1) =>
(
  d3exp_fpemsg(out, d3e1)
) where
{ val () =
  d3explst_fpemsg( out, d3es ) }
//
|
D3Etup0
(npf1, d3es) =>
let
val () =
d3explst_fpemsg(out, d3es) endlet
|
D3Etup1
(tknd,npf1,d3es) =>
let
val () =
d3explst_fpemsg(out, d3es) endlet
//
|
D3Etry0
(tknd,d3e1,dcls) =>
let
val () =
d3exp_fpemsg(out, d3e1)
val () =
d3clslst_fpemsg(out, dcls) endlet
//
(* ****** ****** *)
//
|
D3Eaddr d3e1 =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Eaddr(d3e1) ]
|
D3Eview d3e1 =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Eview(d3e1) ]
|
D3Eflat d3e1 =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Eflat(d3e1) ]
//
(* ****** ****** *)
//
|
D3Eeval d3e1 =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Eeval(d3e1) ]
|
D3Efold d3e1 =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Efold(d3e1) ]
|
D3Efree d3e1 =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Efree(d3e1) ]
//
(* ****** ****** *)
//
|
D3Edp2tr
(   d3e1   ) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Edp2tr(d3e1) ]
|
D3Edl0az
(   d3e1   ) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Edl0az(d3e1) ]
|
D3Edl1az
(   d3e1   ) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Edl1az(d3e1) ]
//
|
D3Ewhere
(d2e1, dcls) =>
let
val () =
d3eclist_fpemsg(out, dcls)
val () = d3exp_fpemsg(out , d2e1)
endlet
//
|
D3Eassgn
(d3el, d3er) =>
let
val () = d3exp_fpemsg(out , d3el)
val () = d3exp_fpemsg(out , d3er)
endlet // end of [ D3Eassgn(_, _) ]
//
|
D3Eraise
(tknd, d3e1) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Eraise(_, _) ]
//
|
D3El0azy
(dsym, d3e1) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3El0azy(_, _) ]
|
D3El1azy
(dsym
,d3e1, d3es) =>
let
  val () =
  d3explst_fpemsg(out , d3es)
endlet where
{
val () = d3exp_fpemsg(out , d3e1)
}(*whr*)//end-[ D3El1azy(_, _, _) ]
//
|
D3Eannot
(d3e1
,s1e2, s2e2) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Eannot(_, _) ]
//
|
D3Elabck
(d3e1, lab2) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Elabck(_, _) ]
|
D3Et2pck
(d3e1, t2p2) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Et2pck(_, _) ]
//
|D3Enone0(    ) => (   (*void*)   )
|D3Enone1(d2e1) => (   (*void*)   )
//
|D3Enone2(d3e1) =>
let
val () = d3exp_fpemsg(out , d3e1)
endlet // end of [ D3Enone2( ... ) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
|
D3Eextnam
( tknd, gnam) =>
let
(*
HX-2023-11-03: (* nothing yet *)
*)
(*
  val () = g1nam_fpemsg(out, gnam)
*)
endlet//end-of-[D3Eextnam(tknd,gnam)]
//
|
D3Esynext
( tknd, gexp) =>
let
(*
HX-2024-07-20: (* nothing yet *)
*)
(*
  val () = g1exp_fpemsg(out, gexp)
*)
endlet//end-of-[D3Esynext(tknd,gexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|
D3Eerrck(_, _) => d3exp_fpemsg(out, d3e)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
|
_(*otherwise*) => d3exp_fpemsg(out, d3e)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
end (*let*) // end-of-[auxmain(out, d3e)]

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
#implfun
d3exp_fpemsg
( out, d3e0 ) =
let
//
#impltmp
g_print$out<>() = out
//
(*
val
loc0 = d3e0.lctn()
val () =
prerrsln
("d3exp_fpemsg: loc0 = ", loc0)
val () =
prerrsln
("d3exp_fpemsg: d3e0 = ", d3e0)
*)
//
in//let
//
case+
d3e0.node() of
|
D3Eerrck(lvl, d3e1) =>
(
auxmain( out, d3e1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
let
val
loc0 = d3e0.lctn() in // let
printsln
("TREAD23-ERROR:",loc0,":",d3e0)
end // let // else // end-of-[if]
) (* end-of-[ D3Eerrck(lvl,d2e1) ] *)
| // non-D3Eerrck // ... // ... // ...
_ (* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(d3exp_fpemsg(out,d3e0))
//
endloc(*local*)//end-of(local(d3exp_fpemsg))
//
(* ****** ****** *)
//
#implfun
l3d3e_fpemsg
(out, ld3e) =
(
case+ ld3e of
|
D3LAB(lab,d3e1) => d3exp_fpemsg(out,d3e1))
//(*case+*)//end-of-(l3d3e_fpemsg(out,ld3e))
//
(* ****** ****** *)
//
#implfun
f3arg_fpemsg
(out, farg) =
(
case+
farg.node() of
//
|F3ARGdapp
(npf1, d3ps) =>
d3patlst_fpemsg(out, d3ps)
//
|F3ARGsapp
(s2vs, s2es) => ((*skipped*))
|F3ARGmets
(   s2es   ) => ((*skipped*)) )
//(*case+*)//end-of-(f3arg_fpemsg(out,farg)]
//
(* ****** ****** *)
//
#implfun
d3gua_fpemsg
(out, dgua) =
(
case+
dgua.node() of
|
D3GUAexp(d3e1) =>
d3exp_fpemsg(out, d3e1)
|
D3GUAmat(d3e1,d3p2) =>
let
val () = d3exp_fpemsg(out, d3e1)
val () = d3pat_fpemsg(out, d3p2)
endlet // end of [D3GUAmat(_,_,_)]
) (*case*) // end-of(d3gua_fpemsg(out,dgua))
//
(* ****** ****** *)
//
#implfun
d3gpt_fpemsg
(out, dgpt) =
(
case+
dgpt.node() of
|
D3GPTpat(d3p1) =>
d3pat_fpemsg(out, d3p1)
|
D3GPTgua(d3p1,d3gs) =>
let
val () = d3pat_fpemsg(out, d3p1)
val () = d3gualst_fpemsg(out, d3gs)
endlet // end of [ D3GPTgua(_,_,_) ]
) (*case*) // end-of(d3gpt_fpemsg(out,dgpt))
//
(* ****** ****** *)
//
#implfun
d3cls_fpemsg
(out, dcls) =
(
case+
dcls.node() of
|
D3CLSgpt(dgpt) =>
d3gpt_fpemsg(out, dgpt)
|
D3CLScls(dgpt,d3e2) =>
let
val () = d3gpt_fpemsg(out, dgpt)
val () = d3exp_fpemsg(out, d3e2)
endlet // end of [ D3CLScls(_,_,_) ]
) (*case*) // end-of(d3cls_fpemsg(out,dcls))
//
(* ****** ****** *)
//
local

fun
auxmain
( out: FILR
, dcl: d3ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
D3Cd2ecl _ => ((*void*))
//
|
D3Cstatic
(tknd, dcl1) =>
let
val () =
d3ecl_fpemsg(out, dcl1)
endlet//end-of(D3Cstatic(_,_))
|
D3Cextern
(tknd, dcl1) =>
let
val () =
d3ecl_fpemsg(out, dcl1)
endlet//end-of(D3Cextern(_,_))
//
|
D3Clocal0
(dcs1, dcs2) =>
let
val () =
d3eclist_fpemsg(out, dcs1)
val () =
d3eclist_fpemsg(out, dcs2)
endlet // end of [D3Clocal0(...)]
//
|D3Cabsopen _ => ( (*void*) )
|D3Cabsimpl _ => ( (*void*) )
//
|
D3Cinclude
(knd0,tknd
,g1e1,fopt,dopt) =>
(
case+ dopt of
|
optn_nil() => ()
|
optn_cons(dcls) =>
let
val () =
  d3eclist_fpemsg(out, dcls)
endlet
) (*case+*)//end-(D3Cinclude(...))
//
|
D3Cstaload
(knd0,tknd
,g1e1,fopt,dopt) => ((*void*))
//
|
D3Cvaldclst
(tknd, d3vs) => let
val () =
  d3valdclist_fpemsg(out, d3vs)
endlet // end-of-(D3Cvaldclst(_,_,_))
|
D3Cvardclst
(tknd, d3vs) => let
val () =
  d3vardclist_fpemsg(out, d3vs)
endlet // end-of-(D3Cvardclst(_,_,_))
//
|
D3Cfundclst
( tknd
, tqas
, d2cs, d3fs) => let
(*
val () =
  t2qaglst_fpemsg(out, tqas)
*)
val () =
  d3fundclist_fpemsg(out, d3fs)
endlet // end-of-(D3Cfundclst(_,_,_))
//
|
D3Cimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp, tias
, f3as, sres, d3e1) =>
let
(*
val () =
  s2qaglst_fpemsg(out, sqas)
val () =
  t2qaglst_fpemsg(out, tqas)
val () =
  t2iaglst_fpemsg(out, tias)
*)
val () =
  f3arglst_fpemsg(out, f3as)
(*
val () = s2res_fpemsg(out, sres)
*)
val () = d3exp_fpemsg(out, d3e1)
endlet // end of [ D3Cimplmnt0(...) ]
//
|
D3Ctmplocal
( dtmp, tmps) =>
let
val () = d3ecl_fpemsg(out, dtmp)
val () = d3eclist_fpemsg(out, tmps)
endlet // end of [ D3Ctmplocal(...) ]
//
|D3Cnone0 _ => ( (*skipped*) )
|D3Cnone1 _ => ( ) | D3Cnone2 _ => ( )
//
|
D3Cerrck(_,_) => d3ecl_fpemsg(out, dcl)
//
(*
| _
(*otherwise*) => d3ecl_fpemsg(out, dcl)
*)
//
end (*let*) // end-of-(auxmain(out,dcl))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
d3ecl_fpemsg
(out, dcl0) =
let
//
#impltmp
g_print$out<>() = out
//
(*
val
loc0 = dcl0.lctn()
val () =
prerrsln
("d3ecl_fpemsg: loc0 = ", loc0)
val () =
prerrsln
("d3ecl_fpemsg: dcl0 = ", dcl0)
*)
//
in//let
//
case+
dcl0.node() of
//
|
D3Cerrck(lvl, d3cl)  =>
(
auxmain( out, d3cl );
if
(lvl
>FPEMSG_ERRVL) then () else
let
val
loc0 = dcl0.lctn() in // let
printsln
("TREAD23-ERROR:",loc0,":",dcl0)
end // let // else // end-of-[if]
) (* end-of-[ D3Cerrck(lvl,dcl0) ] *)
| // non-D3Cerrck // ... // ... // ...
_ (* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(d3ecl_fpemsg(out,dcl0))
//
endloc(*local*)//end-of(local(d3ecl_fpemsg))
//
(* ****** ****** *)
//
#implfun
teqd3exp_fpemsg
  (out, tdxp) =
(
case+ tdxp of
|
TEQD3EXPnone() => ()
|
TEQD3EXPsome(teq1, d3e2) =>
let
val d3e2 = d3exp_fpemsg(out, d3e2)
endlet // end of [TEQD3EXPsome(_,_)]
) (*case+*)//end-(teqd3exp_fpemsg(out,tdxp))
//
(* ****** ****** *)
//
#implfun
d3valdcl_fpemsg
(out, dval) =
let
//
val (  ) =
  d3pat_fpemsg(out, dpat)
//
val (  ) =
  teqd3exp_fpemsg(out, tdxp)
//
(*
val (  ) =
  wths2exp_fpemsg(out, wsxp)
*)
//
endlet where
{
//
  val dpat = d3valdcl_get_dpat(dval)
  val tdxp = d3valdcl_get_tdxp(dval)
//
(*
  val wsxp = d3valdcl_get_wsxp(dval)
*)
//
} (*where*)//end-of-[d3valdcl_fpemsg(out,dval)]
//
(* ****** ****** *)
//
#implfun
d3vardcl_fpemsg
(out, dvar) =
let
//
val (  ) =
  teqd3exp_fpemsg(out, dini)
//
endlet where
{
//
(*
  val dpid = d3vardcl_get_dpid(dvar)
  val vpid = d3vardcl_get_vpid(dvar)
*)
//
(*
  val sres = d3vardcl_get_sres(dvar)
*)
//
  val dini = d3vardcl_get_dini(dvar)
//
} (*where*)//end-of-[d3vardcl_fpemsg(out,dval)]
//
(* ****** ****** *)
//
#implfun
d3fundcl_fpemsg
(out, dfun) =
let
//
val (  ) =
  f3arglst_fpemsg(out, fags)
val (  ) =
  teqd3exp_fpemsg(out, tdxp)
//
endlet where
{
//
(*
  val dpid = d3fundcl_get_dpid(dfun)
*)
//
  val fags = d3fundcl_get_farg(dfun)
(*
  val sres = d3fundcl_get_sres(dfun)
*)
  val tdxp = d3fundcl_get_tdxp(dfun)
(*
  val wsxp = d3fundcl_get_wsxp(dfun)
*)
//
} (*where*)//end-of-[d3fundcl_fpemsg(out,dfun)]
//
(* ****** ****** *)
//
#implfun
d3patlst_fpemsg
(out, d3ps) =
list_foritm<d3pat>(d3ps) where
{
#impltmp
foritm$work<d3pat>(d3p1) = d3pat_fpemsg(out,d3p1)
}
//
(* ****** ****** *)
//
#implfun
l3d3plst_fpemsg
(out, ldps) =
list_foritm<l3d3p>(ldps) where
{
#impltmp
foritm$work<l3d3p>(ld3p) = l3d3p_fpemsg(out,ld3p)
}
//
(* ****** ****** *)
//
#implfun
d3explst_fpemsg
(out, d3es) =
list_foritm<d3exp>(d3es) where
{
#impltmp
foritm$work<d3exp>(d3e1) = d3exp_fpemsg(out,d3e1)
}
//
#implfun
d3expopt_fpemsg
(out, dopt) =
optn_foritm<d3exp>(dopt) where
{
#impltmp
foritm$work<d3exp>(d3e1) = d3exp_fpemsg(out,d3e1)
}
//
(* ****** ****** *)
//
#implfun
l3d3elst_fpemsg
(out, ldes) =
list_foritm<l3d3e>(ldes) where
{
#impltmp
foritm$work<l3d3e>(ld3e) = l3d3e_fpemsg(out,ld3e)
}
//
(* ****** ****** *)
//
#implfun
f3arglst_fpemsg
(out, f3as) =
list_foritm<f3arg>(f3as) where
{
#impltmp
foritm$work<f3arg>(f3a1) = f3arg_fpemsg(out,f3a1)
}
//
(* ****** ****** *)
//
#implfun
d3gualst_fpemsg
(out, d3gs) =
list_foritm<d3gua>(d3gs) where
{
#impltmp
foritm$work<d3gua>(d3g1) = d3gua_fpemsg(out,d3g1)
}
//
#implfun
d3clslst_fpemsg
(out, d3cs) =
list_foritm<d3cls>(d3cs) where
{
#impltmp
foritm$work<d3cls>(d3c1) = d3cls_fpemsg(out,d3c1)
}
//
(* ****** ****** *)
//
#implfun
d3eclist_fpemsg
(out, dcls) =
list_foritm<d3ecl>(dcls) where
{
#impltmp
foritm$work<d3ecl>(dcl1) = d3ecl_fpemsg(out,dcl1)
}
//
(* ****** ****** *)
//
#implfun
d3valdclist_fpemsg
(out, d3vs) =
list_foritm<d3valdcl>(d3vs) where
{
#impltmp
foritm$work<d3valdcl>(dvar) = d3valdcl_fpemsg(out,dvar)
}
//
(* ****** ****** *)
//
#implfun
d3vardclist_fpemsg
(out, d3vs) =
list_foritm<d3vardcl>(d3vs) where
{
#impltmp
foritm$work<d3vardcl>(dvar) = d3vardcl_fpemsg(out,dvar)
}
//
(* ****** ****** *)
//
#implfun
d3fundclist_fpemsg
(out, d3fs) =
list_foritm<d3fundcl>(d3fs) where
{
#impltmp
foritm$work<d3fundcl>(dfun) = d3fundcl_fpemsg(out,dfun)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread23_errmsg.dats] *)
