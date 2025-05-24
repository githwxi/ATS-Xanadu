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
Start Time: June 17th, 2022
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
(* ****** ****** *)
#staload "./../SATS/pread00.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with l0abl_get_lctn
#symload node with l0abl_get_node
(* ****** ****** *)
#symload lctn with s0ymb_get_lctn
#symload node with s0ymb_get_node
(* ****** ****** *)
#symload lctn with g0exp_get_lctn
#symload node with g0exp_get_node
(* ****** ****** *)
#symload lctn with g0mag_get_lctn
#symload node with g0mag_get_node
(* ****** ****** *)
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
(* ****** ****** *)
#symload node with s0arg_get_node
#symload node with s0mag_get_node
#symload node with t0arg_get_node
#symload node with t0mag_get_node
#symload node with s0qua_get_node
(* ****** ****** *)
#symload lctn with s0tdf_get_lctn
#symload node with s0tdf_get_node
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
pread00_i0dnt
  (id0, err) =
(
case+
id0.node() of
|
I0DNTsome _ => (id0)
|
I0DNTnone _ =>
let
val () = (err := err+1) in id0
end (*let*)//end-of-[I0DNTnone]
) (*case+*)//end-of-[pread00_i0dnt]
//
(* ****** ****** *)
//
#implfun
pread00_l0abl
  (l0ab, err) =
(
case+
l0ab.node() of
|
L0ABLsome(lab) => l0ab
|
L0ABLnone(tok) => l0ab
where{ val () = err := err+1 }
) (*case+*)//end-of-[pread00_l0abl]
//
(* ****** ****** *)
//
#implfun
pread00_s0ymb
  (symb, err) =
(
case+
symb.node() of
|
S0YMBi0dnt
(  deid  ) => symb where
{
val deid =
pread00_i0dnt(deid, err) }
|
S0YMBbrckt(tkb,tke) => symb
) (*case+*)//end-of-[pread00_s0ymb]
//
(* ****** ****** *)
//
#implfun
pread00_s0qid
  (sqid, err) =
(
case+ sqid of
|
S0QIDnone(id0) =>
let
val
id0 =
pread00_i0dnt(id0, err) in sqid
end
|
S0QIDsome(tok, id0) =>
let
val
id0 =
pread00_i0dnt(id0, err) in sqid
end
) (*case+*)//end-of-[pread00_s0qid]
//
(* ****** ****** *)
//
#implfun
pread00_d0qid
  (dqid, err) =
(
case+ dqid of
|
D0QIDnone(id0) =>
let
val
id0 =
pread00_i0dnt(id0, err) in dqid
end
|
D0QIDsome(tok, id0) =>
let
val
id0 =
pread00_i0dnt(id0, err) in dqid
end
) (*case+*)//end-of-[pread00_d0qid]
//
(* ****** ****** *)
//
fun
g0exp_errck
(lvl: sint
,g0e: g0exp): g0exp =
(
g0exp
(g0e.lctn(), G0Eerrck(lvl, g0e)))
//
(* ****** ****** *)
//
fun
g0exp_apps_errck
( loc
: loc_t
, ges
: g0explst): g0exp =
let
val lvl = 0 // errvl(ges)
in//let
g0exp_errck
(lvl+1, g0exp(loc, G0Eapps( ges )))
end (*let*) // end of [g0exp_apps_errck]
//
fun
g0exp_lpar_errck
( loc
: loc_t
, tkb
: token
, ges
: g0explst
, tke
: token   ): g0exp =
let
val lvl = 0 // errvl(ges)
in//let
g0exp_errck
(lvl+1, g0exp(loc,G0Elpar(tkb,ges,tke)))
end (*let*) // end of [g0exp_lpar_errck]
//
(* ****** ****** *)
//
fun
g0exp_ift0_errck
( loc
: loc_t
, tift
: token
, g0e1
: g0exp
, gthn:
g0exp_THEN
, gels:
g0exp_ELSE
, tend
: tokenopt): g0exp =
let
val lvl = 0 // errvl(ges)
in//let
g0exp_errck
( lvl+1
, g0exp(loc,G0Eift0(tift,g0e1,gthn,gels,tend)))
end (*let*) // end of [g0exp_ift0_errck]
//
(* ****** ****** *)

