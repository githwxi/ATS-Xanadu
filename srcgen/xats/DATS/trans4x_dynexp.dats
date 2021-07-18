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
// Start Time: May 22nd, 2021
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

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp4.sats"

(* ****** ****** *)

#staload "./../SATS/cstrnt0.sats"
#staload "./../SATS/cstrnt1.sats"
#staload "./../SATS/trans4x.sats"

(* ****** ****** *)

implement
trans4x_envless
  (prog) =
  (cstr) where
{
//
val
env0 =
tr4xenv_make_nil()
//
val () =
trans4x_declist(env0, prog)
//
val
cstr = tr4xenv_free_top(env0)
//
} (* end of [trans4x_envless] *)

(* ****** ****** *)

fun
tr4xenv_add_svarlst
( env0:
! tr4xenv
, s2vs: s2varlst): void =
(
case+ s2vs of
|
list_nil() => ()
|
list_cons(s2v1, s2vs) =>
let
val () =
tr4xenv_add_svar(env0, s2v1)
in
tr4xenv_add_svarlst(env0, s2vs)
end
) (* end of [tr4xenv_add_svarlst] *)

(* ****** ****** *)

fun
tr4xenv_add_shyplst
( env0:
! tr4xenv
, loc0: loc_t
, s2ps: s2explst): void =
(
case+ s2ps of
|
list_nil() => ()
|
list_cons(s2p1, s2ps) =>
let
//
val
chyp =
c1hyp_make_node
(loc0, C1Hsexp(s2p1))
val () =
tr4xenv_add_chyp(env0, chyp)
//
in
tr4xenv_add_shyplst(env0,loc0,s2ps)
end
) (* end of [tr4xenv_add_shyplst] *)

(* ****** ****** *)

local

fun
auxopny
( env0:
! tr4xenv
, d4p0: d4pat): void =
let
//
val
loc0 = d4p0.loc()
//
val-
D4Popny
( d4p1
, s2vs
, s2ps) = d4p0.node()
//
in
trans4x_dpat(env0, d4p1) where
{
val () =
tr4xenv_add_svarlst(env0, s2vs)
val () =
tr4xenv_add_shyplst(env0, loc0, s2ps)
}  
end (*let*) // end of [auxopny]

in(*in-of-local*)

implement
trans4x_dpat
(env0, d4p0) =
let
//
val
loc0 = d4p0.loc()
//
// (*
val () =
println!
("trans4x_dpat: d4p0 = ", d4p0)
// *)
//
in
//
case+
d4p0.node() of
//
|
D4Popny _ => auxopny(env0, d4p0)
|
D4Ptasmp
(d4p1, cstr) =>
{
  val () =
  trans4x_dpat(env0, d4p1)
  val () =
  trans4x_cstr(env0, loc0, cstr)
}
//
| _ (*rest-of-d4pat*) => ((*void*))
//
end (*let*) // end of [trans4x_dpat]

end // end of [local]

