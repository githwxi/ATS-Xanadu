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
//
(*
Author: Hongwei Xi
(*
Mon 13 Feb 2023 09:27:10 AM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2a.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
//
#implfun
match2a_d2var
(env0, d2v1, t2p2) =
match2a_s2typ
(env0, t2p1, t2p2) where
{
  val t2p1 = d2var_get_styp(d2v1)
(*
  val (  ) =
  prerrln("match2a_d2var: d2v1 = ", d2v1)
  val (  ) =
  prerrln("match2a_d2var: t2p1 = ", t2p1)
  val (  ) =
  prerrln("match2a_d2var: t2p2 = ", t2p2)
*)
} (*where*) // end of [match2a_d2var(env0,...)]
//
(* ****** ****** *)
//
#implfun
match2a_d2con
(env0, d2c1, t2p2) =
match2a_s2typ
(env0, t2p1, t2p2) where
{
//
val
t2p1 = d2con_get_xtyp(d2c1)
//
(*
val (  ) =
prerrln("match2a_d2con: d2c1 = ", d2c1)
val (  ) =
prerrln("match2a_d2con: t2p1 = ", t2p1)
val (  ) =
prerrln("match2a_d2con: t2p2 = ", t2p2)
*)
} (*where*) // end of [match2a_d2con(env0,...)]
//
(* ****** ****** *)

#implfun
match2a_d2ap1
(env0, d2c1, t2p2) =
match2a_s2typ
(env0, t2p1, t2p2) where
{
//
val
t2p1 = // [t2p1] is the result
let
  val
  tfun = d2con_get_xtyp(d2c1)
  val
  tfnd = s2typ_get_node(tfun)
in//let
(
  case- tfnd of
  | T2Pfun1(_,_,_,tres) => tres): s2typ
endlet // end of [ val(t2p1) ]
//
(*
val (  ) =
prerrln("match2a_d2ap1: d2c1 = ", d2c1)
val (  ) =
prerrln("match2a_d2ap1: tfun = ", tfun)
val (  ) =
prerrln("match2a_d2ap1: t2p1 = ", t2p1)
val (  ) =
prerrln("match2a_d2ap1: t2p2 = ", t2p2)
*)
//
} (*where*) // end of [match2a_d2ap1(env0,...)]

(* ****** ****** *)

#implfun
match2a_d2cst
(env0, d2c1, t2p2) =
match2a_s2typ
(env0, t2p1, t2p2) where
{
//
val t2p1 = d2cst_get_xtyp(d2c1)
//
(*
val (  ) =
prerrln("match2a_d2cst: d2c1 = ", d2c1)
val (  ) =
prerrln("match2a_d2cst: t2p1 = ", t2p1)
val (  ) =
prerrln("match2a_d2cst: t2p2 = ", t2p2)
*)
//
} (*where*) // end of [match2a_d2cst(env0,...)]

(* ****** ****** *)

#implfun
match2a_d2itm
(env0, d2i1, t2p2) =
(
case+ d2i1 of
//
|D2ITMvar _ =>
f0_d2var(env0, d2i1, t2p2)
//
|D2ITMcon _ =>
f0_d2con(env0, d2i1, t2p2)
|D2ITMcst _ =>
f0_d2cst(env0, d2i1, t2p2)
//
(*
|D2ITMsym _ =>
f0_d2sym(env0, d2i1, t2p2)
*)
//
) (*case+*) where
{
//
(* ****** ****** *)
//
fun
f0_d2var
( env0:
! tr2aenv
, d2i1: d2itm
, t2p2: s2typ): d2itmopt =
let
val-
D2ITMvar(d2v1) = d2i1
in//let
if
match2a_d2var
(env0, d2v1, t2p2)
then optn_cons(d2i1) else optn_nil()
end (*let*) // end of [f0_d2var(env0,d2i1,t2p2)]
//
(* ****** ****** *)
//
fun
f0_d2con
( env0:
! tr2aenv
, d2i1: d2itm
, t2p2: s2typ): d2itmopt =
let
val-
D2ITMcon(d2cs) = d2i1
val d2cs =
f1_d2conlst(env0, d2cs, t2p2)
in//let
case+ d2cs of
|
list_nil _ => optn_nil()
|
list_cons _ =>
let
val d2i1 =
D2ITMcon(d2cs) in optn_cons(d2i1) end
end where
{
//
fun
f1_d2conlst
( env0:
! tr2aenv
, d2cs:d2conlst, t2p0:s2typ): d2conlst =
(
case+ d2cs of
|
list_nil() =>
list_nil()
|
list_cons(d2c1, d2cs) => 
let
val d2cs =
f1_d2conlst(env0, d2cs, t2p0)
in
if
match2a_d2con
(env0, d2c1, t2p2)
then list_cons(d2c1, d2cs) else d2cs end
)
//
} (*where*) // end of [f0_d2con(env0,d2i1,t2p2)]
//
(* ****** ****** *)
//
fun
f0_d2cst
( env0:
! tr2aenv
, d2i1: d2itm
, t2p2: s2typ): d2itmopt =
let
val-
D2ITMcst(d2cs) = d2i1
val d2cs =
f1_d2cstlst(env0, d2cs, t2p2)
in//let
case+ d2cs of
|
list_nil _ => optn_nil()
|
list_cons _ =>
let
val d2i1 =
D2ITMcst(d2cs) in optn_cons(d2i1) end
end where
{
//
fun
f1_d2cstlst
( env0:
! tr2aenv
, d2cs:d2cstlst, t2p0:s2typ): d2cstlst =
(
case+ d2cs of
|
list_nil() =>
list_nil()
|
list_cons(d2c1, d2cs) => 
let
val d2cs =
f1_d2cstlst(env0, d2cs, t2p0)
in
if
match2a_d2cst
(env0, d2c1, t2p2)
then list_cons(d2c1, d2cs) else d2cs end
)
//
} (*where*) // end of [f0_d2cst(env0,d2i1,t2p2)]
//
(* ****** ****** *)
//
} (*where+*) // end of [match2a_d2itm(env0,...)]

(* ****** ****** *)

#implfun
match2a_d2ptm
(env0, dptm, t2p2) =
(
case+ dptm of
|
D2PTMnone(dqid) => optn_nil()
|
D2PTMsome(pval, ditm) =>
let
val
dopt =
match2a_d2itm(env0, ditm, t2p2)
in//let
case+ dopt of
| optn_nil() =>
  optn_nil(*void*)
| optn_cons(ditm) =>
  optn_cons(D2PTMsome(pval, ditm))
end (*let*) // end of [D2PTMsome(...)]
) (*case+*) // end of [match2a_d2ptm(env0,...)]

(* ****** ****** *)

#implfun
match2a_d2conlst
(env0, d2cs, tfun) =
(
case+ d2cs of
|
list_nil() =>
list_nil(*void*)
|
list_cons(d2c1, d2cs) =>
let
val dopt =
match2a_d2con(env0, d2c1, tfun)
in//let
if
dopt // true or false
then
list_cons
(
d2c1,
match2a_d2conlst(env0, d2cs, tfun))
else
(
match2a_d2conlst(env0, d2cs, tfun))
end (*let*) // end of [list_cons(d2c1,d2cs)]
) (*case+*) // end of [match2a_d2conlst(env0,...)]

(* ****** ****** *)

#implfun
match2a_d2ap1lst
(env0, d2cs, tres) =
(
case+ d2cs of
|
list_nil() =>
list_nil(*void*)
|
list_cons(d2c1, d2cs) =>
let
val dopt =
match2a_d2ap1(env0, d2c1, tres)
in//let
if
dopt // true or false
then
list_cons
(
d2c1,
match2a_d2ap1lst(env0, d2cs, tres))
else
(
match2a_d2ap1lst(env0, d2cs, tres))
end (*let*) // end of [list_cons(d2c1,d2cs)]
) (*case+*) // end of [match2a_d2ap1lst(env0,...)]

(* ****** ****** *)

#implfun
match2a_d2ptmlst
(env0, dpis, t2p0) =
(
case+ dpis of
|
list_nil() =>
list_nil(*void*)
|
list_cons(dpi1, dpis) =>
let
val dopt =
match2a_d2ptm(env0, dpi1, t2p0)
in//let
case+ dopt of
|
optn_nil() =>
match2a_d2ptmlst(env0, dpis, t2p0)
|
optn_cons(dpi1) =>
list_cons
(dpi1, match2a_d2ptmlst(env0, dpis, t2p0)) end
) (*case+*) // end of [match2a_d2ptmlst(env0,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trsym2a_utils0.dats] *)