#implfun
pread00_g0exp
( g0e, err ) =
(
case+
g0e.node() of
//
| G0Eid0 _ => g0e
//
| G0Eint _ => g0e
| G0Echr _ => g0e
| G0Eflt _ => g0e
| G0Estr _ => g0e
//
|
G0Eapps _ => f0_apps(g0e, err)
|
G0Elpar _ => f0_lpar(g0e, err)
//
|G0Eift0 _ => f0_ift0( g0e, err )
//
|
G0Etkerr _ =>
(err := err+1; g0exp_errck(1, g0e))
//
|
_(*otherwise*) =>
(err := err+1; g0exp_errck(1, g0e))
//
) where // end-of(case(g0e.node()))
{
//
(* ****** ****** *)
//
fun
f0_apps
( g0e
: g0exp
, err
: &sint >> _): g0exp =
let
val e00 = err
val-
G0Eapps(ges) = g0e.node()
val ges = pread00_g0explst(ges, err)
in//let
if
(err=e00)
then (g0e)
else g0exp_apps_errck(g0e.lctn(), ges)
end (*let*) // end of [f0_apps]
//
(* ****** ****** *)
//
fun
f0_lpar
( g0e
: g0exp
, err
: &sint >> _): g0exp =
let
//
val e00 = err
//
val-
G0Elpar
(tkb,ges,tke) = g0e.node()
//
val ges =
pread00_g0explst(ges, err)
//
val ( ) = // tke: T_RPAREN
(
case+
tke.node() of
| T_RPAREN() => ()
| _(* else *) => (err := err+1)
)
in//let
if
(err=e00)
then (g0e) else
g0exp_lpar_errck(g0e.lctn(), tkb, ges, tke)
end (*let*) // end of [f0_lpar]
//
(* ****** ****** *)
//
fun
f0_ift0
( g0e
: g0exp
, err
: &sint >> _): g0exp =
let
//
val e00 = err
//
val-
G0Eift0
( tift
, g0e1
, gthn
, gels
, tend ) = g0e.node()
//
val g0e1 =
pread00_g0exp(g0e1, err)
//
val gthn =
(
case+ gthn of
|
g0exp_THEN(tok1, g0e2) =>
let
//
val e00 = err
//
val ( ) =
(
case+
tok1.node() of
|
T_THEN() => ()
|
_(*non-T_THEN*) =>
( err := err + 1 )): void
//
val g0e2 =
  pread00_g0exp(g0e2, err)
//
in//let
if
(err=e00)
then gthn else
g0exp_THEN(tok1, g0e2) end): g0exp_THEN
//
val gels =
(
case+ gels of
|
g0exp_ELSE(tok1, g0e3) =>
let
val e00 = err
val ( ) =
(
case+
tok1.node() of
|
T_ELSE() => ()
|
_(*non-T_ELSE*) =>
( err := err + 1 )): void
//
val g0e3 =
  pread00_g0exp(g0e3, err)
//
in//let
if
(err=e00)
then gels else
g0exp_ELSE(tok1, g0e3) end): g0exp_ELSE
//
in//let
if
(err=e00)
then (g0e) else
g0exp_ift0_errck
(g0e.lctn(), tift, g0e1, gthn, gels, tend)
end (*let*) // end of [ f_ift0(g0e, err) ]
//
(* ****** ****** *)
//
} (*where*) // end of [pread00_g0exp(g0e,err)]

(* ****** ****** *)
//
#implfun
pread00_g0mag
( gma, err ) =
(
case+ gma.node() of
|
G0MAGnone(tok) =>
(err := err + 1; gma)
|
G0MAGsarg
(tbeg, g0as, tend) =>
let
//
val e00 = err
//
val g0as =
pread00_i0dntlst(g0as, err)
//
val (  ) =
(
case+
tend.node() of
| T_RBRACE() => ()
| _ => (err := err+1)): void
//
in//let
if
(err=e00)
then gma else
g0mag_make_node
(gma.lctn(),G0MAGsarg(tbeg, g0as, tend))
endlet // end of [G0MAGsarg(_,_,_)]
|
G0MAGdarg
(tbeg, g0as, tend) =>
let
//
val e00 = err
//
val g0as =
pread00_i0dntlst(g0as, err)
//
val (  ) =
(
case+
tend.node() of
| T_RPAREN() => ()
| _ => (err := err+1)): void
//
in//let
if
(err=e00)
then gma else
g0mag_make_node
(gma.lctn(), G0MAGsarg(tbeg, g0as, tend))
endlet // end of [G0MAGdarg(_,_,_)]
) (*case+*) // end of [pread00_g0mag(gma,err)]
//
(* ****** ****** *)
//
fun
sort0_errck
(lvl: sint
,s0t: sort0): sort0 =
(
sort0
(s0t.lctn(), S0Terrck(lvl, s0t)))
//
(* ****** ****** *)
fun
sort0_errvl_a1
(s0t: sort0): sint =
(
case+ s0t.node() of
|
S0Terrck
(lvl, _) => lvl | _ => 0
)
#symload
sort0_errvl with sort0_errvl_a1
#symload errvl with sort0_errvl_a1
(* ****** ****** *)
fun
sort0_errvl_a2
(st1: sort0
,st2: sort0): sint =
maxs
(errvl(st1),errvl(st2))
#symload
sort0_errvl with sort0_errvl_a2
#symload errvl with sort0_errvl_a2
(* ****** ****** *)
fun
sort0_errvl_a3
(st1: sort0
,st2: sort0
,st3: sort0): sint =
maxs
(errvl(st1)
,errvl(st2),errvl(st3))
#symload
sort0_errvl with sort0_errvl_a3
#symload errvl with sort0_errvl_a3
(* ****** ****** *)
//
#extern
fun
sort0_errvl_sts
(sts: sort0lst): sint
#symload errvl with sort0_errvl_sts
//
#implfun
sort0_errvl_sts(sts) =
(
case+ sts of
|
list_nil
((*nil*)) => 0
|
list_cons
(st1,sts) => maxs(errvl(st1),errvl(sts)))
//
(* ****** ****** *)
//
fun
sort0_apps_errck
( loc
: loc_t
, sts
: sort0lst): sort0 =
let
val lvl = errvl(sts)
in//let
sort0_errck(lvl+1, sort0(loc,S0Tapps(sts)))
end (*let*) // end of [sort0_apps_errck]
//
fun
sort0_lpar_errck
( loc
: loc_t
, tkb
: token
, sts
: sort0lst
, tke
: token   ): sort0 =
let
  val lvl = errvl(sts)
