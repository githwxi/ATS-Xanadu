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
Sat 27 Aug 2022 02:44:07 AM EDT
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
#staload
_(*?*) = "./lexing0_print0.dats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
(*
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
*)
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)

#implfun
d2pat_fprint
(out, d2p0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2p0.node() of
//
|D2Pnil() =>
print("D2Pnil(",")")
|D2Pany() =>
print("D2Pany(",")")
|D2Parg() =>
print("D2Parg(",")")
//
|D2Pvar(d2v) =>
print("D2Pvar(",d2v,")")
//
|D2Pint(tok) =>
print("D2Pint(",tok,")")
|D2Pbtf(tok) =>
print("D2Pbtf(",tok,")")
|D2Pchr(tok) =>
print("D2Pchr(",tok,")")
|D2Pstr(tok) =>
print("D2Pstr(",tok,")")
//
|D2Pi00(int) =>
print("D2Pi00(",int,")")
|D2Pb00(btf) =>
print("D2Pb00(",btf,")")
|D2Pc00(chr) =>
print("D2Pc00(",chr,")")
|D2Ps00(str) =>
print("D2Ps00(",str,")")
//
|D2Pcon1(d2c1) =>
print("D2Pcon1(",d2c1,")")
|D2Pcon2(d2cs) =>
print("D2Pcon2(",d2cs,")")
//
|D2Pbang(d2p1) =>
print("D2Pbang(",d2p1,")")
|D2Pflat(d2p1) =>
print("D2Pflat(",d2p1,")")
|D2Pfree(d2p1) =>
print("D2Pfree(",d2p1,")")
//
|
D2Psym0(d1p1,d2is) =>
print("D2Psym0(",d1p1,";",d2is,")")
//
|
D2Psapp(d2p1,s2vs) =>
print("D2Psapp(",d2p1,";",s2vs,")")
//
|
D2Pnone0() => print("D2Pnone0(",")")
|
D2Pnone1(d1p1) => print("D2Pnone1(",d1p1,")")
//
end (*let*) // end of [d2pat_fprint(out, d2p0)]

(* ****** ****** *)

#implfun
d2gua_fprint
(out, dgua) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dgua.node() of
|
D2GUAexp(d2e1) =>
print("D2GUAexp(",d2e1,")")
|
D2GUAmat(d2e1,d2p2) =>
print("D2GUAmat(",d2e1,";",d2p2,")")
//
end (*let*) // end of [d2gua_fprint(out,dgua)]

(* ****** ****** *)
//
#implfun
d2cls_fprint
(out, dcls) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcls.node() of
|
D2CLSgpt(dgpt) =>
print("D2CLSgpt(",dgpt,")")
|
D2CLScls(d2g1,d2e2) =>
print("D2CLScls(",d2g1,";",d2e2,")")
end (*let*) // end of [d2cls_fprint(out,dcls)]
//
#implfun
d2gpt_fprint
(out, dgpt) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dgpt.node() of
|
D2GPTpat(d2p1) =>
print("D2GPTpat(",d2p1,")")
|
D2GPTgua(d2p1,d2gs) =>
print("D2GPTgua(",d2p1,";",d2gs,")")
end (*let*) // end of [d2gpt_fprint(out,dgpt)]
//
(* ****** ****** *)

#implfun
d2exp_fprint
(out, d2e0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
d2e0.node() of
//
|D2Eint(tok) =>
print("D2Eint(",tok,")")
|D2Ebtf(tok) =>
print("D2Ebtf(",tok,")")
|D2Echr(tok) =>
print("D2Echr(",tok,")")
|D2Estr(tok) =>
print("D2Estr(",tok,")")
//
|D2Ei00(int) =>
print("D2Ei00(",int,")")
|D2Eb00(btf) =>
print("D2Eb00(",btf,")")
|D2Ec00(chr) =>
print("D2Ec00(",chr,")")
|D2Es00(str) =>
print("D2Es00(",str,")")
//
|D2Etop(tok) =>
print("D2Etop(", tok, ")")
//
|D2Evar(d2v) =>
print("D2Evar(", d2v, ")")
//
|D2Econ1(d2c1) =>
print("D2Econ1(", d2c1, ")")
|D2Ecst1(d2c1) =>
print("D2Ecst1(", d2c1, ")")
//
|D2Econ2(d2cs) =>
print("D2Econ2(", d2cs, ")")
|D2Ecst2(d2cs) =>
print("D2Ecst2(", d2cs, ")")
//
|D2Esapp(d2e1,s2es) =>
print("D2Esapp(",d2e1,";",s2es,")")
|D2Etapp(d2e1,s2es) =>
print("D2Etapp(",d2e1,";",s2es,")")
//
|D2Eif0
( d2e1, dthn, dels ) =>
( print("D2Eif0(")
; print(d2e1,";",dthn,";",dels,")"))
//
|
D2Etup1
( tknd, npf1, d2es ) =>
( print("D2Etup1(")
; print(tknd,";",npf1,";",d2es,")"))
|
D2Ercd2
( tknd, npf1, ldes ) =>
( print("D2Ercd2(")
; print(tknd,";",npf1,";",ldes,")"))
//
|
D2Eanno
( d2e1, s1e2, s2e2 ) =>
( print("D2Eanno(")
; print(d2e1,";",s1e2,";",s2e2,")"))
//
|
D2Eexists(s2es,d2e1) =>
print("D2Eexists(",s2es,";",d2e1,")")
//
|
D2Enone0() => print( "D2Enone0(",")" )
|
D2Enone1(d1e1) => print("D2Enone1(",d1e1,")")
//
end (*let*) // end of [d2exp_fprint(out, d2e0)]

(* ****** ****** *)

#implfun
d2ecl_fprint
(out, dcl0) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl0.node() of
//
|D2Cd1ecl(d1cl) =>
print("D2Cd1ecl(",d1cl,")")
//
|D2Cstatic(tknd,dcl1) =>
print("D2Cstatic(",tknd,";",dcl1,")")
|D2Cextern(tknd,dcl1) =>
print("D2Cextern(",tknd,";",dcl1,")")
//
|
D2Cnone0() => print( "D2Cnone0(",")" )
|
D2Cnone1(d1cl) => print("D2Cnone1(",d1cl,")")
//
end (*let*) // end of [d2ecl_fprint(out, dcl0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp2_print0.dats] *)
