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
#staload "./../SATS/xats2xc.sats"
//
#staload "./../SATS/xc0emit.sats"
#staload "./../SATS/xc1emit.sats"
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
i1valcc1_lst2
( filr: FILR
, i1vs: i1valist
, envs: i1valist): void =
(
  loop1(0(*i0*), i1vs)
) where
{
//
fun loop1
( i0: sint
, i1vs: i1valist): void =
(
case+ i1vs of
|list_nil() =>
(
  loop2(i0, envs))
|list_cons(i1v1, i1vs) =>
(
  loop1(i0+1, i1vs)) where
{
val () =
(
if // if
(i0 >= 1)
then
strnfpr
(filr, ", "); i1valcc1(filr, i1v1))}
)
//
and loop2
( i0: sint
, envs: i1valist): void =
(
case+ envs of
|list_nil() => ()
|list_cons
(env1, envs) =>
(
  loop2(i0+1, envs)) where
{
val () =
(
if // if
(i0 >= 1)
then
strnfpr
(filr, ", "); i1valcc1(filr, env1))}
)
//
}(*where*)//end-of-[i1valcc1_lst2(...)]
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
strnfpr
(filr,"XATSCAPP(");
d2confpr(filr,dcon);
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
case+
i1f0.node() of
|I1Vfenv
(d2f0, envs) =>
(
strnfpr
(filr,"XATSDAPP(");
d2varcc1(
  filr,d2f0);strnfpr(filr,"(");
i1valcc1_lst2(
  filr,i1vs,envs);strnfpr(filr,"))"))
|
_(*otherwise*) =>
(
strnfpr
(filr,"XATSDAPP(");
i1valcc1(filr,i1f0);strnfpr(filr,"(");
i1valcc1_list(filr,i1vs);strnfpr(filr,"))"))
)
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
i1cmp_xc1emit
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
(ilts
,ityp, ival) =>
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
  i1letlst_xc1emit(ilts, env0)) }//where
)(*where*)//end-of-([I1CMPcons(ilts,ival)])
//
end(*let*)//end-of-[i1cmp_xc1emit(icmp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_xc1emit
(ilet, env0) =
let
//
(* ****** ****** *)
//
val () =
prerrsln
("i1let_xc1emit: ilet = ", ilet)
//
(* ****** ****** *)
//
fun
f0_i1cmpret
( env0:
! envxcc1
, icmp: i1cmp): void =
let
//
val filr =
envxcc1_filr$get(env0)
val nind =
envxcc1_nind$get(env0)
//
in//let
//
let
//
val retq =
(
  i1cmp_retq(icmp))
//
val ival = icmp.ival()
val (  ) =
i1cmp_xc1emit(icmp, env0)
//
in//let
//
if retq then () else
(
nindfpr(filr, nind);
strnfpr(filr, "return ");
i1valcc1(filr, ival);smclnfpr(filr))
//
end//let
//
end(*let*)//end-of-[f0_i1cmpret(...)]
//
and
f0_i1cmprtn
( env0:
! envxcc1
, icmp: i1cmp): void =
let
//
fun
auxlp1
( env0:
! envxcc1
, ilts
: i1letlst): void =
(
case+ ilts of
|list_nil
(  (*0*)  ) => ()
|list_cons
(ilt1, ilts) =>
(
auxlp2(env0, ilts, ilt1))
)
//
and
auxlp2
( env0:
! envxcc1
, ilts
: i1letlst
, ilt1: i1let): void =
(
case+ ilts of
//
|list_nil
(   (*0*)  ) =>
(
case- ilt1 of
|I1LETnew1
(itnm, iins) =>
(
case- iins of
|I1INSdapp
(i1f0, i1vs) =>
auxlp3(env0, i1vs, i1f0))
)
//
|list_cons
(ilt2, ilts) =>
(
auxlp2(env0, ilts, ilt2))
where
{
val () =
(
  i1let_xc1emit(ilt1, env0))
}
)
//
and
auxlp3
( env0:
! envxcc1
, i1vs
: i1valist
, i1f0: i1val): void =
let
//
val i0 = 1
//
val nind =
envxcc1_nind$get(env0)
val filr =
envxcc1_filr$get(env0)
//
val (  ) =
(
  nindfpr(filr, nind))
//
in//let
(
auxlp4(filr, i0, i1vs, i1f0))
end//let
//
and
auxlp4
( filr
: FILR
, i0: sint
, i1vs
: i1valist
, i1f0: i1val): void =
(
case+ i1vs of
//
|list_nil
(  (*0*)  ) =>
(
prints
("continue; // ", i1f0, "\n")
)
//
|list_cons
(i1v1, i1vs) =>
(
prints(
"arg", i0, " = ", i1v1, "; ");
auxlp4(filr, i0+1, i1vs, i1f0))
//
) where
{
//
#impltmp
g_print$out<>() = filr
#impltmp
g_print
<i1val>(i1v) = i1valcc1(filr, i1v)
//
}
//
in//let
  auxlp1(env0, icmp.ilts((*void*)))
