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
Sun 12 Feb 2023 10:01:29 AM EST
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
_(*TRSYM2A*) = "./trsym2a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2a.sats"
(* ****** ****** *)
#symload dexp with d2rxp_get_dexp
#symload dexp with d2rxp_set_dexp
(* ****** ****** *)
//
fun
d2pat_make_dpis
( loc0
: loc_t
, d1p0
: d1pat
, dpis
: d2ptmlst
, t2p1: s2typ): d2pat =
(
case+ dpis of
|
list_nil() =>
f0_else(loc0, dpis, t2p1)
|
list_cons(dpi1, dps2) =>
(
case+ dps2 of
|list_nil() =>
f0_sing(loc0, dpi1, t2p1)
|list_cons _ =>
f0_else(loc0, dpis, t2p1))
) (*case+*) where
{
//
(* ****** ****** *)
//
fun
f0_sing
( loc0: loc_t
, dpi1: d2ptm
, t2p1: s2typ): d2pat =
(
case- dpi1 of
|
D2PTMsome
(pval, d2i1) =>
(
case- d2i1 of
|D2ITMvar(d2v1) =>
let
val
d2p1 =
d2pat_var(loc0, d2v1)
in//let
d2p1.styp(t2p1); d2p1 end
|D2ITMcon(d2cs) =>
let
val
d2p1 =
d2pat_cons(loc0, d2cs)
in//let
(d2p1.styp(t2p1); d2p1) end
//
|D2ITMcst(d2cs) =>
let
val
dpis = list_sing(dpi1) in
f0_else(loc0, dpis, t2p1) end
//
(*
|D2ITMsym(sym1, dpis) => ...
*)
//
)
) (*case+*) // end of [f0_sing(...)]
//
(* ****** ****** *)
//
and
f0_else
( loc0
: loc_t
, dpis
: d2ptmlst
, t2p1: s2typ): d2pat =
let
val
drpt = d2rpt_new1(loc0)
val
dpat =
d2pat_sym0
(loc0, drpt, d1p0, dpis)
in
let
val () = dpat.styp(t2p1) in dpat
end
end (*let*) // end of [f0_else(...)]
//
(* ****** ****** *)
val () =
prerrln("d2pat_make_dpis: loc0 = ", loc0)
val () =
prerrln("d2pat_make_dpis: d1p0 = ", d1p0)
val () =
prerrln("d2pat_make_dpis: dpis = ", dpis)
(* ****** ****** *)
//
} (*where*) // end of [d2pat_make_dpis(...)]
//
(* ****** ****** *)
//
fun
d2exp_make_dpis
( loc0
: loc_t
, d1e0
: d1exp
, dpis
: d2ptmlst
, t2p1: s2typ): d2exp =
(
case+ dpis of
|
list_nil
((*void*)) =>
f0_else(loc0, dpis, t2p1)
|
list_cons
(dpi1, dps2) =>
(
case+ dps2 of
|list_nil() =>
f0_sing(loc0, dpi1, t2p1)
|list_cons _ =>
f0_else(loc0, dpis, t2p1))
) (*case+*) where
{
//
(* ****** ****** *)
//
fun
f0_sing
( loc0: loc_t
, dpi1: d2ptm
, t2p1: s2typ): d2exp =
(
case- dpi1 of
|
D2PTMsome
(pval, d2i1) =>
(
case- d2i1 of
|D2ITMvar(d2v1) =>
let
val
d2e1 =
d2exp_var(loc0, d2v1)
in//let
d2e1.styp(t2p1); d2e1 end
|D2ITMcon(d2cs) =>
let
val
d2e1 =
d2exp_cons(loc0, d2cs)
in//let
(d2e1.styp(t2p1); d2e1) end
|D2ITMcst(d2cs) =>
let
val
d2e1 =
d2exp_csts(loc0, d2cs)
in//let
(d2e1.styp(t2p1); d2e1) end
//
(*
|D2ITMsym(sym1, dpis) => ...
*)
//
)
) (*case+*) // end of [f0_sing(...)]
//
(* ****** ****** *)
//
and
f0_else
( loc0
: loc_t
, dpis
: d2ptmlst
, t2p1: s2typ): d2exp =
let
val
drxp = d2rxp_new1(loc0)
val
dexp =
d2exp_sym0
(loc0, drxp, d1e0, dpis)
in
let
val () = dexp.styp(t2p1) in dexp
end
end (*let*) // end of [f0_else(...)]
//
(* ****** ****** *)
val () =
prerrln("d2exp_make_dpis: loc0 = ", loc0)
val () =
prerrln("d2exp_make_dpis: d1e0 = ", d1e0)
val () =
prerrln("d2exp_make_dpis: dpis = ", dpis)
(* ****** ****** *)
//
} (*where*) // end of [d2exp_make_dpis(...)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2pat
( env0, d2p0 ) =
let
//
(*
val
loc0 = d2p0.lctn()
val () =
prerrln
("trsym2a_d2pat: loc0 = ", loc0)
val () =
prerrln
("trsym2a_d2pat: d2p0 = ", d2p0)
*)
//
in//let
//
case+
d2p0.node() of
//
|D2Pvar _ => ()
//
(*
|D2Pint _ => ()
|D2Pbtf _ => ()
|D2Pchr _ => ()
|D2Pflt _ => ()
|D2Pstr _ => ()
*)
//
|D2Psym0 _ =>
f0_sym0(env0, d2p0)
//
|
D2Pdapp
(d2f0,npf1,d2ps) =>
let
val () =
trsym2a_d2pat(env0, d2f0)
val () =
trsym2a_d2patlst(env0, d2ps) end
//
|D2Pt2pck _ => f0_t2pck(env0, d2p0)
//
| _(* otherwise *) => (   (*skipped*)   )
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_sym0
( env0:
! tr2aenv
, d2p0: d2pat): void =
let
//
val-
D2Psym0
( drpt
, d1p0, dpis) = d2p0.node()
//
val loc0 = d2p0.lctn((*void*))
val t2p1 = d2p0.styp((*void*))
val dpat = drpt.dpat((*void*))
//
(*
val () =
prerrln
("trsym2a_d2pat: f0_sym0: loc0 = ", loc0)
val () =
prerrln
("trsym2a_d2pat: f0_sym0: d2p0 = ", d2p0)
val () =
prerrln
("trsym2a_d2pat: f0_sym0: styp = ", t2p1)
*)
//
in//let
case+
dpat.node() of
|
D2Pnone0() =>
let
//
val dpis =
match2a_d2ptmlst
(env0, dpis, t2p1)
//
val dsym =
d2pat_make_dpis
( loc0
, d1p0, dpis, t2p1) where
{
val dpis =
(
case+ dpis of
|
list_nil() =>
list_nil(*void*)
|
list_cons _ =>
f1_maxes( dpis )):d2ptmlst }
//
in//let
  d2rpt_set_dpat(drpt, dsym)
