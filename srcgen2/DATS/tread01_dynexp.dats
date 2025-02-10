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
Mon Aug 15 17:35:46 EDT 2022
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
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
#symload lctn with f1arg_get_lctn
#symload node with f1arg_get_node
(* ****** ****** *)
#symload lctn with d1arg_get_lctn
#symload node with d1arg_get_node
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-20:
A placeholder for the moment
but it may actually just be okay!
*)
fun
g1exp_errvl_a1
(g1e: g1exp): sint = 0
#symload errvl with g1exp_errvl_a1
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2022-08-21:
A placeholder for the moment
but it may actually just be okay!
*)
fun
s1exp_errvl_lst
(ses: s1explst): sint = 0
#symload errvl with s1exp_errvl_lst
(* ****** ****** *)
(* ****** ****** *)
//
fun
d1pat_errck
(lvl: sint
,d1p: d1pat): d1pat =
(
d1pat
(d1p.lctn(), D1Perrck(lvl, d1p))
) (*case+*) //end-of-[d1pat_errck(_,_)]
//
(* ****** ****** *)
//
fun
d1pat_errvl_a1
(d1p: d1pat): sint =
(
case+ d1p.node() of
|
D1Perrck
(lvl, _) => lvl | _ => 0
)
#symload
d1pat_errvl with d1pat_errvl_a1
#symload errvl with d1pat_errvl_a1
//
(* ****** ****** *)
//
fun
d1pat_errvl_a2
(dp1: d1pat
,dp2: d1pat): sint =
maxs(errvl(dp1),errvl(dp2))
#symload
d1pat_errvl with d1pat_errvl_a2
#symload errvl with d1pat_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
d1pat_errvl_lst
(dps: d1patlst): sint
//
#implfun
d1pat_errvl_lst(dps) =
(
case+ dps of
|
list_nil((*nil*)) => 0
|
list_cons(de1,dps) =>
(
maxs
(errvl(de1),d1pat_errvl_lst(dps)))
endcas // end of [ case+(dps) ]
)
//
#symload errvl with d1pat_errvl_lst
//
(* ****** ****** *)
//
#extern
fun
l1d1p_errvl_ldps
(ldps: l1d1plst): sint
//
#implfun
l1d1p_errvl_ldps
(   ldps   ) =
(
case+ ldps of
|
list_nil((*nil*)) => 0
|
list_cons(ldp1,ldps) =>
let
val+
D1LAB(lab, dp1) = ldp1
in//let
maxs
( errvl(dp1)
, l1d1p_errvl_ldps(ldps)) end
endcas // end of [ case+(ldps) ]
)
//
#symload errvl with l1d1p_errvl_ldps
//
(* ****** ****** *)
fun
d1pat_b0sh_errck
(loc: loc_t): d1pat =
d1pat_errck
(1, d1pat(loc, D1Pb0sh()))
(* ****** ****** *)
fun
d1pat_b1sh_errck
(loc: loc_t
,d1p: d1pat): d1pat =
d1pat_errck
(1, d1pat(loc, D1Pb1sh(d1p)))
(* ****** ****** *)
fun
d1pat_a0pp_errck
(loc: loc_t): d1pat =
d1pat_errck(1,d1pat(loc,D1Pa0pp()))
(* ****** ****** *)
fun
d1pat_a1pp_errck
(loc: loc_t
,dp1: d1pat
,dp2: d1pat): d1pat =
let
val
lvl = maxs
(errvl(dp1), errvl(dp2)) in//let
d1pat_errck
(lvl+1, d1pat(loc, D1Pa1pp(dp1, dp2)))
endlet // end of [d1pat_a1pp_errck(...)]
(* ****** ****** *)
fun
d1pat_a2pp_errck
(loc: loc_t
,dp1: d1pat
,dp2: d1pat
,dp3: d1pat): d1pat =
let
val lvl = maxs
( errvl(dp1)
, errvl(dp2), errvl(dp3)) in//let
d1pat_errck
(lvl+1,d1pat(loc,D1Pa2pp(dp1,dp2,dp3)))
endlet // end of [d1pat_a2pp_errck(...)]
(* ****** ****** *)
fun
d1pat_l1st_errck
( loc
: loc_t
, dps
: d1patlst ): d1pat =
let
val lvl = errvl(dps) in//let
d1pat_errck
(lvl+1, d1pat( loc , D1Pl1st( dps ) ))
endlet // end of [d1pat_l1st_errck(...)]
(* ****** ****** *)
fun
d1pat_l2st_errck
( loc
: loc_t
, dps1
: d1patlst 
, dps2
: d1patlst ): d1pat =
let
val lvl = maxs
(errvl(dps1), errvl(dps2)) in//let
d1pat_errck
(lvl+1, d1pat(loc, D1Pl2st(dps1,dps2)))
endlet // end of [d1pat_l2st_errck(...)]
(* ****** ****** *)
fun
d1pat_t1up_errck
( loc
: loc_t
, tknd
: token
, d1ps
: d1patlst ): d1pat =
let
val lvl = errvl(d1ps) in//let
d1pat_errck
(lvl+1, d1pat(loc, D1Pt1up(tknd,d1ps)))
endlet // end of [d1pat_t1up_errck(...)]
(* ****** ****** *)
fun
d1pat_t2up_errck
( loc
: loc_t
, tknd
: token
, dps1
: d1patlst
, dps2
: d1patlst ): d1pat =
let
val lvl =
maxs(errvl(dps1), errvl(dps2))
in//let
d1pat_errck
(lvl+1
,d1pat(loc, D1Pt2up(tknd, dps1, dps2)))
endlet // end of [d1pat_t2up_errck(...)]
(* ****** ****** *)
fun
d1pat_r1cd_errck
( loc
: loc_t
, tknd
: token
, ldps
: l1d1plst ): d1pat =
let
val lvl = errvl(ldps) in//let
d1pat_errck
(lvl+1, d1pat(loc, D1Pr1cd(tknd,ldps)))
endlet // end of [d1pat_r1cd_errck(...)]
(* ****** ****** *)
fun
d1pat_r2cd_errck
( loc
: loc_t
, tknd
: token
, lss1
: l1d1plst
, lss2
: l1d1plst ): d1pat =
let
val lvl =
maxs(errvl(lss1), errvl(lss2))
in//let
d1pat_errck
(lvl+1
,d1pat(loc, D1Pr2cd(tknd, lss1, lss2)))
endlet // end of [d1pat_r2cd_errck(...)]
(* ****** ****** *)
//
fun
d1pat_annot_errck
( loc: loc_t
, d1p1: d1pat
, s1e2: s1exp): d1pat =
let
val lvl = errvl(d1p1) in//let
d1pat_errck
(lvl+1, d1pat(loc,D1Pannot(d1p1,s1e2)))
endlet // end of [d1pat_annot_errck(...)]
//
(* ****** ****** *)
fun
d1pat_qual0_errck
( loc: loc_t
, tok1: token
, d1p2: d1pat): d1pat =
let
val lvl = errvl(d1p2) in//let
d1pat_errck
(lvl+1, d1pat(loc,D1Pqual0(tok1,d1p2)))
endlet // end of [d1pat_qual0_errck(...)]
(* ****** ****** *)

