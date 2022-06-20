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
#staload
_(*TMP*) =
"./../DATS/staexp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/statyp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/dynexp1_print0.dats"
#staload
_(*TMP*) =
"./../DATS/dynexp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/dynexp3_print0.dats"
(* ****** ****** *)
//
#staload "./../SATS/xlabel0.sats"
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing0.sats"
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
//
overload
print with pprint_t2ype of 10
overload
prerr with pprerr_t2ype of 10
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_d3pat
  (d3p0) = let
//
(*
val
loc0 = d3p0.loc()
val () =
println!
("tread33_d3pat: loc0 = ", loc0)
val () =
println!
("tread33_d3pat: d3p0 = ", d3p0)
*)
//
in
//
case+
d3p0.node() of
//
| D3Pnil _ => ()
| D3Pany _ => ()
//
| D3Pvar _ => ()
//
| D3Pi00 _ => ()
| D3Pb00 _ => ()
| D3Pc00 _ => ()
| D3Ps00 _ => ()
//
| D3Pint _ => ()
| D3Pbtf _ => ()
| D3Pchr _ => ()
| D3Pstr _ => ()
//
| D3Pcon1 _ => ()
//
| D3Pbang(d3p1) =>
  {
    val () =
    tread33_d3pat(d3p1)
  }
| D3Pflat(d3p1) =>
  {
    val () =
    tread33_d3pat(d3p1)
  }
| D3Pfree(d3p1) =>
  {
    val () =
    tread33_d3pat(d3p1)
  }
//
| D3Psap0
  ( d3f1, sarg ) =>
  {
    val () =
    tread33_d3pat(d3f1)
  }
| D3Psap1
  ( d3f1, sarg ) =>
  {
    val () =
    tread33_d3pat(d3f1)
  }
//
| D3Pdap1(d3f1) =>
  {
    val () =
    tread33_d3pat(d3f1)
  }
| D3Pdapp
  (d3f1, npf2, d3ps) =>
  {
//
    val () =
    tread33_d3pat(d3f1)
    val () =
    tread33_d3patlst(d3ps)
//
    val () = auxd3f1(d3f1)
//
  } where {
//
    fun
    auxd3f1
    (d3f1: d3pat): void =
    case+
    d3f1.node() of
//
    |
    D3Pcon1 _ => ()
//
    |
    D3Psap0
    (d3f1, sarg) => auxd3f1(d3f1)
    |
    D3Psap1
    (d3f1, sarg) => auxd3f1(d3f1)
//
    |
    _(*non-D3Pcon?*) =>
    let
      val
      loc0 = d3p0.loc()
      val
      t2p0 = d3p0.type()
      val () =
      trerr33_add(TRERR33d3pat(d3p0))
    in
      prerrln!
      (loc0, ": ***TRERR33***");
      prerrln!
      (loc0, ": TRERR33(D3Pdapp): unresolved datacon");
      prerrln!
      (loc0, ": TRERR33(D3Pdapp): the datacon: ", d3f1);
      prerrln!
      (loc0, ": TRERR33(D3Psym0): the inferred type: ", t2p0);
    end (* non-D3Pcon? *)
  } (*where*) // end of [D3Pdapp]
//
| D3Pnone0() => ()
//
| D3Ptrcd1
  (knd0, npf1, d3ps) =>
  {
    val () =
    tread33_d3patlst(d3ps)
  }
//
| D3Panno
  (d3p1, s1e2, s2e2) =>
  {
    val () =
    tread33_d3pat(d3p1)
  }
//
| D3Psym0(sym1, dpis) =>
  let
    val
    loc0 = d3p0.loc()
    val
    t2p0 = d3p0.type()
    val () =
    trerr33_add(TRERR33d3pat(d3p0))
  in
    prerrln!
    (loc0, ": ***TRERR33***");
    prerrln!
    (loc0, ": TRERR33(D3Psym0): unresolved symbol");
    prerrln!
    (loc0, ": TRERR33(D3Psym0): the symbol: ", sym1);
    prerrln!
    (loc0, ": TRERR33(D3Psym0): the inferred type: ", t2p0);
    prerrln!
    (loc0, ": TRERR33(D3Psym0): the possible solutions: ", dpis);
  end