in//let
sort0_errck(lvl+1, sort0(loc,S0Tlpar(tkb,sts,tke)))
end (*let*) // end of [sort0_lpar_errck]
//
(* ****** ****** *)
//
#implfun
pread00_sort0
  (s0t, err) =
(
case+
s0t.node() of
//
| S0Tid0 _ => s0t
| S0Tint _ => s0t
//
|
S0Tqid _ => f0_qid(s0t, err)
|
S0Tapps _ => f0_apps(s0t, err)
//
|
S0Tlpar _ => f0_lpar(s0t, err)
//
|
S0Ttkerr _ =>
(err := err+1; sort0_errck(1, s0t))
//
|
_(*otherwise*) =>
(err := err+1; sort0_errck(1, s0t))
) where//end-of(case(s0t.node()))
{
//
fun
f0_qid
( s0t
: sort0
, err
: &sint >> _): sort0 =
( err := err+1; sort0_errck(1, s0t) )
//
fun
f0_apps
( s0t
: sort0
, err
: &sint >> _): sort0 =
let
val e00 = err
val-
S0Tapps(sts) = s0t.node()
val sts = pread00_sort0lst(sts, err)
in//let
if
(err = e00)
then s0t else sort0_apps_errck(s0t.lctn(), sts)
end (*let*) // end of [f0_apps]
//
fun
f0_lpar
( s0t
: sort0
, err
: &sint >> _): sort0 =
let
//
val e00 = err
//
val-
S0Tlpar
(tkb,sts,tke) = s0t.node()
//
val sts =
pread00_sort0lst(sts, err)
//
val ( ) = // tke: T_RPAREN
(
case+
tke.node() of
| T_RPAREN() => ()
| _(* else *) => (err := err+1)
)
in//let
if
(err = e00)
then s0t else sort0_lpar_errck(s0t.lctn(),tkb,sts,tke)
end (*let*) // end of [f0_lpar]
//
} (*where*) // end of [pread00_sort0(s0t,err)]
//
(* ****** ****** *)
//
fun
s0exp_errck
(lvl: sint
,s0e: s0exp): s0exp =
(
s0exp
(s0e.lctn(), S0Eerrck(lvl, s0e))
)//end-of-[s0exp_errck(_,_)]
//
(* ****** ****** *)
fun
s0exp_errvl_a1
(s0e: s0exp): sint =
(
case+ s0e.node() of
|
S0Eerrck
(lvl, _) => lvl | _ => 0
)
#symload
s0exp_errvl with s0exp_errvl_a1
#symload errvl with s0exp_errvl_a1
(* ****** ****** *)
fun
s0exp_errvl_a2
(se1: s0exp
,se2: s0exp): sint =
maxs
(errvl(se1),errvl(se2))
#symload
s0exp_errvl with s0exp_errvl_a2
#symload errvl with s0exp_errvl_a2
(* ****** ****** *)
fun
s0exp_errvl_a3
(se1: s0exp
,se2: s0exp
,se3: s0exp): sint =
maxs
(errvl(se1)
,errvl(se2),errvl(se3))
#symload
s0exp_errvl with s0exp_errvl_a3
#symload errvl with s0exp_errvl_a3
(* ****** ****** *)
//
#extern
fun
s0exp_errvl_ses
(ses: s0explst): sint
//
#implfun
s0exp_errvl_ses(ses) =
(
case+ ses of
|
list_nil((*nil*)) => 0
|
list_cons(se1,ses) =>
(
maxs
( errvl(se1),s0exp_errvl_ses(ses)))
endcas // end of [ case+(ses) ]
)
//
#symload errvl with s0exp_errvl_ses
//
(* ****** ****** *)
//
#extern
fun
s0exp_errvl_srp
(srp: s0exp_RPAREN): sint
#symload errvl with s0exp_errvl_srp
//
#implfun
s0exp_errvl_srp
(     srp     ) =
(
case+ srp of
|
s0exp_RPAREN_cons0(tok) => 0
|
s0exp_RPAREN_cons1(tkb,ses,tke) => errvl(ses)
)
//
(* ****** ****** *)
fun
l0s0e_errvl
(lse: l0s0e): sint =
(
  s0exp_errvl(s0e)) where
{
  val+
  S0LAB(lab, tok, s0e) = lse
}
#symload errvl with l0s0e_errvl
(* ****** ****** *)
//
#extern
fun
l0s0e_errvl_lses
(lses: l0s0elst): sint
//
#implfun
l0s0e_errvl_lses(lses) =
(
case+ lses of
|
list_nil((*nil*)) => 0
|
list_cons(lse1,lses) =>
(
maxs
( errvl(lse1)
, l0s0e_errvl_lses(lses)))
endcas // end of [ case+(lses) ]
)
//
#symload errvl with l0s0e_errvl_lses
//
(* ****** ****** *)
//
#extern
fun
l0s0e_errvl_lsrb
(lsrb: l0s0e_RBRACE): sint
//
#implfun
l0s0e_errvl_lsrb
(     lsrb     ) =
(
case+ lsrb of
|
l0s0e_RBRACE_cons0
(       tok      ) => 0
|
l0s0e_RBRACE_cons1
(  tkb,lses,tke  ) => errvl(lses)
)
//
#symload errvl with l0s0e_errvl_lsrb
//
(* ****** ****** *)
//
fun
s0exp_op1_errck
( loc
: loc_t
, tok
: token): s0exp =
let
val lvl = 0 in
s0exp_errck
(lvl+1, s0exp(loc,S0Eop1(tok)))
end (*let*) // end of [s0exp_op1_errck]
//
fun
s0exp_op2_errck
( loc
: loc_t
, tok
: token): s0exp =
let
val lvl = 0 in
s0exp_errck
(lvl+1, s0exp(loc,S0Eop2(tok)))
end (*let*) // end of [s0exp_op2_errck]
//
fun
s0exp_op3_errck
( loc
: loc_t
, tkb
: token
, id0
: i0dnt
, tke
: token): s0exp =
let
val lvl = 0
in//let
s0exp_errck
( lvl+1
, s0exp(loc, S0Eop3(tkb,id0,tke)))
end (*let*) // end of [s0exp_op3_errck]
//
(* ****** ****** *)
//
fun
s0exp_apps_errck
( loc
: loc_t
, ses
: s0explst): s0exp =
let
val lvl = s0exp_errvl_ses(ses)
in//let
s0exp_errck
(lvl+1, s0exp(loc,S0Eapps(ses)))
end (*let*) // end of [s0exp_apps_errck]
//
(* ****** ****** *)
//
fun
s0exp_fimp_errck
( loc
: loc_t
, tkb
: token
, ses
: s0explst
, tke
: token   ): s0exp =
let
val lvl = s0exp_errvl_ses(ses)
in//let
s0exp_errck
(lvl+1, s0exp(loc,S0Efimp(tkb,ses,tke)))
end (*let*) // end of [s0exp_fimp_errck]
//
(* ****** ****** *)
//
fun
s0exp_lpar_errck
( loc
: loc_t
, tkb
: token
, ses
: s0explst
, srp
: s0exp_RPAREN): s0exp =
let
val lvl =
(
  maxs(errvl(ses),errvl(srp)))
