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
Wed Dec 27 18:02:19 EST 2023
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
_(*TRANS34*) = "./trans34.dats"
(* ****** ****** *)
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload styp with d2var_get_styp
#symload styp with d2var_set_styp
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload styp with d3pat_get_styp
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload styp with d3exp_get_styp
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3pat
  (env0, d3p0) =
let
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
//
(*
val (  ) = prerrln
("trans34_d3pat: loc0 = ", loc0)
val (  ) = prerrln
("trans34_d3pat: d3p0 = ", d3p0)
val (  ) = prerrln
("trans34_d3pat: t2p0 = ", t2p0)
*)
//
in//let
//
case+
d3p0.node() of
//
|D3Pany _ =>
(
  f0_any(env0, d3p0))
|D3Pvar _ =>
(
  f0_var(env0, d3p0))
//
|D3Pint(tok) =>
(
d4pat_make_tpnd
(loc0, t2p0, D4Pint(tok)))
|D3Pbtf(sym) =>
(
d4pat_make_tpnd
(loc0, t2p0, D4Pbtf(sym)))
|D3Pchr(tok) =>
(
d4pat_make_tpnd
(loc0, t2p0, D4Pchr(tok)))
//
(* ****** ****** *)
//
|D3Pcon _ => f0_con(env0, d3p0)
//
(* ****** ****** *)
//
|D3Pannot _ => f0_annot(env0, d3p0)
//
(* ****** ****** *)
//
| _(*otherwise*) =>
let
  val loc0 = d3p0.lctn((*void*))
in//let
(
  d4pat(loc0, t2p0, D4Pnone1(d3p0)) )
end(*let*)//end of [_(*otherwise*)] // temp
//
end where // end-of-[trans34_d3pat( ... )]
{
//
(* ****** ****** *)
//
fun
f0_any
( env0:
! tr34env
, d3p0: d3pat): d4pat =
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pany())) where
{
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
val-
D3Pany((*0*)) = d3p0.node()
//
}(*where*)//end-of-[f0_any(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr34env
, d3p0: d3pat): d4pat =
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pvar(d2v1))) where
{
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
val-D3Pvar(d2v1) = d3p0.node()
//
}(*where*)//end-of-[f0_var(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr34env
, d3p0: d3pat): d4pat =
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pcon(d2c1))) where
{
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
val-D3Pcon(d2c1) = d3p0.node()
//
}(*where*)//end-of-[f0_var(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr34env
, d3p0: d3pat): d4pat =
let
//
val loc0 = d3p0.lctn()
//
val-
D3Pannot
( d3p1
, s1e2, s2e2) = d3p0.node()
//
(*
val
t2p2 = s2exp_stpize(s2e2)
val
t2p2 = s2typ_hnfiz0(t2p2)
*)
val
t2p2 = d3p0.styp((*void*))
//
// (*
val () =
prerrln
("f0_annot(34): t2p2 = ", t2p2)
// *)
//
val d4p1 =
(
case+
d3p1.node() of
|
D3Pvar(d2v1) =>
(
(*
HX: No update!!!
*)
// d2v1.styp(t2p2);
d4pat
( loc1
, t2p2, D4Pvar(d2v1))) where
{
  val loc1 = d3p1.lctn((*0*)) }
|
_(*non-D3Pvar*) =>
trans34_d3pat_tpck(env0, d3p1, t2p2)
) : d4pat // end of [val(d4p1)]
//
in//let
d4pat_make_tpnd
(loc0, t2p2, D4Pannot(d4p1,s1e2,s2e2))
end (*let*) // end of [f0_annot(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end of [trans34_d3pat(env0,d3p0)]
//
(* ****** ****** *)
//
#implfun
trans34_l3d3p
( env0,ld3p ) =
let
//
val+
D3LAB(lab0, d3p1) = ld3p
//
in//let
(
  D4LAB(lab0, trans34_d3pat(env0, d3p1)) )
end(*let*)//end-of-[trans33_l3d3p(env0,ld3p)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3exp
  (env0, d3e0) =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
(*
val (  ) = prerrln
("trans34_d3exp: loc0 = ", loc0)
val (  ) = prerrln
("trans34_d3exp: d3e0 = ", d3e0)
val (  ) = prerrln
("trans34_d3exp: t2p0 = ", t2p0)
*)
//
in//let
//
case+
d3e0.node() of
//
|D3Evar _ =>
(
  f0_var(env0, d3e0))