//
| D3Ptcast(d3p1, t2p2) =>
  let
//
    val
    loc0 = d3p0.loc()
    val
    t2p1 = d3p1.type()
    val () =
    tread33_d3pat(d3p1)
    val () =
    trerr33_add(TRERR33d3pat(d3p0))
//
  in
    prerrln!
    ( loc0, ": ***TRERR33***" );
    prerrln!
    ( loc0
    , ": TRERR33(D3Ptcast): d3p1 = ", d3p1);
    prerrln!
    ( loc0
    , ": TRERR33(D3Ptcast): the inferred type: ", t2p1);
    prerrln!
    ( loc0
    , ": TRERR33(D3Ptcast): the expected type: ", t2p2);
  end
//
| D3Pnone1(d3p1) =>
  let
    val
    loc0 = d3p0.loc()
    val () =
    trerr33_add(TRERR33d3pat(d3p0))
  in
    prerrln!
    (loc0, ": ***TRERR33***");
    prerrln!
    ( loc0
    , ": TRERR33(D3Pnone1): the d3pat-error: ", d3p1);
  end // end of [D3Pnone1]
//
| _(* rest-of-d3pat *) =>
  {
    val
    loc0 = d3p0.loc()
    val () = prerrln!(loc0, ": tread33_d3pat(", d3p0, ")")
  }