#implfun
tread01_d1pat
  (d1p0, err) =
(
case+
d1p0.node() of
//
| D1Pid0 _ => d1p0
//
| D1Pint _ => d1p0
| D1Pchr _ => d1p0
| D1Pflt _ => d1p0
| D1Pstr _ => d1p0
//
| D1Pa0pp() =>
(
d1pat_a0pp_errck(loc0)
) where
{ val () = ( err := err + 1 ) }
|
D1Pa1pp
( d1p1, d1p2) =>
let
//
val e00 = err
//
val
d1p1 = tread01_d1pat(d1p1, err)
val
d1p2 = tread01_d1pat(d1p2, err)
//
in//let
if
(err=e00)
then (d1p0) else
d1pat_a1pp_errck(loc0, d1p1, d1p2)
endlet // end of [D1Pa1pp(d1p1,d1p2)]
//
|
D1Pa2pp
( d1p1
, d1p2, d1p3) =>
let
//
val e00 = err
//
val
d1p1 = tread01_d1pat(d1p1, err)
val
d1p2 = tread01_d1pat(d1p2, err)
val
d1p3 = tread01_d1pat(d1p3, err)
//
in//let
if
(err=e00)
then (d1p0) else
d1pat_a2pp_errck
( loc0  ,  d1p1  ,  d1p2  ,  d1p3 )
endlet//end(D1Pa2pp(d1p1,d1p2,d1p3))
//
|
D1Pl1st(d1ps) =>
let
//
val e00 = err
//
val d1ps =
  tread01_d1patlst(d1ps, err)
//
in//let
if
(err=e00)
then (d1p0)
else d1pat_l1st_errck(loc0, d1ps )
endlet // end of [ D1Pl1st( d1ps ) ]
|
D1Pl2st
( dps1, dps2) =>
let
//
val e00 = err
//
val dps1 =
  tread01_d1patlst(dps1, err)
val dps2 =
  tread01_d1patlst(dps2, err)
//
in//let
if
(err=e00)
then (d1p0) else
d1pat_l2st_errck(loc0, dps1, dps2)
endlet // end of [D1Pl2st(dps1,dps2)]
//
|
D1Pt1up
( tknd, d1ps) =>
let
//
val e00 = err
//
val d1ps =
  tread01_d1patlst(d1ps, err)
//
in//let
if
(err=e00)
then (d1p0) else
d1pat_t1up_errck(loc0, tknd, d1ps)
endlet // end of [D1Pt1up(tknd,d1ps)]
|
D1Pt2up
( tknd
, dps1, dps2) =>
let
//
val e00 = err
//
val dps1 =
  tread01_d1patlst(dps1, err)
val dps2 =
  tread01_d1patlst(dps2, err)
//
in//let
if
(err=e00)
then (d1p0) else
d1pat_t2up_errck(loc0,tknd,dps1,dps2)
endlet // end(D1Pt2up(tknd,dps1,dps2))
//
|
D1Pannot
( d1p1, s1e2) =>
let
//
val e00 = err
//
val d1p1 =
tread01_d1pat(d1p1, err)
val s1e2 =
tread01_s1exp(s1e2, err)
//
in//let
if
(err=e00)
then (d1p0) else
d1pat_annot_errck( loc0, d1p1, s1e2 )
endlet // end of [D1Pannot(d1p1,s1e2)]
//
|
D1Pqual0
( tok1, d1p2) =>
let
//
val e00 = err
//
val
d1p2 = tread01_d1pat(d1p2, err)
//
in//let
if
(err=e00)
then (d1p0) else
d1pat_qual0_errck( loc0, tok1, d1p2 )
endlet // end of [D1Pqual0(tok1,d1p2)]
//
|
_(* otherwise *) =>
let
val lvl0 = 1
in//let
(
err := err+1; d1pat_errck(lvl0, d1p0) )
end(*let*)//end-of-[ _(* otherwise *) ]
//
) where
{
//
val loc0 = d1p0.lctn((*void*))//needed
//
(*
val (  ) =
prerrsln("tread01_d1pat: loc0 = ", loc0)
val (  ) =
prerrsln("tread01_d1pat: d1p0 = ", d1p0)
*)
//
} (*where*)//end(tread01_d1pat(d1p0,err))

(* ****** ****** *)
//
#implfun
tread01_l1d1p
  (ld1p, err) =
