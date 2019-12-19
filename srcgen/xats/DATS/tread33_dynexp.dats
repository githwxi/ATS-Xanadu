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
// Start Time: September, 2019
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
#staload "./../SATS/label0.sats"
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
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
//
#staload "./../SATS/tread33.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/staexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/statyp2_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp1_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp3_print.dats"

(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_d3pat
  (d3p0) = let
//
val loc0 = d3p0.loc((*void*))
//
in
//
case+
d3p0.node() of
//
| D3Pany _ => ()
| D3Pvar _ => ()
//
| D3Pcon1 _ => ()
//
| D3Pdapp
  (d3f1, npf2, d3ps) =>
  {
    val () =
    tread33_d3pat<>(d3f1)
    val () =
    tread33_d3patlst<>(d3ps)
  }
//
| D3Pnone0() => ()
//
| D3Ptuple
  (knd, npf, d3ps) =>
  {
    val () =
    tread33_d3patlst<>(d3ps)
  }
//
| D3Panno(d3p1, t2p2) =>
  {
    val () =
    tread33_d3pat<>(d3p1)
  }
//
| D3Psym0(sym0, dpis) =>
  let
    val
    t2p0 = d3p0.type()
    val () =
    t3xerr_add(T3XERRd3pat(d3p0))
  in
    println!
    (loc0, ": T3XERR(d3pat): D3Psym0: sym0 = ", sym0);
    println!
    (loc0, ": T3XERR(d3pat): D3Psym0: t2p0 = ", t2p0);
    println!
    (loc0, ": T3XERR(d3pat): D3Psym0: dpis = ", dpis);
  end
//
| D3Ptcast(d3p1, t2p2) =>
  let
//
    val
    t2p1 = d3p1.type()
//
    val () =
    tread33_d3pat<>(d3p1)
//
    val () =
    t3xerr_add(T3XERRd3pat(d3p0))
  in
//
    println!
    (loc0, ": T3XERR(d3pat): D3Ptcast: d3p1 = ", d3p1);
    println!
    (loc0, ": T3XERR(d3pat): D3Ptcast: t2p1 = ", t2p1);
    println!
    (loc0, ": T3XERR(d3pat): D3Ptcast: t2p2 = ", t2p2);
//
  end
//
| D3Pnone1(d3p1) =>
  let
    val () =
    t3xerr_add(T3XERRd3pat(d3p0))
  in
    println!
    (loc0, ": T3XERR(d3pat): D3Pnone1: d3p1 = ", d3p1);
  end // end of [D3Pnone1]
//
| _(* rest-of-d3pat *) =>
  {
    val () = println!(loc0, ": tread33_d3pat(", d3p0, ")")
  }
//
end // end of [tread33_d3pat]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_d3patopt(opt) =
(
case+ opt of
| None() => ()
| Some(d3p) => tread33_d3pat<>(d3p)
)
//
implement
{}(*tmp*)
tread33_d3patlst(d3ps) =
(
list_foreach<d3pat>(d3ps)
) where
{
implement(env)
list_foreach$fwork<d3pat><env>(d3p, env) = tread33_d3pat<>(d3p)
} (* end of [tread33_d3patlst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
tread33_d3exp
  (d3e0) = let
//
val
loc0 = d3e0.loc((*void*))
val
t2p0 = t2ype_hnfize(d3e0.type())
(*
val () =
println!
("tread33_d3exp: d3e0 = ", d3e0)
val () =
println!
("tread33_d3exp: t2p0 = ", t2p0)
*)
//
in
//
case+
d3e0.node() of
//
| D3Eint _ => ()
| D3Ebtf _ => ()
| D3Echr _ => ()
| D3Eflt _ => ()
| D3Estr _ => ()
//
| D3Evar _ => ()
//
| D3Econ1 _ => ()
| D3Ecst1 _ => ()
//
| D3Efcst _ => ()
| D3Etcst _ => ()
//
| D3Esap1
  (d3e1, s2e2) =>
  {
    val () =
    tread33_d3exp<>(d3e1)
  }
//
| D3Edapp
  (d3f1, npf2, d3es) =>
  {
    val () =
    tread33_d3exp<>(d3f1)
    val () =
    tread33_d3explst<>(d3es)
  }
//
| D3Elet(d3cs, d3e1) =>
  {
    val () =
    tread33_d3eclist<>(d3cs)
    val () = tread33_d3exp<>(d3e1)
  }
| D3Ewhere(d3e1, d3cs) =>
  {
    val () =
    tread33_d3eclist<>(d3cs)
    val () = tread33_d3exp<>(d3e1)
  }
//
| D3Eassgn(d3e1, d3e2) =>
  {
    val () = tread33_d3exp<>(d3e1)
    val () = tread33_d3exp<>(d3e2)
  }
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  {
    val () = tread33_d3exp<>(d3e1)
    val () = tread33_d3exp<>(d3e2)
    val () = tread33_d3expopt<>(opt3)
  }
//
| D3Ecase
  (knd0, d3e1, d3cs) =>
  {
    val () = tread33_d3exp<>(d3e1)
    val () = tread33_d3claulst<>(d3cs)
  }
//
| D3Econ2(d2cs) =>
  let
    val
    t2p0 = d3e0.type()
    val () =
    t3xerr_add(T3XERRd3exp(d3e0))
  in
    println!
    (loc0, ": T3XERR(d3exp): D3Econ2: d2cs = ", d2cs);
    println!
    (loc0, ": T3XERR(d3exp): D3Econ2: t2p0 = ", t2p0);
  end
//
| D3Esym0(sym0, dpis) =>
  let
    val
    t2p0 = d3e0.type()
    val () =
    t3xerr_add(T3XERRd3exp(d3e0))
  in
    println!
    (loc0, ": T3XERR(d3exp): D3Esym0: sym0 = ", sym0);
    println!
    (loc0, ": T3XERR(d3exp): D3Esym0: t2p0 = ", t2p0);
    println!
    (loc0, ": T3XERR(d3exp): D3Esym0: dpis = ", dpis);
  end
//
| D3Eaddr(d3e1) =>
  {
    val () = tread33_d3exp<>(d3e1)
  }
| D3Efold(d3e1) =>
  {
    val () = tread33_d3exp<>(d3e1)
  }
//
| D3Eeval
  ( knd0, d3e1 ) =>
  {
    val () = tread33_d3exp<>(d3e1)
  }
//
| D3Elazy(d3e1) =>
  {
    val () = tread33_d3exp<>(d3e1)
  }
//
| D3Elcast(d3e1, lab2) =>
  let
//
    val
    t2p1 = d3e1.type()
//
    val () =
    tread33_d3exp<>(d3e1)
//
    val () =
    t3xerr_add(T3XERRd3exp(d3e0))
  in
//
    println!
    (loc0, ": T3XERR(d3exp): D3Elcast: d3e1 = ", d3e1);
//
    println!(loc0, ": T3XERR(d3exp): D3Elcast: t2p1 = ", t2p1);
    println!(loc0, ": T3XERR(d3exp): D3Elcast: lab2 = ", lab2);
//
  end
| D3Etcast(d3e1, t2p2) =>
  let
//
    val
    t2p1 = d3e1.type()
//
    val () =
    tread33_d3exp<>(d3e1)
//
    val () =
    t3xerr_add(T3XERRd3exp(d3e0))
  in
//
    println!
    (loc0, ": T3XERR(d3exp): D3Etcast: d3e1 = ", d3e1);
//
    println!(loc0, ": T3XERR(d3exp): D3Etcast: t2p1 = ", t2p1);
    println!(loc0, ": T3XERR(d3exp): D3Etcast: t2p2 = ", t2p2);
//
  end
//
| D3Enone0() => ((*void*))
//
| D3Enone1(_) =>
  let
    val () =
    t3xerr_add(T3XERRd3exp(d3e0))
  in
    println!(loc0, ": T3XERR(d3exp): ", d3e0);
  end // end of [D1Enone1]
//
| _(* rest-of-d3exp *) =>
  {
    val () = println!(loc0, ": tread33_d3exp(", d3e0, ")")
  }
//
end // end of [tread33_d3exp]

(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_d3expopt(opt) =
(
case+ opt of
| None() => ()
| Some(d3e) => tread33_d3exp<>(d3e)
)
//
implement
{}(*tmp*)
tread33_d3explst(d3es) =
(
list_foreach<d3exp>(d3es)
) where
{
implement(env)
list_foreach$fwork<d3exp><env>(d3e, env) = tread33_d3exp<>(d3e)
} (* end of [tread33_d3explst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_d3gua
  (d3g0) =
(
case+
d3g0.node() of
| D3GUAexp(d3e1) =>
  {
    val () = tread33_d3exp<>(d3e1)
  }
| D3GUAmat(d3e1, d3p2) =>
  {
    val () = tread33_d3exp<>(d3e1)
    val () = tread33_d3pat<>(d3p2)
  }
)
//
implement
{}(*tmp*)
tread33_d3clau
  (d3cl) =
(
case+
d3cl.node() of
| D3CLAUpat(dgp1) =>
  {
    val () =
    tread33_d3gpat<>(dgp1)
  }
| D3CLAUexp(dgp1, d3e2) =>
  {
    val () =
    tread33_d3gpat<>(dgp1)
    val () = tread33_d3exp<>(d3e2)
  }
)
implement
{}(*tmp*)
tread33_d3gpat
  (dgp0) =
(
case+
dgp0.node() of
| D3GPATpat(d3p1) =>
  {
    val () = tread33_d3pat<>(d3p1)
  }
| D3GPATgua(d3p1, d3gs) =>
  {
    val () = tread33_d3pat<>(d3p1)
    val () = tread33_d3gualst<>(d3gs)
  }
)
//
implement
{}(*tmp*)
tread33_d3gualst(d3gs) =
(
list_foreach<d3gua>(d3gs)
) where
{
implement(env)
list_foreach$fwork<d3gua><env>(d3g, env) = tread33_d3gua<>(d3g)
} (* end of [tread33_d3gualst] *)
//
implement
{}(*tmp*)
tread33_d3claulst(d3cs) =
(
list_foreach<d3clau>(d3cs)
) where
{
implement(env)
list_foreach$fwork<d3clau><env>(d3cl, env) = tread33_d3clau<>(d3cl)
} (* end of [tread33_d3claulst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
tread33_d3ecl(d3cl) =
let
//
val loc0 = d3cl.loc()
//
(*
val () =
println!
("tread33_d3ecl: d3cl = ", d3cl)
*)
//
in
//
case+
d3cl.node() of
//
| D3Cd2ecl(d2c) => ()
//
| D3Cstatic(tok, d3c1) =>
  {
    val () = tread33_d3ecl<>(d3c1)
  }
| D3Cextern(tok, d3c1) =>
  {
    val () = tread33_d3ecl<>(d3c1)
  }
//
| D3Cvaldecl
  (knd, mopt, v3ds) =>
  {
    val () = tread33_v3aldeclist<>(v3ds)
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cvaldecl: v3ds = ", v3ds)
*)
  }
//
| D3Cvardecl
  (knd, mopt, v3ds) =>
  {
    val () = tread33_v3ardeclist<>(v3ds)
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cvardecl: v3ds = ", v3ds)
*)
  }
//
| D3Cfundecl
  (knd, mopt, tqas, f3ds) =>
  {
    val () = tread33_f3undeclist<>(f3ds)
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cfundecl: f3ds = ", f3ds)
*)
  }
//
| D3Cimpdecl1
  ( tok, mopt
  , sqas, tqas
  , id2c, ti2s, ti3a
  , f3as, res0, d3e0) =>
  {
    val () =
    tread33_f3arglst<>(f3as)
(*
    val () =
    tread33_ti3arg<>(ti3a)
    val () =
    tread33_ti2arglst<>(ti2s)
*)
    val () = tread33_d3exp<>(d3e0)
  }
| D3Cimpdecl2
  ( tok, mopt
  , sqas, tqas
  , id2c, ti2s, ti3a
  , f3as, res0, d3e0) =>
  {
    val () =
    tread33_f3arglst<>(f3as)
(*
    val () =
    tread33_ti3arg<>(ti3a)
    val () =
    tread33_ti2arglst<>(ti2s)
*)
    val () = tread33_d3exp<>(d3e0)
//
    val-
    IMPLD2CST2
    (dqid, d2cs, d2ct) = id2c
    val () =
    (
    case+ d2ct of
    | Some _ => ()
    | None _ => let
        val () =
        t3xerr_add(T3XERRd3ecl(d3cl))
      in
      println!
      ( loc0
      , ": T3XERR(d3ecl): D3Cimpdecl: id2c = "
      , id2c )
      end // end of [None()]
    )
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cimpdecl: d3cl = ", d3cl)
*)
  }
//
| _(* rest-of-d3ecl *) =>
  {
    val () = println!(loc0, ": tread33_d3ecl(", d3cl, ")")
  }
//
end // end of [tread33_d3ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_d3eclist(d3cs) =
(
list_foreach<d3ecl>(d3cs)
) where
{
implement(env)
list_foreach$fwork<d3ecl><env>(d3c, env) = tread33_d3ecl<>(d3c)
} (* end of [tread33_d3eclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_f3arg
  (f3a0) =
(
case+
f3a0.node() of
//
| F3ARGsome_sta _ => ()
| F3ARGsome_met _ => ()
| F3ARGsome_dyn
  (npf, d3ps) =>
  {
    val () = tread33_d3patlst<>(d3ps)
  }
//
| F3ARGnone2(f2a) =>
  let
    val loc0 = f3a0.loc()
    val ((*void*)) =
    t3xerr_add(T3XERRf3arg(f3a0))
  in
    println!
    (loc0, ": T3XERR(f3arg): F3ARGnone2: f2a = ", f2a)
  end
| F3ARGnone3(f3a) =>
  let
    val loc0 = f3a0.loc()
    val ((*void*)) =
    t3xerr_add(T3XERRf3arg(f3a0))
  in
    println!
    (loc0, ": T3XERR(f3arg): F3ARGnone3: f3a = ", f3a)
  end
//
) (* end of [tread33_f3arg] *)
//
implement
{}(*tmp*)
tread33_f3arglst(f3as) =
(
list_foreach<f3arg>(f3as)
) where
{
implement(env)
list_foreach$fwork<f3arg><env>(f3a, env) = tread33_f3arg<>(f3a)
} (* end of [tread33_f3arglst] *)
//
implement
{}(*tmp*)
tread33_f3arglstopt(opt0) =
(
case+ opt0 of None() => () | Some(f3as) => tread33_f3arglst<>(f3as)
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_v3aldecl
  (v3d0) =
{
  val () =
  tread33_d3pat<>(rcd.pat)
  val () =
  tread33_d3expopt<>(rcd.def)
(*
  val () =
  tread33_s2expopt<>(rcd.wth)
*)
} where
{
//
  val+V3ALDECL(rcd) = v3d0
//
} (* end of [tread33_v3aldecl] *)
//
implement
{}(*tmp*)
tread33_v3aldeclist(v3ds) =
(
list_foreach<v3aldecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<v3aldecl><env>(v3ds, env) = tread33_v3aldecl<>(v3ds)
} (* end of [tread33_v3aldeclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_v3ardecl
  (v3d0) =
{
(*
  val () =
  tread33_d2var(rcd.d2v)
*)
  val () =
  tread33_d3expopt(rcd.ini)
} where
{
  val+V3ARDECL(rcd) = v3d0
}
//
implement
{}(*tmp*)
tread33_v3ardeclist(v3ds) =
(
list_foreach<v3ardecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<v3ardecl><env>(v3ds, env) = tread33_v3ardecl<>(v3ds)
} (* end of [tread33_v3ardeclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread33_f3undecl
  (f3d0) =
{
  val () =
  tread33_d3expopt(rcd.def)
  val () =
  tread33_f3arglstopt(rcd.a3g)
} where
{
//
  val+F3UNDECL(rcd) = f3d0
//
} (* end of [tread33_f3undecl] *)
//
implement
{}(*tmp*)
tread33_f3undeclist(f3ds) =
(
list_foreach<f3undecl>(f3ds)
) where
{
implement(env)
list_foreach$fwork<f3undecl><env>(f3ds, env) = tread33_f3undecl<>(f3ds)
} (* end of [tread33_f3undeclist] *)
//
(* ****** ****** *)

local

extern
fun{}
the_t3xerrlst_get(): t3xerrlst
extern
fun{}
the_t3xerrlst_set(t3xerrlst): void

implement
{}(*tmp*)
t3xerr_add(xerr) = let
//
val
xerrs = the_t3xerrlst_get<>()
//
in
  the_t3xerrlst_set<>(list_cons(xerr, xerrs))
end // end of [t3xerr_add]

in (* in-of-local *)

implement
tread33_main(d3cs) = let
//
local
//
val
the_t3xerrlst =
ref<t3xerrlst>(list_nil)
//
in(*in-of-local*)
val () =
$tempenver(the_t3xerrlst)
implement
the_t3xerrlst_get<>() = the_t3xerrlst[]
implement
the_t3xerrlst_set<>(xs) = the_t3xerrlst[] := xs
end // end of [local]
//
val () =
tread33_d3eclist<>(d3cs)
val
xerrs = the_t3xerrlst_get<>()
val
nxerr = list_length<t3xerr>(xerrs)
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
("tread33_main: nxerr = ", nxerr)
//
val () =
if
(nxerr = 1)
then
prerrln!
("tread33_main: there is one t3xerr!")
val () =
if
(nxerr > 1)
then
prerrln!
("tread33_main: there are some t3xerrs!")
//
val () =
(
$raise(XATSOPT_T3XERR_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("tread33_main: there are no t3xerrs!")
//
} (* end of [else] *)
//
end // end of [tread33_main]

end // end of [local]

(* ****** ****** *)

(* end of [xats_tread33_dynexp.dats] *)
