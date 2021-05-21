(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
//
implement
s2exp_whnfize_env
  (env0, s2e0) =
(
s2exp_whnfize(s2e0)
)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxxtv
( env0:
! tr34env
, s2e1: s2exp
, s2e2: s2exp): void =
let
val-
S2Extv
(xtv1) = s2e1.node()
in
s2xtv_set_sexp(xtv1, s2e2)
end // end of [auxxtv]

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
s2exp_eqeqize_env
(env0, s2e1, s2e2) =
let
val
s2e1 =
whnfize_env(env0, s2e1)
val
s2e2 =
whnfize_env(env0, s2e2)
in(*in-of-let*)
//
case+
s2e1.node() of
|
S2Extv _ =>
auxxtv(env0, s2e1, s2e2)
| _(*rest-of-s2exp*) =>
(
case+
s2e2.node() of
|
S2Extv _ =>
auxxtv(env0, s2e2, s2e1)
| _(*rest-of-s2exp*) => ((*void*))
)
//
end // end of [s2exp_eqeqize_env]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxxtv
( env0:
! tr34env
, s2e1: s2exp
, s2e2: s2exp): void =
let
val-
S2Extv
(xtv1) = s2e1.node()
in
s2xtv_set_sexp(xtv1, s2e2)
end // end of [auxxtv]

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
s2exp_tpeqize_env
(env0, s2e1, s2e2) =
let
val
s2e1 =
whnfize_env(env0, s2e1)
val
s2e2 =
whnfize_env(env0, s2e2)
in(*in-of-let*)
//
case+
s2e1.node() of
|
S2Extv _ =>
auxxtv(env0, s2e1, s2e2)
| _(*rest-of-s2exp*) =>
(
case+
s2e2.node() of
|
S2Extv _ =>
auxxtv(env0, s2e2, s2e1)
| _(*rest-of-s2exp*) => ((*void*))
)
//
end // end of [s2exp_tpeqize_env]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxxtv
( env0:
! tr34env
, s2e1: s2exp
, s2e2: s2exp): void =
let
val-
S2Extv
(xtv1) = s2e1.node()
in
s2xtv_set_sexp(xtv1, s2e2)
end (*let*) // end of [auxxtv]

(* ****** ****** *)

fun
auxapp
( env0:
! tr34env
, s2e1: s2exp
, s2e2: s2exp): void =
let
val-
S2Eapp
(s2f1, ses1) = s2e1.node()
in
//
case+
s2e2.node() of
|
S2Eapp(s2f2, ses2) =>
let
val () =
s2exp_tpeqize_env
(env0, s2f1, s2f2)
in
  auxarg(env0, ses1, ses2)
end // end of [S2Eapp]
| _(*rest-of-s2exp*) => ((*void*))
end where
{
fun
auxarg
( env0:
! tr34env
, ses1: s2explst
, ses2: s2explst): void =
(
case+ ses1 of
|
list_nil() => () where
{
  val-list_nil() = ses2
}
|
list_cons
(se11, ses1) => () where
{
val-
list_cons(se21, ses2) = ses2
val () =
(
ifcase
| _(*else*) =>
s2exp_eqeqize_env(env0, se11, se21)
)
}
)
} (*where*) // end of [auxapp]

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
s2exp_tsubize_env
(env0, s2e1, s2e2) =
let
//
val
s2e1 =
whnfize_env(env0, s2e1)
val
s2e2 =
whnfize_env(env0, s2e2)
//
in(*in-of-let*)
//
case+
s2e1.node() of
//
|
S2Extv _ =>
auxxtv(env0, s2e1, s2e2)
//
|
S2Eapp _ =>
auxapp(env0, s2e1, s2e2)
//
| _(*rest-of-s2exp*) => ((*void*))
//
end // end of [s2exp_tsubize_env]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
(*
//
implement
s2exp_opnx_env
  (loc0, s2e0) =
let
val
knd =
K2XTVopen(s2e0)
in
xtv1.kind(knd); xtv1
end where {
//
val s2t0 = s2e0.sort()
val
xtv1 = s2xtv_new(loc0, s2t0)
//
} // end of [s2exp_opnx_env]
//
*)
(* ****** ****** *)

implement
s2exp_opny_env
  (env0, s2e0) =
(
  auxs2e0(env0, s2e0)
) where
{
//
fun
svsapp
( xs: s2varlst
, ys: s2varlst): s2varlst =
(
case+ ys of
| list_nil() => xs
| list_cons _ =>
  list_append<s2var>(xs, ys)
)
fun
spsapp
( xs: s2explst
, ys: s2explst): s2explst =
(
case+ ys of
| list_nil() => xs
| list_cons _ =>
  list_append<s2exp>(xs, ys)
)
//
fun
auxs2e0
( env0:
! tr34env, s2e0: s2exp)
: (s2varlst, s2explst, s2exp) =
let
val
s2e0 =
whnfize_env(env0, s2e0)
in
//
case+
s2e0.node() of
|
S2Eexi
(svs1, sps1, s2e1) =>
let
//
val
( s2vs
, s2ps
, sopn) =
  auxs2e0(env0, s2e1)
//
val svs2 =
s2varlst_copy(svs1)
val sopn =
s2exp_revars(sopn, svs1, svs2)
val sps2 =
s2explst_revars(sps1, svs1, svs2)
val s2ps =
s2explst_revars(s2ps, svs1, svs2)
//
in
  ( svsapp(svs2, s2vs)
  , spsapp(sps2, s2ps), sopn)
end
|
_(*rest-of-s2exp*) =>
(list_nil(), list_nil(), s2e0)
//
end (*let*) // end of [auxs2e0]
} (*where*) // end of [s2exp_opny_env]

(* ****** ****** *)

implement
d4exp_opny_env
( env0, d4e0 ) =
let
//
val
loc0 = d4e0.loc()
val
s2e0 = d4e0.sexp()
val
t2p0 = d4e0.type()
//
val
( s2vs
, s2ps
, sopn) =
s2exp_opny_env(env0, s2e0)
//
in
d4exp_make_node
( loc0
, sopn
, t2p0
, D4Eopny(d4e0, s2vs, s2ps))
end // end of [d4exp_opny_env]

(* ****** ****** *)

implement
trans34_d4pat_deunis
  (d4p0) =
(
let
val
s2e0 = d4p0.sexp()
in
  auxd4p0(d4p0, s2e0)
end
) where
{
//
val
loc0 = d4p0.loc()
val
t2p0 = d4p0.type()
//
fun
auxs2vs
( s2vs
: s2varlst): s2explst =
(
case+
s2vs of
|
list_nil() =>
list_nil()
|
list_cons
(s2v1, s2vs) =>
let
val
s2v1 =
s2var_copy(s2v1)
val
s2e1 = s2exp_var(s2v1)
in
  list_cons(s2e1, auxs2vs(s2vs))
end
)
//
fun
auxd4p0
( d4p0: d4pat
, s2e0: s2exp): d4pat =
let
//
val
s2e0 = s2exp_whnfize(s2e0)
//
in
case+
s2e0.node() of
|
S2Euni
( s2vs
, s2ps, s2e1) =>
let
//
val
tsub = auxs2vs(s2vs)
//
val s2e1 = 
s2exp_subst_svarlst
( s2e1, s2vs, tsub )
val s2ps =
s2explst_subst_svarlst
( s2ps, s2vs, tsub )
//
val
d4p1 =
d4pat_make_node
( loc0, s2e1, t2p0
, D4Psapx(d4p0, tsub, s2ps))
//
in
  auxd4p0(d4p1, s2e1)
end
| _ (* rest-of-s2exp *) => d4p0
end
//
} (*where*) // end of [trans34_d4pat_deunis]

(* ****** ****** *)

implement
trans34_d4exp_deuni1
  (d4e0) =
(
let
val
s2e0 = d4e0.sexp()
in
  auxd4e0(d4e0, s2e0)
end
) where
{
//
val
loc0 = d4e0.loc()
val
t2p0 = d4e0.type()
//
fun
auxs2vs
( s2vs
: s2varlst): s2explst =
(
case+
s2vs of
|
list_nil() =>
list_nil()
|
list_cons
(s2v1, s2vs) =>
let
val
s2t1 = s2v1.sort()
val
xtv1 =
s2xtv_new(loc0, s2t1)
val
s2e1 = s2exp_xtv(xtv1)
in
  list_cons(s2e1, auxs2vs(s2vs))
end
)
//
fun
auxd4e0
( d4e0: d4exp
, s2e0: s2exp): d4exp =
let
//
val
s2e0 = s2exp_whnfize(s2e0)
//
in
case+
s2e0.node() of
|
S2Euni
( s2vs
, s2ps, s2e1) =>
let
//
val
tsub = auxs2vs(s2vs)
//
val s2e1 = 
s2exp_subst_svarlst
( s2e1, s2vs, tsub )
val s2ps =
s2explst_subst_svarlst
( s2ps, s2vs, tsub )
//
in
  d4exp_make_node
  ( loc0, s2e1, t2p0
  , D4Esapx(d4e0, tsub, s2ps))
end
| _ (* rest-of-s2exp *) => d4e0
end
//
} (*where*) // end of [trans34_d4exp_deuni1]

(* ****** ****** *)

implement
trans34_d4exp_deunis
  (d4e0) =
(
let
val
s2e0 = d4e0.sexp()
in
  auxd4e0(d4e0, s2e0)
end
) where
{
//
val
loc0 = d4e0.loc()
val
t2p0 = d4e0.type()
//
fun
auxs2vs
( s2vs
: s2varlst): s2explst =
(
case+
s2vs of
|
list_nil() =>
list_nil()
|
list_cons
(s2v1, s2vs) =>
let
val
s2t1 = s2v1.sort()
val
xtv1 =
s2xtv_new(loc0, s2t1)
val
s2e1 = s2exp_xtv(xtv1)
in
  list_cons(s2e1, auxs2vs(s2vs))
end
)
//
fun
auxd4e0
( d4e0: d4exp
, s2e0: s2exp): d4exp =
let
//
val
s2e0 = s2exp_whnfize(s2e0)
//
in
case+
s2e0.node() of
|
S2Euni
( s2vs
, s2ps, s2e1) =>
let
//
val
tsub = auxs2vs(s2vs)
//
val s2e1 = 
s2exp_subst_svarlst
( s2e1, s2vs, tsub )
val s2ps =
s2explst_subst_svarlst
( s2ps, s2vs, tsub )
//
val
d4e1 =
d4exp_make_node
( loc0, s2e1, t2p0
, D4Esapx(d4e0, tsub, s2ps))
//
in
  auxd4e0(d4e1, s2e1)
end
| _ (* rest-of-s2exp *) => d4e0
end
//
} (*where*) // end of [trans34_d4exp_deunis]

(* ****** ****** *)

implement
trans34_f3undecl_set_sexp
( f3d0 ) =
let
//
val+
F3UNDECL
( rcd ) = f3d0
//
val nam = rcd.nam
val d2c = rcd.d2c
//
in
//
case+
rcd.wtp of
|
None((*void*)) =>
let
val a3g = rcd.a3g
in
//
case+ a3g of
|
None() => ((*void*))
|
Some(f3as) =>
let
val
s2r0 =
(
case+
rcd.res of
|
EFFS2EXPnone() =>
s2exp_t2ype(rcd.rtp)
|
EFFS2EXPsome(s2r0) => s2r0
) : s2exp // end-of-val
val
s2f0 =
aux_f3as(f3as, s2r0)
in
d2var_set_sexp(nam, s2f0);
d2cst_set_sexp(d2c, s2f0);
end
//
end (* None *)
|
Some(s2f0) =>
(
d2var_set_sexp(nam, s2f0);
d2cst_set_sexp(d2c, s2f0);
) (* end of [Some] *)
//
end where
{
fun
aux_fc2
( f3as
: f3arglst): funclo2 =
(
case+ f3as of
| list_nil() => FC2fun()
| list_cons(f3a0, f3as) =>
(
case+
f3a0.node() of
| F3ARGsome_dyn _ =>
  FC2cloref | _ => aux_fc2(f3as)
)
)
fun
aux_f3a0
( fc2
: funclo2
, f3a0: f3arg
, s2r0: s2exp): s2exp =
(
case+
f3a0.node() of
| F3ARGsome_dyn
  (npf, d3ps) =>
  (
    s2exp_fun_full
    (fc2, npf, s2es, s2r0)
  ) where
  {
  val s2es =
  trans34_d3patlst_get_s2es(d3ps)
  }
| F3ARGsome_sta
  (s2vs, s2ps) =>
  s2exp_uni(s2vs, s2ps, s2r0)
//
| _ (*else*) => s2r0 // end-of-else
)
and
aux_f3as
( f3as
: f3arglst
, s2r0: s2exp): s2exp =
(
case+ f3as of
|
list_nil() => s2r0
|
list_cons(f3a0, f3as) =>
let
val fc2 = aux_fc2(f3as)
in
aux_f3a0
(fc2, f3a0, aux_f3as(f3as, s2r0))
end // end of [list_cons]
)
} (* trans34_f3undecl_set_sexp *)

(* ****** ****** *)
//
implement
trans34_d3pat_get_sexp
( d3p0 ) =
(
case+
d3p0.node() of
|
D3Panno(d3p1, s2e2) => s2e2
|
_ (*else*) => s2exp_t2ype(d3p0.type())
) (* end of [trans34_d3pat_get_sexp] *)
implement
trans34_d3patlst_get_s2es
( d3ps ) =
(
  list_vt2t(d3ps)
) where
{
val
d3ps =
list_map<d3pat><s2exp>
  (d3ps) where
{
implement
list_map$fopr<d3pat><s2exp> = trans34_d3pat_get_sexp
}
} (* end of [trans34_d3patlst_get_s2es] *)
//
(* ****** ****** *)

(* end of [xats_trans34_util1.dats] *)