in//let
s0exp_errck
(lvl+1, s0exp(loc,S0Elpar(tkb,ses,srp)))
end (*let*) // end of [s0exp_lpar_errck]
//
(* ****** ****** *)
//
fun
s0exp_tup1_errck
( loc
: loc_t
, tkb
: token
, opt
: tokenopt
, ses
: s0explst
, srp
: s0exp_RPAREN): s0exp =
let
val lvl =
(
  maxs(errvl(ses),errvl(srp)))
in//let
s0exp_errck
( lvl+1
, s0exp(loc,S0Etup1(tkb,opt,ses,srp)))
end (*let*) // end of [s0exp_tup1_errck]
//
(* ****** ****** *)
//
fun
s0exp_rcd2_errck
( loc
: loc_t
, tkb
: token
, opt
: tokenopt
, lses
: l0s0elst
, lsrb
: l0s0e_RBRACE): s0exp =
let
val lvl =
(
  maxs(errvl(lses),errvl(lsrb)))
in//let
s0exp_errck
( lvl+1
, s0exp
  (loc, S0Ercd2(tkb, opt, lses, lsrb)))
end (*let*) // end of [s0exp_rcd2_errck]
//
(* ****** ****** *)
//
fun
s0exp_lams_errck
( loc
: loc_t
, tknd
: token
, smas
: s0maglst
, tres
: sort0opt
, arrw: token
, body: s0exp
, tend: tokenopt): s0exp =
let
  val lvl = s0exp_errvl(body)
