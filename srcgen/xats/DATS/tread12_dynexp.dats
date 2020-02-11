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
#staload "./../SATS/tread12.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/staexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/tread12_staexp.dats"

(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_d2cst
  (d2c0) = let
//
val
loc0 = d2c0.loc((*void*))
val
s2e0 = d2cst_get_sexp(d2c0)
//
val () = tread12_s2exp(s2e0)
//
in
  // nothing
end // end of [tread12_d2cst]
//
implement
{}(*tmp*)
tread12_d2cstlst(d2cs) =
(
list_foreach<d2cst>(d2cs)
) where
{
implement(env)
list_foreach$fwork<d2cst><env>(d2c, env) = tread12_d2cst<>(d2c)
} (* end of [tread12_d2cstlst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_d2pat
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
| D2Pvar(d2v) => ()
//
| D2Ptuple
  (knd, npf, d2ps) =>
  {
    val () =
    tread12_d2patlst<>(d2ps)
  }
//
| D2Panno(d2p1, s2e2) =>
  {
    val () = tread12_s2exp<>(s2e2)
    val () = tread12_d2pat<>(d2p1)
  }
//
| D2Pnone0() => ((*void*))
//
| D2Pnone1(_) =>
  let
    val () =
    trerr12_add(TRERR12d2pat(d2p0))
  in
    prerrln!(loc0, ": TRERR12(d2pat): ", d2p0);
  end // end of [D2Pnone1]
//
| _(* rest-of-d2pat *) =>
  (
    prerrln!(loc0, ": tread12_d2pat: d2p0 = ", d2p0)
  )
//
end // end of [tread12_d2pat]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_d2patopt(opt) =
(
case+ opt of
| None() => ()
| Some(d2p) => tread12_d2pat<>(d2p)
)
//
implement
{}(*tmp*)
tread12_d2patlst(d2ps) =
(
list_foreach<d2pat>(d2ps)
) where
{
implement(env)
list_foreach$fwork<d2pat><env>(d2p, env) = tread12_d2pat<>(d2p)
} (* end of [tread12_d2patlst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
tread12_d2exp
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
    val () = tread12_d2exp<>(d2e1)
    val () = tread12_dsapparg<>(s2es)
  }
| D2Etapp
  (d2e1, s2es) =>
  {
    val () = tread12_d2exp<>(d2e1)
    val () = tread12_dtapparg<>(s2es)
  }
| D2Edapp
  (d2e1, npf, d2es) =>
  {
    val () = tread12_d2exp<>(d2e1)
    val () = tread12_d2explst<>(d2es)
  }
//
| D2Elet(d2cs, d2e1) =>
  {
    val () =
    tread12_d2eclist<>(d2cs)
    val () = tread12_d2exp<>(d2e1)
  }
| D2Ewhere(d2e1, d2cs) =>
  {
    val () =
    tread12_d2eclist<>(d2cs)
    val () = tread12_d2exp<>(d2e1)
  }
//
| D2Eassgn(d2e1, d2e2) =>
  {
    val () = tread12_d2exp<>(d2e1)
    val () = tread12_d2exp<>(d2e2)
  }
//
| D2Eif0
  (d2e1, d2e2, opt3) =>
  {
    val () = tread12_d2exp<>(d2e1)
    val () = tread12_d2exp<>(d2e2)
    val () = tread12_d2expopt<>(opt3)
  }
//
| D2Eaddr(d2e1) =>
  {
    val () =
    tread12_d2exp<>(d2e1)
  }
| D2Efold(d2e1) =>
  {
    val () =
    tread12_d2exp<>(d2e1)
  }
//
| D2Eanno(d2e1, s2e2) =>
  {
    val () = tread12_d2exp<>(d2e1)
    val () = tread12_s2exp<>(s2e2)
  }
//
| D2Enone0() => ((*void*))
//
| D2Enone1(_) =>
  let
    val () =
    trerr12_add(TRERR12d2exp(d2e0))
  in
    prerrln!(loc0, ": TRERR12(d2exp): ", d2e0);
  end // end of [D1Enone1]
//
| _(* rest-of-d2exp *) =>
  (
    prerrln!(loc0, ": tread12_d2exp: d2e0 = ", d2e0)
  )
//
end // end of [tread12_d2exp]

(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_d2expopt(opt) =
(
case+ opt of
| None() => ()
| Some(d2e) => tread12_d2exp<>(d2e)
)
//
implement
{}(*tmp*)
tread12_d2explst(d2es) =
(
list_foreach<d2exp>(d2es)
) where
{
implement(env)
list_foreach$fwork<d2exp><env>(d2e, env) = tread12_d2exp<>(d2e)
} (* end of [tread12_d2explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
tread12_dsapparg
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
    | _(*non-S2Eany*) => tread12_s2exp<>(s2e0)
    )
  }
) (* end of [auxlst] *)
} (* end of [tread12_dsapparg] *)

implement
{}(*tmp*)
tread12_dtapparg
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
    | _(*non-S2Eany*) => tread12_s2exp<>(s2e0)
    )
  }
) (* end of [auxlst] *)
} (* end of [tread12_dtapparg] *)

