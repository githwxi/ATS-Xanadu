(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 26 May 2024 09:29:27 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/js1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i1cmp_get_lctn
#symload ival with i1cmp_get_ival
#symload ilts with i1cmp_get_ilts
(* ****** ****** *)
#symload filr with envx2js_get_filr
#symload nind with envx2js_get_nind
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
 strn_fprint(filr,"\n"))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1intjs1
( filr: FILR
, tint: token): void =
(
case-
tint.node() of
|T_INT01
(  rep  ) => print
("XATSINT1(", rep, ")")
|T_INT02
(bas,rep) => print
("XATSINT2(",bas,",",rep,")")
|T_INT03
(bas
,rep,sfx) => print
("XATSINT3("
,bas, ",", rep, ",", sfx, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i1intjs1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valjs1
( filr: FILR
, ival: i1val): void =
let
//
(*
val () =
prerrln
("i1valjs1: ival = ", ival)
*)
//
in//let
case+
ival.node() of
(* ****** ****** *)
|I1Vtnm(itnm) => i1tnmfpr(filr,itnm)
(* ****** ****** *)
|I1Vcst(dcst) => d2cstfpr(filr,dcst)
(* ****** ****** *)
|I1Vvar(dvar) => d2varfpr(filr,dvar)
(* ****** ****** *)
|I1Vint(tint) => i1intjs1(filr,tint)
(* ****** ****** *)
|
_(*otherwise*) => i1val_fprint(filr,ival)
(* ****** ****** *)
end(*let*) // end-of-[i1valjs1(env0,ival)]
//
(* ****** ****** *)
//
fun
i1valjs1_list
( filr: FILR
, i1vs: i1valist): void =
(
list_iforeach(i1vs)) where
{
#typedef x0 = i1val
#typedef xs = i1valist
#impltmp
iforeach$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");i1valjs1(filr, x0))
}(*where*)//end-of-[i1valjs1_list(...)]
//
(* ****** ****** *)
//
fun
i1insjs1
( filr: FILR
, iins: i1ins): void =
let
//
(*
val () =
prerrln
("i1insjs1: iins = ", iins)
*)
//
in//let
case+ iins of
//
|I1INSdapp
(i1f0, i1vs) =>
(
i1valjs1(filr,i1f0);strnfpr(filr,"(");
i1valjs1_list(filr,i1vs);strnfpr(filr,")")
)
//
(* ****** ****** *)
|
_(*otherwise*) => i1ins_fprint(filr,iins)
(* ****** ****** *)
end(*let*) // end-of-[i1insjs1(env0,iins)]
//
(* ****** ****** *)
//
fun
i1cmpjs1
( filr: FILR
, icmp: i1cmp): void =
let
//
(*
val () =
prerrln
("i1cmpjs1: icmp = ", icmp)
*)
//
in//let
case+ icmp of
(* ****** ****** *)
|
_(*otherwise*) => i1cmp_fprint(filr,icmp)
(* ****** ****** *)
end(*let*) // end-of-[i1cmpjs1(env0,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_fjarg
  (env0, farg) = xats2js_fjarg(env0, farg)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
js1emit_i1ins
  (env0, iins) = xats2js_i1ins(env0, iins)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1cmp
( env0,icmp ) =
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
(filr, "// I1CMP(ival):");
i1valjs1(  filr , ival  )) where
{
val () =
(
  js1emit_i1letlst(env0, ilts)) };
//
strnfpr(filr, " // I1CMP:return\n");
)
//
end(*let*)//end-of-[js1emit_i1cmp(env0,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1let
( env0,ilet ) =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
fun
f0_i1tnmcmp
( env0:
! envx2js
, itnm: i1tnm
, icmp: i1cmp): void =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
val ival = icmp.ival()
val ilts = icmp.ilts()
//
val () =
js1emit_i1letlst(env0, ilts)
//
val () =
let
nindfpr(filr, nind);
i1tnmfpr(filr, itnm);strnfpr(filr, " = ");i1valjs1(filr, ival);fprintln(filr)
end//let
//
end//let//end-of-[f0_i1tnmcmp(...)]
//
in//let
//
case+ ilet of
|I1LETnew0
(   iins   ) =>
(
nindfpr(filr, nind);
i1insjs1(filr, iins);fprintln(filr))
//
|I1LETnew1
(itnm, iins) =>
(
//
case+ iins of
//
(* ****** ****** *)
//
|I1INSlet0
(dcls, icmp) =>
let
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmfpr(filr, itnm);strnfpr(filr, " // let\n")
)
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "{ // let\n"))
//
val () =
envx2js_incnind(env0,2(*++*))
val () =
(
 js1emit_i1dclist(env0,dcls))
val () =
(
 f0_i1tnmcmp(env0,itnm,icmp))
val () =
(
 envx2js_decnind(env0,2(*--*)))
//
val () = 
(
nindfpr(filr, nind);
strnfpr(filr, "} // endlet\n"))
//
end//let//end-of-[I1INSlet0(...)]
//
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
strnfpr(filr, "let ");i1tnmfpr(filr, itnm);strnfpr(filr, " // ift\n"))
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "if (");i1valjs1(filr, itst);strnfpr(filr, ") // ift\n"))
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "{\n");
case+ ithn of
|optn_nil() => ()
|optn_cons(icmp) =>
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*))))//then
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "} else {\n");
case+ iels of
|optn_nil() => ()
|optn_cons(icmp) =>
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*))))//else
//
val () =
( nindfpr(filr, nind);
  strnfpr(filr, "} // endif\n"))//endif
//
end//let//end-of-[I1INSift0(...)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmfpr(filr, itnm);strnfpr(filr, " = ");i1insjs1(filr, iins);fprintln(filr))
//
(* ****** ****** *)
//
)(*end-of-[I1LETnew1(itnm,iins)]*)
//
end(*let*)//end-of-[js1emit_i1let(env0,ilet)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_fjarglst
  (env0, fjas) =
(
  list_js1emit_fnp(env0, fjas, js1emit_fjarg))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1letlst
  (env0, ilts) =
(
  list_js1emit_fnp(env0, ilts, js1emit_i1let))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit_dynexp.dats] *)
(***********************************************************************)