in//let
s0exp_errck
(
lvl+1,
s0exp_make_node
(loc
,S0Elams
 (tknd, smas, tres, arrw, body, tend)))
end (*let*) // end of [s0exp_lams_errck]
//
(* ****** ****** *)
//
fun
s0exp_uni0_errck
( loc: loc_t
, tkb: token
, sqs: s0qualst
, tke: token   ): s0exp =
let
val lvl = 0 // errvl(sqs)
in//let
s0exp_errck
(lvl+1,s0exp(loc,S0Euni0(tkb,sqs,tke)))
end (*let*) // end of [s0exp_uni0_errck]
//
fun
s0exp_exi0_errck
( loc: loc_t
, tkb: token
, sqs: s0qualst
, tke: token   ): s0exp =
let
val lvl = 0 // errvl(sqs)
in//let
s0exp_errck
(lvl+1,s0exp(loc,S0Eexi0(tkb,sqs,tke)))
end (*let*) // end of [s0exp_exi0_errck]
//
(* ****** ****** *)
//
fun
s0exp_annot_errck
( loc: loc_t
, s0e: s0exp
, s0t: sort0): s0exp =
let
  val lvl = s0exp_errvl(s0e)
(*
//HX: errvl for [s0t] is not used
*)
in//let
s0exp_errck
(lvl+1, s0exp(loc, S0Eannot(s0e, s0t)))
end (*let*) // end of [s0exp_annot_errck]
//
(* ****** ****** *)
//
fun
s0exp_qual0_errck
( loc: loc_t
, tok: token
, se1: s0exp): s0exp =
let
  val lvl = s0exp_errvl(se1)
in//let
s0exp_errck
(lvl+1, s0exp(loc, S0Equal0(tok, se1)))
end (*let*) // end of [s0exp_qual0_errck]
//
(* ****** ****** *)
//
#implfun
pread00_s0arg
( s0a, err ) = (
case+
s0a.node() of
|
S0ARGnone(tok) =>
(err := err + 1; s0a)
|
S0ARGsome(id0, opt) =>
(
case+ opt of
|
optn_nil() => s0a
|
optn_cons(s0t) =>
let
val s0t = 
pread00_sort0
  (s0t, err) in s0a end//let
) where
{
val () =
(
case+
id0.node() of
|
I0DNTsome _ => ((*void*))
|
I0DNTnone _ => (err := err + 1)
) : void // end of [val ()]
} (*whr*) // end of [S0ARGsome]
) (*case*) // end of [pread00_s0arg(s0a,err)]
//
#implfun
pread00_s0arglst
  (s0as, err) =
(
case+ s0as of
|
list_nil() =>
list_nil((*nil*))
|
list_cons
(s0a1, sas1) => s0as where
{
  val s0a1 = pread00_s0arg(s0a1, err)
  val sas1 = pread00_s0arglst(sas1, err)
} // end of [list_cons(s0a1,s0as)]
) (*case*) // end-of-[pread00_s0arglst(s0as,err)]
//
(* ****** ****** *)
//
#implfun
pread00_s0mag
( sma, err ) =
(
//
case+
sma.node() of
|
S0MAGnone(tok) =>
(err := err + 1; sma)
//
|
S0MAGsing(s0a) =>
(
case+
s0a.node() of
|
I0DNTsome _ => sma
|
I0DNTnone _ => (err := err + 1; sma))
//
|
S0MAGlist
(tklp, s0as, tkrp) =>
let
val s0as =
pread00_s0arglst(s0as, err)
in//let
case+
tkrp.node() of
|
T_RPAREN() => sma
|
_(*non-T_RPAREN*) => (err := err+1; sma)
endlet // end of [S0MAGlst(_,_,_)]
//
) (*case*) // end of [pread00_s0mag(sma,err)]
//
#implfun
pread00_s0maglst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_s0mag)
//
(* ****** ****** *)
//
#implfun
pread00_t0arg
  (t0a, err) =