//
end // end of [tread33_d3pat]
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_d3patopt(opt) =
(
case+ opt of
| None() => ()
| Some(d3p) => tread33_d3pat(d3p)
)
//
implement
//{}(*tmp*)
tread33_d3patlst(d3ps) =
(
list_foreach<d3pat>(d3ps)
) where
{
implement(env)
list_foreach$fwork<d3pat><env>(d3p, env) = tread33_d3pat(d3p)
} (* end of [tread33_d3patlst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_D3Eif0
(d3e0: d3exp): void =
let
//
val-
D3Eif0
( d3e1
, d3e2, opt3) = d3e0.node()
//
val () =
(
case+
d3e1.node() of
|
D3Etcast(d3e1, _) =>
{
//
val
loc1 = d3e1.loc()
val () =
prerrln!
( loc1, ": ***TRERR33***")
val () =
prerrln!
( loc1
, ": TRERR33(D3Eif0): test: non-boolean")
//
}
| _ (* else *) => ((*void*))
) (* end of [val] *)
//
val () =
(
case+
d3e2.node() of
|
D3Etcast(d3e2, t2p2) =>
{
//
val
loc2 = d3e2.loc()
val
t2pi = d3e2.type()
//
val () =
prerrln!
( loc2, ": ***TRERR33***")
val () =
prerrln!
( loc2
, ": TRERR33(D3Eif0): then: type-mismatch")
val () =
prerrln!
( loc2
, ": TRERR33(D3Eif0): then: the inferred type: ", t2pi)
val () =
prerrln!
( loc2
, ": TRERR33(D3Eif0): then: the expected type: ", t2p2)
//
}
| _ (* else *) => ((*void*))
) (* end of [val] *)
//
val () =
(
case+ opt3 of
|
None() => ()
|
Some(d3e3) =>
(
case+
d3e3.node() of
|
D3Etcast(d3e3, t2p3) =>
{
//
val
loc3 = d3e3.loc()
val
t2pi = d3e3.type()
//
val () =
prerrln!
( loc3, ": ***TRERR33***")
val () =
prerrln!
( loc3
, ": TRERR33(D3Eif0): else: type-mismatch")
val () =
prerrln!
( loc3
, ": TRERR33(D3Eif0): else: the inferred type: ", t2pi)
val () =
prerrln!
( loc3
, ": TRERR33(D3Eif0): else: the expected type: ", t2p3)
//
}
| _ (* else *) => ((*void*))
)
) (* end of [val] *)
//
in
  // nothing
end // end of [aux_D3Eif0]

(* ****** ****** *)

in(*in-of-local*)

implement
//{}(*tmp*)
tread33_d3exp
  (d3e0) = let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
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
| D3Ei00 _ => ()
| D3Eb00 _ => ()
| D3Ec00 _ => ()
| D3Es00 _ => ()
//
| D3Eint _ => ()
| D3Ebtf _ => ()
| D3Echr _ => ()
| D3Eflt _ => ()
| D3Estr _ => ()
//
| D3Etop _ => ()
//
| D3Evar _ => ()
| D3Ekvar _ => ()//skip
//
| D3Econ1 _ => ()
| D3Ecst1 _ => ()
//
| D3Efcon _ => ()
| D3Etcon _ => ()
//
| D3Efcst _ => ()
| D3Etcst _ => ()
//
|
D3Econ2(d2cs) =>
let
  val
  t2p0 = whnfize(t2p0)
  val () =
  trerr33_add(TRERR33d3exp(d3e0))
in
  prerrln!
  (loc0, ": ***TRERR33***");
  prerrln!
  (loc0, ": TRERR33(D3Econ2): d2cs = ", d2cs);
  prerrln!
  (loc0, ": TRERR33(D3Econ2): t2p0 = ", t2p0);
end // end of [D3Econ2]
//
|
D3Esym0(sym1, dpis) =>
let
  val
  t2p0 = whnfize(t2p0)
  val () =
  trerr33_add(TRERR33d3exp(d3e0))
in
  prerrln!
  (loc0, ": ***TRERR33***");
  prerrln!
  (loc0, ": TRERR33(D3Esym0): unresolved symbol");
  prerrln!
  (loc0, ": TRERR33(D3Esym0): the symbol: ", sym1);
  prerrln!
  (loc0, ": TRERR33(D3Esym0): the inferred type: ", t2p0);
  prerrln!
  (loc0, ": TRERR33(D3Esym0): the possible solutions: ", dpis);
end // end of [D3Esym0]
//
// HX: for tread3x
| D3Eterr _ => ()//skip
//
// HX: for tread3x
| D3Etimp _ => ()//skip
//
| D3Esap0
  (d3e1, s2e2) =>
  {
    val () =
    tread33_d3exp(d3e1)
  }
| D3Esap1
  (d3e1, s2e2) =>
  {
    val () =
    tread33_d3exp(d3e1)
  }
//
| D3Edapp
  (d3f1, npf2, d3es) =>
  {
    val () =
    tread33_d3exp(d3f1)
    val () =
    tread33_d3explst(d3es)
  }
//
| D3Epcon
  (d3e1, lab2) =>
  {
(*
  val () = aux_D3Epcon(d3e0)
*)
  val () = tread33_d3exp(d3e1)
  }
//
| D3Epbox
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Epbox(d3e0)
*)
  val () = tread33_d3exp(d3e1)
  }
//
| D3Eproj
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Eproj(d3e0)
*)
  val () = tread33_d3exp(d3e1)
  }
| D3Eplft
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Eplft(d3e0)
*)
  val () = tread33_d3exp(d3e1)
  }
| D3Epptr
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Epptr(d3e0)
*)
  val () = tread33_d3exp(d3e1)
  }
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  {
//
  val () = aux_D3Eif0(d3e0)
//
  val () = tread33_d3exp(d3e1)
  val () = tread33_d3exp(d3e2)
  val () = tread33_d3expopt(opt3)
//
  }
//
| D3Ecas0
  (knd0, d3e1, d3cs) =>
  {
  val () = tread33_d3exp(d3e1)
  val () = tread33_d3claulst(d3cs)
  }