end (*let*) // end of [D2Pnone0]
|
_(*otherwise*) => trsym2a_d2pat(env0, dpat)
end where
{
//
(* ****** ****** *)
//
fun
f1_maxes
( dpis
: d2ptmlst): d2ptmlst =
(
auxtake(pmax, dpis)) where
{
val
pmax =
(
case- dpis of
|
list_cons
(dpi1, d2ps) =>
(
case- dpi1 of
|
D2PTMsome(pval, _) =>
  auxpmax(pval, d2ps))): sint
//
(*
val () =
prerrln("f1_maxes: pmax = ", pmax)
*)
//
} (*where*) // end of [f1_maxes(...)]
//
and
auxpmax
( pmax: sint
, dpis: d2ptmlst): sint =
(
case+ dpis of
|
list_nil() => pmax
|
list_cons(dpi1, dpis) =>
(
case- dpi1 of
|
D2PTMsome(pval, _) =>
auxpmax(max(pmax, pval), dpis))
) (*case+*) // end of [auxpmax( ... )]
//
and
auxtake
( pmax: sint
, dpis: d2ptmlst): d2ptmlst =
(
case+ dpis of
|
list_nil() =>
list_nil(*void*)
|
list_cons(dpi1, dpis) =>
(
case- dpi1 of
|
D2PTMsome(pval, d2i1) =>
if
(pval < pmax)
then auxtake(pmax, dpis) else
list_cons(dpi1, auxtake(pmax, dpis)))
) (*case+*) // end of [auxtake( ... )]
//
(* ****** ****** *)
//
} (*where*) // end of [f0_sym0(env0, d2p0)]
//
(* ****** ****** *)
//
fun
f0_t2pck
( env0:
! tr2aenv
, d2p0: d2pat): void =
(
trsym2a_d2pat(env0, d2p1)) where
{
  val-D2Pt2pck(d2p1, t2p2) = d2p0.node()
} (*where*) // end of [f0_t2pck(env0, d2p0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trsym2a_d2pat(env0,d2p0)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2exp
( env0, d2e0 ) =
let
//
(*
val
loc0 = d2e0.lctn()
val () =
prerrln
("trsym2a_d2exp: loc0 = ", loc0)
val () =
prerrln
("trsym2a_d2exp: d2e0 = ", d2e0)
*)
//
in//let
//
case+
d2e0.node() of
//
(*
| D2Eint _ => ()
| D2Ebtf _ => ()
| D2Echr _ => ()
| D2Eflt _ => ()
| D2Estr _ => ()
*)
//
(*
| D2Evar _ => ()
| D2Econ _ => ()
| D2Ecst _ => ()
*)
//
|D2Esym0 _ =>
f0_sym0(env0, d2e0)
//
|
D2Etapp
(d2f0, s2es) =>
let
val () =
trsym2a_d2exp(env0, d2f0)
(*
val () =
trsym2a_s2explst(env0, s2es)
*)
endlet // end of [D2Etapp(...)]
//
|
D2Edapp
(d2f0,npf1,d2es) =>
let
val () =
trsym2a_d2exp(env0, d2f0)
val () =
trsym2a_d2explst(env0, d2es) end
//
|
D2Elet0
(dcls, d2e1) =>
(
trsym2a_d2exp(env0, d2e1))
where
{ val () =
  trsym2a_d2eclist(env0, dcls) }