//
(* ****** ****** *)
//
|D3Eint(tok) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Eint(tok)))
|D3Ebtf(sym) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Ebtf(sym)))
|D3Echr(tok) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Echr(tok)))
//
(* ****** ****** *)
//
|D3Edapp _ => f0_dapp(env0, d3e0)
//
(* ****** ****** *)
//
| _(*otherwise*) =>
let
  val loc0 = d3e0.lctn((*0*))
in//let
(
  d4exp(loc0, t2p0, D4Enone1(d3e0)) )
end(*let*)//end of [_(*otherwise*)] // temp
//
end where // end-of-[trans34_d3exp( ... )]
{
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Evar(d2v1) = d3e0.node()
//
in//let
if
d2var_mutq(d2v1)
then
(
  f1_mutq(env0, d2v1))
else
if
d2var_linq(d2v1)
then
(
  f1_linq(env0, d2v1))
else let
val
t2p1 = d2v1.styp((*0*))
in//let
  d4exp_make_tpnd
  (loc0, t2p1, D4Evar(d2v1)) end
end where
{
//
fun
f1_mutq
( env0:
! tr34env
, d2v1
: d2var ) : d4exp = f0_var(env0, d3e0)
//
fun
f1_linq
( env0:
! tr34env
, d2v1
: d2var ) : d4exp = f0_var(env0, d3e0)
//
}(*where*) // end of [f0_var(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val
d4f0 =
(
  trans34_d3exp(env0, d3f0))
//
val d4es =
trans34_d3explst(env0, d3es)
//
val tfun = d4f0.styp((*nil*))
//
val targ =
(
case+
tfun.node() of
| T2Pfun1
( f2cl, npf1
, t2ps, tres) => t2ps
|_ (*else*) => list_nil()): s2typlst
val tres =
(
case+
tfun.node() of
| T2Pfun1
( f2cl
, npf1, t2ps, tres) => tres
| _(* non-T2Pfun1 *) => tfun): s2typ
//
// (*
val () =
prerrln
("trans34_d3exp:f0_dapp:tfun = ",tfun)
val () =
prerrln
("trans34_d3exp:f0_dapp:targ = ",targ)
val () =
prerrln
("trans34_d3exp:f0_dapp:tres = ",tres)
// *)
//
in//let
let
val d4es =
trans34_d4explst_tpcks
(env0, loc0, d4es, targ)
in
  d4exp_make_tpnd
  (loc0, tres, D4Edapp(d4f0,npf1,d4es))
end (*let*)
end (*let*) // end of [f0_dapp(env0,d3e0)]
//
(* ****** ****** *)
//
}(*where*)//end of [trans34_d3exp(env0,d3e0)]
//
(* ****** ****** *)
//
#implfun
trans34_l3d3e
( env0,ld3e ) =
let
//
val+
D3LAB(lab0, d3e1) = ld3e
//
in//let
(
  D4LAB(lab0, trans34_d3exp(env0, d3e1)) )