//
| D3Elet(d3cs, d3e1) =>
  {
    val () =
    tread33_d3eclist(d3cs)
    val () = tread33_d3exp(d3e1)
  }
| D3Ewhere(d3e1, d3cs) =>
  {
    val () =
    tread33_d3eclist(d3cs)
    val () = tread33_d3exp(d3e1)
  }
//
| D3Eseqn(d3es, d3e1) =>
  {
    val () =
    tread33_d3explst(d3es)
    val () = tread33_d3exp(d3e1)
  }
//
| D3Etrcd1
  (knd0, npf1, d3es) =>
  {
    val () =
    tread33_d3explst(d3es)
  }
//
| D3Eassgn(d3e1, d3e2) =>
  {
    val () = tread33_d3exp(d3e1)
    val () = tread33_d3exp(d3e2)
  }
//
| D3Elam
  (knd0, f3as,
   tres, arrw, body) =>
  {
    val () =
    tread33_f3arglst(f3as)
    val () = tread33_d3exp(body)
  }
| D3Efix
  (knd0,
   d2v0, f3as,
   tres, arrw, body) =>
  {
    val () =
    tread33_f3arglst(f3as)
    val () = tread33_d3exp(body)
  }
//
| D3Etry0
  (tok0, d3e1, d3cs) =>
  {
    val () = tread33_d3exp(d3e1)
    val () = tread33_d3claulst(d3cs)
  }
//
| D3Eaddr(d3e1) =>
  {
    val () = tread33_d3exp(d3e1)
  }
| D3Eflat(d3e1) =>
  {
    val () = tread33_d3exp(d3e1)
  }
| D3Etalf(d3e1) =>
  {
    val () = tread33_d3exp(d3e1)
  }
//
| D3Efold(d3e1) =>
  {
    val () = tread33_d3exp(d3e1)
  }
//
| D3Eeval
  ( knd0, d3e1 ) =>
  {
    val () = tread33_d3exp(d3e1)
  }
| D3Efree
  ( knd0, d3e1 ) =>
  {
    val () = tread33_d3exp(d3e1)
  }
//
| D3Eraise(d3e1) =>
  {
    val () = tread33_d3exp(d3e1)
  }
//
| D3Elazy(d3e1) =>
  {
    val () = tread33_d3exp(d3e1)
  }
| D3Ellazy(d3e1, d3es) =>
  {
    val () = tread33_d3exp(d3e1)
    val () = tread33_d3explst(d3es)
  }
//
| D3Eanno
  ( d3e1
  , s1e2, s2e2 ) =>
  {
    val () = tread33_d3exp(d3e1)
(*
    val () = tread33_s2exp(s2e2)
*)
  }
//
| D3Elcast(d3e1, lab2) =>
  {
    val () =
    tread33_d3exp_D3Elcast(d3e0)
  }
//
| D3Etcast(d3e1, t2p2) =>
  {
    val () =
    tread33_d3exp_D3Etcast(d3e0)
  }
//
| D3Eexist1(s2es, d3e1) =>
  {
(*
    val () =
      tread33_s2explst(s2es)
    // end of [val]
*)
    val () = tread33_d3exp(d3e1)
  }
//
| D3Enone0( ) => ((*void*))
//
| D3Enone1(_) =>
  let
    val () =
    trerr33_add(TRERR33d3exp(d3e0))
  in
    prerrln!
    (loc0, ": ***TRERR33***");
    prerrln!
    ( loc0
    , ": TRERR33(D3Enone1): the d3exp-error: ", d3e0);
  end // end of [D3Enone1]
//
|
_(* rest-of-d3exp *) =>
{
  val () = prerrln!(loc0, ": tread33_d3exp(", d3e0, ")")
}
//
end // end of [tread33_d3exp]

