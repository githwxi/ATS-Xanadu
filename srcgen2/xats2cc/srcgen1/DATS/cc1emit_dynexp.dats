(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sun Aug 16 10:36:26 AM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2cc.sats"
//
#staload "./../SATS/cc0emit.sats"
#staload "./../SATS/cc1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2con_ctag$get
(dcon: d2con): sint =
let
//
val
ctag =
d2con_get_ctag(dcon)
//
val
EXN000 = 1000000(*1M*)
//
in//let
//
if ctag >= 0
then ctag else
let
val loc0 = dcon.lctn()
in//let
EXN000 + 
postn_get_ntot(loc0.pbeg())
end//let
//
end//end-of-[d2con_ctag$get(.)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
strnfpr
(filr:FILR
,strn:strn):void =
(
strn_fprint(strn, filr))//endfun
//
(* ****** ****** *)
//
fun
endlnfpr
(filr: FILR): void =
(
strn_fprint("\n", filr))//endfun
fun
smclnfpr
(filr: FILR): void =
(
strn_fprint(";\n", filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2confpr
(filr: FILR
,dcon: d2con): void =
let
#impltmp
g_print$out<>() = filr
//
val name =
(
  d2con_get_name(dcon))
//
in//let
(
  prints('"', name, '"') )
end(*let*)//end-of-[d2confpr(...)]
//
(* ****** ****** *)
//
fun
d2ctgfpr
(filr: FILR
,dcon: d2con): void =
let
//
val ctag =
d2con_ctag$get(dcon)
//
in//let
(
  print(ctag) ) where
{
#impltmp g_print$out<>() = filr
}
end(*let*)//end-of-[d2ctgfpr(...)]
//
(* ****** ****** *)
//
fun
i0ctgfpr
(filr: FILR
,ipat: i0pat): void =
let
#impltmp
g_print$out<>() = filr
in//let
case+
ipat.node() of
//
|I0Pcon(d2c0) =>
(
prints
("XATSCTAG("
,'"', name, '"', ",", ctag, ")")
) where
{
  val ctag = d2con_ctag$get(d2c0)
  val name = d2con_get_name(d2c0) }
//
|
_(*non-I0Pcon*) => prints('"',ipat,'"')
//
end(*let*)//end-of-[i0ctgfpr(filr,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valcc1_list
( filr: FILR
, i1vs: i1valist): void =
(
list_iforitm(i1vs)) where
{
#typedef x0 = i1val
#typedef xs = i1valist
#impltmp
iforitm$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");i1valcc1(filr, x0))
}(*where*)//end-of-[i1valcc1_list(...)]
//
(* ****** ****** *)
//
fun
l1i1vcc1_list
( filr: FILR
, livs: l1i1vlst): void =
(
list_iforitm(livs)) where
{
#typedef x0 = l1i1v
#typedef xs = l1i1vlst
#impltmp
iforitm$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");l1i1vcc1(filr, x0))
}(*where*)//end-of-[l1i1vcc1_list(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1inscc1
( filr: FILR
, iins: i1ins): void =
let
//
(*
val () =
prerrsln
("i1inscc1: iins = ", iins)
*)
//
in//let
//
case+ iins of
//
(* ****** ****** *)
//
|I1INSdapp
(i1f0, i1vs) =>
(
if
i1val_conq
(  i1f0  )
then//then
let
val-
I1Vcon(dcon) = i1f0.node()
in//let
(
//
strnfpr(
filr,"XATSCAPP(");d2confpr(filr,dcon);
strnfpr(filr,", [");d2ctgfpr(filr,dcon);
//
if // if
list_consq(i1vs) then strnfpr(filr,", ");
//
i1valcc1_list(filr,i1vs);strnfpr(filr,"])"))
end//let
else//else
(
if
i1val_cfnq
(  i1f0  )
then // then
(
strnfpr
(filr,"XATSCAST(");
strnfpr(filr,"\"");
i1valcc1(filr,i1f0);strnfpr(filr,"\"");
strnfpr(filr,", [");
i1valcc1_list(filr,i1vs);strnfpr(filr,"])"))
else // else
(
strnfpr
(filr,"XATSDAPP(");
i1valcc1(filr,i1f0);strnfpr(filr,"(");
i1valcc1_list(filr,i1vs);strnfpr(filr,"))"))
)
)
//
(* ****** ****** *)
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
// HX: this is temporary
val () = i1ins_fprint(iins, filr) end
//
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*)//end-of-[i1inscc1(filr,iins)]
//
(* ****** ****** *)
//
fun
i1cmpcc1
( filr: FILR
, icmp: i1cmp): void =
let
//
(*
val () =
prerrsln
("i1cmpcc1: icmp = ", icmp)
*)
//
in//let
//
case+ icmp of
//
(* ****** ****** *)
|
_(*otherwise*) => i1cmp_fprint(icmp, filr)
(* ****** ****** *)
//
end(*let*)//end-of-[i1cmpcc1(filr,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmp_cc1emit
(icmp, env0) =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
in//let
//
case+ icmp of
|
I1CMPcons
(ilts, ival) =>
(
nindfpr(filr, nind);
strnfpr
(filr,"// I1CMP:start\n");
//
(
nindfpr(filr, nind);
strnfpr
(filr,"// I1CMP:return:");
i1valfpr(filr,ival);endlnfpr(filr))
where
{
//
fun
i1valfpr
( filr: FILR
, ival: i1val): void =
(
case+
ival.node() of
|
I1Vs00 _ =>
strnfpr(
filr, "I1Vs00(...)")
|
I1Vstr _ =>
strnfpr(
filr, "I1Vstr(...)")
|
_(*else*) =>
(
i1val_fprint(ival, filr)))
//
val () =
(
  i1letlst_cc1emit(ilts, env0)) }//where
)(*where*)//end-of-([I1CMPcons(ilts,ival)])
//
end(*let*)//end-of-[i1cmp_cc1emit(icmp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_cc1emit
(ilet, env0) =
let
//
val () =
prerrsln
("i1let_cc1emit: ilet = ", ilet)
//
in//let
//
case+ ilet of
//
|I1LETnew0
(   iins   ) =>
(
case+ iins of
|
_(*otherwise*) =>
(
nindfpr(filr, nind);i1inscc1(filr, iins);smclnfpr(filr))
)
//
|I1LETnew1
(itnm, iins) =>
(
let
//
val ityp =
i1tnm_ityp$get(itnm)
//
in//let
//
case+ iins of
|
_(*otherwise*) =>
(
//
nindfpr(filr, nind);
i0typcc0(filr, ityp);endlnfpr(filr);
//
nindfpr(filr, nind);i1tnmcc1(filr, itnm);
strnfpr(filr, " = ");i1inscc1(filr, iins);smclnfpr(filr))
//
end//let
)
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
val filr = env0.filr()
val nind = env0.nind()
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1let_cc1emit(ilet,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjarglst_cc1emit
  (fjas, env0) =
(
  loop1(1(*i0*), fjas)
) where
{
//
val filr =
(
envxcc1_filr$get(env0))
val nind =
(
envxcc1_nind$get(env0))
//
fnx
loop1
( i0: sint
, fjas: fjarglst): void =
(
case+ fjas of
|
list_nil
( (*void*) ) => ( (*void*) )
|
list_cons
(fja1, fjas) => loop2(i0, fja1, fjas)
)
//
and
loop2
( i0: sint
, fja1: fjarg
, fjas: fjarglst): void =
(
case+
fja1.node() of
|
FJARGdarg(i1bs) => loop3(i0, i1bs, fjas)
)
//
and
loop3
( i0: sint
, i1bs: i1bndlst
, fjas: fjarglst): void =
(
case+ i1bs of
|
list_nil() =>
loop1(i0, fjas)
|
list_cons(ibnd, i1bs) =>
(
  loop3(i0+1, i1bs, fjas)) where
{
//
#impltmp
g_print$out<>() = filr
//
#impltmp g_print
<i1tnm>(itnm) = i1tnmcc1(filr, itnm)
//
val () =
case+ ibnd of
|
I1BNDcons(itnm, i0p1, dvvs) =>
(
nindfpr(filr,nind);
(
prints("let ", itnm, " = ", "arg", i0, "\n")))
}
)
//
}(*where*)//end-of-[fjarglst_cc1emit(fjas,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_cc1emit_dynexp.dats] *)
(***********************************************************************)
(***********************************************************************)