end(*let*)//end-of-[trans33_l3d3e(env0,ld3e)]
//
(* ****** ****** *)
//
#implfun
trans34_f3arg
( env0, farg ) =
let
//
val loc0 = farg.lctn()
//
(*
val () =
prerrln
("trans34_f3arg: loc0 = ", loc0)
val () =
prerrln
("trans34_f3arg: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
//
|
F3ARGdapp(npf1, d3ps) =>
let
val loc0 = farg.lctn()
val d4ps =
trans34_d3patlst(env0, d3ps)
in//let
f4arg(loc0,F4ARGdapp(npf1,d4ps))
end (*let*) // end of [F3ARGdapp]
//
|
F3ARGsapp
(s2vs, s2ps) =>
(
  f4arg(loc0,F4ARGsapp(s2vs,s2ps)))
|
F3ARGmets
(   s2es   ) => f4arg(loc0,F4ARGmets(s2es))
//
end(*let*)//end-of-[trans34_f3arg(env0,farg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3patlst
  (env0, d3ps) =
(
  list_trans34_fnp(env0, d3ps, trans34_d3pat))
//
(* ****** ****** *)
//
#implfun
trans34_l3d3plst
  (env0, ldps) =
(
  list_trans34_fnp(env0, ldps, trans34_l3d3p))
//
(* ****** ****** *)
//
#implfun
trans34_d3explst
  (env0, d3es) =
(
  list_trans34_fnp(env0, d3es, trans34_d3exp))
//
#implfun
trans34_d3expopt
  (env0, dopt) =
(
  optn_trans34_fnp(env0, dopt, trans34_d3exp))
//
(* ****** ****** *)
//
#implfun
trans34_l3d3elst
  (env0, ldes) =
(
  list_trans34_fnp(env0, ldes, trans34_l3d3e))
//
(* ****** ****** *)
//
#implfun
trans34_f3arglst
  (env0, f3as) =
(
  list_trans34_fnp(env0, f3as, trans34_f3arg))
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
trans34_d3pat_tpck
(env0, d3p0, t2p0) =
let
val
d4p0 = trans34_d3pat(env0, d3p0)
in
trans34_d4pat_tpck(env0,d4p0,t2p0)
end(*let*) // end-of-[trans34_d2pat_tpck(...)]

(* ****** ****** *)

#implfun
trans34_d3exp_tpck
(env0, d3e0, t2p0) =
let
val
d4e0 = trans34_d3exp(env0, d3e0)
in//let
(
  trans34_d4exp_tpck(env0,d4e0,t2p0) )
end(*let*) // end-of-[trans34_d3exp_tpck(...)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trans34_d4pat_tpck
(env0, d4p0, t2p0) =
let
val ubtf =
unify34_s2typ(env0,d4p0.styp(),t2p0)
in//let
if
ubtf then d4p0 else
let
val loc0 = d4p0.lctn() in
d4pat(loc0, t2p0, D4Pt2pck(d4p0,t2p0)) end
end where
{
//
(*
val () =
prerrln("trans34_d4pat_tpck: d4p0 = ", d4p0)
val () =
prerrln("trans34_d4pat_tpck: t2p0 = ", t2p0)
*)
//
} (*where*) // end of [trans34_d4pat_tpck(...)]

(* ****** ****** *)

#implfun
trans34_d4exp_tpck
(env0, d4e0, t2p0) =
let
//
val t2p0 =
(
  f0_dearg(t2p0) )
//
val t2p1 = d4e0.styp()
//
val ubtf =
unify34_s2typ(env0, t2p1, t2p0)
//
in//let
if
ubtf then d4e0 else
let
val
loc0 = d4e0.lctn() in//let
d4exp
(loc0, t2p0, D4Et2pck(d4e0,t2p0)) end
end where
{
//
fun
f0_dearg
(t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|T2Parg1
(knd0, t2p1) => f0_dearg(t2p1)
|T2Patx2
(t2p1, t2p2) => f0_dearg(t2p1)
|_(* otherwise *) => (  t2p0  ))//fun
//
(*
//
val
loc0 = d4e0.lctn((*void*))
//
val () = prerrln
  ("trans34_d4exp_tpck: loc0 = ", loc0)
val () = prerrln
  ("trans34_d4exp_tpck: d4e0 = ", d4e0)
val () = prerrln
  ("trans34_d4exp_tpck: t2p0 = ", t2p0)
//
*)
//
}(*where*) // end-of-[trans34_d4exp_tpck(...)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4explst_tpcks
( env0
, loc0, d4es , t2ps ) =
(
case+ d4es of
|
list_nil() =>
(
case+ t2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2p1, t2ps) =>
list_cons(d4e1, d4es) where
{
//
val
d4e1 = d4exp_none0(loc0)
//
val d4e1 =
trans34_d4exp_tpck(env0, d4e1, t2p1)
val d4es =
trans34_d4explst_tpcks(env0,loc0,d4es,t2ps) }
)
|
list_cons(d4e1, d4es) =>
(
case+ t2ps of
|
list_nil() =>
list_cons(d4e1, d4es) where
{
//
val
t2p1 = s2typ_none0((*void*))
//
val d4e1 =
trans34_d4exp_tpck(env0, d4e1, t2p1)
val d4es =
trans34_d4explst_tpcks(env0,loc0,d4es,t2ps) }
|
list_cons(t2p1, t2ps) =>
list_cons(d4e1, d4es) where
{
val d4e1 =
trans34_d4exp_tpck(env0, d4e1, t2p1)
val d4es =
trans34_d4explst_tpcks(env0,loc0,d4es,t2ps) }
)
)(*case+*) // end-of-[trans34_d4explst_tpcks(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3explstopt
( env0, dopt ) =
(
  optn_trans34_fnp(env0, dopt, trans34_d3explst))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_dynexp.dats] *)
