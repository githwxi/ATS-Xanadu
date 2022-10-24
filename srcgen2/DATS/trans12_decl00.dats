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
Sun 11 Sep 2022 03:17:27 PM EDT
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
_(*TRANS12*) = "./trans12.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
(* ****** ****** *)

#implfun
trans12_d1ecl
( env0,d1cl ) = let
//
(*
val
loc0 = d1cl.lctn()
val () =
prerrln
("trans12_d1ecl: d1cl = ", d1cl)
*)
//
in//let
//
case+
d1cl.node() of
//
|D1Cd0ecl _ =>
let
val loc0 = d1cl.lctn()
in//let
d2ecl(loc0, D2Cd1ecl(d1cl))
end (*let*) // end of [D1Cd0ecl]
//
|
D1Cstatic
(tknd, dcl1) =>
let
val loc0 = d1cl.lctn()
val dcl1 =
trans12_d1ecl(env0, dcl1)
in//let
d2ecl(loc0, D2Cstatic(tknd, dcl1))
end (*let*) // end of [D1Cstatic]
|
D1Cextern
(tknd, dcl1) =>
let
val loc0 = d1cl.lctn()
val dcl1 =
trans12_d1ecl(env0, dcl1)
in//let
d2ecl(loc0, D2Cextern(tknd, dcl1))
end (*let*) // end of [D1Cextern]
//
|
D1Clocal0 _ => f0_local0(env0, d1cl)
//
|
D1Cabssort _ => f0_abssort(env0, d1cl)
|
D1Cstacst0 _ => f0_stacst0(env0, d1cl)
//
|
D1Csexpdef _ => f0_sexpdef(env0, d1cl)
//
|_(*otherwise*) =>
let
val loc0 = d1cl.lctn()
in//let
  d2ecl_make_node(loc0, D2Cnone1(d1cl))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where
{
//
(* ****** ****** *)
fun
f0_local0
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Clocal0
(head, body) = d1cl.node()
//
val (  ) =
tr12env_pshloc1(env0)
val head =
trans12_d1eclist(env0, head)
val (  ) =
tr12env_pshloc2(env0)
val body =
trans12_d1eclist(env0, body)
//
val (  ) = tr12env_locjoin(env0)
//
in//let
d2ecl(loc0, D2Clocal0(head, body))
end (*let*) // end of [f0_local0(env0,d1cl)]
(* ****** ****** *)
//
fun
f0_abssort
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cabssort
(tknd, tok1) = d1cl.node()
//
in//let
//
let
val tid1 =
  sortid_sym(tok1)
val tabs =
  t2abs_make_name(tid1)
val s2tx =
  S2TEXsrt(S2Tbas(T2Btabs(tabs)))
//
in
d2ecl_make_node
(loc0, D2Cabssort(tid1)) where
{
val () =
tr12env_add0_s2tex(env0, tid1, s2tx) }
end (*let*)
//
end (*let*) // end of [f0_abssort(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_stacst0
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cstacst0
( tknd
, tok1
, tmas, tres) = d1cl.node()
//
fun
auxtfun
( tres
: sort2
, stss
: sort2lstlst): sort2 =
(
case+ stss of
|
list_nil() => tres
|
list_cons(s2ts, stss) =>
(
auxtfun(tres, stss)) where
{
val tres = S2Tf1un(s2ts, tres)
}
)
//
in//let
//
let
//
val
sid1 = sexpid_sym(tok1)
val
stss =
trans12_t1maglst(env0, tmas)
//
val s2t2 =
(
  auxtfun(tres, stss)
) where
{ val
  tres =
  trans12_sort1(env0, tres) }
//
val s2c1 =
s2cst_make_idst(loc0, sid1, s2t2)
//
in
//
d2ecl_make_node
( loc0
, D2Cstacst0(s2c1, s2t2)) where
{ val () =
  tr12env_add0_s2cst_all(env0, s2c1) }
//
end (*let*)
//
end (*let*) // end of [f0_stacst0(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_stacst0
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
val
loc0 = d1cl.lctn()
val-
D1Csexpdef
( tknd
, tok1
, smas
, topt, sdef) = d1cl.node()
//
val
svss =
trans12_s1maglst(env0, smas)
//
val
s2e1 =
(
case+ topt of
|
optn_nil() =>
trans12_s1exp(env0, s1e1)
|
optn_cons(s1t1) =>
let
val s2t1 =
trans12_sort1(env0, s1t1)
in//let
trans12_s1exp_sort(env0, sdef, s2t1)
endlet // end of [optn_cons]
)
//
val sdef = auxslam(sdef, svss)
//
in//let
d2ecl_make_node
( loc0
, D2Csexpdef(s2c1, sdef)) where
{ val () =
  tr12env_add0_s2cst_all(env0, s2c1) }
end (*let*) // end of [f0_sexpdef(env0,d1cl)]
//
} (*where*) // end of [trans12_d1ecl(env0,d1cl)]

(* ****** ****** *)

#implfun
trans12_d1eclist
  (env0, dcls) =
list_trans12_fnp(env0, dcls, trans12_d1ecl)

(* ****** ****** *)
//
#implfun
trans12_d1eclistopt
  (  env0,dopt  ) =
optn_trans12_fnp(env0, dopt, trans12_d1eclist)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_decl00.dats] *)