|
D2Eift0
(d2e1,dthn,dels) =>
let
val () =
trsym2a_d2exp(env0, d2e1)
val () =
trsym2a_d2expopt(env0, dthn)
val () =
trsym2a_d2expopt(env0, dels) end
//
|
D2Ecas0
(tknd,d2e1,d2cs) =>
let
val () =
trsym2a_d2exp(env0, d2e1)
val () =
trsym2a_d2clslst(env0, d2cs) end
//
|
D2Eseqn
(d2es, d2e1) =>
(
trsym2a_d2exp(env0, d2e1))
where
{ val () =
  trsym2a_d2explst(env0, d2es) }
//
|
D2Etup0
(npf1,d2es) =>
let
val () =
trsym2a_d2explst(env0, d2es) end
|
D2Etup1
(tknd,npf1,d2es) =>
let
val () =
trsym2a_d2explst(env0, d2es) end
//
|
D2Ewhere
(d2e1, dcls) =>
(
trsym2a_d2exp(env0, d2e1))
where
{ val () =
  trsym2a_d2eclist(env0, dcls) }
//
|
D2Eassgn
(d2el, d2er) =>
let
val () =
trsym2a_d2exp(env0, d2el)
val () =
trsym2a_d2exp(env0, d2er) endlet
//
|
D2Eraise
(tknd, d2e1) =>
let
val () =
trsym2a_d2exp(env0, d2e1) endlet
//
|
D2Et2pck(_, _) => f0_t2pck(env0, d2e0)
//
| _(* otherwise *) => (   (*skipped*)   )
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_sym0
( env0:
! tr2aenv
, d2e0: d2exp): void =
let
//
val-
D2Esym0
( drxp
, d1e0, dpis) = d2e0.node()
//
val loc0 = d2e0.lctn((*void*))
val t2p1 = d2e0.styp((*void*))
val dexp = drxp.dexp((*void*))
//
(*
val () =
prerrln
("trsym2a_d2exp: f0_sym0: loc0 = ", loc0)
val () =
prerrln
("trsym2a_d2exp: f0_sym0: d2e0 = ", d2e0)
val () =
prerrln
("trsym2a_d2exp: f0_sym0: styp = ", t2p1)
*)
//
in//let
case+
dexp.node() of
|
D2Enone0() =>
let
//
val dpis =
match2a_d2ptmlst
(env0, dpis, t2p1)
//
val dsym =
d2exp_make_dpis
( loc0
, d1e0, dpis, t2p1) where
{
val dpis =
(
case+ dpis of
|
list_nil() =>
list_nil(*void*)
|
list_cons _ =>
f1_maxes( dpis )):d2ptmlst }
//
in//let
  d2rxp_set_dexp(drxp, dsym)