let
//
val e00 = err
//
val+
D1LAB(lab0, d1p1) = ld1p
//
val
d1p1 = tread01_d1pat(d1p1, err)
//
in//let
if // if
(err=e00)
then (ld1p) else D1LAB(lab0, d1p1)
end (*let*)//end(tread01_l1d1p(ld1p,err))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d1exp_errck
(lvl: sint
,d1e: d1exp): d1exp =
(
d1exp
(d1e.lctn(), D1Eerrck(lvl, d1e))
) (*case+*) // end-of-[d1exp_errck(_,_)]
//
(* ****** ****** *)
//
fun
d1exp_errvl_a1
(d1e: d1exp): sint =
(
case+ d1e.node() of
|
D1Eerrck
(lvl, _) => lvl | _ => 0
)
#symload
d1exp_errvl with d1exp_errvl_a1
#symload errvl with d1exp_errvl_a1
//
(* ****** ****** *)
//
fun
d1exp_errvl_a2
(de1: d1exp
,de2: d1exp): sint =
maxs(errvl(de1),errvl(de2))
#symload
d1exp_errvl with d1exp_errvl_a2
#symload errvl with d1exp_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
d1exp_errvl_lst
(des: d1explst): sint
//
#implfun
d1exp_errvl_lst(des) =
(
case+ des of
|
list_nil((*nil*)) => 0
|
list_cons(de1,des) =>
(
maxs
(errvl(de1),d1exp_errvl_lst(des)))
endcas // end of [ case+(des) ]
)
//
#symload errvl with d1exp_errvl_lst
//
(* ****** ****** *)
//
fun
d1exp_errvl_opt
(opt: d1expopt): sint =
(
case+ opt of
|
optn_nil((*nil*)) => 0
|
optn_cons(d1e1) => errvl(d1e1))
//
#symload errvl with d1exp_errvl_opt
//
(* ****** ****** *)
//
#extern
fun
l1d1e_errvl_ldes
(ldes: l1d1elst): sint
//
#implfun
l1d1e_errvl_ldes
(   ldes   ) =
(
case+ ldes of
|
list_nil((*nil*)) => 0
|
list_cons(lde1,ldes) =>
let
val+
D1LAB(lab, de1) = lde1 in
maxs
( errvl(de1)
, l1d1e_errvl_ldes(ldes)) end
endcas // end of [ case+(ldes) ]
)
//
#symload errvl with l1d1e_errvl_ldes
//
(* ****** ****** *)
//
fun
d1cls_errvl_a1
(dcl: d1cls): sint =
(
case+ dcl.node() of
|
D1CLSgpt(dgpt) => 0
|
D1CLScls(dgpt,d1e1) => errvl(d1e1)
)
#symload errvl with d1cls_errvl_a1
//
(* ****** ****** *)
//
#extern
fun
d1cls_errvl_lst
(dcls: d1clslst): sint
#symload errvl with d1cls_errvl_lst
//
#implfun
d1cls_errvl_lst(dcls) =
(
case+ dcls of
|
list_nil((*nil*)) => 0
|
list_cons(dcl1,dcls) => maxs
(errvl(dcl1), d1cls_errvl_lst(dcls))
) (*case+*)//end-of-(d1cls_errvl_lst)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2022-08-21:
A placeholder for the moment
but it may actually just be okay!
*)
fun
d1ecl_errvl_lst
(dcs: d1eclist): sint = 0
#symload errvl with d1ecl_errvl_lst
//
(* ****** ****** *)
(* ****** ****** *)
fun
d1exp_b0sh_errck
(loc: loc_t): d1exp =
d1exp_errck
(1, d1exp(loc, D1Eb0sh()))
(* ****** ****** *)
fun
d1exp_b1sh_errck
(loc: loc_t
,d1e: d1exp): d1exp =
d1exp_errck
(1, d1exp(loc, D1Eb1sh(d1e)))
(* ****** ****** *)
fun
d1exp_a0pp_errck
(loc: loc_t): d1exp =
d1exp_errck(1,d1exp(loc,D1Ea0pp()))
(* ****** ****** *)
fun
d1exp_a1pp_errck
(loc: loc_t
,de1: d1exp
,de2: d1exp): d1exp =
let
val lvl = maxs
(errvl(de1), errvl(de2)) in//let
d1exp_errck
(lvl+1, d1exp(loc, D1Ea1pp(de1, de2)))
endlet // end of [d1exp_a1pp_errck(...)]
(* ****** ****** *)
fun
d1exp_a2pp_errck
(loc: loc_t
,de1: d1exp
,de2: d1exp
,de3: d1exp): d1exp =
let
val lvl = maxs
( errvl(de1)
, errvl(de2), errvl(de3)) in//let
d1exp_errck
(lvl+1,d1exp(loc,D1Ea2pp(de1,de2,de3)))
endlet // end of [d1exp_a2pp_errck(...)]
(* ****** ****** *)
fun
d1exp_sarg_errck
( loc
: loc_t
, ses
: s1explst ): d1exp =
let
val lvl = errvl(ses) in//let
d1exp_errck
(lvl+1, d1exp( loc , D1Esarg( ses ) ))
endlet // end of [d1exp_sarg_errck(...)]
(* ****** ****** *)
fun
d1exp_targ_errck
( loc
: loc_t
, ses
: s1explst ): d1exp =
let
val lvl = errvl(ses) in//let
d1exp_errck
(lvl+1, d1exp( loc , D1Etarg( ses ) ))
endlet // end of [d1exp_targ_errck(...)]
(* ****** ****** *)
fun
d1exp_l1st_errck
( loc
: loc_t
, des
: d1explst ): d1exp =
let
val lvl = errvl(des) in//let
d1exp_errck
(lvl+1, d1exp( loc , D1El1st( des ) ))
endlet // end of [d1exp_l1st_errck(...)]
(* ****** ****** *)
fun
d1exp_l2st_errck
( loc
: loc_t
, des1
: d1explst 
, des2
: d1explst ): d1exp =
let
val lvl = maxs
(errvl(des1), errvl(des2)) in//let
d1exp_errck
(lvl+1, d1exp(loc, D1El2st(des1,des2)))
endlet // end of [d1exp_l2st_errck(...)]
(* ****** ****** *)
fun
d1exp_s1eq_errck
( loc
: loc_t
, d1es
: d1explst ): d1exp =
let
val lvl = errvl(d1es)
in//let
d1exp_errck
( lvl+1 , d1exp( loc, D1Es1eq(d1es) ) )
endlet // end of [d1exp_s1eq_errck(...)]
fun
d1exp_s2eq_errck
( loc
: loc_t
, des1
: d1explst 
, des2
: d1explst ): d1exp =
let
val lvl =
maxs(errvl(des1), errvl(des2))
in//let
d1exp_errck
(lvl+1, d1exp(loc, D1Es2eq(des1,des2)))
endlet // end of [d1exp_s2eq_errck(...)]
(* ****** ****** *)
//
fun
d1exp_ift0_errck
( loc
: loc_t
, d1e1
: d1exp
, dthn
: d1expopt
, dels
: d1expopt): d1exp =
let
val lvl = maxs
(errvl(d1e1),errvl(dthn),errvl(dels))
in//let
d1exp_errck
( lvl+1
, d1exp(loc,D1Eift0(d1e1, dthn, dels)))
endlet // end of [d1exp_ift0_errck(...)]
//
fun
d1exp_ift1_errck
( loc
: loc_t
, d1e1
: d1exp
, dthn
: d1expopt
, dels
: d1expopt
, tinv: t1inv): d1exp =
let
val lvl = maxs
(errvl(d1e1),errvl(dthn),errvl(dels))
in//let
d1exp_errck
(
lvl+1,
d1exp
(loc, D1Eift1(d1e1, dthn, dels, tinv)))
endlet // end of [d1exp_ift1_errck(...)]
//
(* ****** ****** *)
//
fun
d1exp_cas0_errck
( loc
: loc_t
, tknd
: token
, d1e1
: d1exp
, d1cs
: d1clslst ): d1exp =
let
val lvl =
maxs(errvl(d1e1), errvl(d1cs))
in//let
d1exp_errck
( lvl+1
, d1exp(loc,D1Ecas0(tknd, d1e1, d1cs)))
endlet // end of [d1exp_cas0_errck(...)]
//
fun
d1exp_cas1_errck
( loc
: loc_t
, tknd
: token
, d1e1
: d1exp
, d1cs
: d1clslst
, tinv: t1inv): d1exp =
let
val lvl =
maxs(errvl(d1e1), errvl(d1cs))
in//let
d1exp_errck
(
lvl+1,
d1exp
(loc, D1Ecas1(tknd, d1e1, d1cs, tinv)))
endlet // end of [d1exp_cas1_errck(...)]
//
(* ****** ****** *)
fun
d1exp_let0_errck
( loc
: loc_t
, d1cs
: d1eclist
, d1e1: d1exp): d1exp =
let
val lvl =
maxs(errvl(d1cs), errvl(d1e1))
in//let
d1exp_errck
(lvl+1, d1exp(loc, D1Elet0(d1cs,d1e1)))
endlet // end of [d1exp_let0_errck(...)]
(* ****** ****** *)
fun
d1exp_where_errck
( loc
: loc_t
, d1e1
: d1exp
, d1cs
: d1eclist): d1exp =
let
val lvl =
maxs(errvl(d1cs), errvl(d1e1))
in//let
d1exp_errck
(lvl+1, d1exp(loc, D1Ewhere(d1e1,d1cs)))
endlet // end of [d1exp_where_errck(...)]
(* ****** ****** *)
fun
d1exp_brckt_errck
( loc
: loc_t
, d1es
: d1explst): d1exp =
let
val lvl = errvl(d1es)
in//let
d1exp_errck
( lvl+1, d1exp(loc, D1Ebrckt( d1es )) )
endlet // end of [d1exp_brckt_errck(...)]
(* ****** ****** *)
fun
d1exp_dtsel_errck
( loc
: loc_t
, tknd
: token
, lab1
: label
, dopt
: d1expopt): d1exp =
let
val lvl = errvl(dopt)
in//let
d1exp_errck
( lvl+1
, d1exp(loc, D1Edtsel(tknd,lab1,dopt)) )
endlet // end of [d1exp_dtsel_errck(...)]
(* ****** ****** *)
fun
d1exp_t1up_errck
( loc
: loc_t
, tknd
: token
, d1es
: d1explst ): d1exp =
let
val lvl = errvl(d1es)
in//let
d1exp_errck
(lvl+1, d1exp(loc, D1Et1up(tknd,d1es)))
endlet // end of [d1exp_t1up_errck(...)]
(* ****** ****** *)
fun
d1exp_t2up_errck
( loc
: loc_t
, tknd
: token
, des1
: d1explst
, des2
: d1explst ): d1exp =
let
val lvl =
maxs(errvl(des1), errvl(des2))
in//let
d1exp_errck
(lvl+1
,d1exp(loc, D1Et2up(tknd, des1, des2)))
endlet // end of [d1exp_t2up_errck(...)]
(* ****** ****** *)
fun
d1exp_r1cd_errck
( loc
: loc_t
, tknd
: token
, ldes
: l1d1elst ): d1exp =
let
val lvl = errvl(ldes)
in//let
d1exp_errck
(lvl+1, d1exp(loc, D1Er1cd(tknd,ldes)))
endlet // end of [d1exp_r1cd_errck(...)]
(* ****** ****** *)
fun
d1exp_r2cd_errck
( loc
: loc_t
, tknd
: token
, lss1
: l1d1elst
, lss2
: l1d1elst ): d1exp =
let
val lvl =
maxs(errvl(lss1), errvl(lss2))
in//let
d1exp_errck
(lvl+1
,d1exp(loc, D1Er2cd(tknd, lss1, lss2)))
endlet // end of [d1exp_r2cd_errck(...)]
(* ****** ****** *)
fun
d1exp_lam0_errck
( loc
: loc_t
, tknd
: token
, f1as
: f1arglst
, sres
: s1res
, arrw
: f1unarrw
, d1e1: d1exp): d1exp =
let
//
val lvl = errvl(d1e1)
//
in//let
d1exp_errck
(
lvl+1,
d1exp
(loc
,D1Elam0(tknd, f1as, sres, arrw, d1e1)))
endlet // end of [d1exp_lam0_errck(...)]
(* ****** ****** *)
fun
d1exp_fix0_errck
( loc
: loc_t
, tknd
: token
, deid
: token
, f1as
: f1arglst
, sres
: s1res
, arrw
: f1unarrw
, d1e1: d1exp): d1exp =
let
//
val lvl = errvl(d1e1)
//
in//let
d1exp_errck
(
lvl+1,
d1exp
(loc,
D1Efix0(tknd,deid,f1as,sres,arrw,d1e1)))
endlet // end of [d1exp_fix0_errck(...)]
(* ****** ****** *)
fun
d1exp_try0_errck
( loc
: loc_t
, tknd
: token
, d1e1
: d1exp
, d1cs
: d1clslst): d1exp =
let
//
val lvl =
maxs(errvl(d1e1), errvl(d1cs))
//
in//let
  d1exp( loc, D1Etry0(tknd,d1e1,d1cs) )