end // end of [local]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_d3expopt(opt) =
(
case+ opt of
| None() => ()
| Some(d3e) => tread33_d3exp(d3e)
)
//
implement
//{}(*tmp*)
tread33_d3explst(d3es) =
(
list_foreach<d3exp>(d3es)
) where
{
implement(env)
list_foreach$fwork<d3exp><env>(d3e, env) = tread33_d3exp(d3e)
} (* end of [tread33_d3explst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_d3gua
  (d3g0) =
(
case+
d3g0.node() of
| D3GUAexp(d3e1) =>
  {
    val () = tread33_d3exp(d3e1)
  }
| D3GUAmat(d3e1, d3p2) =>
  {
    val () = tread33_d3exp(d3e1)
    val () = tread33_d3pat(d3p2)
  }
)
//
implement
//{}(*tmp*)
tread33_d3clau
  (d3cl) =
(
case+
d3cl.node() of
| D3CLAUpat(dgp1) =>
  {
    val () =
    tread33_d3gpat(dgp1)
  }
| D3CLAUexp(dgp1, d3e2) =>
  {
    val () =
    tread33_d3gpat(dgp1)
    val () = tread33_d3exp(d3e2)
  }
)
implement
//{}(*tmp*)
tread33_d3gpat
  (dgp0) =
(
case+
dgp0.node() of
| D3GPATpat(d3p1) =>
  {
    val () = tread33_d3pat(d3p1)
  }
| D3GPATgua(d3p1, d3gs) =>
  {
    val () = tread33_d3pat(d3p1)
    val () = tread33_d3gualst(d3gs)
  }
)
//
implement
//{}(*tmp*)
tread33_d3gualst(d3gs) =
(
list_foreach<d3gua>(d3gs)
) where
{
implement(env)
list_foreach$fwork<d3gua><env>(d3g, env) = tread33_d3gua(d3g)
} (* end of [tread33_d3gualst] *)
//
implement
//{}(*tmp*)
tread33_d3claulst(d3cs) =
(
list_foreach<d3clau>(d3cs)
) where
{
implement(env)
list_foreach$fwork<d3clau><env>(d3cl, env) = tread33_d3clau(d3cl)
} (* end of [tread33_d3claulst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
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
|
D3Cd2ecl(d2c) => ()
//
|
D3Cstatic(tok, d3c1) =>
{
  val () = tread33_d3ecl(d3c1)
}
|
D3Cextern(tok, d3c1) =>
{
  val () = tread33_d3ecl(d3c1)
}
|
D3Clocal(head, body) =>
{
val () = tread33_d3eclist(head)
val () = tread33_d3eclist(body)
} (* end of [D3Clocal] *)
//
|
D3Cinclude
( tok
, src, knd
, fopt, dopt ) =>
(
  case+ dopt of
  | None() => ()
  | Some(dcls) =>
    {
      val () = tread33_d3eclist(dcls)
    }
)
//
| D3Cstaload _ => ((*void*))
//
| D3Cfundclst
  (knd, mopt, tqas, f3ds) =>
  {
    val () = tread33_d3fundeclist(f3ds)
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cfundecl: f3ds = ", f3ds)
*)
  }
//
| D3Cvaldclst
  (knd, mopt, v3ds) =>
  {
    val () = tread33_d3valdeclist(v3ds)
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cvaldecl: v3ds = ", v3ds)
*)
  }
| D3Cvardclst
  (knd, mopt, v3ds) =>
  {
    val () = tread33_d3vardeclist(v3ds)
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cvardecl: v3ds = ", v3ds)
*)
  }
//
| D3Cimplmnt1
  ( tok
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s
  , f3as, res0, d3e0) =>
  {
    val () =
    tread33_f3arglst(f3as)
(*
    val () =
    tread33_ti3arg(ti3a)
    val () =
    tread33_ti2arglst(ti2s)
    val () = tread33_d3exp(d3e0)
*)
  }
| D3Cimplmnt2
  ( tok
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s
  , f3as, res0, d3e0) =>
  {
    val () =
    tread33_f3arglst(f3as)
(*
    val () =
    tread33_ti3arg(ti3a)
    val () =
    tread33_ti2arglst(ti2s)
*)
    val () = tread33_d3exp(d3e0)
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
        trerr33_add(TRERR33d3ecl(d3cl))
      in
      prerrln!
      (loc0, ": ***TRERR33***");
      prerrln!
      ( loc0
      , ": TRERR33(D3Cimplmnt2): id2c = ", id2c )
      end // end of [None()]
    )
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cimplmnt2: d3cl = ", d3cl)
*)
  }