end(*let*)//end-of-[f0_i1cmprtn(...)]
//
(* ****** ****** *)
//
(*
HX-2024-06-22:
Note that the temporary [itnm]
is assumed to have been introduced
*)
fun
f0_i1tnmcmp
( env0:
! envxcc1
, itnm: i1tnm
, icmp: i1cmp): void =
let
//
val filr =
envxcc1_filr$get(env0)
val nind =
envxcc1_nind$get(env0)
//
val retq =
(
  i1cmp_retq(icmp))
//
val ival = icmp.ival()
val ilts = icmp.ilts()
//
val () =
i1letlst_xc1emit(ilts, env0)
//
val () =
if retq then () else
let
nindfpr(filr, nind);i1tnmcc1(filr, itnm);
strnfpr(filr, " = ");i1valcc1(filr, ival);endlnfpr(filr)
end//let//end-of-[if(retq)]
//
end//let//end-of-[f0_i1tnmcmp(...)]
//
(* ****** ****** *)
//
in//let
//
case+ ilet of
//
|I1LETnew0
(   iins   ) =>
(
case+ iins of
//
|
I1INSrturn
(ical, icmp) =>
(
if // if
i1cmp_tailq
(icmp, ical) then
f0_i1cmprtn(env0, icmp) else f0_i1cmpret(env0, icmp))
//
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
fun
f1_i1ins
(iins: i1ins): void =
(
nindfpr(filr, nind);
i0typcc0(filr, ityp);endlnfpr(filr);
//
nindfpr(filr, nind);i1tnmcc1(filr, itnm);
strnfpr(filr, " = ");i1inscc1(filr, iins);smclnfpr(filr))
//
in//let
//
case+ iins of
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSdapp _ => f1_i1ins(iins)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSlet0
(dcls, icmp) =>
let
//
val () =
(
nindfpr(filr, nind);
i0typcc0(filr, ityp);strnfpr(filr, "\n");
nindfpr(filr, nind);
i1tnmcc1(filr, itnm);strnfpr(filr, ";\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "{ // let\n"))
//
val () =
envxcc1_incnind(env0,2(*++*))
val () =
(
i1dclist_xc1emit(dcls, env0))
val () =
(
f0_i1tnmcmp(env0, itnm, icmp))
val () =
(
 envxcc1_decnind(env0,2(*--*)))
//
val () = 
(
nindstrnfpr(filr, nind, "} // endlet\n"))
//
end//let//end-of-[I1INSlet0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSift0
(itst
,ithn, iels) =>
let
//
val () =
(
nindfpr(filr, nind);
i0typcc0(filr, ityp);strnfpr(filr, "\n");
nindfpr(filr, nind);
i1tnmcc1(filr, itnm);strnfpr(filr, ";\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "if (");
i1valcc1(filr, itst);strnfpr(filr, ") // ift\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "{\n");
case+ ithn of
|optn_nil() => ()
|optn_cons(icmp) =>
(envxcc1_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envxcc1_decnind(env0,2(*--*))))//then
//
val () =
(
nindstrnfpr
(filr, nind, "} else {\n");
case+ iels of
|optn_nil() => ()
|optn_cons(icmp) =>
(envxcc1_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envxcc1_decnind(env0,2(*--*))))//else
//
val () =
(
nindstrnfpr(filr, nind, "} // end(if)\n"))
//
end//let//end-of-[I1INSift0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
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

(* ****** ****** *)
(* ****** ****** *)
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
}(*where*)//end-of-[i1let_xc1emit(ilet,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjarglst_xc1emit
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
#impltmp
g_print
<i1tnm>(itnm) =
(
  i1tnmcc1(filr, itnm))
//
val () =
case+ ibnd of
|
I1BNDcons
(itnm
,i0p1, dvvs) =>
let
//
val ityp =
i1tnm_ityp$get(itnm)
//
in//let
//
nindfpr
(filr,nind);
i0typcc0(filr, ityp);endlnfpr(filr);
//
nindfpr
(filr,nind);prints
(itnm, " = ", "arg", i0);smclnfpr(filr)
//
end//let
}
)(*case+*)//end-of-[loop3(i0,i1bs,fjas)]
//
}(*where*)//end-of-[fjarglst_xc1emit(fjas,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2xc_srcgen1_DATS_xc1emit_dynexp.dats] *)
(***********************************************************************)
(***********************************************************************)