endlet // end of [d1exp_try0_errck(...)]
(* ****** ****** *)
//
fun
d1exp_raise_errck
( loc: loc_t
, tknd: token
, d1e1: d1exp): d1exp =
let
//
val lvl = errvl(d1e1)
//
in//let
d1exp_errck
(lvl+1, d1exp(loc,D1Eraise(tknd,d1e1)))
endlet // end of [d1exp_raise_errck(...)]
//
(* ****** ****** *)
//
fun
d1exp_annot_errck
( loc: loc_t
, d1e1: d1exp
, s1e2: s1exp): d1exp =
let
//
val lvl = errvl(d1e1)
//
in//let
d1exp_errck
(lvl+1, d1exp(loc,D1Eannot(d1e1,s1e2)))
endlet // end of [d1exp_annot_errck(...)]
//
(* ****** ****** *)
fun
d1exp_qual0_errck
( loc: loc_t
, tok1: token
, d1e2: d1exp): d1exp =
let
val lvl = errvl(d1e2)
in//let
d1exp_errck
(lvl+1, d1exp(loc, D1Equal0(tok1,d1e2)))
endlet // end of [d1exp_qual0_errck(...)]
(* ****** ****** *)
//
fun
d1exp_exists_errck
( loc
: loc_t
, tknd
: token
, d1es
: d1explst
, d1e1: d1exp): d1exp =
let
val lvl =
maxs(errvl(d1es), errvl(d1e1))
in//let
d1exp_errck
( lvl+1
, d1exp(loc, D1Eexists(tknd,d1es,d1e1)))
endlet // end of [d1exp_exists_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d1exp_synext_errck
( loc: loc_t
, tknd: token
, gexp: g1exp): d1exp =
let
val lvl = errvl(gexp)
in//let
d1exp_errck
(
lvl+1, d1exp(loc,D1Esynext(tknd, gexp)))
endlet // end of [d1exp_synext_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
tread01_d1exp
  (d1e0, err) =