(* ****** ****** *)

implement
{}(*tmp*)
tread12_d2ecl(d2cl) =
let
//
val loc0 = d2cl.loc()
//
(*
val () =
println!
("tread12_d2ecl: d2cl = ", d2cl)
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
    tread12_d2ecl<>(d2c1)
  }
| D2Cextern
  (tok, d2c1) =>
  {
    val () =
    tread12_d2ecl<>(d2c1)
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
        tread12_d2eclist<>(d2cs)
      )
    )
  }
//
| D2Cstacst0(s2c, s2t) =>
  {
    val () = tread12_s2cst<>(s2c)
    val () = tread12_sort2<>(s2t)
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
    val () = tread12_s2exp<>(def)
//
(*
    val () =
    println!
    ("tread12_d2ecl: D2Cs2expdef: s2c = ", s2c)
    val () =
    println!
    ("tread12_d2ecl: D2Cs2expdef: s2c.def = ", def)
*)
//
  }
//
| D2Cabstype(s2c, df2) =>
  {
//
    val () = tread12_abstdf2<>(df2)
//
(*
    val () =
    println!
    ("tread12_d2ecl: D2Cabstype: s2c = ", s2c)
    val () =
    println!
    ("tread12_d2ecl: D2Cabstype: s2c.def = ", df2)  
    val () =
    println!
    ("tread12_d2ecl: D2Cabstype: s2c.sort = ", s2c.sort())
*)
//
  }