end (*let*) // end of [D2Enone0]
|
_(*otherwise*) => trsym2a_d2exp(env0, dexp)
end where
{
//
(* ****** ****** *)
//
fun
f1_maxes
( dpis
: d2ptmlst): d2ptmlst =
(
auxtake(pmax, dpis)) where
{
val
pmax =
(
case- dpis of
|
list_cons
(dpi1, dpis) =>
(
case- dpi1 of
|
D2PTMsome(pval, _) =>
  auxpmax(pval, dpis))): sint
//
(*
val () =
prerrln("f1_maxes: pmax = ", pmax)
*)
//
} (*where*) // end of [f1_maxes(...)]
//
and
auxpmax
( pmax: sint
, dpis: d2ptmlst): sint =
(
case+ dpis of
|
list_nil() => pmax
|
list_cons(dpi1, dpis) =>
(
case- dpi1 of
| D2PTMsome(pval, _) =>
  auxpmax(max(pmax, pval), dpis))
) (*case+*) // end of [auxpmax( ... )]
//
and
auxtake
( pmax: sint
, dpis: d2ptmlst): d2ptmlst =
(
case+ dpis of
|
list_nil() =>
list_nil((*void*))
|
list_cons(dpi1, dpis) =>
(
case- dpi1 of
|
D2PTMsome(pval, d2i1) =>
if
(pval < pmax)
then auxtake(pmax, dpis) else
list_cons(dpi1, auxtake(pmax, dpis)))
) (*case+*) // end of [auxtake( ... )]
//
(* ****** ****** *)
//
} (*where*) // end of [f0_sym0(env0, d2e0)]
//
(* ****** ****** *)
//
fun
f0_t2pck
( env0:
! tr2aenv
, d2e0: d2exp): void =
(
trsym2a_d2exp(env0, d2e1)) where
{
  val-D2Et2pck(d2e1, t2p2) = d2e0.node()
} (*where*) // end of [f0_t2pck(env0, d2e0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trsym2a_d2exp(env0,d2e0)]
//
(* ****** ****** *)
//
#implfun
trsym2a_f2arg
(env0 , farg) =
(
case+
farg.node() of
//
|F2ARGdyn0
(npf1, d2ps) =>
trsym2a_d2patlst(env0, d2ps)
//
|F2ARGsta0
(s2vs, s2es) => ( (*void*) )
|F2ARGmet0(s2es) => ( (*void*) )
//
) (*case+*)//end-of-(trsym2a_f2arg(env0,farg)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2gua
(env0 , dgua) =
(
case+
dgua.node() of
|
D2GUAexp
( d2e1 ) =>
trsym2a_d2exp(env0, d2e1)
|
D2GUAmat
(d2e1,d2p2) =>
let
val () =
trsym2a_d2exp(env0, d2e1)
val () =
trsym2a_d2pat(env0, d2p2) endlet
) (*case+*)//end-of-(trsym2a_d2gua(env0,farg)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2gpt
(env0 , dgpt) =
(
case+
dgpt.node() of
|
D2GPTpat
( d2p1 ) => 
trsym2a_d2pat(env0, d2p1)
|
D2GPTgua
(d2p1,d2gs) =>
let
val () =
trsym2a_d2pat(env0, d2p1)
val () =
trsym2a_d2gualst(env0, d2gs) endlet
) (*case+*)//end-of-(trsym2a_d2gpt(env0,farg)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2cls
(env0 , dcls) =
(
case+
dcls.node() of
|
D2CLSgpt(dgpt) =>
trsym2a_d2gpt(env0, dgpt)
|
D2CLScls(dgpt,d2e2) =>
let
val () = trsym2a_d2gpt(env0, dgpt)
val () = trsym2a_d2exp(env0, d2e2)
endlet // end of [ D2CLScls(_,_,_) ]
) (*case*) // end-of(trsym2a_d2cls(env0,dcls))
//
(* ****** ****** *)
//
#implfun
trsym2a_d2patlst
( env0, d2ps ) =
list_trsym2a_fnp(env0, d2ps, trsym2a_d2pat)
//
#implfun
trsym2a_l2d2plst
( env0, ldps ) =
list_trsym2a_fnp(env0, ldps, trsym2a_l2d2p)
//
(* ****** ****** *)
//
#implfun
trsym2a_d2explst
( env0, d2es ) =
list_trsym2a_fnp(env0, d2es, trsym2a_d2exp)
#implfun
trsym2a_d2expopt
( env0, dopt ) =
optn_trsym2a_fnp(env0, dopt, trsym2a_d2exp)
//
#implfun
trsym2a_l2d2elst
( env0, ldes ) =
list_trsym2a_fnp(env0, ldes, trsym2a_l2d2e)
//
(* ****** ****** *)
//
#implfun
trsym2a_f2arglst
( env0, f2as ) =
list_trsym2a_fnp(env0, f2as, trsym2a_f2arg)
//
(* ****** ****** *)
//
#implfun
trsym2a_d2gualst
( env0, d2gs ) =
list_trsym2a_fnp(env0, d2gs, trsym2a_d2gua)
//
#implfun
trsym2a_d2clslst
( env0, d2cs ) =
list_trsym2a_fnp(env0, d2cs, trsym2a_d2cls)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trsym2a_dynexp.dats] *)