(
case+
d1e0.node() of
//
| D1Eid0 _ => d1e0
//
| D1Eint _ => d1e0
| D1Echr _ => d1e0
| D1Eflt _ => d1e0
| D1Estr _ => d1e0
//
| D1Eb0sh() => d1e0
(*
( err := err+1
; d1exp_b0sh_errck(loc0))
*)
| D1Eb1sh(d1e1) => d1e0
(*
let
//
val d1e1 =
  tread01_d1exp(d1e1, err)
//
in//let
( err := err+1
; d1exp_b1sh_errck(loc0,d1e1))
endlet // end of [D1Eb1sh(d1e1)]
*)
//
| D1Ea0pp() =>
(
d1exp_a0pp_errck(loc0)
) where
{ val () = ( err := err + 1 ) }
//
|
D1Ea1pp
( d1e1, d1e2) =>
let
//
val e00 = err
//
val
d1e1 = tread01_d1exp(d1e1, err)
val
d1e2 = tread01_d1exp(d1e2, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_a1pp_errck(loc0, d1e1, d1e2)
endlet // end of [D1Ea1pp(d1e1,d1e2)]
//
|
D1Ea2pp
( d1e1
, d1e2, d1e3) =>
let
//
val e00 = err
//
val
d1e1 = tread01_d1exp(d1e1, err)
val
d1e2 = tread01_d1exp(d1e2, err)
val
d1e3 = tread01_d1exp(d1e3, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_a2pp_errck(loc0,d1e1,d1e2,d1e3)
endlet//end-(D1Ea2pp(d1e1,d1e2,d1e3))
//
|
D1Esarg(s1es) =>
let
val e00 = err
//
val s1es =
  tread01_s1explst(s1es, err)
//
in//let
if
(err=e00)
then (d1e0)
else d1exp_sarg_errck(loc0, s1es )
endlet // end of [ D1Esarg( s1es ) ]
|
D1Etarg(s1es) =>
let
val e00 = err
//
val s1es =
  tread01_s1explst(s1es, err)
//
in//let
if
(err=e00)
then (d1e0)
else d1exp_targ_errck(loc0, s1es )
endlet // end of [ D1Etarg( s1es ) ]
//
|
D1El1st(d1es) =>
let
//
val e00 = err
//
val d1es =
  tread01_d1explst(d1es, err)
//
in//let
if
(err=e00)
then (d1e0)
else d1exp_l1st_errck(loc0, d1es )
endlet // end of [ D1El1st( d1es ) ]
|
D1El2st
( des1, des2) =>
let
//
val e00 = err
//
val des1 =
  tread01_d1explst(des1, err)
val des2 =
  tread01_d1explst(des2, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_l2st_errck(loc0, des1, des2)
endlet // end of [D1El2st(des1,des2)]
//
|
D1Es1eq(d1es) =>
let
//
val e00 = err
//
val d1es =
  tread01_d1explst(d1es, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_s1eq_errck( loc0, d1es )
endlet // end of [D1Es1eq(d1es)]
|
D1Es2eq(des1,des2) =>
let
//
val e00 = err
//
val des1 =
  tread01_d1explst(des1, err)
val des2 =
  tread01_d1explst(des2, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_s2eq_errck(loc0, des1, des2)
endlet // end of [D1Es2eq(des1,des2)]
//
|
D1Eift0
( d1e1
, dthn, dels) =>
let
//
val e00 = err
//
val d1e1 =
tread01_d1exp(d1e1, err)
val dthn =
tread01_d1expopt(dthn, err)
val dels =
tread01_d1expopt(dels, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_ift0_errck(loc0,d1e1,dthn,dels)
endlet//end-[D1Eift0(d1e1,dthn,dels)]
|
D1Eift1
( d1e1, dthn
, dels, tinv) =>
let
//
val e00 = err
//
val d1e1 =
tread01_d1exp(d1e1, err)
val dthn =
tread01_d1expopt(dthn, err)
val dels =
tread01_d1expopt(dels, err)
//
val
tinv = tread01_t1inv(tinv, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_ift1_errck
( loc0 , d1e1 , dthn , dels , tinv )
endlet//end-[D1Eift1(d1e1,dthn,dels)]
//
|
D1Ecas0
( tknd
, d1e1, dcls) =>
let
//
val e00 = err
//
val d1e1 =
tread01_d1exp(d1e1, err)
val dcls =
tread01_d1clslst(dcls, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_cas0_errck(loc0,tknd,d1e1,dcls)
endlet//end-(D1Ecas0(tknd,d1e1,dcls))
|
D1Ecas1
( tknd
, d1e1
, dcls, tinv) =>
let
//
val e00 = err
//
val d1e1 =
tread01_d1exp(d1e1, err)
val dcls =
tread01_d1clslst(dcls, err)
//
val
tinv = tread01_t1inv(tinv, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_cas1_errck
( loc0 , tknd , d1e1 , dcls , tinv )
endlet//end-[D1Ecas1(tknd,d1e1,dcls)]
//
|
D1Elet0
( d1cs, d1e1) =>
let
//
val e00 = err
//
val
d1cs =
tread01_d1eclist(d1cs, err)
val
d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_let0_errck(loc0 , d1cs , d1e1)
endlet // end of [D1Elet0(d1cs,d1e1)]
//
|
D1Et1up
( tknd, d1es) =>
let
//
val e00 = err
//
val d1es =
  tread01_d1explst(d1es, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_t1up_errck(loc0 , tknd , d1es)
endlet // end of [ D1Et1up(tknd,d1es) ]
|
D1Et2up
( tknd
, des1, des2) =>
let
//
val e00 = err
//
val des1 =
  tread01_d1explst(des1, err)
val des2 =
  tread01_d1explst(des2, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_t2up_errck(loc0,tknd,des1,des2)
endlet // end(D1Et2up(tknd,des1,des2))
//
|
D1Er1cd
( tknd, ldes) =>
let
//
val e00 = err
//
val ldes =
  tread01_l1d1elst(ldes, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_r1cd_errck( loc0 , tknd , ldes )
endlet // end of [ D1Er1cd(tknd,ldes) ]
|
D1Er2cd
( tknd
, lss1, lss2) =>
let
//
val e00 = err
//
val
lss1 = tread01_l1d1elst(lss1, err)
val
lss2 = tread01_l1d1elst(lss2, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_r2cd_errck(loc0,tknd,lss1,lss2)
endlet // end(D1Er2cd(tknd,lss1,lss2))
//
|
D1Elam0
( tknd
, f1as, sres
, arrw, d1e1) =>
let
//
val e00 = err
//
val f1as =
tread01_f1arglst(f1as, err)
//
val sres =
  tread01_s1res( sres, err )
val arrw =
  tread01_f1unarrw(arrw, err)
//
val
d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_lam0_errck
(loc0, tknd, f1as, sres, arrw, d1e1)
endlet // end-of-[ D1Elam0(  ...  ) ]
//
|
D1Efix0
( tknd
, deid
, f1as, sres
, arrw, d1e1) =>
let
//
val e00 = err
//
val f1as =
tread01_f1arglst(f1as, err)
//
val sres =
  tread01_s1res( sres, err )
val arrw =
  tread01_f1unarrw(arrw, err)
//
val
d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_fix0_errck
(loc0,tknd,deid,f1as,sres,arrw,d1e1)
endlet // end-of-[ D1Efix0(  ...  ) ]
//
|
D1Etry0
( tknd
, d1e1, d1cs) =>
let
//
val e00 = err
//
val d1e1 =
tread01_d1exp(d1e1, err)
val d1cs =
tread01_d1clslst(d1cs, err)
//
in//let
d1exp_try0_errck(loc0,tknd,d1e1,d1cs)
endlet // end(D1Etry0(tknd,d1e1,d1cs))
//
(* ****** ****** *)
//
|
D1Ewhere
( d1e1, d1cs) =>
let
//
val e00 = err
//
val
d1cs =
tread01_d1eclist(d1cs, err)
val
d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_where_errck(loc0 , d1e1 , d1cs)
endlet // end of [D1Ewhere(d1cs,d1es)]
//
(* ****** ****** *)
//
|
D1Ebrckt(d1es) =>
let
//
val e00 = err
//
val d1es =
tread01_d1explst(d1es, err)
//
in//let
if
(err=e00)
then (d1e0)
else d1exp_brckt_errck( loc0 , d1es )
endlet // end of [ D1Ebrckt(  d1es  ) ]
|
D1Edtsel
( tknd
, lab1, dopt) =>
let
//
val e00 = err
//
val dopt =
tread01_d1expopt(dopt, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_dtsel_errck(loc0,tknd,lab1,dopt)
endlet//end-of(D1Edtsel(tknd,lab1,dopt))
//
(* ****** ****** *)
//
|
D1Eraise
( tknd, d1e1) =>
let
//
val e00 = err
//
val d1e1 =
tread01_d1exp(d1e1, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_raise_errck( loc0, tknd, d1e1 )
endlet // end of [D1Eraise(tknd,d1e1)]
//
(* ****** ****** *)
//
|
D1Eannot
( d1e1, s1e2) =>
let
//
val e00 = err
//
val d1e1 =
tread01_d1exp(d1e1, err)
val s1e2 =
tread01_s1exp(s1e2, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_annot_errck( loc0, d1e1, s1e2 )
endlet // end of [D1Eannot(d1e1,s1e2)]
//
|
D1Equal0
( tok1, d1e2) =>
let
//
val e00 = err
//
val
d1e2 = tread01_d1exp(d1e2, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_qual0_errck( loc0, tok1, d1e2 )
endlet // end of [D1Equal0(tok1,d1e2)]
//
|
D1Enone0
(  (*nil*)  ) => (       d1e0       )
//
(* ****** ****** *)
|
D1Eextnam
( tknd, gnam) => d1e0//HX:fixity-less
//
(* ****** ****** *)
//
|
D1Eexists
( tknd
, d1es, d1e1) =>
let
//
val e00 = err
//
val d1es =
tread01_d1explst(d1es, err)
//
val
d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if
(err=e00)
then (d1e0) else
d1exp_exists_errck(loc0,tknd,d1es,d1e1)
endlet//end-[D1Eexists(tknd,d1es,d1e1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|
D1Esynext
( tknd, gexp) =>
let
//
val e00 = err
//
val gexp =
tread01_g1exp(gexp, err)
//
in//let
if
(err=e00)
then (d1e0) else
(
  d1exp_synext_errck(loc0,tknd,gexp))
endlet//end-of-[D1Esynext(tknd, d1e1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|
_(* otherwise *) =>
let
val lvl0 = 1
in//let
(
err := err+1; d1exp_errck(lvl0, d1e0) )
end(*let*)//end-of-[ _(* otherwise *) ]
//
) where
{
(* ****** ****** *)
//
val loc0 = d1e0.lctn((*void*))//needed
//
(* ****** ****** *)
//
(*
val (  ) =
prerrsln("tread01_d1exp: loc0 = ", loc0)
val (  ) =
prerrsln("tread01_d1exp: d1e0 = ", d1e0)
*)
//
} (*where*)//end(tread01_d1exp(d1e0,err))

(* ****** ****** *)

#implfun
tread01_l1d1e
  (ld1e, err) =
let
//
val e00 = err
//
val+
D1LAB(lab0, d1e1) = ld1e
//
val
d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if // if
(err=e00)
then (ld1e) else D1LAB(lab0, d1e1)
end (*let*)//end(tread01_l1d1e(ld1e,err))

(* ****** ****** *)
//
#implfun
tread01_f1arg
  (farg, err) =
(
case+
farg.node() of
//
(*
|
F1ARGnone(tok)
*)
|
F1ARGdapp(d1p1) =>
let
val e00 = err
val d1p1 =
tread01_d1pat(d1p1, err)
in//let
if
(err=e00)
then (farg) else
f1arg
(farg.lctn(), F1ARGdapp(d1p1))
endlet // end of [F1ARGdapp(d1p1)]
|
F1ARGsapp(s1qs) =>
let
//
val e00 = err
//
val s1qs =
tread01_s1qualst(s1qs, err)
//
in//let
if
(err=e00)
then (farg) else
f1arg
(farg.lctn(), F1ARGsapp(s1qs))
endlet // end of [F1ARGsapp(s1qs)]
|
F1ARGmets(s1es) =>
let
//
val e00 = err
//
val s1es =
tread01_s1explst(s1es, err)
//
in//let
if
(err=e00)
then (farg) else
f1arg
(farg.lctn(), F1ARGmets(s1es))
endlet // end of [F1ARGmets(s1es)]
//
) (*case+*)//end-of[tread01_f1arg(farg,err)]
//
(* ****** ****** *)
//
#implfun
tread01_d1gua
  (dgua, err) =
(
case+
dgua.node() of
|
D1GUAexp
( d1e1 ) => let
//
val e00 = err
//
val
d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if
(err = e00)
then (dgua) else
d1gua(dgua.lctn(), D1GUAexp(d1e1))
endlet // end of [ D1GUAexp(d1e1) ]
|
D1GUAmat
(d1e1,d1p2) =>
let
//
val e00 = err
//
val
d1e1 = tread01_d1exp(d1e1, err)
//
val d1p2 = tread01_d1pat(d1p2, err)
//
in//let
if
(err = e00)
then (dgua) else
d1gua(dgua.lctn(), D1GUAmat(d1e1,d1p2))
endlet // end of [ D1GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread01_d1gua(dgua,err)]
//
(* ****** ****** *)
//
#implfun
tread01_d1gpt
  (dgpt, err) =
(
case+
dgpt.node() of
|
D1GPTpat
( d1p1 ) => let
//
val e00 = err
//
val
d1p1 = tread01_d1pat(d1p1, err)
//
in//let
if
(err = e00)
then (dgpt) else
d1gpt(dgpt.lctn(), D1GPTpat(d1p1))
endlet // end of [ D1GPTpat(d1p1) ]
|
D1GPTgua
(d1p1,d1gs) =>
let
//
val e00 = err
//
val d1p1 = tread01_d1pat(d1p1, err)
//
val d1gs = tread01_d1gualst(d1gs, err)
//
in//let
if
(err = e00)
then (dgpt) else
d1gpt(dgpt.lctn(), D1GPTgua(d1p1,d1gs))
endlet // end of [ D1GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread01_d1gpt(dgpt,err)]
//
(* ****** ****** *)
//
#implfun
tread01_d1cls
  (dcls, err) =
(
case+
dcls.node() of
|
D1CLSgpt
( dgpt ) => let
//
val e00 = err
//
val dgpt =
tread01_d1gpt(dgpt, err)
in//let
if
(err=e00)
then (dcls)
else
d1cls(dcls.lctn(), D1CLSgpt(dgpt))
end (*let*)//end-of[D1CLSgpt(dgpt)]
|
D1CLScls
(dgpt,d1e1) =>
let
//
val e00 = err
//
val dgpt = tread01_d1gpt(dgpt, err)
val d1e1 = tread01_d1exp(d1e1, err)
//
in//let
if
(err=e00)
then (dcls)
else
d1cls(dcls.lctn(), D1CLScls(dgpt,d1e1))
endlet // end-of-[ D1CLScls(_,_,_) ]
) (*case+*)//end-of-[tread01_d1cls(dcls,err)]
//
(* ****** ****** *)
//
#implfun
tread01_t1qua
  (t1q0, err) =
(
case+ t1q0 of
|
T1QUAsome(loc0, s1qs) =>
let
//
val e00 = err
//
val s1qs =
tread01_s1qualst(s1qs, err)
//
in//let
if
(err=e00)
then t1q0 else T1QUAsome(loc0, s1qs)
endlet // end of [T1QUAsome(loc0,s1qs)]
) (*case+*) // end of [tread01_t1qua(t1q0,err)]
//
(* ****** ****** *)
//
#implfun
tread01_t1inv
  (tinv, err) =
(
case+ tinv of
|
T1INVsome
( loc0
, t1qs, d1ps) =>
let
val e00 = err
//
val t1qs =
tread01_t1qualst(t1qs, err)
val d1ps =
tread01_d1patlst(d1ps, err)
//
in//let
if
(err=e00)
then tinv else T1INVsome(loc0, t1qs, d1ps)
endlet // end of [T1INVsom(loc0,t1qs,d1ps)]
) (*case+*) // end of [tread01_t1inv(tinv,err)]
//
(* ****** ****** *)
//
#implfun
tread01_a1typ
  (a1t0, err) =
(
case+
a1t0.node() of
//
(*
|
A1TYPnone(tok) => a1t0
*)
//
|
A1TYPsome(s1e1,topt) =>
let
val e00 = err
val s1e1 = tread01_s1exp(s1e1, err)
in//let
if
(err=e00)
then (a1t0) else
a1typ
(a1t0.lctn(), A1TYPsome(s1e1,topt))
endlet // end of [A1TYPsome(s1e1,topt)]
) (*case+*)//end-of[tread01_a1typ(a1t0,err)]
//
(* ****** ****** *)
//
#implfun
tread01_d1arg
  (darg, err) =
(
case+
darg.node() of
//
(*
| D1ARGnone(tok)
*)
|
D1ARGsta0(s1qs) =>
let
//
val e00 = err
//
val s1qs =
tread01_s1qualst(s1qs, err)
//
in//let
if
(err=e00)
then (darg) else
d1arg
(darg.lctn(), D1ARGsta0(s1qs))
endlet // end of [D1ARGsta0(s1qs)]
|
D1ARGdyn1(dpid) => darg
|
D1ARGdyn2(ats1,opt2) =>
let
//
val e00 = err
//
val ats1 =
tread01_a1typlst(ats1, err)
val opt2 =
tread01_a1typlstopt(opt2, err)
//
in//let
if
(err=e00)
then (darg) else
d1arg
(darg.lctn(), D1ARGdyn2(ats1,opt2))
endlet // end of [D1ARGdyn2(ats1,opt2)]
) (*case+*)//end-of[tread01_d1arg(darg,err)]
//
(* ****** ****** *)
//
#implfun
tread01_s1res
  (sres, err) =
(
case+ sres of
|
S1RESnone() => sres
|
S1RESsome(seff,s1e1) =>
let
//
val e00 = err
//
(*
val seff =
tread01_s1eff(seff, err)
*)
val s1e1 =
tread01_s1exp(s1e1, err)
in
if
(err=e00)
then (sres) else S1RESsome(seff, s1e1)
endlet // end of [S1RESsome(seff,s1e1)]
) (*case+*)//end-of[tread01_s1res(sres,err)]
//
(* ****** ****** *)

#implfun
tread01_d1patlst
  (  d1ps, err  ) =
list_tread01_fnp(d1ps, err, tread01_d1pat)
#implfun
tread01_l1d1plst
  (  ldps, err  ) =
list_tread01_fnp(ldps, err, tread01_l1d1p)

(* ****** ****** *)

#implfun
tread01_d1explst
  (  d1es, err  ) =
list_tread01_fnp(d1es, err, tread01_d1exp)
#implfun
tread01_d1expopt
  (  dopt, err  ) =
optn_tread01_fnp(dopt, err, tread01_d1exp)
#implfun
tread01_l1d1elst
  (  ldes, err  ) =
list_tread01_fnp(ldes, err, tread01_l1d1e)

(* ****** ****** *)
//
#implfun
tread01_f1arglst
  (  f1as, err  ) =
list_tread01_fnp(f1as, err, tread01_f1arg)
//
(* ****** ****** *)
//
#implfun
tread01_t1qualst
  (  tqas, err  ) =
list_tread01_fnp(tqas, err, tread01_t1qua)
//
(* ****** ****** *)

#implfun
tread01_f1unarrw
  (  arrw, err  ) =
(
case+ arrw of
|
F1UNARRWdflt
(   loc0   ) => arrw
|
F1UNARRWlist
(loc0, s1es) =>
let
val e00 = err
val s1es =
tread01_s1explst(s1es, err)
//
in//let
if
(err=e00)
then arrw else F1UNARRWlist(loc0, s1es)
endlet // end of [F1UNARRWlist(...)]
) (*case+*)//end-of(tread01_f1unarrw(...))

(* ****** ****** *)
//
#implfun
tread01_d1gualst
  (  d1gs, err  ) =
list_tread01_fnp(d1gs, err, tread01_d1gua)
#implfun
tread01_d1clslst
  (  d1cs, err  ) =
list_tread01_fnp(d1cs, err, tread01_d1cls)
//
(* ****** ****** *)
//
#implfun
tread01_a1typlst
  (  a1ts, err  ) =
list_tread01_fnp(a1ts, err, tread01_a1typ)
#implfun
tread01_d1arglst
  (  d1as, err  ) =
list_tread01_fnp(d1as, err, tread01_d1arg)
//
(* ****** ****** *)
//
#implfun
tread01_a1typlstopt
  (  aopt, err  ) =
optn_tread01_fnp(aopt, err, tread01_a1typlst)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread01_dynexp.dats] *)
