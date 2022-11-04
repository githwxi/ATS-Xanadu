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
#symload lctn with s1tdf_get_lctn
#symload node with s1tdf_get_node
(* ****** ****** *)
#symload lctn with d1tst_get_lctn
#symload node with d1tst_get_node
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
D1Csortdef _ => f0_sortdef(env0, d1cl)
//
|
D1Csexpdef _ => f0_sexpdef(env0, d1cl)
//
|
D1Cdatasort _ => f0_datasort(env0, d1cl)
//
|_(*otherwise*) =>
let
val loc0 = d1cl.lctn()
in//let
  d2ecl_make_node(loc0, D2Cnone1( d1cl ))
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
f0_sortdef
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Csortdef
( tknd
, tok1, stdf) = d1cl.node()
//
in//let
//
case+
stdf.node() of
|
S1TDFsort(s1t1) =>
let
val s2t1 =
trans12_sort1(env0, s1t1)
val s2tx = S2TEXsrt(s2t1)
in//let
d2ecl_make_node
( loc0
, D2Csortdef(tid1, s2tx)) where
{
val
tid1 = sortid_sym(tok1)
val () =
tr12env_add0_s2tex(env0, tid1, s2tx) }
end (*let*) // end of [S1TDFsort(s1t1)]
//
|
S1TDFtsub(s1a1, s1es) =>
let
val
(s2v1, sps1) =
trans12_s1arg_tsub
(   env0, s1a1   )
//
val () =
tr12env_pshlam0(env0)
val () =
tr12env_add0_s2var_one
(     env0, s2v1     )
val sps2 =
trans12_s1explst_stck1
(  env0, s1es, s2t0  ) where
{
  val s2t0 = the_sort2_bool }
val () = tr12env_poplam0(env0)
//
val s2ps =
list_append(sps1, sps2)
val s2tx = S2TEXsub(s2v1, s2ps)
in//let
d2ecl_make_node
( loc0
, D2Csortdef(tid1, s2tx)) where
{
val
tid1 = sortid_sym(tok1)
val () =
tr12env_add0_s2tex(env0, tid1, s2tx) }
end (*let*) // end of [S1TDFtsub(s1a1,s1es)]
//
end (*let*) // end of [f0_sortdef(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_sexpdef
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Csexpdef
( tknd
, tok1
, smas
, topt, sdef) = d1cl.node()
//
val () =
prerrln
("f0_sexpdef: smas=", smas)
val () =
prerrln
("f0_sexpdef: sdef=", sdef)
//
val
svss =
trans12_s1maglst(env0, smas)
//
val () =
tr12env_pshlam0(env0)
//
val () =
auxloop(env0, svss) where
{
fun
auxloop
( env0:
! tr12env
, svss: s2varlstlst): void =
(
case+ svss of
|
list_nil() => ()
|
list_cons(s2vs, svss) =>
(
  auxloop(env0, svss)) where
{
val () =
tr12env_add0_s2varlst_one(env0,s2vs)
}
) (*case+*)
} (*where*)//end-of-[auxloop(env0,svss)]
//
val
sdef =
(
case+ topt of
|
optn_nil() =>
trans12_s1exp(env0, sdef)
|
optn_cons(s1t1) =>
let
val s2t1 =
trans12_sort1(env0, s1t1)
in//let
trans12_s1exp_stck(env0, sdef, s2t1)
endlet // end of [optn_cons]
)
//
val () =
prerrln
("f0_sexpdef: sdef=", sdef)
//
val () = tr12env_poplam0(env0)
//
val sdef =
(
auxslam
(sdef, svss)) where
{
fun
auxslam
( sdef
: s2exp
, svss
: s2varlstlst): s2exp =
(
case+ svss of
|
list_nil() => sdef
|
list_cons(s2vs, svss) =>
(
auxslam(sdef, svss)) where
{
val
sdef = s2exp_lam0(s2vs, sdef) }
) (*case+*) // end-of-[auxslam]
} (*where*) // end-of-[val sdef]
//
val () =
prerrln
("f0_sexpdef: sdef=", sdef)
//
val s2c1 =
s2cst_make_idst
(loc0, sid1, s2t2) where
{
  val s2t2 = sdef.sort()
  val sid1 = sexpid_sym(tok1) }
//
in//let
d2ecl_make_node
( loc0
, D2Csexpdef(s2c1, sdef)) where
{ val () =
  tr12env_add0_s2cst_all(env0, s2c1) }
end (*let*) // end of [f0_sexpdef(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_datasort
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cdatasort
( tknd
, d1ts) = d1cl.node()
//
val s2ts = f1_d1ts(d1ts)
//
in//let
d2ecl_make_node
(loc0, D2Cdatasort(d1cl, s2ts))
end where
{
//
fun
f1_d1t0
(d1t0: d1tst): sort2 =
let
//
val
D1TSTnode
(tok1, tcns) = d1t0.node()
//
val tid1 = sortid_sym(tok1)
//
local
val
s2td =
t2dat_make_name(tid1)
in//local
val
s2t1 = S2Tbas(T2Btdat(s2td))
end//local
//
in//let
(
  s2t1 ) where
{
  val () =
  tr12env_add0_s2tex
  (env0, tid1, S2TEXsrt(s2t1)) }
end (*let*) // end of [f1_d1t0(d1t0)]
//
fun
f1_d1ts
(d1ts: d1tstlst): sort2lst =
list_map<x0><y0>(d1ts) where
{
 #typedef x0 = d1tst
 #typedef y0 = sort2
 #impltmp map$fopr<x0><y0> = f1_d1t0 }
//
} (*where*) // end of [f0_datasort(env0,d1cl)]
//
(* ****** ****** *)
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
