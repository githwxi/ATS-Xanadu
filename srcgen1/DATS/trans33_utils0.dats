(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: August, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"
#staload "./../SATS/trans33.sats"

(* ****** ****** *)
//
local
#staload
"./statyp2_unify0.dats"
in//local
//
implement
unify3_t2ype_t2ype
( loc0
, t2p1, t2p2) = let
//
implement
unify_eval<>(t2p0) = whnfize(t2p0)
//
in
  unify_t2ype_t2ype<>(loc0, t2p1, t2p2)
end // end of [unify3_t2ype_t2ype]
//
(* ****** ****** *)
//
implement
unify3_t2ypelst_t2ypelst
( loc0
, tps1, tps2) = let
//
implement
unify_eval<>(t2p0) = whnfize(t2p0)
//
in
unify_t2ypelst_t2ypelst<>(loc0, tps1, tps2)
end // end of [unify3_t2ypelst_t2ypelst]
//
end // end of [local]
//
(* ****** ****** *)

implement
match3_t2ype_t2ype
(t2p1, t2p2) = let
//
val
loc0 =
the_location_dummy
//
val
xtvs =
t2ype_get_xtvs(t2p2)
val
test =
unify3(loc0, t2p1, t2p2)
//
fun
reset
(xtv0: t2xtv): void =
(xtv0.type(the_t2ype_none0))
fun
auxlst
( xtvs
: List_vt(t2xtv)): void =
(
case+ xtvs of
|
~list_vt_nil() => ()
|
~list_vt_cons(x0, xs) =>
 let
 val () = reset(x0) in auxlst(xs)
 end
)
//
in
let
val () = auxlst(xtvs) in test end
end // end of [match3_t2ype_t2ype]

(* ****** ****** *)
//
implement
match3_t2ypelst_t2ypelst
  (xs, ys) =
(
  auxlst(xs, ys)
) where
{
fun
auxlst
( xs: t2ypelst
, ys: t2ypelst): bool =
(
case+ xs of
|
list_nil() =>
(
case+ ys of
|
list_nil _ => true
|
list_cons _ => false
)
|
list_cons(x0, xs) =>
(
case+ ys of
|
list_nil() => false
|
list_cons(y0, ys) =>
if
match3(x0, y0)
then auxlst(xs, ys) else false
)
) (* end of [auxmat] *)
//
} (* match3_t2ypelst_t2ypelst *)
//
(* ****** ****** *)
//
local
//
#staload
"./statyp2_utils0.dats"
//
fun
t2ype_eval_env
( env0:
! abstenv
, t2p0: t2ype): t2ype =
let
//
val-
T2Pcst
(s2c0) = t2p0.node()
//
val
opt0 =
abstenv_find(env0, s2c0)
//
in//local
//
case+ opt0 of
| ~
None_vt() => t2p0
| ~
Some_vt(t2p1) =>
t2ype_whnfize_env(env0, t2p1)
//
end // end of [t2ype_eval_env]
//
in(*in-of-local*)
//
implement
t2ype_whnfize_env
  (env0, t2p0) =
(
  t2ype_whnfz<>(t2p0)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
t2ype_whnfz$cst<>
  (t2p0, flag) =
let
//
val-
T2Pcst(s2c0) = t2p0.node()
//
val
def0 = s2cst_get_type(s2c0)
//
in
//
case+
def0.node() of
//
|
T2Pnone0() =>
let
val
env0 =
$UN.castvwtp0{abstenv}(env0)
val
t2p0 = t2ype_eval_env(env0, t2p0)
in
let
prval () = $UN.cast2void(env0) in t2p0
end
end
//
| _(* else *) => 
let
val () =
(flag := flag + 1)
val
env0 =
$UN.castvwtp0{abstenv}(env0)
val
t2p0 = t2ype_whnfize_env(env0, def0)
in
let
prval () = $UN.cast2void(env0) in t2p0
end
end
//
end // t2ype_whnfz$cst
//
} (* end of [t2ype_whnfize_env] *)
//
end // end of [local]
//
(* ****** ****** *)
//
local
#staload
"./statyp2_unify0.dats"
in//local
//
implement
unify3_env_t2ype_t2ype
( loc0
, env0
, t2p1, t2p2) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
unify_eval<>(t2p0) =
let
val
env0 =
$UN.castvwtp0{abstenv}(env0)
val t2p0 = whnfize_env(env0, t2p0)
in
let
prval () = $UN.cast2void(env0) in t2p0
end
end
//
in
  unify_t2ype_t2ype<>(loc0, t2p1, t2p2)
end // end of [unify3_env_t2ype_t2ype]
//
(* ****** ****** *)
//
implement
unify3_env_t2ypelst_t2ypelst
( loc0
, env0
, tps1, tps2) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
unify_eval<>(t2p0) =
let
val
env0 =
$UN.castvwtp0{abstenv}(env0)
val t2p0 = whnfize_env(env0, t2p0)
in
let
prval () = $UN.cast2void(env0) in t2p0
end
end
//
in
unify_t2ypelst_t2ypelst<>(loc0, tps1, tps2)
end // end of [unify3_env_t2ypelst_t2ypelst]
//
end // end of [local]
//
(* ****** ****** *)

implement
t2ype_f3arg_elim
( loc0
, env0
, tfun, f3as
) =
(
( f3as, tfun ) where
{
var tfun = tfun
val f3as =
auxf3as_0(env0, f3as, tfun)
}
) where
{
fun
auxf3as_0
( env0:
! abstenv
, f3as
: f3arglst
, tfun
: &t2ype >> _): f3arglst =
(
case+ f3as of
|
list_nil() =>
list_nil()
|
list_cons
(f3a0, f3as) =>
(
  list_cons(f3a0, f3as)
) where
{
val
f3a0 =
auxf3as_1(env0, f3a0, tfun)
val
f3as =
auxf3as_0(env0, f3as, tfun)
}
) (* auxf3as_0 *)
and
auxf3as_1
( env0:
! abstenv
, f3a0: f3arg
, tfun: &t2ype >> _): f3arg =
(
case-
f3a0.node() of
(*
| F3ARGnone2 _ => f3a0
| F3ARGnone3 _ => f3a0
| F3ARGsome_met _ => f3a0
*)
| F3ARGsome_sta _ =>
  (
    auxf3as_1s(env0, f3a0, tfun)
  )
| F3ARGsome_dyn _ =>
  (
    auxf3as_1d(env0, f3a0, tfun)
  )
)
//
and
auxf3as_1s
( env0:
! abstenv
, f3a0: f3arg
, tfun: &t2ype >> _): f3arg =
let
//
val-
F3ARGsome_sta
( svs1
, s2ps) = f3a0.node()
//
val
t2p0 =
whnfize_env(env0, tfun)
//
in
//
if
auxtest(svs1)
then
(
case+
t2p0.node() of
|
T2Puni
(svs2, t2p0) =>
let
val tsub =
auxtsub(svs2, svs1)
val t2p0 =
(
  t2ype_revars
  (t2p0, svs2, tsub)
) where
{
val
tsub = $UN.list_vt2t(tsub)
} (* where *) // end-of-val
val () = list_vt_free(tsub)
in
let val () = tfun := t2p0 in f3a0 end
end
|
_(*non-T2Puni*) =>
let
  val () = tfun := t2p0
in
  f3arg_make_node
  ( f3a0.loc(), F3ARGnone3(f3a0) )
end
) (* end of [then] *)
else
(
let val () = tfun := t2p0 in f3a0 end
) (* end of [else] *)
//
end where
{
//
fun
auxtest
( s2vs
: s2varlst): bool =
(
case+ s2vs of
|
list_nil() => false
|
list_cons(s2v0, s2vs) =>
let
  val s2t0 = s2v0.sort()
in
  if
  sort2_is_impred(s2t0)
  then true else auxtest(s2vs)
end
)
//
fun
auxtsub
( xs0
: s2varlst
, ys0
: s2varlst): List0_vt(s2var) =
(
case+ xs0 of
|
list_nil() =>
list_vt_nil()
|
list_cons(x0, xs1) =>
(
case+ ys0 of
| list_nil() =>
  list_vt_cons
  (x0, auxtsub(xs1, list_nil()))
| list_cons(y0, ys1) =>
  let
  val st = y0.sort()
  in
  if
  sort2_is_impred(st)
  then
  list_vt_cons
  (y0, auxtsub(xs1, ys1)) else auxtsub(xs0, ys1)
  end
) (* list_cons *)
) (* end of [auxtsub] *)
} // end of [let] // end of [auxf3as_1s]
//
and
auxf3as_1d
( env0:
! abstenv
, f3a0: f3arg
, tfun: &t2ype >> _): f3arg =
let
//
val-
F3ARGsome_dyn
( npf1
, d3ps) = f3a0.node()
//
val
loc0 = f3a0.loc()
val
t2p0 = whnfize_env(env0, tfun)
//
in
//
case+
t2p0.node() of
//
|
T2Puni
(s2vs, t2p0) =>
(
  tfun := t2p0;
  auxf3as_1d(env0, f3a0, tfun)
) where
{
  val t2p0 =
  t2ype_gnvars(t2p0, s2vs)
}
|
T2Pfun
(_, _, t2ps, t2p0) =>
let
val
d3ps =
trans33_dpatlst_dnts(env0, d3ps, t2ps)
in
  tfun := t2p0;
  f3arg_make_node
  (  loc0, F3ARGsome_dyn(npf1, d3ps)  )
end // end of [T2Pfun]
//
| _(*non-T2Puni/fun*) =>
(
f3arg_make_node(loc0, F3ARGnone3(f3a0))
)
//
end // end of [auxf3as_1d]
//
} (* end of [t2ype_f3arg_elim] *)

(* ****** ****** *)
//
fun
d33exp_make_node
( loc0: loc_t
, t2p0: t2ype
, d3en: d3exp_node) =
let
val t2p0 = whnfize(t2p0)
val d3e0 =
d3exp_make_node(loc0, t2p0, d3en)
in
case+ t2p0.node() of
|
T2Plft(t2p1) =>
d3exp_make_node
(loc0, t2p1, D3Eflat(d3e0)) | _ => d3e0
end // end of [d33exp_make_node]
//
(* ****** ****** *)

implement
d33exp_dntp
( env0
, d3e0, t2p0) = let
//
val loc0 = d3e0.loc()
//
val
test =
unify3_env
( loc0
, env0, d3e0.type(), t2p0)
//
in
//
if
test
then d3e0
else
d33exp_tcastize(env0, d3e0, t2p0)
//
end // end of [d33exp_dntp]

(* ****** ****** *)

implement
d33explst_dntp
( loc0
, env0
, d3es, t2ps) = let
//
fun
auxt2ps
( t2ps
: t2ypelst
)
: d3explst =
(
case+ t2ps of
|
list_nil() =>
list_nil()
|
list_cons(t2p0, t2ps) =>
let
  val d3e0 =
  d3exp_none0_1(loc0, t2p0)
in
  list_cons(d3e0, auxt2ps(t2ps))
end
)
fun
auxd3es
( d3es
: d3explst
)
: d3explst =
(
case+ d3es of
|
list_nil() =>
list_nil()
|
list_cons(d3e0, d3es) =>
let
  val d3e0 =
  d3exp_none2_0(d3e0)
in
  list_cons(d3e0, auxd3es(d3es))
end
)
//
in (* in-of-let *)
//
case+ d3es of
|
list_nil() => auxt2ps(t2ps)
|
list_cons _ =>
(
  case+ t2ps of
  |
  list_nil() => auxd3es(d3es)
  |
  list_cons _ =>
  let
    val+
    list_cons
    (d3e0, d3es) = d3es
    val+
    list_cons
    (t2p0, t2ps) = t2ps
    val
    d3e0 =
    d33exp_dntp(env0, d3e0, t2p0)
  in
    list_cons(d3e0, auxd3es(d3es))
  end
)
//
end (* end of [d33explst_dntp] *)

(* ****** ****** *)

implement
d33exp_sapp_up
( loc0
, env0
, d3f0, s2es) =
(
d23exp_sapp_up(loc0, d3f0, s2es)
) (* end of [d33exp_sapp_up] *)

implement
d33exp_tapp_up
( loc0
, env0
, d3f0, s2es) =
(
d23exp_tapp_up(loc0, d3f0, s2es)
) (* end of [d33exp_tapp_up] *)

(* ****** ****** *)

local
//
fun
auxcbrf
( env0:
! abstenv
, tfun
: t2ype
, d3es
: d3explst): d3explst =
let
val
tfun =
whnfize_env(env0, tfun)
in
case+
tfun.node() of
|
T2Puni
(s2vs, tfun) =>
auxcbrf(env0, tfun, d3es)
|
T2Pexi
(s2vs, tfun) =>
auxcbrf(env0, tfun, d3es)
|
T2Pfun
( fc2, npf
, targ, tres) =>
let
var flag:int = 0
in
  auxtarg(env0, flag, targ, d3es)
end
| _ (*non-T2Pfun*) => d3es(*call-by-val*)
end // end of [auxlft]
and
auxtarg
( env0:
! abstenv
, flag
: &int
, t2ps
: t2ypelst
, d3es
: d3explst): d3explst =
(
case+ t2ps of
|
list_nil() => d3es
|
list_cons
(t2p1, t2ps) =>
(
case+ d3es of
|
list_nil() => list_nil()
|
list_cons
(d3e1, d3es2) =>
let
val
fini = flag
val
t2p1 = whnfize_env(env0, t2p1)
val
d3e1 =
(
case+
t2p1.node() of
| T2Plft _ =>
  let
  val () =
  (flag := flag+1)
  in d3exp_talf(d3e1) end
| _ (* non-T2Plft *) => d3e1
) : d3exp // end-of-val
val
d3es2 =
auxtarg(env0, flag, t2ps, d3es2)
in
if
(flag = fini)
then d3es else list_cons(d3e1, d3es2)
end // end of [let]
) (* end-of-case(d3es)*)
) (* end-of-case(t2ps)*) // fun(auxarg)
//
in(*in-of-local*)

implement
d33exp_dapp_up
( loc0
, env0
, d3f0, npf0, d3es) =
let
//
val
d3es =
auxcbrf
(env0, d3f0.type(), d3es)
//
val
targ =
d3explst_get_type(d3es)
//
val tres = t2ype_new(loc0)
//
// HX: FC2cloref is
val tfun = // the default
(
  t2ype_fun0
  (loc0, npf0, targ, tres)
)
//
val d3f0 = d33exp_dntp(env0, d3f0, tfun)
//
in
//
d33exp_make_node
(loc0, tres, D3Edapp(d3f0, npf0, d3es))
//
end // end of [d33exp_dapp_up]

end // end of [local]

(* ****** ****** *)

local

fun
tyrec_kind
(t2p1: t2ype): int =
(
case+
t2p1.node() of
|
T2Ptyrec
(tknd, _, _) =>
(
case+ tknd of
| TYRECbox0() => 1
| TYRECbox1() => 1
//
| TYRECflt0() => 0
(*
| TYRECflt1(_) => 0
*)
| TYRECflt2(_) => 0
)
| _ (*non-T2Ptyrec*) => 1(*boxed*)
) (* end of [tyrec_kind] *)

in(*in-of-local*)

implement
d33exp_proj_up
( loc0
, env0
, d3e1, lab2) =
let
//
val
t2p1 = d3e1.type()
val
t2p1 =
whnfize_env(env0, t2p1)
//
val
opt1 = t2ype_un_p2tr(t2p1)
//
in
case+ opt1 of
| ~
None_vt() =>
d33exp_proj0_up
(loc0, env0, d3e1, t2p1, lab2)
| ~
Some_vt(t2p1) =>
d33exp_proj1_up
(loc0, env0, d3e1, t2p1, lab2)
end // end of [d33exp_proj_up]

(* ****** ****** *)
(*
HX-2020-08-05:
[d3e1] is a non-pointer
*)
implement
d33exp_proj0_up
( loc0
, env0
, d3e1, t2p1, lab2) =
let
//
(*
val () =
println!
("d33exp_proj0_up: loc0 = ", loc0)
val () =
println!
("d33exp_proj0_up: d3e1 = ", d3e1)
val () =
println!
("d33exp_proj0_up: t2p1 = ", t2p1)
val () =
println!
("d33exp_proj0_up: lab2 = ", lab2)
*)
//
val
knd1 = tyrec_kind(t2p1)
val
opt2 = t2ype_projize(t2p1, lab2)
//
in(*in-of-let*)
//
case+ opt2 of
|
~None_vt() =>
(
if
t2ype_isdat(t2p1)
then
(
let
  val t2p2 = t2ype_new(loc0)
in
  d33exp_make_node
  (loc0, t2p2, D3Epcon(d3e1, lab2))
end
)
else
let
  val t2p2 = t2ype_new(loc0)
in
  d33exp_make_node
  (loc0, t2p2, D3Elcast(d3e1, lab2))
end
)
|
~Some_vt(it2p2) =>
let
  val (i0, t2p2) = it2p2
in
//
if
(knd1 > 0)
then
(
// HX: boxed
  d33exp_make_node
  (loc0, t2p2, D3Epbox(d3e1, lab2, i0))
)
else
(
// HX: unboxed
case+
d3e1.node() of
//
| D3Eflat(d3el) =>
  let
    val tprj = t2ype_lft(t2p2)
  in
    d33exp_make_node
    (loc0, tprj, D3Eplft(d3el, lab2, i0))
  end
//
// HX: deref
| D3Eeval(1, d3el) =>
  let
    val tprj = t2ype_lft(t2p2)
  in
    d33exp_make_node
    (loc0, tprj, D3Eplft(d3el, lab2, i0))
  end
//
| _ (* non-D3Eflat *) => 
  (
    d33exp_make_node
    (loc0, t2p2, D3Eproj(d3e1, lab2, i0))
  )
) (* end of [else] *)
//
end
//
end // end of [d33exp_proj0_up]

(* ****** ****** *)
(*
HX-2020-08-05:
[d3e1] is a pointer(p2tr)
*)
implement
d33exp_proj1_up
( loc0
, env0
, d3e1, t2p1, lab2) =
let
//
(*
val () =
println!
("d33exp_proj1_up: loc0 = ", loc0)
val () =
println!
("d33exp_proj1_up: d3e1 = ", d3e1)
val () =
println!
("d33exp_proj1_up: t2p1 = ", t2p1)
val () =
println!
("d33exp_proj1_up: lab2 = ", lab2)
*)
//
(*
//
HX-2020-09-22:
[knd1] should be 0!!!
//
val
knd1 = tyrec_kind(t2p1)
*)
val
opt2 = t2ype_projize(t2p1, lab2)
//
in(*in-of-let*)
//
case+ opt2 of
| ~
None_vt() =>
let
val t2p2 = t2ype_new(loc0)
val tptr =
t2ype_app1(the_t2ype_p2tr, t2p2)
in
  d33exp_make_node
  (loc0, t2p2, D3Elcast(d3e1, lab2))
end // end of [None_vt]
| ~
Some_vt(it2p2) =>
let
val (i0, t2p2) = it2p2
val tptr =
t2ype_app1(the_t2ype_p2tr, t2p2)
in
  d33exp_make_node
  (loc0, tptr, D3Epptr(d3e1, lab2, i0))
end // end of [Some_vt]
//
end // end of [d33exp_proj1_up]

end // end of [local]

(* ****** ****** *)

implement
d33exp_assgn_up
( loc0
, env0
, d3e1, d3e2) =
let
//
val
t2p0 =
the_t2ype_void
val
t2p2 = 
d3e2.type((*void*))
val
d3e1 =
d33exp_dntp(env0, d3e1, t2p2)
//
in
let
  val
  d3e1 = d3exp_talf(d3e1)
in
  d33exp_make_node
  (loc0, t2p0, D3Eassgn(d3e1, d3e2))
end
end // end of [d33exp_assgn_up]

(* ****** ****** *)

implement
ti3env_reset(ti3e) =
let
val+
TI3ENV(_, xtvs, _) = ti3e
in (* in-of-let *)
(
list_foreach<t2xtv>(xtvs)
) where
{
implement
(env)(*tmp*)
list_foreach$fwork<t2xtv><env>
  (xtv, env) = xtv.type(the_t2ype_none0)
}
end // end of [ti3env_reset]

(* ****** ****** *)

implement
ti3env_get_s2vs
( ti3e ) =
( s2vs ) where
{
val+
TI3ENV(s2vs, _, _) = ti3e
} (* end of [ti3env_get_s2vs] *)

implement
ti3env_get_targ
( ti3e ) =
( targ ) where
{
val+
TI3ENV(_, _, targ) = ti3e
} (* end of [ti3env_get_targ] *)

implement
ti3env_get_tsub
( ti3e ) =
let
val+
TI3ENV(_, xtvs, _) = ti3e
in
list_vt2t
(
list_map<t2xtv><t2ype>(xtvs)
) where
{
implement
list_map$fopr<t2xtv><t2ype>(xtv) = xtv.type()
}
end (* end of [ti3env_get_tsub] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_d3clau
( env0:
! abstenv
, d3cl: d3clau
, t2p2: t2ype): d3clau =
let
val
loc0 = d3cl.loc()
in
case+
d3cl.node() of
|
D3CLAUpat _ => d3cl
|
D3CLAUexp(dgp1, d3e2) =>
let
val
d3e2 =
d33exp_tcastize(env0, d3e2, t2p2)
in
d3clau_make_node(loc0, D3CLAUexp(dgp1, d3e2))
end
end
fun
aux_d3claulst
( env0:
! abstenv
, dcls
: d3claulst
, t2p2: t2ype): d3claulst =
list_vt2t
(
list_map<d3clau><d3clau>(dcls)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3clau><d3clau>
  (d3cl) =
let
val
env0 =
$UN.castvwtp0{abstenv}(env0)
val d3cl =
aux_d3clau(env0, d3cl, t2p2)
in
let prval () = $UN.cast2void(env0) in d3cl end
end
} (* end of [aux_d3claulst] *)

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
d33exp_tcastize
( env0
, d3e1, t2p2) =
let
//
val loc1 = d3e1.loc()
//
(*
val t2p1 = d3e1.type()
val () =
println!
("d33exp_tcastize: d3e1 = ", d3e1)
val () =
println!
("d33exp_tcastize: t2p1 = ", t2p1)
val () =
println!
("d33exp_tcastize: t2p2 = ", t2p2)
*)
//
in
//
case+
d3e1.node() of
//
|
D3Eif0
(de11, de12, opt3) =>
let
val
t2p1 = d3e1.type()
val
de12 =
d33exp_tcastize(env0, de12, t2p2)
val
opt3 =
(
case+ opt3 of
| None() =>
  None((*void*))
| Some
  (de13) => Some
  (
  d33exp_tcastize(env0, de13, t2p2)
  )
) : d3expopt // end of [val]
in
  d33exp_make_node
  ( loc1
  , t2p1, D3Eif0(de11, de12, opt3))
end
|
D3Eif1
( de11
, de12, opt3, tinv) =>
let
val
t2p1 = d3e1.type()
val
de12 =
d33exp_tcastize(env0, de12, t2p2)
val
opt3 =
(
case+ opt3 of
| None() =>
  None((*void*))
| Some
  (de13) => Some
  (
  d33exp_tcastize(env0, de13, t2p2)
  )
) : d3expopt // end of [val]
in
  d33exp_make_node
  ( loc1
  , t2p1
  , D3Eif1(de11, de12, opt3, tinv))
end
//
|
D3Ecas0
(knd0, de11, dcls) =>
let
val
t2p1 = d3e1.type()
val
dcls =
aux_d3claulst(env0, dcls, t2p2)
in
  d33exp_make_node
  ( loc1
  , t2p1, D3Ecas0(knd0, de11, dcls))
end
|
D3Ecas1
( knd0
, de11, dcls, tinv) =>
let
val
t2p1 = d3e1.type()
val
dcls =
aux_d3claulst(env0, dcls, t2p2)
in
  d33exp_make_node
  ( loc1
  , t2p1
  , D3Ecas1(knd0, de11, dcls, tinv))
end
//
| _ (* else *) =>
  d33exp_make_node
  (loc1, t2p2, D3Etcast(d3e1, t2p2))
//
end // end of [d33exp_tcastize]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
(*
local
//
#staload
T12 = "./../SATS/trans12.sats"
//
in
(*
HX-2022-05-20:
This one is declared in [trans33.sats]
*)
implement
fmodenv_get_t3imptbl(menv) =
$UN.cast($T12.fmodenv_get_t3imptbl(menv))
end // end of [local]
*)
(* ****** ****** *)

local
//
#staload
"libats/SATS/hashfun.sats"
#staload
"libats/SATS/hashtbl_chain.sats"
//
#staload _(*anon*) = "libats/DATS/qlist.dats"
//
#staload _(*anon*) = "libats/DATS/hashfun.dats"
#staload _(*anon*) = "libats/DATS/linmap_list.dats"
#staload _(*anon*) = "libats/DATS/hashtbl_chain.dats"
//
typedef key = uint
typedef itm = implist
//
vtypedef hashtbl = hashtbl(key, itm)
//
in (* in of local *)

(* ****** ****** *)
//
implement
hash_key<key>(key) =
$UN.cast
(inthash_jenkins($UN.cast(key)))
//
implement
gequal_val_val<key>(x, y) = (x = y)
//
(* ****** ****** *)

implement
t3imptbl_find_implist
  (tbl, d2c) = let
//
val key =
stamp2uint(d2c.stamp())
//
val tbl =
$UN.castvwtp0{hashtbl}(tbl)
val opt =
hashtbl_search_opt(tbl, key)
prval () = $UN.cast2void(tbl)
//
in
//
case+ opt of
| ~Some_vt(imps) => imps
| ~None_vt((*void*)) => implist_nil()
//
end // end of [t3imptbl_find_implist]

(* ****** ****** *)
//
implement
t3imptbl_make_d3eclist
  (d3cs) =
let
//
fun
auxdcl0
( htbl
: !hashtbl
, d3cl: d3ecl): void =
let
val-
D3Cimplmnt3
( tok0
, stmp, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res1, body) = d3cl.node()
in
//
if
iseqz(ti2s)
then
((*function*))
else
(
// template
case+ id2c of
|
IMPLD2CST1
(dqid, d2cs) =>
let
val-
list_cons
(d2c1, d2cs) = d2cs
in
  auxins0(htbl, d2c1, d3cl)
end
|
IMPLD2CST2
(dqid, d2cs, opt3) =>
(
case+ opt3 of
| None() => ()
| Some(d2c1) => auxins0(htbl, d2c1, d3cl)
)
)
end // end of [auxdcl0]
//
and
auxins0
( htbl
: !hashtbl
, d2c1: d2cst
, d3cl: d3ecl): void =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cimplmnt3
( tok0
, stmp, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res1, body) = d3cl.node()
//
(*
val () =
println!("auxins0: loc0 = ", loc0)
val () =
println!("auxins0: d2c1 = ", d2c1)
val () =
println!("auxins0: d3cl = ", d3cl)
*)
//
val t2ps =
(
case- ti3a of 
|
TI3ARGsome(t2ps) => t2ps
) : t2ypelst // end-of-val
//
val s2vs =
(
  auxs2vs_make(sqas, tqas)
)
val xtvs =
list_vt2t
(
  list_map<s2var><t2xtv>(s2vs)
) where
{
implement
list_map$fopr<
  s2var><t2xtv>(s2v) =
  t2xtv_new_srt(loc0, s2v.sort())
} (* end of [val xtvs] *)
val tsub =
(
  auxtsub_make(s2vs, xtvs)
)
//
val t2ps =
let
val tsub = $UN.list_vt2t(tsub)
in
t2ypelst_subst_svarlst(t2ps, s2vs, tsub)
end // end of [val]
//
val
((*freed*)) = list_vt_free(tsub)
//
val ti3e = TI3ENV(s2vs, xtvs, t2ps)
//
val key =
  stamp2uint(d2c1.stamp())
val opt =
  hashtbl_search_opt<key,itm>(htbl, key)
//
in
//
case+ opt of
|
~None_vt() =>
let
val itm0 =
implist_cons
(d3cl, ti3e, implist_nil())
in   
hashtbl_insert_any<key,itm>(htbl, key, itm0)
end
|
~Some_vt(itm0) =>
let
val itm1 =
implist_cons(d3cl, ti3e, itm0)
in   
hashtbl_insert_any<key,itm>(htbl, key, itm1)
end
//
end // end of [auxins0]
//
and
auxtsub_make
( s2vs
: s2varlst
, xtvs
: t2xtvlst): t2ypelst_vt =
(
case+ s2vs of
|
list_nil() =>
list_vt_nil()
|
list_cons(s2v0, s2vs) =>
let
//
  val-
  list_cons
  (xtv0, xtvs) = xtvs
//
  val s2t0 = s2v0.sort()
  val t2p0 =
  t2ype_new_srt_xtv(s2t0, xtv0)
//
in
  list_vt_cons
  (t2p0, auxtsub_make(s2vs, xtvs))
end
) (* end of [auxtsub_make] *)
and
auxs2vs_make
( sqas
: sq2arglst
, tqas
: tq2arglst): s2varlst =
let
  val s2vs = sqas.s2vs()
in
  case s2vs of
  | list_nil _ => tqas.s2vs()
  | list_cons _ => s2vs + tqas.s2vs()
end // end of [auxs2vs_make]
//
fun
auxlst1
( htbl: !hashtbl
, d3cs: d3eclist): void =
(
case+ d3cs of
| list_nil() => ()
| list_cons
  (d3c0, d3cs) => 
  auxlst2(htbl, d3c0, d3cs)
)
and
auxlst2
( htbl
: !hashtbl
, d3cl: d3ecl
, d3cs: d3eclist): void =
(
case+
d3cl.node() of
| D3Clocal
  (head, body) =>
  let
  val () =
  auxlst1(htbl, body) in auxlst1(htbl, d3cs)
  end
| D3Cimplmnt3 _ =>
  let
  val () =
  auxdcl0(htbl, d3cl) in auxlst1(htbl, d3cs)
  end
| _(*non-D3Cimplmnt3*) => auxlst1(htbl, d3cs)
)
//
val
mycap = i2sz(1*1024)
val
mytbl = 
hashtbl_make_nil<key,itm>(mycap)
//
in
let
val () =
auxlst1(mytbl, d3cs) in $UN.castvwtp0{t3imptbl}(mytbl)
end
end // end of [t3imptbl_make_d3eclist]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans33_util0.dats] *)