(
case+
t0a.node() of
|
T0ARGnone(tok) =>
(err := err + 1; t0a)
|
T0ARGsome(s0t, opt) =>
(
case+ opt of
|
optn_nil() =>
let
val s0t =
pread00_sort0(s0t, err) in t0a
end // optn_nil((*nil*))
|
optn_cons(tok) =>
let
val s0t =
pread00_sort0(s0t, err) in t0a
end where // optn_cons(tok)
{
(*
val () =
(
case+
tok.node() of
| T_IDALP _ => ()
| _(*non-T_IDALP*) => (err := err + 1))
*)
}
) (*case+*)//end of [T0ARGsome]
) (*case+*)//end of [pread00_t0arg(t0a,err)]
//
#implfun
pread00_t0arglst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_t0arg)
//
(* ****** ****** *)
//
#implfun
pread00_t0mag
( tma, err ) =
(
//
case+
tma.node() of
|
T0MAGnone(tok) =>
(err := err + 1; tma)
|
T0MAGlist
(tklp, t0as, tkrp) =>
let
val t0as =
pread00_t0arglst(t0as, err)
in//let
case+
tkrp.node() of
|
T_RPAREN() => tma
|
_(*non-T_RPAREN*) => (err := err+1; tma)
endlet // end of [T0MAGlst]
//
) (*case*) // end of [pread00_t0mag(tma,err)]
//
#implfun
pread00_t0maglst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_t0mag)
//
(* ****** ****** *)
//
#implfun
pread00_s0qua
  (s0q, err) =
(
case+
s0q.node() of
|
S0QUAprop
(  s0e  ) => s0q
where {
val s0e =
pread00_s0exp(s0e, err)
}
|
S0QUAvars
(ids, opt) => s0q
where {
val ids =
pread00_i0dntlst(ids, err)
val opt =
pread00_sort0opt(opt, err)
}
(*
|S0QUAsome _ => s0q
|S0QUAnone _ => (err := err + 1; s0q)
*)
) (*case*) // end of [pread00_s0qua(s0q,err)]
//
#implfun
pread00_s0qualst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_s0qua)
//
(* ****** ****** *)
//
#implfun
pread00_s0exp
  (s0e, err) =