//
| D3Cimplmnt3
  ( tok
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s
  , f3as, res0, d3e0) =>
  {
//
(*
    val () =
    tread33_ti3arg(ti3a)
*)
    val () =
    tread33_ti2arglst(ti2s)
//
    val () =
    tread33_f3arglst(f3as)
//
    val () = tread33_d3exp(d3e0)
//
(*
    val () =
    println!
    ("tread33_d3ecl: D3Cimplmnt3: d3cl = ", d3cl)
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
//{}(*tmp*)
tread33_d3eclist(d3cs) =
(
list_foreach<d3ecl>(d3cs)
) where
{
implement(env)
list_foreach$fwork<d3ecl><env>(d3c, env) = tread33_d3ecl(d3c)
} (* end of [tread33_d3eclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_ti2arg
  (ti2a) =
(
auxs2es(ti2a.s2es())
) where
{
//
fun
auxs2e0
(s2e0: s2exp): void =
(
case+
s2e0.node() of
|
S2Ecast _ => auxcast(s2e0)
| _ (* non-S2Ecast *) => ()
)
//
and
auxcast
(s2e0: s2exp): void =
let
val-
S2Ecast
( loc0
, s2e1
, s2t2) = s2e0.node()
//
val () =
trerr33_add
( TRERR33ti2arg(ti2a) )
//
in
prerrln!
(loc0, ": ***TRERR33***");
prerrln!
(loc0, ": TRERR33(ti2arg): ti2a = ", ti2a);
end // end of [auxs2e0]
//
and
auxs2es
(s2es: s2explst): void =
(
case+ s2es of
|
list_nil() => ()
|
list_cons(s2e0, s2es) =>
let
  val () =
  auxs2e0(s2e0) in auxs2es(s2es)
end
)
//
} (* end of [tread33_ti2arg] *)
//
implement
//{}(*tmp*)
tread33_ti2arglst(tias) =
(
list_foreach<ti2arg>(tias)
) where
{
implement(env)
list_foreach$fwork<ti2arg><env>(tia, env) = tread33_ti2arg(tia)
} (* end of [tread33_ti2arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_f3arg
  (f3a0) =
(
case+
f3a0.node() of
//
| F3ARGsome_sta _ => ()
| F3ARGsome_met _ => ()
//
| F3ARGsome_dyn
  ( npf1, d3ps ) =>
  {
    val () = tread33_d3patlst(d3ps)
  }
//
| F3ARGnone2(f2a) =>
  let
    val loc0 = f3a0.loc()
    val ((*void*)) =
    trerr33_add(TRERR33f3arg(f3a0))
  in
    prerrln!
    (loc0, ": TRERR33(f3arg): F3ARGnone2: f2a = ", f2a)
  end
| F3ARGnone3(f3a) =>
  let
    val loc0 = f3a0.loc()
    val ((*void*)) =
    trerr33_add(TRERR33f3arg(f3a0))
  in
    prerrln!
    (loc0, ": TRERR33(f3arg): F3ARGnone3: f3a = ", f3a)
  end
//
) (* end of [tread33_f3arg] *)
//
implement
//{}(*tmp*)
tread33_f3arglst(f3as) =
(
list_foreach<f3arg>(f3as)
) where
{
implement(env)
list_foreach$fwork<f3arg><env>(f3a, env) = tread33_f3arg(f3a)
} (* end of [tread33_f3arglst] *)
//
implement
//{}(*tmp*)
tread33_f3arglstopt(opt0) =
(
case+ opt0 of None() => () | Some(f3as) => tread33_f3arglst(f3as)
)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_d3valdecl
  (v3d0) =
{
  val () =
  tread33_d3pat(rcd.pat)
  val () =
  tread33_d3expopt(rcd.def)
(*
  val () =
  tread33_s2expopt(rcd.wth)
*)
} where
{
//
  val+D3VALDECL(rcd) = v3d0
//
} (* end of [tread33_d3valdecl] *)
//
implement
//{}(*tmp*)
tread33_d3valdeclist(v3ds) =
(
list_foreach<d3valdecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<d3valdecl><env>(v3d, env) = tread33_d3valdecl(v3d)
} (* end of [tread33_d3valdeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_d3vardecl
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
  val+D3VARDECL(rcd) = v3d0
}
//
implement
//{}(*tmp*)
tread33_d3vardeclist(v3ds) =
(
list_foreach<d3vardecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<d3vardecl><env>(v3d, env) = tread33_d3vardecl(v3d)
} (* end of [tread33_d3vardeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread33_d3fundecl
  (f3d0) =
{
  val () =
  tread33_d3expopt(rcd.def)
  val () =
  tread33_f3arglstopt(rcd.f3g)
} where
{
//
  val+D3FUNDECL(rcd) = f3d0
//
} (* end of [tread33_d3fundecl] *)
//
implement
//{}(*tmp*)
tread33_d3fundeclist(f3ds) =
(
list_foreach<d3fundecl>(f3ds)
) where
{
implement(env)
list_foreach$fwork<d3fundecl><env>(f3d, env) = tread33_d3fundecl(f3d)
} (* end of [tread33_d3fundeclist] *)
//
(* ****** ****** *)

local

extern
fun//{}
the_trerr33lst_get(): trerr33lst
extern
fun//{}
the_trerr33lst_set(trerr33lst): void

implement
//{}(*tmp*)
trerr33_add(xerr) = let
//
val
xerrs = the_trerr33lst_get()
//
in
the_trerr33lst_set(list_cons(xerr, xerrs))
end // end of [trerr33_add]

in (* in-of-local *)
//
local
//
val
the_trerr33lst =
ref<trerr33lst>(list_nil)
//
in(*in-of-local*)
implement
the_trerr33lst_get() = the_trerr33lst[]
implement
the_trerr33lst_set(xs) = the_trerr33lst[] := xs
end // end of [local]
//
implement
tread33_package
(
  p3kg
) = let
//
(*
val () =
println!
("tread33_package")
*)
//
val
D3TRANSD(rcd) = p3kg
//
val d3cs =
let
val
d3csopt = rcd.transd
in
case+
d3csopt of
| None() =>
  list_nil((*void*))
| Some(d3cs) => d3cs
end : d3eclist // end-of-val
//
val () =
tread33_d3eclist(d3cs)
//
val
xerrs = the_trerr33lst_get()
val
nxerr = list_length<trerr33>(xerrs)
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
tread33_package: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread33_package: \
there is one trans33-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread33_package: \
there are some trans33-errors!")
//
val () =
(
$raise(XATSOPT_TRERR33_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("\
tread33_package: \
there are none of trans33-errors!")
//
} (* end of [else] *)
//
end (*let*) // end of [tread33_package]

end // end of [local]

(* ****** ****** *)
//
//
// HX-2020-07-02:
// For contributed code
//
(* ****** ****** *)

#include
"./CONTRIB/tread33_dynexp.dats"

(* ****** ****** *)

(* end of [xats_tread33_dynexp.dats] *)
