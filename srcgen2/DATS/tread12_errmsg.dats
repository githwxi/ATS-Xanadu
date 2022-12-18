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
(*
Sat 17 Dec 2022 04:34:14 PM EST
*)
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#define FPEMSG_ERRVL 2
(* ****** ****** *)
#symload fpemsg with sort2_fpemsg
#symload fpemsg with s2exp_fpemsg
#symload fpemsg with l2s2e_fpemsg
(* ****** ****** *)
#symload fpemsg with d2pat_fpemsg
#symload fpemsg with l2d2p_fpemsg
#symload fpemsg with d2exp_fpemsg
#symload fpemsg with l2d2e_fpemsg
(* ****** ****** *)
#symload fpemsg with d2ecl_fpemsg
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, s2t: sort2): void =
let
#impltmp
g_print$out<>() = out
in//let
case s2t of
//
|S2Tid0 _ => ()
|S2Tint _ => ()
|S2Tbas _ => ()
//
|
S2Ttup(s2ts) =>
(
sort2lst_fpemsg(out, s2ts))
//
|S2Tfun0 _ => ()
|
S2Tfun1
(s2ts, sres) =>
(
sort2_fpemsg
( out, sres )) where
{
val () =
sort2lst_fpemsg(out, s2ts)}
//
|
S2Tapps
(s2f0, s2ts) =>
(
sort2_fpemsg(out, s2f0);
sort2lst_fpemsg(out, s2ts))
//
|S2Tnone0() => ((*void*))
|S2Tnone1(s0t1) => ((*void*))
//
|
S2Terrck _ => sort2_fpemsg(out, s2t)
end(*let*)//end-of-(auxmain(out,s2t))
//
in//local
//
#implfun
sort2_fpemsg
( out, s2t0 ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ s2t0 of
|
S2Terrck(lvl, s2t1) =>
(
auxmain( out, s2t1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
println("TREAD12-ERROR:", s2t0))
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(sort2_fpemsg(out,s2t0))
//
endloc(*local*)//end-of(local(sort2_fpemsg))

(* ****** ****** *)

local

fun
auxmain
( out: FILR
, s2e: s2exp): void =
let
#impltmp
g_print$out<>() = out
in//let
case s2e of
//
|S2Eint _ => ()
|S2Ebtf _ => ()
|S2Echr _ => ()
|S2Estr _ => ()
//
|S2Ecst _ => ()
//
|S2Evar _ => ()
//
|S2Eany _ => ()
//
|
S2Etop0(s2e1) =>
s2exp_fpemsg(out, s2e1)
|
S2Etopz(s2e1) =>
s2exp_fpemsg(out, s2e1)
//
| // HX: unresolved list of
S2Ecsts(s2cs) => ()
//
|
S2Eapps
(s2f0, s2es) =>
(
s2exp_fpemsg(out, s2f0);
s2explst_fpemsg(out, s2es))
//
|
S2Elam0
(s2vs, s2e1) =>
(
s2exp_fpemsg(out, s2e1))
//
|
S2Efun1
(f2cl,npf1,s2es,sres) =>
(
s2exp_fpemsg
( out, sres )) where
{
val () =
s2explst_fpemsg(out, s2es)}
//
|
S2Emet0
(s2es, s2e1) =>
(
s2exp_fpemsg
( out, s2e1 )) where
{
val () =
s2explst_fpemsg(out, s2es)}
//
|
S2Eexi0
(s2vs,s2ps,s2e1) =>
(
s2exp_fpemsg
( out, s2e1 )) where
{
val () =
s2explst_fpemsg(out, s2ps)}
|
S2Euni0
(s2vs,s2ps,s2e1) =>
(
s2exp_fpemsg
( out, s2e1 )) where
{
val () =
s2explst_fpemsg(out, s2ps)}
//
|
S2Elist(s2es) =>
(
s2explst_fpemsg(out, s2es))
//
|
S2Etrcd
(tknd,npf1,lses) =>
(
l2s2elst_fpemsg(out, lses))
//
|S2Enone0() => ( (*void*) )
|S2Enone1(s1e1) => ( (*void*) )
|S2Enone1(s2e1) => ( (*void*) )
//
|
S2Eerrck _ => s2exp_fpemsg(out, s2e)
endlet where
{
(*
  val ( ) =
  prerrln("auxmain: s2e = ", s2e)
*)
} (*where*)//end-of-(auxmain(out,s2e))
//
in//local
//
#implfun
s2exp_fpemsg
( out, s2e0 ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ s2e0 of
|
S2Eerrck(lvl, s2e1) =>
(
auxmain( out, s2e1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
println("TREAD12-ERROR:", s2e0)
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(s2exp_fpemsg(out,s2e0))
//
endloc(*local*)//end-of(local(s2exp_fpemsg))

(* ****** ****** *)
//
#implfun
l2s2e_fpemsg
(out, ls2e) =
(
case+ ls2e of
|
S2LAB(lab,s2e1) => s2exp_fpemsg(out,s2e1)
) (*case+*)//end-of-(l2s2e_fpemsg(out,ls2e))
//
(* ****** ****** *)
local

fun
auxmain
( out: FILR
, d2p: d2pat): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2p.node() of
|
D2Perrck(_,_) => d2pat_fpemsg(out, d2p)
//
end (*let*) // end-of-(auxmain(out,d2p))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
#implfun
d2pat_fpemsg
( out, d2p0 ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2p0.node() of
|
D2Perrck(lvl, d2p1) =>
(
auxmain( out, d2p1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
let
val loc0 = d2p0.lctn() in
println
("TREAD12-ERROR:",loc0,":",d2p0)
end
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(d2pat_fpemsg(out,d2p0))
//
endloc(*local*)//end-of(local(d2pat_fpemsg))
//
(* ****** ****** *)
//
#implfun
l2d2p_fpemsg
(out, ld2p) =
(
case+ ld2p of
|
D2LAB(lab,d2p1) => d2pat_fpemsg(out,d2p1)
) (*case+*)//end-of-(l2d2p_fpemsg(out,ld2p))
//
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, d2e: d2exp): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2e.node() of
|
D2Eerrck(_,_) => d2exp_fpemsg(out, d2e)
//
end (*let*) // end-of-(auxmain(out,d2e))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
#implfun
d2exp_fpemsg
( out, d2e0 ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2e0.node() of
|
D2Eerrck(lvl, d2e1) =>
(
auxmain( out, d2e1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
let
val loc0 = d2e0.lctn() in
println
("TREAD12-ERROR:",loc0,":",d2e0)
end
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(d2exp_fpemsg(out,d2e0))
//
endloc(*local*)//end-of(local(d2exp_fpemsg))

(* ****** ****** *)
//
#implfun
l2d2e_fpemsg
(out, ld2e) =
(
case+ ld2e of
|
D2LAB(lab,d2e1) => d2exp_fpemsg(out,d2e1)
) (*case+*)//end-of-(l2d2e_fpemsg(out,ld2e))
//
(* ****** ****** *)
//
#implfun
d2gua_fpemsg
(out, dgua) =
(
case+
dgua.node() of
|
D2GUAexp(d2e1) =>
d2exp_fpemsg(out, d2e1)
|
D2GUAmat(d2e1,d2p2) =>
let
val () = d2exp_fpemsg(out, d2e1)
val () = d2pat_fpemsg(out, d2p2)
endlet // end of [D2GUAmat(_,_,_)]
) (*case*) // end-of(d2gua_fpemsg(out,dgua))
//
(* ****** ****** *)
//
#implfun
d2gpt_fpemsg
(out, dgpt) =
(
case+
dgpt.node() of
|
D2GPTpat(d2p1) =>
d2pat_fpemsg(out, d2p1)
|
D2GPTgua(d2p1,d2gs) =>
let
val () = d2pat_fpemsg(out, d2p1)
val () = d2gualst_fpemsg(out, d2gs)
endlet // end of [ D2GPTgua(_,_,_) ]
) (*case*) // end-of(d2gpt_fpemsg(out,dgpt))
//
(* ****** ****** *)
//
#implfun
d2cls_fpemsg
(out, dcls) =
(
case+
dcls.node() of
|
D2CLSgpt(dgpt) =>
d2gpt_fpemsg(out, dgpt)
|
D2CLScls(dgpt,d2e2) =>
let
val () = d2gpt_fpemsg(out, dgpt)
val () = d2exp_fpemsg(out, d2e2)
endlet // end of [ D2CLScls(_,_,_) ]
) (*case*) // end-of(d2cls_fpemsg(out,dcls))
//
(* ****** ****** *)
//
#implfun
s2res_fpemsg
  (out, sres) =
(
case+ sres of
|
S2RESnone() => ()
|
S2RESsome(seff,s2e1) =>
let
(*
val
seff = s2eff_fpemsg(out, seff)
*)
val
s2e1 = s2exp_fpemsg(out, s2e1)
endlet // end of [S2RESsome(seff,s2e1)]
) (*case+*)//end-of[s2res_fpemsg(out,sres)]
//
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, dcl: d2ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
|
D2Cerrck(_,_) => d2ecl_fpemsg(out, dcl)
//
end (*let*) // end-of-(auxmain(out,dcl))

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
d2ecl_fpemsg
(out, dcl0) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcl0.node() of
|
D2Cerrck(lvl, d2cl)  =>
(
auxmain( out, d2cl );
if
(lvl
>FPEMSG_ERRVL) then () else
let
val loc0 = dcl0.lctn() in
println
("TREAD12-ERROR:",loc0,":",dcl0)
end
)
//
| _(* otherwise *) => (   (*skipped*)   )
end (*let*)//end-of(d2ecl_fpemsg(out,dcl0))
//
endloc(*local*)//end-of(local(d2ecl_fpemsg))

(* ****** ****** *)
(*
HX-2022-12-12: for various list/optn-derivatives
*)
(* ****** ****** *)
//
#implfun
sort2lst_fpemsg
(out, s2ts) =
list_foreach<sort2>(s2ts) where
{
#impltmp
foreach$work<sort2>(s2t1) = sort2_fpemsg(out,s2t1)
}
//
#implfun
sort2opt_fpemsg
(out, topt) =
optn_foreach<sort2>(topt) where
{
#impltmp
foreach$work<sort2>(s2t1) = sort2_fpemsg(out,s2t1)
}
//
(* ****** ****** *)
//
#implfun
s2explst_fpemsg
(out, s2es) =
list_foreach<s2exp>(s2es) where
{
#impltmp
foreach$work<s2exp>(s2e1) = s2exp_fpemsg(out,s2e1)
}
#implfun
s2expopt_fpemsg
(out, sopt) =
optn_foreach<s2exp>(sopt) where
{
#impltmp
foreach$work<s2exp>(s2e1) = s2exp_fpemsg(out,s2e1)
}
//
(* ****** ****** *)
//
#implfun
l2s2elst_fpemsg
(out, lses) =
list_foreach<l2s2e>(lses) where
{
#impltmp
foreach$work<l2s2e>(ls2e) = l2s2e_fpemsg(out,ls2e)
}
//
(* ****** ****** *)
//
#implfun
d2patlst_fpemsg
(out, d2ps) =
list_foreach<d2pat>(d2ps) where
{
#impltmp
foreach$work<d2pat>(d2p1) = d2pat_fpemsg(out,d2p1)
}
//
(* ****** ****** *)
//
#implfun
l2d2plst_fpemsg
(out, ldps) =
list_foreach<l2d2p>(ldps) where
{
#impltmp
foreach$work<l2d2p>(ld2p) = l2d2p_fpemsg(out,ld2p)
}
//
(* ****** ****** *)
//
#implfun
d2explst_fpemsg
(out, d2es) =
list_foreach<d2exp>(d2es) where
{
#impltmp
foreach$work<d2exp>(d2e1) = d2exp_fpemsg(out,d2e1)
}
//
(* ****** ****** *)
//
#implfun
l2d2elst_fpemsg
(out, ldes) =
list_foreach<l2d2e>(ldes) where
{
#impltmp
foreach$work<l2d2e>(ld2e) = l2d2e_fpemsg(out,ld2e)
}
//
(* ****** ****** *)
//
#implfun
f2arglst_fpemsg
(out, f2as) =
list_foreach<f2arg>(f2as) where
{
#impltmp
foreach$work<f2arg>(f2a1) = f2arg_fpemsg(out,f2a1)
}
//
(* ****** ****** *)
//
#implfun
s2qaglst_fpemsg
(out, sqas) =
list_foreach<s2qag>(sqas) where
{
#impltmp
foreach$work<s2qag>(sqa1) = s2qag_fpemsg(out,sqa1)
}
//
(* ****** ****** *)
//
#implfun
t2qaglst_fpemsg
(out, tqas) =
list_foreach<t2qag>(tqas) where
{
#impltmp
foreach$work<t2qag>(tqa1) = t2qag_fpemsg(out,tqa1)
}
//
(* ****** ****** *)
//
#implfun
t2iaglst_fpemsg
(out, tias) =
list_foreach<t2iag>(tias) where
{
#impltmp
foreach$work<t2iag>(tia1) = t2iag_fpemsg(out,tia1)
}
//
(* ****** ****** *)
//
#implfun
d2gualst_fpemsg
(out, d2gs) =
list_foreach<d2gua>(d2gs) where
{
#impltmp
foreach$work<d2gua>(dgua) = d2gua_fpemsg(out,dgua)
}
//
#implfun
d2clslst_fpemsg
(out, d2cs) =
list_foreach<d2cls>(d2cs) where
{
#impltmp
foreach$work<d2cls>(d2cl) = d2cls_fpemsg(out,d2cl)
}
//
(* ****** ****** *)
//
#implfun
d2eclist_fpemsg
(out, dcls) =
list_foreach<d2ecl>(dcls) where
{
#impltmp
foreach$work<d2ecl>(d2cl) = d2ecl_fpemsg(out,d2cl)
}
//
(* ****** ****** *)
//
#implfun
d2arglst_fpemsg
(out, d2as) =
list_foreach<d2arg>(d2as) where
{
#impltmp
foreach$work<d2arg>(d2a1) = d2arg_fpemsg(out,d2a1)
}
//
(* ****** ****** *)
//
#implfun
teqd2exp_fpemsg
  (out, tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() => ()
|
TEQD2EXPsome(teq1, d2e2) =>
let
val d2e2 = d2exp_fpemsg(out, d2e2)
endlet // end of [TEQD2EXPsome(_,_)]
) (*case+*)//end-(teqd2exp_fpemsg(out,tdxp))
//
#implfun
wths2exp_fpemsg
  (out, wsxp) =
(
case+ wsxp of
|
WTHS2EXPnone() => ()
|
WTHS2EXPsome(twth, s2e1) =>
let
val s2e1 = s2exp_fpemsg(out, s2e1)
endlet // end of [WTHS2EXPsome(_,_)]
) (*case+*)//end-(wths2exp_fpemsg(out,wsxp))
//
(* ****** ****** *)
//
#implfun
d2valdcl_fpemsg
(out, dval) =
let
//
val (  ) =
  d2pat_fpemsg(out, dpat)
//
val (  ) =
  teqd2exp_fpemsg(out, tdxp)
//
val (  ) =
  wths2exp_fpemsg(out, wsxp)
//
endlet where
{
  val dpat = d2valdcl_get_dpat(dval)
  val tdxp = d2valdcl_get_tdxp(dval)
  val wsxp = d2valdcl_get_wsxp(dval)
//
} (*where*)//end-of-[d2valdcl_fpemsg(out,dval)]
//
(* ****** ****** *)
//
#implfun
d2vardcl_fpemsg
(out, dvar) =
let
//
val (  ) =
  s2expopt_fpemsg(out, sres)
//
val (  ) =
  teqd2exp_fpemsg(out, dini)
//
endlet where
{
(*
  val dpid = d2vardcl_get_dpid(dvar)
  val vpid = d2vardcl_get_vpid(dvar)
*)
  val sres = d2vardcl_get_sres(dvar)
  val dini = d2vardcl_get_dini(dvar)
//
} (*where*)//end-of-[d2vardcl_fpemsg(out,dval)]
//
(* ****** ****** *)
//
#implfun
d2fundcl_fpemsg
(out, dfun) =
let
//
val (  ) =
  f2arglst_fpemsg(out, fags)
//
val (  ) =
  s2res_fpemsg( out , sres )
//
val (  ) =
  teqd2exp_fpemsg(out, tdxp)
//
val (  ) =
  wths2exp_fpemsg(out, wsxp)
//
endlet where
{
(*
  val dpid = d2fundcl_get_dpid(dfun)
*)
  val fags = d2fundcl_get_farg(dfun)
  val sres = d2fundcl_get_sres(dfun)
  val tdxp = d2fundcl_get_tdxp(dfun)
  val wsxp = d2fundcl_get_wsxp(dfun)
} (*where*)//end-of-[d2fundcl_fpemsg(out,dfun)]
//
(* ****** ****** *)
//
#implfun
d2cstdcl_fpemsg
(out, dcst) =
let
//
val (  ) =
  d2arglst_fpemsg(out, dags)
//
val (  ) =
  s2res_fpemsg( out , sres )
val (  ) = // d2res=teqd2exp
  teqd2exp_fpemsg( out, dres )
//
endlet where
{
(*
  val dpid = d2cstdcl_get_dpid(dcst)
*)
  val dags = d2cstdcl_get_darg(dcst)
  val sres = d2cstdcl_get_sres(dcst)
  val dres = d2cstdcl_get_dres(dcst)
} (*where*)//end-of-[d2cstdcl_fpemsg(out,dcst)]
//
(* ****** ****** *)
//
#implfun
d2vardclist_fpemsg
(out, d2vs) =
list_foreach<d2vardcl>(d2vs) where
{
#impltmp
foreach$work<d2vardcl>(dvar) = d2vardcl_fpemsg(out,dvar)
}
//
(* ****** ****** *)
//
#implfun
d2fundclist_fpemsg
(out, d2fs) =
list_foreach<d2fundcl>(d2fs) where
{
#impltmp
foreach$work<d2fundcl>(dfun) = d2fundcl_fpemsg(out,dfun)
}
//
(* ****** ****** *)
//
#implfun
d2cstdclist_fpemsg
(out, d2cs) =
list_foreach<d2cstdcl>(d2cs) where
{
#impltmp
foreach$work<d2cstdcl>(dcst) = d2cstdcl_fpemsg(out,dcst)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_errmsg.dats] *)
