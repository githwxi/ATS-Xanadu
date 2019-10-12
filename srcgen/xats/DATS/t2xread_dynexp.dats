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
// Start Time: June, 2019
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
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
#staload "./../SATS/t2xread.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/staexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/t2xread_staexp.dats"

(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_d2cst
  (d2c0) = let
//
val
loc0 = d2c0.loc((*void*))
val
s2e0 = d2cst_get_sexp(d2c0)
//
val () = t2xread_s2exp(s2e0)
//
in
  // nothing
end // end of [t2xread_d2cst]
//
implement
{}(*tmp*)
t2xread_d2cstlst(d2cs) =
(
list_foreach<d2cst>(d2cs)
) where
{
implement(env)
list_foreach$fwork<d2cst><env>(d2c, env) = t2xread_d2cst<>(d2c)
} (* end of [t2xread_d2cstlst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_d2pat
  (d2p0) = let
//
val loc0 = d2p0.loc((*void*))
//
in
//
case+
d2p0.node() of
//
| D2Pany() => ()
//
| D2Pnone0() => ((*void*))
//
| D2Pnone1(_) =>
  let
    val () =
    t2xerr_add(T2XERRd2pat(d2p0))
  in
    prerrln!(loc0, ": T2XERR(d2pat): ", d2p0);
  end // end of [D2Pnone1]
//
| D2Ptuple
  (knd, npf, d2ps) =>
  {
    val () =
    t2xread_d2patlst<>(d2ps)
  }
//
| D2Panno(d2p1, s2e2) =>
  {
    val () = t2xread_s2exp<>(s2e2)
    val () = t2xread_d2pat<>(d2p1)
  }
//
| _(* rest-of-d2pat *) =>
  (
    prerrln!(loc0, ": t2xread_d2pat: d2p0 = ", d2p0)
  )
//
end // end of [t2xread_d2pat]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_d2patopt(opt) =
(
case+ opt of
| None() => ()
| Some(d2p) => t2xread_d2pat<>(d2p)
)
//
implement
{}(*tmp*)
t2xread_d2patlst(d2ps) =
(
list_foreach<d2pat>(d2ps)
) where
{
implement(env)
list_foreach$fwork<d2pat><env>(d2p, env) = t2xread_d2pat<>(d2p)
} (* end of [t2xread_d2patlst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
t2xread_d2exp
  (d2e0) = let
//
val
loc0 = d2e0.loc((*void*))
//
in
//
case+
d2e0.node() of
//
| D2Eint(tok) => ()
| D2Echr(tok) => ()
| D2Eflt(tok) => ()
| D2Estr(tok) => ()
//
| D2Evar(d2v) => ()
//
| D2Econ1(d2c) => ()
| D2Ecst1(d2c) => ()
//
| D2Econ2(d2cs) => ()
| D2Ecst2(d2cs) => ()
//
| D2Esapp
  (d2e1, s2es) =>
  {
    val () = t2xread_d2exp<>(d2e1)
    val () = t2xread_dsapparg<>(s2es)
  }
| D2Etapp
  (d2e1, s2es) =>
  {
    val () = t2xread_d2exp<>(d2e1)
    val () = t2xread_dtapparg<>(s2es)
  }
| D2Edapp
  (d2e1, npf, d2es) =>
  {
    val () = t2xread_d2exp<>(d2e1)
    val () = t2xread_d2explst<>(d2es)
  }
//
| D2Elet(d2cs, d2e1) =>
  {
    val () =
    t2xread_d2eclist<>(d2cs)
    val () = t2xread_d2exp<>(d2e1)
  }
| D2Ewhere(d2e1, d2cs) =>
  {
    val () =
    t2xread_d2eclist<>(d2cs)
    val () = t2xread_d2exp<>(d2e1)
  }
//
| D2Eassgn(d2e1, d2e2) =>
  {
    val () = t2xread_d2exp<>(d2e1)
    val () = t2xread_d2exp<>(d2e2)
  }
//
| D2Eif0
  (d2e1, d2e2, opt3) =>
  {
    val () = t2xread_d2exp<>(d2e1)
    val () = t2xread_d2exp<>(d2e2)
    val () = t2xread_d2expopt<>(opt3)
  }
//
| D2Eaddr(d2e1) =>
  {
    val () =
    t2xread_d2exp<>(d2e1)
  }
| D2Efold(d2e1) =>
  {
    val () =
    t2xread_d2exp<>(d2e1)
  }
//
| D2Eanno(d2e1, s2e2) =>
  {
    val () = t2xread_d2exp<>(d2e1)
    val () = t2xread_s2exp<>(s2e2)
  }
//
| D2Enone0() => ((*void*))
//
| D2Enone1(_) =>
  let
    val () =
    t2xerr_add(T2XERRd2exp(d2e0))
  in
    prerrln!(loc0, ": T2XERR(d2exp): ", d2e0);
  end // end of [D1Enone1]
//
| _(* rest-of-d2exp *) =>
  (
    prerrln!(loc0, ": t2xread_d2exp: d2e0 = ", d2e0)
  )
//
end // end of [t2xread_d2exp]

(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_d2expopt(opt) =
(
case+ opt of
| None() => ()
| Some(d2e) => t2xread_d2exp<>(d2e)
)
//
implement
{}(*tmp*)
t2xread_d2explst(d2es) =
(
list_foreach<d2exp>(d2es)
) where
{
implement(env)
list_foreach$fwork<d2exp><env>(d2e, env) = t2xread_d2exp<>(d2e)
} (* end of [t2xread_d2explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
t2xread_dsapparg
  (s2es) =
(
  auxlst(s2es)
) where
{
fun
auxlst
( s2es
: s2explst): void =
(
case+ s2es of
| list_nil() =>
  ((*void*))
| list_cons
  (s2e0, s2es) =>
  (
    auxlst(s2es)
  ) where
  {
    val () =
    (
    case+
    s2e0.node() of
    | S2Eany(knd) => ()
    | _(*non-S2Eany*) => t2xread_s2exp<>(s2e0)
    )
  }
) (* end of [auxlst] *)
} (* end of [t2xread_dsapparg] *)

implement
{}(*tmp*)
t2xread_dtapparg
  (s2es) =
(
  auxlst(s2es)
) where
{
fun
auxlst
( s2es
: s2explst): void =
(
case+ s2es of
| list_nil() =>
  ((*void*))
| list_cons
  (s2e0, s2es) =>
  (
    auxlst(s2es)
  ) where
  {
    val () =
    (
    case+
    s2e0.node() of
    | S2Eany(knd) => ()
    | _(*non-S2Eany*) => t2xread_s2exp<>(s2e0)
    )
  }
) (* end of [auxlst] *)
} (* end of [t2xread_dtapparg] *)

(* ****** ****** *)

implement
{}(*tmp*)
t2xread_d2ecl(d2cl) =
let
//
val loc0 = d2cl.loc()
//
(*
val () =
println!
("t2xread_d2ecl: d2cl = ", d2cl)
*)
//
in
//
case+
d2cl.node() of
//
| D2Cstatic
  (tok, d2c1) =>
  {
    val () =
    t2xread_d2ecl<>(d2c1)
  }
| D2Cextern
  (tok, d2c1) =>
  {
    val () =
    t2xread_d2ecl<>(d2c1)
  }
//
| D2Cinclude
  ( tok
  , src, knd, fopt, body) =>
  {
    val () =
    (
    case+ body of
    | None() => ()
    | Some(d2cs) =>
      (
        t2xread_d2eclist<>(d2cs)
      )
    )
  }
//
| D2Cstacst0(s2c, s2t) =>
  {
    val () = t2xread_s2cst<>(s2c)
    val () = t2xread_sort2<>(s2t)
  }
//
| D2Csexpdef(s2c, def) =>
  {
(*
    val
    def =
    s2cst_get_def(s2c)
    val () =
    assertloc(isneqz(def))
    val
    def = unsome(def)
*)
//
    val () = t2xread_s2exp<>(def)
//
(*
    val () =
    println!
    ("t2xread_d2ecl: D2Cs2expdef: s2c = ", s2c)
    val () =
    println!
    ("t2xread_d2ecl: D2Cs2expdef: s2c.def = ", def)
*)
//
  }
//
| D2Cabstype(s2c, df2) =>
  {
//
    val () = t2xread_abstdf2<>(df2)
//
(*
    val () =
    println!
    ("t2xread_d2ecl: D2Cabstype: s2c = ", s2c)
    val () =
    println!
    ("t2xread_d2ecl: D2Cabstype: s2c.def = ", df2)  
    val () =
    println!
    ("t2xread_d2ecl: D2Cabstype: s2c.sort = ", s2c.sort())
*)
//
  }
//
| D2Cabsimpl
  (knd, scs, def) =>
  {
//
    val () = t2xread_s2exp<>(def)
//
(*
    val () =
    println!
    ("t2xread_d2ecl: D2Cabsimpl: scs = ", scs)
    val () =
    println!
    ("t2xread_d2ecl: D2Cabsimpl: def = ", def)
    val () =
    println!
    ("t2xread_d2ecl: D2Cabsimpl: def.sort = ", def.sort())
*)
//
  }
//
| D2Csymload
  (tok, sym0, dpi1) =>
  (
  case+ dpi1 of
  | D2PITMnone(dqid) =>
    let
    val () =
    t2xerr_add(T2XERRd2ecl(d2cl))
    in
      prerrln!(loc0, ": T2XERR(d2ecl): ", d2cl);
    end // end of [D2PITMnone]
  | D2PITMsome(_, _) => ((*void*))
  )
//
| D2Cfundecl
  (knd, mopt, tqas, f2ds) =>
  {
    val () = t2xread_tq2arglst<>(tqas)
    val () = t2xread_f2undeclist<>(f2ds)
(*
    val () =
    println!
    ("t2xread_d2ecl: D2Cfundecl: tqas = ", tqas)
    val () =
    println!
    ("t2xread_d2ecl: D2Cfundecl: f2ds = ", f2ds)
*)
  }
//
| D2Cdynconst
  (knd, tqas, d2cs) =>
  {
    val () = t2xread_d2cstlst<>(d2cs)
    val () = t2xread_tq2arglst<>(tqas)
(*
    val () =
    println!
    ("t2xread_d2ecl: D2Cdynconst: tqas = ", tqas)
    val () =
    println!
    ("t2xread_d2ecl: D2Cdynconst: d2cs = ", d2cs)
*)
  }
//
| _(* rest-of-d2ecl *) =>
  (
    prerrln!(loc0, ": t2xread_d2ecl: d2cl = ", d2cl)
  )
//
end // end of [t2xread_d2ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_d2eclist(d2cs) =
(
list_foreach<d2ecl>(d2cs)
) where
{
implement(env)
list_foreach$fwork<d2ecl><env>(d2c, env) = t2xread_d2ecl<>(d2c)
} (* end of [t2xread_d2eclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_f2arg
  (f2a0) =
(
case+
f2a0.node() of
| F2ARGsome_dyn
  (npf, d2ps) =>
  {
    val () = t2xread_d2patlst<>(d2ps)
  }
| F2ARGsome_sta
  (s2vs, s2ps) =>
  {
    val () = t2xread_s2varlst<>(s2vs)
    val () = t2xread_s2explst<>(s2ps)
  }
//
| F2ARGsome_met(s2es) =>
  {
    val () = t2xread_s2explst<>(s2es)
  }
)
//
implement
{}(*tmp*)
t2xread_f2arglst(f2as) =
(
list_foreach<f2arg>(f2as)
) where
{
implement(env)
list_foreach$fwork<f2arg><env>(f2a, env) = t2xread_f2arg<>(f2a)
} (* end of [t2xread_f2arglst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_tq2arg
  (tq2a) =
(
  t2xread_s2varlst(tq2a.s2vs())
)
//
implement
{}(*tmp*)
t2xread_tq2arglst(tqas) =
(
list_foreach<tq2arg>(tqas)
) where
{
implement(env)
list_foreach$fwork<tq2arg><env>(tq2a, env) = t2xread_tq2arg<>(tq2a)
} (* end of [t2xread_tq2arglst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t2xread_f2undecl
  (f2d0) =
{
  val () =
  t2xread_d2expopt<>(rcd.def)
  val () =
  t2xread_f2arglst<>(rcd.arg)
  val () =
  t2xread_effs2expopt<>(rcd.res)
//
  val () = t2xread_s2expopt<>(rcd.wtp)
//
} where
{
//
  val+F2UNDECL(rcd) = f2d0
//
} (* end of [t2xread_f2undecl] *)
//
implement
{}(*tmp*)
t2xread_f2undeclist(f2ds) =
(
list_foreach<f2undecl>(f2ds)
) where
{
implement(env)
list_foreach$fwork<f2undecl><env>(f2ds, env) = t2xread_f2undecl<>(f2ds)
} (* end of [t2xread_f2undeclist] *)
//
(* ****** ****** *)

local

extern
fun{}
the_t2xerrlst_get(): t2xerrlst
extern
fun{}
the_t2xerrlst_set(t2xerrlst): void

implement
{}(*tmp*)
t2xerr_add(xerr) = let
//
val
xerrs = the_t2xerrlst_get<>()
//
in
  the_t2xerrlst_set<>(list_cons(xerr, xerrs))
end // end of [t2xerr_add]

in (* in-of-local *)

implement
t2xread_main(d2cs) = let
//
local
//
val
the_t2xerrlst =
ref<t2xerrlst>(list_nil)
//
in(*in-of-local*)
val () =
$tempenver(the_t2xerrlst)
implement
the_t2xerrlst_get<>() = the_t2xerrlst[]
implement
the_t2xerrlst_set<>(xs) = the_t2xerrlst[] := xs
end // end of [local]
//
val () =
t2xread_d2eclist<>(d2cs)
val
xerrs = the_t2xerrlst_get<>()
val
nxerr = list_length<t2xerr>(xerrs)
//
in
//
if
(nxerr > 0)
then
{
//
val () =
prerrln!
("t2xread_main: nxerr = ", nxerr)
//
val () =
if
(nxerr = 1)
then
prerrln!
("t2xread_main: there is one t2xerr!")
val () =
if
(nxerr > 1)
then
prerrln!
("t2xread_main: there are some t2xerrs!")
//
val () =
(
$raise(XATSOPT_T2XERR_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("t2xread_main: there are no t2xerrs!")
//
} (* end of [else] *)
//
end // end of [t2xread_main]

end // end of [local]

(* ****** ****** *)

(* end of [xats_t2xread_dynexp.dats] *)
