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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun 30 Oct 2022 03:56:27 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
//
fun
s2varlst_memberq
( s2vs
: s2varlst
, s2v0: s2var): bool =
let
#typedef x0 = s2var
#typedef xs = s2varlst
in//let
gseq_memberq<xs><x0>(s2vs, s2v0)
end//let//end-of-[s2varlst_memberq]
//
(* ****** ****** *)
//
#implfun
s2exp_revar0
(s2e0, s2v0, s2v1) =
let
var flag: sint = 0
in//let
s2exp_revarx(s2e0, s2v0, s2v1, flag)
end (*let*) // end of [s2exp_revar0(...)]
//
#implfun
l2s2e_revar0
(ls2e, s2v0, s2v1) =
let
var flag: sint = 0
in//let
l2s2e_revarx(ls2e, s2v0, s2v1, flag)
end (*let*) // end of [l2s2e_revar0(...)]
//
(* ****** ****** *)
//
#implfun
s2explst_revar0
(s2es, s2v0, s2v1) =
let
var flag: sint = 0
in//let
s2explst_revarx(s2es, s2v0, s2v1, flag)
end (*let*) // end of [s2explst_revar0(...)]
//
#implfun
l2s2elst_revar0
(lses, s2v0, s2v1) =
let
var flag: sint = 0
in//let
l2s2elst_revarx(lses, s2v0, s2v1, flag)
end (*let*) // end of [l2s2elst_revar0(...)]
//
(* ****** ****** *)

#implfun
s2exp_revarx
( s2e0
, s2v0, s2v1, flag) =
(
f0_main(s2e0, flag)) where
{
//
fun
f0_main
( s2e0: s2exp
, flag: &sint >> _): s2exp =
(
case+
s2e0.node() of
//
|S2Eint _ => s2e0
|S2Ebtf _ => s2e0
|S2Echr _ => s2e0
|S2Estr _ => s2e0
//
|S2Ecst _ => s2e0
//
|S2Evar(svar) =>
(
if ~
(svar=s2v0)
then s2e0 else
(
flag := flag+1;
s2exp_make_node
(s2e0.sort(), S2Evar(s2v1))))
//
|S2Eany _ => s2e0
//
|
S2Etop0(s2e1) =>
let
//
val fval = flag
//
val s2e1 =
f0_main(s2e1, flag)
//
val s2t0 = s2e1.sort()
//
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node(s2t0,S2Etop0(s2e1))
end (*let*) // end of [S2Etop0(...)]
//
|
S2Etop1(s2e1) =>
let
//
val fval = flag
//
val s2e1 =
f0_main(s2e1, flag)
//
val s2t0 = s2e1.sort()
//
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node(s2t0,S2Etop1(s2e1))
end (*let*) // end of [S2Etop1(...)]
//
|
S2Eapps
(s2e1, s2es) =>
let
val fval = flag
val s2e1 =
f0_main(s2e1, flag)
val s2es =
s2explst_revarx
(s2es, s2v0, s2v1, flag)
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node
(s2e0.sort(), S2Eapps(s2e1, s2es))
end (*let*) // end of [S2Eapps(...)]
//
|
S2Elam1
(s2vs, s2e1) =>
let
val fval = flag
val s2e1 =
f0_main(s2e1, flag)
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node
(s2e0.sort(), S2Elam1(s2vs, s2e1))
end (*let*) // end of [S2Elam1(...)]
//
|
S2Efun1
( f2cl, npf1
, s2es, s2e1) =>
let
//
val fval = flag
//
val s2e1 =
f0_main(s2e1, flag)
val s2es =
s2explst_revarx
(s2es, s2v0, s2v1, flag)
//
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node
( s2e0.sort()
, S2Efun1(f2cl, npf1, s2es, s2e1))
end (*let*) // end of [S2Efun1(...)]
//
|
S2Emet0
(s2es, s2e1) =>
let
//
val fval = flag
//
val s2e1 =
f0_main(s2e1, flag)
val s2es =
s2explst_revarx
(s2es, s2v0, s2v1, flag)
//
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node
(s2e0.sort(), S2Emet0(s2es, s2e1))
end (*let*) // end of [S2Emet0(...)]
//
|
S2Eexi0
(s2vs,s2ps,s2e1) =>
(
if
test
then s2e0 else
let
//
val fval = flag
//
(*
Assume s2v1 not in s2vs
*)
//
val s2e1 =
f0_main(s2e1, flag)
val s2ps =
s2explst_revarx
(s2ps, s2v0, s2v1, flag)
//
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node
(s2e0.sort()
,S2Eexi0(s2vs,s2ps,s2e1)) end
) where
{ val test =
  s2varlst_memberq(s2vs, s2v0) }
//(*where*) // end of [S2Eexi0(...)]
//
|
S2Euni0
(s2vs,s2ps,s2e1) =>
(
if
test
then s2e0 else
let
//
val fval = flag
//
(*
Assume s2v1 not in s2vs
*)
//
val s2e1 =
f0_main(s2e1, flag)
val s2ps =
s2explst_revarx
(s2ps, s2v0, s2v1, flag)
//
in//let
if
flag <= fval
then s2e0 else
s2exp_make_node
(s2e0.sort()
,S2Euni0(s2vs,s2ps,s2e1))end
) where
{ val test =
  s2varlst_memberq(s2vs, s2v0) }
//(*where*) // end of [S2Euni0(...)]
//
|
S2Elist(s2es) => let
//
val fval = flag
//
val s2t0 = s2e0.sort()
//
val s2es =
s2explst_revarx
(s2es, s2v0, s2v1, flag)
in//let
s2exp_make_node(s2t0,S2Elist(s2es))
end (*let*) // end of [S2Elist(...)]
//
|
S2Etext
(name, s2es) =>
let
//
val fval = flag
//
val s2es =
s2explst_revarx
(s2es, s2v0, s2v1, flag)
in//let
s2exp_make_node
(s2e0.sort(), S2Etext(name, s2es))
end (*let*) // end of [S2Etext(...)]
//
|
S2Etrcd
(tknd,npf1,lses) =>
let
//
val fval = flag
//
val lses =
l2s2elst_revarx
(lses, s2v0, s2v1, flag)
in//let
s2exp_make_node
(
s2e0.sort(),S2Etrcd(tknd,npf1,lses))
end (*let*) // end of [S2Etrcd(...)]
//
|
S2Eimpr
(loc0, s2e1) =>
let
//
val fval = flag
//
val s2e1 =
f0_main(s2e1, flag)
//
in//let
if // if
flag <= fval
then s2e0 else
s2exp_make_node
(s2e0.sort(), S2Eimpr(loc0, s2e1))
end (*let*) // end of [S2Eimpr(...)]
//
|
S2Eprgm
(loc0, s2e1) =>
let
//
val fval = flag
//
val s2e1 =
f0_main(s2e1, flag)
//
in//let
if // if
flag <= fval
then s2e0 else
s2exp_make_node
(s2e0.sort(), S2Eprgm(loc0, s2e1))
end (*let*) // end of [S2Eprgm(...)]
//
|
S2Ecast
(loc0,s2e1,s2t2) =>
let
//
val fval = flag
//
val s2e1 =
f0_main(s2e1, flag)
//
in//let
if // if
flag <= fval
then s2e0 else
s2exp_make_node
(
s2e0.sort(),S2Ecast(loc0,s2e1,s2t2))
end (*let*) // end of [S2Ecast(...)]
//
|
_(*rest-of-s2exp*) => s2exp_none2(s2e0)
) (*case+*) // end-[ f0_main(s2e0,flag) ]
//
} (*where*) // end of [s2exp_revarx(...)]