//
| D2Cabsimpl
  (knd, scs, def) =>
  {
//
    val () = tread12_s2exp<>(def)
//
(*
    val () =
    println!
    ("tread12_d2ecl: D2Cabsimpl: scs = ", scs)
    val () =
    println!
    ("tread12_d2ecl: D2Cabsimpl: def = ", def)
    val () =
    println!
    ("tread12_d2ecl: D2Cabsimpl: def.sort = ", def.sort())
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
    trerr12_add(TRERR12d2ecl(d2cl))
    in
      prerrln!(loc0, ": TRERR12(d2ecl): ", d2cl);
    end // end of [D2PITMnone]
  | D2PITMsome(_, _) => ((*void*))
  )
//
| D2Cfundecl
  (knd, mopt, tqas, f2ds) =>
  {
    val () = tread12_tq2arglst<>(tqas)
    val () = tread12_f2undeclist<>(f2ds)
(*
    val () =
    println!
    ("tread12_d2ecl: D2Cfundecl: tqas = ", tqas)
    val () =
    println!
    ("tread12_d2ecl: D2Cfundecl: f2ds = ", f2ds)
*)
  }
//
| D2Cdynconst
  (knd, tqas, d2cs) =>
  {
    val () = tread12_d2cstlst<>(d2cs)
    val () = tread12_tq2arglst<>(tqas)
(*
    val () =
    println!
    ("tread12_d2ecl: D2Cdynconst: tqas = ", tqas)
    val () =
    println!
    ("tread12_d2ecl: D2Cdynconst: d2cs = ", d2cs)
*)
  }
//
| _(* rest-of-d2ecl *) =>
  (
    prerrln!(loc0, ": tread12_d2ecl: d2cl = ", d2cl)
  )
//
end // end of [tread12_d2ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_d2eclist(d2cs) =
(
list_foreach<d2ecl>(d2cs)
) where
{
implement(env)
list_foreach$fwork<d2ecl><env>(d2c, env) = tread12_d2ecl<>(d2c)
} (* end of [tread12_d2eclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_f2arg
  (f2a0) =
(
case+
f2a0.node() of
| F2ARGsome_dyn
  (npf, d2ps) =>
  {
    val () = tread12_d2patlst<>(d2ps)
  }
| F2ARGsome_sta
  (s2vs, s2ps) =>
  {
    val () = tread12_s2varlst<>(s2vs)
    val () = tread12_s2explst<>(s2ps)
  }
//
| F2ARGsome_met(s2es) =>
  {
    val () = tread12_s2explst<>(s2es)
  }
)
//
implement
{}(*tmp*)
tread12_f2arglst(f2as) =
(
list_foreach<f2arg>(f2as)
) where
{
implement(env)
list_foreach$fwork<f2arg><env>(f2a, env) = tread12_f2arg<>(f2a)
} (* end of [tread12_f2arglst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_tq2arg
  (tq2a) =
(
  tread12_s2varlst(tq2a.s2vs())
)
//
implement
{}(*tmp*)
tread12_tq2arglst(tqas) =
(
list_foreach<tq2arg>(tqas)
) where
{
implement(env)
list_foreach$fwork<tq2arg><env>(tq2a, env) = tread12_tq2arg<>(tq2a)
} (* end of [tread12_tq2arglst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread12_f2undecl
  (f2d0) =
{
  val () =
  tread12_d2expopt<>(rcd.def)
  val () =
  tread12_f2arglst<>(rcd.arg)
  val () =
  tread12_effs2expopt<>(rcd.res)
//
  val () = tread12_s2expopt<>(rcd.wtp)
//
} where
{
//
  val+F2UNDECL(rcd) = f2d0
//
} (* end of [tread12_f2undecl] *)
//
implement
{}(*tmp*)
tread12_f2undeclist(f2ds) =
(
list_foreach<f2undecl>(f2ds)
) where
{
implement(env)
list_foreach$fwork<f2undecl><env>(f2ds, env) = tread12_f2undecl<>(f2ds)
} (* end of [tread12_f2undeclist] *)
//
(* ****** ****** *)

local

extern
fun{}
the_trerr12lst_get(): trerr12lst
extern
fun{}
the_trerr12lst_set(trerr12lst): void

implement
{}(*tmp*)
trerr12_add(xerr) = let
//
val
xerrs = the_trerr12lst_get<>()
//
in
  the_trerr12lst_set<>(list_cons(xerr, xerrs))
end // end of [trerr12_add]

in (* in-of-local *)

implement
tread12_main(d2cs) = let
//
local
//
val
the_trerr12lst =
ref<trerr12lst>(list_nil)
//
in(*in-of-local*)
val () =
$tempenver(the_trerr12lst)
implement
the_trerr12lst_get<>() = the_trerr12lst[]
implement
the_trerr12lst_set<>(xs) = the_trerr12lst[] := xs
end // end of [local]
//
val () =
tread12_d2eclist<>(d2cs)
val
xerrs = the_trerr12lst_get<>()
val
nxerr = list_length<trerr12>(xerrs)
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
("\
tread12_main: \
nxerr = ", nxerr)
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread12_main: \
there is one trerr12-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread12_main: \
there are some trerr12-errors!")
//
val () =
(
$raise(XATSOPT_TRERR12_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("\
tread12_main: \
there are none of trerr12-errors!")
//
} (* end of [else] *)
//
end // end of [tread12_main]

end // end of [local]

(* ****** ****** *)

(* end of [xats_tread12_dynexp.dats] *)