(* ****** ****** *)
//
implement
trans4x_dpatlst
(env0, d4ps) =
(
case+ d4ps of
|
list_nil() => ()
|
list_cons(d4p0, d4ps) =>
{
  val () =
  trans4x_dpat(env0, d4p0)
  val () =
  trans4x_dpatlst(env0, d4ps)
}
) (* end of [trans4x_dpatlst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxdapp
( env0:
! tr4xenv
, d4e0: d4exp): void =
let
//
val-
D4Edapp
( d4f0
, npf1
, d4es) = d4e0.node()
//
val () =
trans4x_dexp(env0, d4f0)
//
in
trans4x_dexplst(env0, d4es)
end (*let*) // end of [auxdapp]

(* ****** ****** *)

fun
auxopny
( env0:
! tr4xenv
, d4e0: d4exp): void =
let
//
val
loc0 = d4e0.loc()
//
val-
D4Eopny
( d4e1
, s2vs
, s2ps) = d4e0.node()
//
//
in
trans4x_dexp(env0, d4e1) where
{
val () =
tr4xenv_add_svarlst(env0, s2vs)
val () =
tr4xenv_add_shyplst(env0, loc0, s2ps)
}
end (*let*) // end of [auxopny]

(* ****** ****** *)

fun
aux_let
( env0:
! tr4xenv
, d4e0: d4exp): void =
let
//
val-
D4Elet
( dcls
, d4e1) = d4e0.node()
//
val () =
trans4x_declist(env0, dcls)
//
in
  trans4x_dexp( env0, d4e1 )
end (*let*) // end of [aux_let]

(* ****** ****** *)

fun
aux_where
( env0:
! tr4xenv
, d4e0: d4exp): void =
let
//
val-
D4Ewhere
( d4e1
, dcls) = d4e0.node()
//
val () =
trans4x_declist(env0, dcls)
//
in
  trans4x_dexp( env0, d4e1 )
end (*let*) // end of [aux_where]

(* ****** ****** *)

fun
aux_if0
( env0:
! tr4xenv
, d4e0: d4exp): void =
let
//
val-
D4Eif0
( d4e1
, d4e2
, opt3) = d4e0.node()
//
val () =
trans4x_dexp(env0, d4e1)
//
val loc1 = d4e1.loc()
val s2e1 = d4e1.sexp()
val sbtf = unbool(s2e1)
(*
val () =
println!
("aux_if0: s2e1 = ", s2e1)
val () =
println!
("aux_if0: sbtf = ", sbtf)
*)
//
val () =
tr4xenv_add_if0(env0)
//
val
c1h2 =
c1hyp_make_node
(loc1, C1Hsexp(sbtf))
//
val
() =
tr4xenv_add_bloc(env0)
val
() =
tr4xenv_add_chyp(env0, c1h2)
val
() = trans4x_dexp(env0, d4e2)
val
() = let
val
loc2 = d4e2.loc()
val
c1is =
tr4xenv_pop_bloc(env0)
val
c1s2 =
c1str_make_node
( loc2
, C1Kbloc(), C1Sitms(c1is))
in
  tr4xenv_add_cstr(env0, c1s2)
end // end of [val]
//
val
() =
(
case+ opt3 of
|
None() => ()
|
Some(d4e3) => () where
{
val
sbff =
s2exp_btf(false)
val
c1h3 =
c1hyp_make_node
( loc1
, C1Heqeq(sbtf, sbff))
val
() =
tr4xenv_add_bloc(env0)
val
() =
tr4xenv_add_chyp(env0, c1h3)
val
() = trans4x_dexp(env0, d4e3)
val
() = let
val
loc3 = d4e3.loc()
val
c1is =
tr4xenv_pop_bloc(env0)
val
c1s3 =
c1str_make_node
( loc3
, C1Kbloc(), C1Sitms(c1is))
in
  tr4xenv_add_cstr(env0, c1s3)
end // end of [val]
}
) : void // case // end-of-val
//
in
//
let
val
loc0 = d4e0.loc()
val
c1is =
tr4xenv_pop_if0(env0)
val
c1s0 =
c1str_make_node
( loc0
, C1Kif0(), C1Sitms(c1is))
in
  tr4xenv_add_cstr(env0, c1s0)
end
//
end where
{
//
fun
unbool
( sexp
: s2exp
)
: s2exp = sbtf where
{
val-
S2Eapp
( s2f0
, s2es) = sexp.node()
val-
list_cons(sbtf, _) = s2es
} (*where*) // end of [unbool]
//
} (*where*) // end of [aux_if0]

(* ****** ****** *)

fun
aux_cas0
( env0:
! tr4xenv
, d4e0: d4exp): void =
let
//
val-
D4Ecas0
( knd0
, dmat
, dcls) = d4e0.node()
//
val () =
trans4x_dexp(env0, dmat)
//
val () =
tr4xenv_add_cas0(env0)
//
val () =
trans4x_dclaulst(env0, dcls)
//
in
//
let
val
loc0 = d4e0.loc()
val
c1is =
tr4xenv_pop_cas0(env0)
val
c1s0 =
c1str_make_node
( loc0
, C1Kif0(), C1Sitms(c1is))
in
  tr4xenv_add_cstr(env0, c1s0)
end
//
end (*let*) // end of [aux_cas0]

(* ****** ****** *)

in(*in-of-local*)

implement
trans4x_dexp
(env0, d4e0) =
let
//
val
loc0 = d4e0.loc()
//
(*
val () =
println!
("trans4x_dexp: d4e0 = ", d4e0)
*)
//
in
//
case+
d4e0.node() of
//
|
D4Edapp _ => auxdapp(env0, d4e0)
//
|
D4Eopny _ => auxopny(env0, d4e0)
//
|D4Elet _ => aux_let(env0, d4e0)
|D4Ewhere
(d4e1, dcls) => aux_where(env0, d4e0)
//
|
D4Eif0
( _cond_
, _then_
, _else_) => aux_if0(env0, d4e0)
|
D4Ecas0 _ => aux_cas0(env0, d4e0)
//
|
D4Estmap
(d4e1, map2) =>
{
  val () =
  trans4x_dexp(env0, d4e1)
}
|
D4Estmrg
(d4e1, mrg2) =>
{
  val () =
  trans4x_dexp(env0, d4e1)
(*
  val () =
  trans4x_stmrg(env0, mrg2)
*)
}
|
D4Etcast
(d4e1, cstr) =>
{
  val () =
  trans4x_dexp(env0, d4e1)
  val () =
  trans4x_cstr(env0, loc0, cstr)
}
//
| _ (*rest-of-d4exp*) => ((*void*))
//
end (*let*) // end of [trans4x_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
trans4x_dexplst
(env0, d4es) =
(
case+ d4es of
|
list_nil() => ()
|
list_cons(d4e0, d4es) =>
{
  val () =
  trans4x_dexp(env0, d4e0)
  val () =
  trans4x_dexplst(env0, d4es)
}
) (* end of [trans4x_dexplst] *)
//
(* ****** ****** *)
//
implement
trans4x_farg
(env0, f4a0) =
let
//
val
loc0 = f4a0.loc()
//
// (*
val () =
println!
("trans4x_farg: f4a0 = ", f4a0)
// *)
//
in
//
case+
f4a0.node() of
|
F4ARGnone3 _ => ()
//
|
F4ARGsome_dyn
( npf1, d4ps ) =>
trans4x_dpatlst(env0, d4ps)
//
|
F4ARGsome_sta
( s2vs, s2ps ) =>
{
val () =
tr4xenv_add_svarlst(env0, s2vs)
val () =
tr4xenv_add_shyplst(env0, loc0, s2ps)
}
//
|
F4ARGsome_met(s2es) =>
let
  val
  cstr =
  c1str_make_node
  (loc0, C1Smwfd(s2es))
in
  tr4xenv_add_cstr(env0, cstr)
end
//
end (*let*) // end of [trans4x_farg]
//
(* ****** ****** *)
//
implement
trans4x_farglst
(env0, f4as) =
(
case+ f4as of
|
list_nil() => ()
|
list_cons(f4a0, f4as) =>
{
  val () =
  trans4x_farg(env0, f4a0)
  val () =
  trans4x_farglst(env0, f4as)
}
) (* end of [trans4x_farglst] *)
//
(* ****** ****** *)
//
implement
trans4x_dgpat
( env0, dgpt ) =
(
case+
dgpt.node() of
//
|
D4GPATpat(d4p1) =>
trans4x_dpat(env0, d4p1)
//
|
D4GPATgua(d4p1, d4gs) =>
trans4x_dpat(env0, d4p1)
//
) (* end of [trans4x_dgpat] *)
//
(* ****** ****** *)
//
implement
trans4x_dclau
( env0, dcl0 ) =
let
//
val
loc0 = dcl0.loc()
//
in
//
case+
dcl0.node() of
|
D4CLAUpat
( dgpt ) => ()
|
D4CLAUexp
(dgpt, d4e1) =>
let
val () =
tr4xenv_add_bloc(env0)
//
val () =
let
val () =
trans4x_dgpat
( env0, dgpt )
val () =
tr4xenv_add_citm
(env0, C1Igimp(*void*))
in
  trans4x_dexp(env0, d4e1)
end
//
val
c1is =
tr4xenv_pop_bloc(env0)
val
cstr =
c1str_make_node
( loc0
, C1Kbloc(), C1Sitms(c1is))
in
  tr4xenv_add_cstr(env0, cstr)
end
//
end // end of [trans4x_dclau]
//
(* ****** ****** *)
//
implement
trans4x_dclaulst
(env0, dcls) =
(
case+ dcls of
|
list_nil() => ()
|
list_cons(dcl0, dcls) =>
{
  val () =
  trans4x_dclau(env0, dcl0)
  val () =
  trans4x_dclaulst(env0, dcls)
}
) (* end of [trans4x_dclaulst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_valdecl
( env0:
! tr4xenv,
  d4cl: d4ecl): void =
let
//
val-
D4Cvaldecl
( tok0
, mopt
, v4ds) = d4cl.node()
//
in
  auxv4ds(env0, v4ds)
end where
{
//
fun
auxv4d0
( env0:
! tr4xenv
, v4d0
: v4aldecl): void =
let
//
val+
V4ALDECL
( rcd ) = v4d0
//
val loc = rcd.loc
//
(*
val () =
tr4xenv_add_val0(env0)
*)
//
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(d4e0) =>
trans4x_dexp(env0, d4e0)
) : void // end-of-val
//
in
//
case+
rcd.def of
|
None() => ()
|
Some(d4e0) =>
trans4x_dpat(env0, rcd.pat)
//
end // end of [auxv4d0]
//
fun
auxv4ds
( env0:
! tr4xenv
, v4ds
: v4aldeclist): void =
(
case+ v4ds of
|
list_nil() => ()
|
list_cons
(v4d0, v4ds) => () where
{
val () = auxv4d0(env0, v4d0)
val () = auxv4ds(env0, v4ds)
}
) (* end of [auxv4ds] *)
//
} (*where*) // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_fundecl
( env0:
! tr4xenv,
  d4cl: d4ecl): void =
let
//
val-
D4Cfundecl
( tok0
, mopt
, tqas
, f4ds) = d4cl.node()
//
in
  auxf4ds(env0, f4ds)
end where
{
//
fun
auxf4d0
( env0:
! tr4xenv
, f4d0
: f4undecl): void =
let
//
val+
F4UNDECL
( rcd ) = f4d0
//
val loc = rcd.loc
//
val () =
tr4xenv_add_fun0(env0)
//
val () =
(
case+
rcd.a4g of
|
None() => ()
|
Some(f4as) =>
trans4x_farglst
( env0, f4as )): void
//
val () =
(
case+
rcd.def of
|
None() => ()
|
Some(d4e0) =>
trans4x_dexp(env0, d4e0)
) : void // end-of-val
//
val c1is =
tr4xenv_pop_fun0(env0)
val cstr =
c1str_make_node
(loc, C1Kfun0(), C1Sitms(c1is))
//
in
tr4xenv_add_citm( env0, C1Icstr(cstr) )
end // end of [auxf4d0]
//
fun
auxf4ds
( env0:
! tr4xenv
, f4ds
: f4undeclist): void =
(
case+ f4ds of
|
list_nil() => ()
|
list_cons
(f4d0, f4ds) => () where
{
val () = auxf4d0(env0, f4d0)
val () = auxf4ds(env0, f4ds)
}
) (* end of [auxf4ds] *)
//
} (*where*) // end of [aux_fundecl]

(* ****** ****** *)

in(*in-of-local*)

implement
trans4x_decl
(env0, d4cl) =
let
//
(*
val () =
println!
("trans4x_decl: d4cl = ", d4cl)
*)
//
in(*in-of-let*)
//
case+
d4cl.node() of
//
|
D4Cvaldecl _ =>
aux_valdecl(env0, d4cl)
//
|
D4Cfundecl _ =>
aux_fundecl(env0, d4cl)
//
| _ (*rest-of-d4ecl*) => ((*void*))
//
end (*let*) // end of [trans4x_decl]

end // end of [local]

(* ****** ****** *)

implement
trans4x_declist
(env0, dcls) =
(
case+ dcls of
|
list_nil() => ()
|
list_cons(d4cl, dcls) =>
{
  val () =
  trans4x_decl(env0, d4cl)
  val () =
  trans4x_declist(env0, dcls)
}
) (* end of [trans4x_declist] *)

(* ****** ****** *)

local

fun
aux_exi
( env0
: !tr4xenv
, loc0: loc_t
, s2e0: s2exp): s2exp =
let
//
val-
S2Eexi
( s2vs
, s2ps
, s2e1) = s2e0.node()
//
val
tsub = auxtsub( s2vs )
//
val () =
auxs2ps
( env0
, s2ps
, s2vs
, $UN.list_vt2t(tsub))
//
val
s2e1 =
s2exp_subst_svarlst
( s2e1
, s2vs
, $UN.list_vt2t(tsub))
//
val () =
list_vt_free( tsub )
in
  s2exp_whnfize(s2e1)
end where
{
//
fun
auxtsub
( s2vs
: s2varlst)
: s2explst_vt =
(
case+ s2vs of
|
list_nil() =>
list_vt_nil()
|
list_cons(s2v1, s2vs) =>
let
  val xtv1 =
  s2xtv_new_srt
  (loc0, s2v1.sort())
  val s2e1 = s2exp_xtv(xtv1)
in
list_vt_cons(s2e1, auxtsub(s2vs))
end
) (* end of [auxtsub] *)
//
fun
auxs2ps
( env0:
! tr4xenv
, s2ps: s2explst
, s2vs: s2varlst
, tsub: s2explst): void =
(
case+ s2ps of
|
list_nil() => ()
|
list_cons
(s2p1, s2ps) =>
let
val
s2p1 =
s2exp_subst_svarlst
( s2p1, s2vs, tsub )
val
cstr =
c1str_make_node
( loc0, C1Ssexp(s2p1))
val () =
tr4xenv_add_cstr(env0, cstr)
in
  auxs2ps(env0, s2ps, s2vs, tsub)
end // end of [list_cons]
)
//
} (*where*) // end of [aux_exi]

(* ****** ****** *)

(*
fun
aux_t2ype
( env0
: !tr4xenv
, loc0: loc_t
, s2e0: s2exp): s2exp =
let
//
val-
S2Et2ype
( t2p0 ) = s2e0.node()
//
in
//
case+
t2p0.node() of
|
T2Papp(t2f0, t2ps) =>
let
val
s2f0 = s2exp_t2ype(t2f0)
val
s2es =
auxt2ps(env0, loc0, t2ps)
in
s2exp_apps(loc0, s2f0, s2es)
end
//
| _(*else-of-t2ype*) => s2e0
//
end where
{
fun
auxt2ps
( env0:
! tr4xenv
, loc0: loc_t
, t2ps: t2ypelst): s2explst =
(
case+ t2ps of
|
list_nil() =>
list_nil()
|
list_cons
(t2p1, t2ps) =>
let
//
val s2e1 =
(
case+
t2p1.node() of
|
T2Pnone0() =>
let
val
s2t1 =
t2p1.sort()
val
s2v1 =
s2var_new(s2t1)
val () =
tr4xenv_add_svar
( env0, s2v1 )
in
  s2exp_var(s2v1)
end
//
|
_(*else*) => s2exp_t2ype(t2p1)
//
) : s2exp // end-of-val
//
in
list_cons
(s2e1, auxt2ps(env0, loc0, t2ps))
end
)
} (*where*) // end of [aux_t2ype]
*)

(* ****** ****** *)

in(*in-of-local*)

fun
trans4x_s2exp_deexi
( env0:
! tr4xenv
, loc0: loc_t
, s2e0: s2exp): s2exp =
(
case+
s2e0.node() of
|
S2Eexi _ =>
aux_exi(env0, loc0, s2e0)
//
(*
|
S2Et2ype _ =>
aux_t2ype(env0, loc0, s2e0)
*)
//
| _(*else-of-s2exp*) => s2e0
//
) (* end of [trans4x_s2exp_deexi] *)

end // end of [trans4x_s2exp_deexi]

(* ****** ****** *)
//
fun
un_S2Extv
(x0: s2exp): bool =
(
case+ x0.node() of
S2Extv _ => true | _ => false
)
//
fun
un_S2Eapp
(x0: s2exp): bool =
(
case+ x0.node() of
S2Eapp _ => true | _ => false
)
//
(* ****** ****** *)

local

(* ****** ****** *)
// HX: auxh: singul
// HX: auxi: singul
// HX: auxii: plural
(* ****** ****** *)

fun
auxh_eqeq
( env0:
! tr4xenv,
  loc0: loc_t
, s2e1: s2exp
, s2e2: s2exp): void =
let
//
val s2e1 =
s2exp_whnfize(s2e1)
val s2e2 =
s2exp_whnfize(s2e2)
//
val () =
println!
("auxh_eqeq: s2e1 = ", s2e1)
val () =
println!
("auxh_eqeq: s2e2 = ", s2e2)
//
in
//
ifcase
|
un_S2Extv(s2e1) =>
let
val-
S2Extv
(xtv1) = s2e1.node()
in
s2xtv_set_sexp(xtv1, s2e2)
end
|
un_S2Extv(s2e2) =>
let
val-
S2Extv
(xtv2) = s2e2.node()
in
s2xtv_set_sexp(xtv2, s2e1)
end
|
_ (* else-of-ifcase *) =>
let
val chyp =
c1hyp_make_node
(loc0, C1Heqeq(s2e1, s2e2))
in
  tr4xenv_add_chyp( env0, chyp )
end
//
end (*let*) // end of [auxh_eqeq]

(* ****** ****** *)

and
auxh_tpeq
( env0:
! tr4xenv,
  loc0: loc_t
, s2e1: s2exp
, s2e2: s2exp): void =
let
//
val s2e1 =
s2exp_whnfize(s2e1)
val s2e2 =
s2exp_whnfize(s2e2)
//
val () =
println!
("auxh_tpeq: s2e1 = ", s2e1)
val () =
println!
("auxh_tpeq: s2e2 = ", s2e2)
//
in
//
ifcase
|
un_S2Extv(s2e1) =>
let
val-
S2Extv
(xtv1) = s2e1.node()
in
s2xtv_set_sexp(xtv1, s2e2)
end
|
un_S2Extv(s2e2) =>
let
val-
S2Extv
(xtv2) = s2e2.node()
in
s2xtv_set_sexp(xtv2, s2e1)
end
//
|
un_S2Eapp(s2e1) =>
let
//
val-
S2Eapp
(s2f1, ses1) = s2e1.node()
val-
S2Eapp
(s2f2, ses2) = s2e2.node()
//
val () =
auxh_tpeq(env0, loc0, s2f1, s2f2)
//
in
auxhh_eqeq(env0, loc0, ses1, ses2)
end // end of [S2Eapp]
|
_ (* else-of-ifcase *) =>
let
val chyp =
c1hyp_make_node
(loc0, C1Htpeq(s2e1, s2e2))
in
  tr4xenv_add_chyp( env0, chyp )
end
//
end (*let*) // end of [auxh_tpeq]

(* ****** ****** *)

and
auxhh_eqeq
( env0:
! tr4xenv,
  loc0: loc_t
, ses1: s2explst
, ses2: s2explst): void =
(
case+ ses1 of
|
list_nil
((*void*)) => ()
|
list_cons
(s2e1, ses1) =>
let
val-
list_cons
(s2e2, ses2) = ses2
val () =
auxh_eqeq(env0, loc0, s2e1, s2e2)
in
auxhh_eqeq(env0, loc0, ses1, ses2)
end
) (* end of [auxhh_eqeq] *)

(* ****** ****** *)

fun
auxi_eqeq
( env0:
! tr4xenv,
  loc0: loc_t
, s2e1: s2exp
, s2e2: s2exp): void =
let
//
val s2e1 =
s2exp_whnfize(s2e1)
val s2e2 =
s2exp_whnfize(s2e2)
//
val () =
println!
("auxi_eqeq: s2e1 = ", s2e1)
val () =
println!
("auxi_eqeq: s2e2 = ", s2e2)
//
in
//
ifcase
|
un_S2Extv(s2e1) =>
let
val-
S2Extv
(xtv1) = s2e1.node()
in
s2xtv_set_sexp(xtv1, s2e2)
end
|
un_S2Extv(s2e2) =>
let
val-
S2Extv
(xtv2) = s2e2.node()
in
s2xtv_set_sexp(xtv2, s2e1)
end
|
_ (*else-of-ifcase*) =>
let
val cstr =
c1str_make_node
(loc0, C1Seqeq(s2e1, s2e2))
in
  tr4xenv_add_cstr( env0, cstr )
end
//
end (*let*) // end of [auxi_eqeq]

(* ****** ****** *)

and
auxi_tple
( env0:
! tr4xenv,
  loc0: loc_t
, s2e1: s2exp
, s2e2: s2exp): void =
let
//
val s2e1 =
s2exp_whnfize(s2e1)
val s2e2 =
s2exp_whnfize(s2e2)
//
val () =
println!
("auxi_tple: s2e1 = ", s2e1)
val () =
println!
("auxi_tple: s2e2 = ", s2e2)
//
in
//
case+
s2e1.node() of
|
S2Eapp
(s2f1, ses1) =>
let
val
s2e2 =
trans4x_s2exp_deexi
( env0, loc0, s2e2 )
// (*
val () =
println!
("auxi_tple: s2e2 = ", s2e2)
// *)
val-
S2Eapp
( s2f2
, ses2) = s2e2.node()
val () =
auxi_tpeq(env0, loc0, s2f1, s2f2)
in
auxii_eqeq(env0, loc0, ses1, ses2)
end (*let*) // end of [S2Eapp]
//
(*
|
S2Eexi
( svs1
, sps1, s2e1) =>
let
//
val
svs2 =
s2varlst_copy(svs1)
val
sps2 =
s2explst_revars
( sps1, svs1, svs2 )
//
val () =
tr4xenv_add_sexi(env0)
//
val () =
auxi_tple
( env0
, loc0, s2e1, s2e2) where
{
val
s2e1 =
s2exp_revars(s2e1, svs1, svs2)
val () =
tr4xenv_add_svarlst(env0, svs2)
val () =
tr4xenv_add_shyplst(env0, loc0, sps2)
}
//
in
//
tr4xenv_add_citm
(env0, C1Icstr(cstr)) where
{
val c1is =
tr4xenv_pop_sexi(env0)
val cstr =
c1str_make_node
(loc0, C1Ksexi(), C1Sitms(c1is))
}
//
end (*let*) // end of [S2Eexi]
*)
//
|
_(*rest-of-s2exp*) =>
let
  val
  cstr =
  c1str_make_node
  (loc0, C1Stple(s2e1, s2e2))
in
  tr4xenv_add_cstr( env0, cstr )
end
//
end (*let*) // end of [auxi_tple]

(* ****** ****** *)

and
auxi_tpeq
( env0:
! tr4xenv,
  loc0: loc_t
, s2e1: s2exp
, s2e2: s2exp): void =
let
//
val s2e1 =
s2exp_whnfize(s2e1)
val s2e2 =
s2exp_whnfize(s2e2)
//
val () =
println!
("auxi_tpeq: s2e1 = ", s2e1)
val () =
println!
("auxi_tpeq: s2e2 = ", s2e2)
//
in
//
ifcase
|
_(* else-of-ifcase *) =>
let
  val
  cstr =
  c1str_make_node
  (loc0, C1Stpeq(s2e1, s2e2))
in
  tr4xenv_add_cstr( env0, cstr )
end
//
end (*let*) // end of [auxi_tpeq]

(* ****** ****** *)

and
auxii_eqeq
( env0:
! tr4xenv,
  loc0: loc_t
, ses1: s2explst
, ses2: s2explst): void =
(
case+ ses1 of
|
list_nil
((*void*)) => ()
|
list_cons
(s2e1, ses1) =>
let
val-
list_cons
(s2e2, ses2) = ses2
val () =
auxi_eqeq
(env0, loc0, s2e1, s2e2)
in
auxii_eqeq
(env0, loc0, ses1, ses2)
end
) (* end of [auxii_eqeq] *)

in(*in-of-local*)

implement
trans4x_cstr
(env0, loc0, cstr) =
let
//
val () =
println!
("trans4x_cstr: loc0 = ", loc0)
val () =
println!
("trans4x_cstr: cstr = ", cstr)
//
in
//
case+ cstr of
//
|
C0Htpeq
(s2e1, s2e2) =>
auxh_tpeq(env0, loc0, s2e1, s2e2)
//
|
C0Itple
(s2e1, s2e2) =>
auxi_tple(env0, loc0, s2e1, s2e2)
|
C0Itpeq
(s2e1, s2e2) =>
auxi_tpeq(env0, loc0, s2e1, s2e2)
//
|
C0Idvar
(d2v0, s2e1, s2e2) =>
auxi_tple(env0, loc0, s2e1, s2e2)
//
(*
|
_(*rest-of-c0str*) =>
(
  let
  val
  cstr =
  c1str_make_node
  (loc0, C1Scstr(cstr))
  in
    tr4xenv_add_cstr( env0, cstr )
  end
)
*)
//
end (*let*) // end of [trans4x_cstr]

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans4x_dynexp.dats] *)