(* ****** ****** *)
//
#implfun
l2s2e_revarx
( ls2e
, s2v0, s2v1, flag) =
let
val fval = flag
val+
S2LAB(l0, s2e0) = ls2e
val s2e0 =
s2exp_revarx
(s2e0, s2v0, s2v1, flag)
in//let
if // if
flag <= fval
then ls2e else S2LAB(l0, s2e0)
end (*let*) // end of [l2s2e_revarx(...)]
//
(* ****** ****** *)

#implfun
s2explst_revarx
( s2es
, s2v0, s2v1, flag) =
(
case+ s2es of
|
list_nil() =>
list_nil((*void*))
|
list_cons
(s2e1, ses2) =>
let
//
val fval = flag
//
val s2e1 =
s2exp_revarx
(s2e1, s2v0, s2v1, flag)
val ses2 =
s2explst_revarx
(ses2, s2v0, s2v1, flag)
//
in//let
if // if
flag <= fval
then s2es else list_cons(s2e1, ses2)
end (*let*) // end of [list_cons(...)]
) (*case+*) // end of [s2explst_revarx(...)]

(* ****** ****** *)

#implfun
l2s2elst_revarx
( lses
, s2v0, s2v1, flag) =
(
//
case+ lses of
|
list_nil() =>
list_nil((*void*))
|
list_cons
(lse1, lss2) =>
let
//
val fval = flag
//
val lse1 =
l2s2e_revarx
(lse1, s2v0, s2v1, flag)
val lss2 =
l2s2elst_revarx
(lss2, s2v0, s2v1, flag)
//
in//let
if // if
flag <= fval
then lses else list_cons(lse1, lss2)
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [l2s2elst_revarx(...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_staexp2_utils2.dats] *)
