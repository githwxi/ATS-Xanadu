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
(*
// HX-2025-04-23:
// For if-guarded declarations!
*)
(* ****** ****** *)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Wed Apr 23 01:09:27 PM EDT 2025
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
SYM = "./../SATS/xsymbol.sats"
//
#staload
LOC = "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xbasics.sats"
//
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/trans01.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-04-19:
This one is for handling if-guarded declarations!
*)
implement
trans01_declist
  (  dcls  ) =
(
//
let
//
val
dres =
list_vt_nil() in//let
//
list_vt2t
(
list_vt_reverse
(
f0_declist(dcls, dres)))
end//end-of-[let]
//
) where // end-of-[let]
{
//
(* ****** ****** *)

overload
d1ecl with d1ecl_make_node

(* ****** ****** *)
//
vtypedef
d1eclist_vt = List0_vt(d1ecl)
//
fun
d1cls_vt2t_reverse
( dcls
: d1eclist_vt): d1eclist =
list_vt2t
(list_vt_reverse<d1ecl>(dcls))
//
(* ****** ****** *)
//
fun
f1_then0
( dcl0: d0ecl
, dcls: d0eclist)
: (d1eclopt, d0eclist) =
(
case+ dcls of
|
list_nil
((*void*)) => (None, dcls)
|
list_cons
(dcl1, d2ls) =>
(
case+
dcl1.node() of
//
|
_(*non-D0Cthen0*) =>
let
val dres = list_vt_nil()
val (dres, dcls) = f1_declist(dcls, dres)
in//let
(
  opt1, dcls) where
{
val loc1 = dcl0.loc((*0*))
val opt1 = Some(d1ecl(loc1, D1Cthen0(dres)))
}
end//let//end-of-[non-D0Cthen0()]
//
)(*case+*)//end-of(list_cons(...))
//
)(*case+*)//end-of-[f1_then0(...)]
//
and
f1_else1
( dcl0: d0ecl
, dcls: d0eclist)
: (d1eclopt, d0eclist) =
(
case+ dcls of
|
list_nil
((*void*)) => (None, dcls)
//
|
list_cons
(dcl1, d2ls) =>
(
case+
dcl1.node() of
//
|
D0Celse1 _ => 
let
//
val dres = list_vt_nil()
val (dres, dcls) = f1_declist(d2ls, dres)
//
in//let
(
  opt1, dcls) where
{
val loc1 = dcl1.loc((*0*))
val opt1 = Some(d1ecl(loc1, D1Celse1(dres)))
}
end//let//end-of-[D0Celse1(...)]
//
|
D0Celsif
( tknd
, gexp, topt) =>
let
//
val (dthn, dcls) = f1_then0(dcl1, d2ls)
val (dels, dcls) = f1_else1(dcl1, dcls)
(*
val (dend, dcls) = f1_endif(dcl1, dcls)
*)
val dend = None(*void*)
//
in//let
//
(
  opt1, dcls) where
{
val loc1 = dcl1.loc((*0*))
val gexp = trans01_gexp(gexp)
val opt1 = Some
(
d1ecl(loc1, D1Celsif(gexp, dthn, dels, dend)))
}
//
end//let//end-of-[D0Celsif(...)]
//
|
_(*non-D0Celse1/D0Celsif*) =>
let
  val dels =
  None(*0*) in (dels, dcls) end
//
)(*case+*)//end-of(list_cons(...))
//
)(*case+*)//end-of-[f1_else1(...)]
//
and
f1_endif
( dcl0: d0ecl
, dcls: d0eclist)
: (d1eclopt, d0eclist) =
(
case+ dcls of
|
list_nil
((*void*)) => (None, dcls)
//
|
list_cons
(dcl1, d2ls) =>
(
case+
dcl1.node() of
//
|
D0Cendif(tend) => 
(
  opt1, d2ls) where
{
val loc1 = dcl1.loc((*0*))
val opt1 = Some(d1ecl(loc1, D1Cendif(tend)))
}
//
|
_(*non-D0Celse1*) =>
let
  val dels =
  None(*0*) in (dels, dcls) end
//
)(*case+*)//end-of(list_cons(...))
//
)(*case+*)//end-of-[f1_endif(...)]
//
and
f1_decl
( dcl0: d0ecl
, dcls: d0eclist)
: (d1ecl, d0eclist) =
(
//
case+
dcl0.node() of
|
D0Cifdec
( tknd
, gexp, topt) =>
let
//
val (dthn, dcls) = f1_then0(dcl0, dcls)
val (dels, dcls) = f1_else1(dcl0, dcls)
val (dend, dcls) = f1_endif(dcl0, dcls)
//
in//let
//
(
  dcl0, dcls) where
{
val loc0 = dcl0.loc((*0*))
val gexp = trans01_gexp(gexp)
//
val gexp =
(
case-
tknd.node() of
|
T_SRP_IFDEC(knd0) =>
if
knd0 = 0
then gexp else
let
val
gid0 = // HX: defined?
$SYM.symbol_make("defq")
val
gfun =
g1exp_make_node(loc0, G1Eid0(gid0))
in//let
g1exp_make_node(loc0, G1Eapp1(gfun, gexp))
end//let
)
//
val dcl0 =
(
d1ecl(loc0, D1Cifexp(gexp, dthn, dels, dend)))
}
//
end//let//end-of-[D0Cifdec(...)]
|
_(*non-D0Cifdec*) =>
(
  dcl0, dcls) where
{
  val dcl0 = trans01_decl(dcl0) }
//
)(*case+*)//end-of-[f1_decl(d0cl)]
//
and
f1_declist
( dcls: d0eclist
, dres: d1eclist_vt)
: (d1eclist, d0eclist) =
(
case+ dcls of
//
|list_nil
((*void*)) =>
(dres, dcls) where{
val
dres = d1cls_vt2t_reverse(dres) }
//
|list_cons
(dcl1, d2ls) =>
(
case+ 
dcl1.node() of
//
|D0Celse1 _ =>
(dres, dcls) where{
val
dres = d1cls_vt2t_reverse(dres) }
|D0Celsif _ =>
(dres, dcls) where{
val
dres = d1cls_vt2t_reverse(dres) }
|D0Cendif _ =>
(dres, dcls) where{
val
dres = d1cls_vt2t_reverse(dres) }
//
| _(*otherwise*) =>
(
f1_declist(dcls, dres)
) where
{
val
( dcl1
, dcls ) = f1_decl(dcl1, d2ls)
val dres = list_vt_cons(dcl1, dres) }
)(*case+*)//end-of-[list_cons(...)]
)(*case+*)//end-of-[f1_declist(dcls)]
//
fun
f0_declist
( dcls
: d0eclist
, dres
: d1eclist_vt): d1eclist_vt =
(
case+ dcls of
//
|list_nil
((*void*)) => dres
//
|list_cons
(dcl1, d2ls) =>
(
case+
dcl1.node() of
//
| D0Cifdec _ =>
let
val
( dcl1
, dcls ) =
(
  f1_decl(dcl1, d2ls))
in//let
(
  f0_declist(dcls, dres)
) where
{
val dres =
(
  list_vt_cons(dcl1, dres)) }
end(*let*)//end-of-[D0Cifdec(...)]
//
| _(*non-D0Cifdec*) =>
(
  f0_declist(d2ls, dres)
) where
{
val dcl1 = trans01_decl(dcl1)
val dres = list_vt_cons(dcl1, dres)
}(*where*)//end-of-[non-D0Cifdec(...)]
//
)(*case+*)//end-of-[list_cons(...)]
//
)(*case+*)//end-of-[f0_declist(dcls)]
//
}(*where*)//end-of-[trans01_declist(dcls)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [xats_trans01_dynutl.dats] *)