(
//
case+
s0e.node() of
//
| S0Eid0 _ => s0e
//
| S0Eint _ => s0e
| S0Echr _ => s0e
| S0Eflt _ => s0e
| S0Estr _ => s0e
//
|
S0Eop1 _ => f0_op1(s0e, err)
|
S0Eop2 _ => f0_op2(s0e, err)
|
S0Eop3 _ => f0_op3(s0e, err)
//
|
S0Eapps _ => f0_apps(s0e, err)
|
S0Efimp _ => f0_fimp(s0e, err)
|
S0Elpar _ => f0_lpar(s0e, err)
//
|
S0Etup1 _ => f0_tup1(s0e, err)
|
S0Ercd2 _ => f0_rcd2(s0e, err)
//
|
S0Elams _ => f0_lams(s0e, err)
//
|
S0Euni0 _ => f0_uni0(s0e, err)
|
S0Eexi0 _ => f0_exi0(s0e, err)
//
|
S0Eannot _ => f0_annot(s0e, err)
|
S0Equal0 _ => f0_qual0(s0e, err)
//
|
S0Etkerr _ =>
(err := err+1; s0exp_errck(1, s0e))
//
|
_(*otherwise*) =>
(err := err+1; s0exp_errck(1, s0e))
//
) where // end-of(case(s0e.node()))
{
//
fun
f0_op1
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val-
S0Eop1(tok) = s0e.node()
in//let
//
s0exp_op1_errck(s0e.lctn(), tok)
//
end(*let*)//end-of(f0_op1(s0e,err))
//
fun
f0_op2
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Eop2(tok) = s0e.node()
in//let
//
case+
tok.node() of
|
T_IDSYM _ => s0e
|
_(*else*) => // HX: invalid
s0exp_op2_errck(s0e.lctn(), tok)
//
end(*let*)//end-of(f0_op2(s0e,err))
//
fun
f0_op3
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Eop3
(tkb, id0, tke) = s0e.node()
//
val ( ) =
(
case+
id0.node() of
| I0DNTsome _ => ()
| _(* else *) => (err := err+1)
)
//
val ( ) =
(
case+
tke.node() of
| T_RPAREN() => ()
| _(* else *) => (err := err+1)
)
in//let
//
if
(err = e00)
then s0e else
s0exp_op3_errck(s0e.lctn(), tkb, id0, tke)
//
end(*let*)//end-of(f0_op3(s0e,err))
//
fun
f0_apps
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Eapps(sts) = s0e.node()
//
val ses = pread00_s0explst(sts, err)
//
in//let
if
(err = e00)
then s0e else s0exp_apps_errck(s0e.lctn(), ses)
end (*let*) // end of [f0_apps]
//
(* ****** ****** *)
//
fun
f0_fimp
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Efimp
(tkb,ses,tke) = s0e.node()
//
val ses =
pread00_s0explst(ses, err)
val ( ) =
(
case+
tke.node() of
| T_GT0() => ()
| _(*else*) => (err := err+1)
)
in//let
if
(err = e00)
then s0e else
s0exp_fimp_errck(s0e.lctn(),tkb,ses,tke)
end (*let*) // end of [f0_lpar]
//
(* ****** ****** *)
//
fun
f0_lpar
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Elpar
(tkb,ses,srp) = s0e.node()
//
val ses =
pread00_s0explst(ses, err)
val srp =
pread00_s0exp_RPAREN(srp, err)
in//let
if
(err = e00)
then s0e else
s0exp_lpar_errck(s0e.lctn(),tkb,ses,srp)
end (*let*) // end of [f0_lpar]
//
(* ****** ****** *)
//
fun
f0_tup1
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Etup1
(tkb,opt,ses,srp) = s0e.node()
//
val ses =
pread00_s0explst(ses, err)
val srp =
pread00_s0exp_RPAREN(srp, err)
in//let
if
(err = e00)
then s0e else
s0exp_tup1_errck(s0e.lctn(),tkb,opt,ses,srp)
end (*let*) // end of [f0_tup1]
//
(* ****** ****** *)
//
fun
f0_rcd2
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Ercd2
(tkb,opt,lses,lsrb) = s0e.node()
//
val lses =
pread00_l0s0elst(lses, err)
val srp =
pread00_l0s0e_RBRACE(lsrb, err)
in//let
if
(err = e00)
then s0e else
s0exp_rcd2_errck(s0e.lctn(),tkb,opt,lses,lsrb)
end (*let*) // end of [f0_rcd2]
//
(* ****** ****** *)
//
fun
f0_lams
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Elams
(tknd//lam
,smas,tres
,arrw// =>
,body,tend) = s0e.node()
//
val smas =
pread00_s0maglst(smas, err) // s0maglst
val tres =
pread00_sort0opt(tres, err) // sort0opt
//
val (  ) =
(
case+
arrw.node() of
| T_EQGT() => ()
| _(*non-T_EQGT*) => (err := err + 1)
)
//
val body = pread00(body, err) // ( s0exp )
//
in//let
if
(err = e00)
then s0e else
s0exp_lams_errck
(s0e.lctn(),tknd,smas,tres,arrw,body,tend)
end (*let*) // end of [ f0_lams(s2e,err) ]
//
(* ****** ****** *)

fun
f0_uni0
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Euni0
(tkb,sqs,tke) = s0e.node()
//
val sqs =
pread00_s0qualst(sqs, err)
//
val ( ) =
(
case+
tke.node() of
|
T_RBRACE() => () // HX: valid
|
_(*non-RBRACE*) => (err := err + 1)
)
//
in
if
(err = e00)
then s0e else
s0exp_uni0_errck(s0e.lctn(),tkb,sqs,tke)
end (*let*) // end of [ f0_uni0(s2e,err) ]

(* ****** ****** *)

fun
f0_exi0
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
//
val e00 = err
val-
S0Eexi0
(tkb,sqs,tke) = s0e.node()
//
val sqs =
pread00_s0qualst(sqs, err)
//
val ( ) =
(
case+
tke.node() of
|
T_RBRCKT() => () // HX: valid
|
_(*non-RBRCKT*) => (err := err + 1)
)
//
in
if
(err = e00)
then s0e else
s0exp_exi0_errck(s0e.lctn(),tkb,sqs,tke)
end (*let*) // end of [ f0_exi0(s2e,err) ]

(* ****** ****** *)

fun
f0_annot
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Eannot
(se1, st2) = s0e.node()
val se1 = pread00_s0exp(se1, err)
val st2 = pread00_sort0(st2, err)
in
if
(err=e00)
then (s0e) else
(
  s0exp_annot_errck(s0e.lctn(),se1,st2))
end (*let*) // end of [ f0_annot(s2e,err) ]

(* ****** ****** *)

fun
f0_qual0
( s0e
: s0exp
, err
: &sint >> _): s0exp =
let
val e00 = err
val-
S0Equal0
(tok, se1) = s0e.node()
val se1 = pread00_s0exp(se1, err)
in
if
(err = e00)
then (s0e) else
(
  s0exp_qual0_errck(s0e.lctn(),tok,se1))
end (*let*) // end of [ f0_qual0(s2e,err) ]

(* ****** ****** *)

} (*where*) // end of [pread00_s0exp(s0e,err)]

(* ****** ****** *)
//
#implfun
pread00_l0s0e
  (lse, err) =
