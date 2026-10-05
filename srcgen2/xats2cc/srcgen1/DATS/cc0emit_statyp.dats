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
Sat Oct  3 04:28:18 PM EDT 2026
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
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
//
#staload
"./../../../SATS/xsymbol.sats"
//
#staload
"./../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
//
#staload // S2E =
"./../../../SATS/staexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xats2cc.sats"
#staload "./../SATS/cc0emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2var_imprq
(svar: s2var): bool =
(
  sort2_imprq(svar.sort()))
//
fun
i0typ_imprq
(ityp: i0typ): bool =
(
  sort2_imprq(ityp.sort()))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
labelcc0
(filr: FILR
,lab0: label): void =
let
//
#impltmp
g_print$out() = filr
//
in//let
//
case+ lab0 of
|LABint(int) =>
(
  prints("_", int, "_"))
|LABsym(sym) =>
(
  symbl_fprint(sym, filr))
end(*let*)//end-of-[labelcc0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2cstcc0
(filr, scst) = s2cstfpr(filr, scst)
//
(* ****** ****** *)
//
#implfun
s2varcc0
(filr, svar) = s2varfpr(filr, svar)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
sargscc0
(filr
,npos, s2vs) =
(
case+ s2vs of
|
list_nil
( (*0*) ) => npos
|
list_cons
(s2v1, s2vs) =>
if // if
s2var_imprq(s2v1)
then
(
if // if
(npos >= 1)
then // then
strnfpr(filr, ", ");
s2varcc0(filr, s2v1);
sargscc0(filr, npos+1, s2vs))
else sargscc0(filr, npos, s2vs)//end(if)
)(*case+*)//endof[sargscc0(filr,npos,s2vs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trcdfpr
(filr: FILR
,tknd: trcdknd): void =
(
case+ tknd of
//
|TRCDflt0() =>
(
strnfpr(filr, "TRCDflt0"))
|TRCDbox0() =>
(
strnfpr(filr, "TRCDbox0"))
|TRCDbox1() =>
(
strnfpr(filr, "TRCDbox1"))
|TRCDbox2() =>
(
strnfpr(filr, "TRCDbox2"))
//
| _(*else*) =>
(
  trcdknd_fprint(tknd, filr))
//
)(*case+*)//end-of-[trcdfpr(...)]
//
(* ****** ****** *)
//
#implfun
i0typcc0
(filr, ityp) =
(
case+
ityp.node() of
//
(* ****** ****** *)
//
|I0Tcst
(   scst   ) =>
(
s2cstcc0(filr, scst))
//
|I0Tvar
(   svar   ) =>
(
s2varcc0(filr, svar))
//
(* ****** ****** *)
//
|I0Ttop0
(   i0t1   ) =>
(
strnfpr(
filr, "XI0Ttop0(");
i0typcc0
(filr, i0t1);strnfpr(filr, ")"))
//
|I0Ttop1
(   i0t1   ) =>
(
strnfpr(
filr, "XI0Ttop1(");
i0typcc0
(filr, i0t1);strnfpr(filr, ")"))
//
(* ****** ****** *)
//
|I0Tapps
(i0f0, i0ts) =>
(
f1_i0f0(i0f0);
strnfpr(filr, "(");
f1_ityp(ityp);strnfpr(filr, ")")
) where
{
//
fun
f1_i0f0
(i0f0: i0typ): void =
(
case+
i0f0.node() of
|
I0Tapps
(i0f0, i0ts) => f1_i0f0(i0f0)
|
_(*non-apps*) => i0typcc0(filr, i0f0)
)
//
fun
f1_ityp
(ityp: i0typ): void =
let
val
npos = g1_ityp(0, ityp)
end//let//end(f1_ityp(...))
//
and
g1_ityp
(npos: nint
,ityp: i0typ): nint =
(
case+
ityp.node() of
|
I0Tapps
(i0f0, i0ts) =>
(
f0_i0ts(npos, i0ts))
where{
val npos =
(
  g1_ityp(npos, i0f0)) }
|
_(*non-apps*) => (  npos  ))//g1_ityp
//
}(*where*)//end-of-[I0Tapps(i0f0,i0ts)]
//
(* ****** ****** *)
//
|I0Tf2cl
(   f2cl   ) =>
f2clknd_fprint(f2cl, filr)
//
|I0Tfun1
(f2cl, npf1
,i0ts, tres) =>
(
strnfpr
(filr, "XI0Tfun1(");
i0typcc0(filr, f2cl);
strnfpr(filr, ", (");
f0_npf1_i0ts(0(*npos*), npf1, i0ts);
strnfpr(filr, "), ");
i0typcc0(filr, tres);strnfpr(filr, ")")
)
//
(* ****** ****** *)
//
|I0Ttext
(name, i0ts) =>
(
case+
i0ts of
|
list_nil() =>
(
strnfpr(filr, name))
|
list_cons _ =>
let
//
fun
f1_i0ts
(
npos: nint,
i0ts: i0typlst): void =
let
val npos =
  f0_i0ts(npos, i0ts) end
//
in//let
//
strnfpr
(filr, name);strnfpr(filr, "(");
f1_i0ts
(0(*npos*), i0ts);strnfpr(filr, ")")
//
end(*let*)
//
)(*case+*)//endof[I0Ttext(name,i0ts)]
//
(* ****** ****** *)
//
|
I0Ttrcd
(tknd
,npf1, lits) =>
(
trcdfpr(
filr, tknd);
strnfpr
(filr, "(");
strnfpr
(filr, "struct{");
f0_npf1_lits(0(*npos*), npf1, lits);
strnfpr(filr, "}");strnfpr(filr, ")"))
//
(* ****** ****** *)
//
|
_(*otherwise*) => i0typfpr(filr, ityp)
//
(* ****** ****** *)
//
) where // endof-[i0typcc0(filr, ityp)]
{
//
(* ****** ****** *)
//
fun
f0_i0ts
(
npos: nint,
i0ts: i0typlst): nint =
(
case+ i0ts of
|
list_nil
( (*void*) ) => npos
|
list_cons
(i0t1, i0ts) =>
(
if // if
i0typ_imprq(i0t1)
then
(
f0_i0ts(npos+1, i0ts))
where
{
//
val (  ) =
(
if // if
(npos >= 1)
then // then
strnfpr(filr, ", "))
val (  ) =
(
  i0typcc0(filr, i0t1))
}
else f0_i0ts(npos, i0ts)//else
)//end-of-[list_cons(i0t1,i0ts)]
)(*case+*)//end-of-[f0_i0ts(...,i0ts)]
//
(* ****** ****** *)
//
fun
f0_npf1_i0ts
( npos: nint
, npf1: sint
, i0ts: i0typlst): void =
(
case+ i0ts of
|
list_nil() => ()
|
list_cons(i0t1, i0ts) =>
(
if // if
(npf1 >= 1)
then
(
f0_npf1_i0ts
(npos, npf1-1, i0ts))
else
(
f0_npf1_i0ts
(npos+1, npf1, i0ts))
where
{
//
val (  ) =
if (npos >= 1)
then strnfpr(filr, ", ")
//
val (  ) = i0typcc0(filr, i0t1)
}(*where*)
)//end-of-[list_cons(i0t1,i0ts)]
)(*case+*)//end-of-[f0_npf1_i0ts(...)]
//
(* ****** ****** *)
//
fun
f0_npf1_lits
( npos: nint
, npf1: sint
, lits: l0i0tlst): void =
(
case+ lits of
|
list_nil() => ()
|
list_cons(lit1, lits) =>
(
if // if
(npf1 >= 1)
then
(
f0_npf1_lits
(npos, npf1-1, lits))
else
(
f0_npf1_lits
(npos+1, npf1, lits))
where
{
//
val (  ) =
if (npos >= 1)
then strnfpr(filr, ", ")
//
val (  ) = l0i0tcc0(filr, lit1)
}(*where*)
)//end-of-[list_cons(lit1,lits)]
)(*case+*)//end-of-[f0_npf1_lits(...)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i0typcc0( filr, ityp )] 
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
l0i0tcc0
(filr, li0t) =
let
val+
I0LAB
(l0, ityp) = li0t in
i0typcc0
(filr, ityp);
strnfpr(filr, " "); labelcc0(filr, l0) end
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_cc0emit_statyp.dats] *)
(***********************************************************************)
(***********************************************************************)