let
//
val e00 = err
//
val+
S0LAB
(lab,teq,s0e) = lse
//
val ( ) =
(
case+
lab.node() of
|
L0ABLsome _ => ()
|
L0ABLnone _ => (err := err + 1)
)
val ( ) =
(
case+ teq.node() of
|
T_EQ0() => () // HX: lab = s0e
|
_(*non-EQ0*) => (err := err + 1)
)
val s0e = pread00_s0exp(s0e, err)
in//let
if
(err = e00) then lse else S0LAB(lab,teq,s0e)
end (*let*) // end of [pread00_l0s0e(lse,err)]
//
(* ****** ****** *)

#implfun
pread00_s0tdf
  (tdf, err) =
(
case+
tdf.node() of
|
S0TDFsort(s0t) =>
let
//
val e00 = err
//
val s0t =
pread00_sort0(s0t, err)
in//let
if
(err=e00)
then (tdf) else
s0tdf(tdf.lctn(), S0TDFsort(s0t))
end
|
S0TDFtsub
( tbeg, s0a1
, tbar, s0ps, tend) =>
let
//
val e00 = err
//
val
s0a1 = pread00_s0arg(s0a1, err)
//
val (  ) =
(
case+
tbar.node() of
|T_BAR() => ()| _ => (err := err+1))
//
val s0ps = pread00_s0explst(s0ps, err)
//
val (  ) =
(
case+
tend.node() of
|
T_RBRACE() => () | _ => (err := err+1))
in//let
if
(err=e00)
then (tdf) else
s0tdf_make_node
(
tdf.lctn(),
S0TDFtsub(tbeg, s0a1, tbar, s0ps, tend))
endlet // end of [S0TDFtsub(...)]
//
) (*case*)//end-of-[pread00_s0tdf(tdf,err)]

(* ****** ****** *)
#implfun
pread00_i0dntlst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_i0dnt)
#implfun
pread00_i0dntopt
(   opt, err   ) =
optn_pread00_fnp(opt, err, pread00_i0dnt)
(* ****** ****** *)
#implfun
pread00_g0explst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_g0exp)
#implfun
pread00_g0expopt
(   opt, err   ) =
optn_pread00_fnp(opt, err, pread00_g0exp)
(* ****** ****** *)
#implfun
pread00_g0maglst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_g0mag)
(* ****** ****** *)
//
#implfun
pread00_sort0lst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_sort0)
#implfun
pread00_sort0opt
(   opt, err   ) =
optn_pread00_fnp(opt, err, pread00_sort0)
//
(* ****** ****** *)
//
#implfun
pread00_s0explst
(   lst, err   ) =
list_pread00_fnp(lst, err, pread00_s0exp)
#implfun
pread00_s0expopt
(   opt, err   ) =
optn_pread00_fnp(opt, err, pread00_s0exp)
//
#implfun
pread00_l0s0elst
(   lst, err  ) =
list_pread00_fnp(lst, err, pread00_l0s0e)
//
(* ****** ****** *)

#implfun
pread00_s0exp_RPAREN
  (srp0, err) =
(
case+ srp0 of
|
s0exp_RPAREN_cons0
(      tend      ) =>
(
case+
tend.node() of
|
T_RPAREN() => srp0
|
_(*non-T_RPAREN*) => (err := err+1; srp0)
)
|
s0exp_RPAREN_cons1
(tbar, s0es, tend) =>
let
//
val e00 = err
//
val s0es =
pread00_s0explst(s0es, err)
in//let
//
case+
tend.node() of
|
T_RPAREN() =>
(
  if
  (err=e00)
  then srp0
  else s0exp_RPAREN_cons1(tbar, s0es, tend)
)
|
_(*non-T_RPAREN*) =>
(err := err+1; s0exp_RPAREN_cons1(tbar, s0es, tend))
//
endlet // end of [s0exp_RPAREN_cons1]
) (*case*) // end of [pread00_s0exp_RPAREN]

(* ****** ****** *)

#implfun
pread00_l0s0e_RBRACE
  (lsrb, err) =
(
case+ lsrb of
|
l0s0e_RBRACE_cons0
(      tend      ) =>
(
case+
tend.node() of
|
T_RBRACE() => lsrb
|
_(*non-T_RBRACE*) => (err := err+1; lsrb)
)
|
l0s0e_RBRACE_cons1
(tbar, lses, tend) =>
let
//
val e00 = err
//
val lses =
pread00_l0s0elst(lses, err)
in//let
//
case+
tend.node() of
|
T_RBRACE() =>
(
if
(err=e00)
then lsrb
else l0s0e_RBRACE_cons1(tbar, lses, tend)
)
|
_(*non-T_RBRACE*) =>
(
err := err+1; l0s0e_RBRACE_cons1(tbar,lses,tend))
//
endlet // end of [l0s0e_RBRACE_cons1]
) (*case*) // end of [pread00_l0s0e_RBRACE]

(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_pread00_staexp.dats] *)
(***********************************************************************)
