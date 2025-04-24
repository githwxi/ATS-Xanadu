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
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
_(*TMP*) =
"./../DATS/staexp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/dynexp2_print0.dats"
#staload
_(*TMP*) =
"./../DATS/tread12_staexp.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/mylib00.sats"
#staload "./../DATS/mylib00.dats"
//
(* ****** ****** *)
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
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
#staload "./../SATS/tread12.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_d2con
  (d2c0) = let
//
val
loc0 = d2c0.loc((*void*))
val
s2e0 = d2con_get_sexp(d2c0)
//
val () = tread12_s2exp(s2e0)
//
in
  // nothing
end // end of [tread12_d2con]
//
implement
//{}(*tmp*)
tread12_d2conlst(d2cs) =
(
list_foritm<d2con>(d2cs)
) where
{
implement(env)
list_foritm$work<d2con><env>(d2c, env) = tread12_d2con(d2c)
} (* end of [tread12_d2conlst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
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
//{}(*tmp*)
tread12_d2cstlst(d2cs) =
(
list_foritm<d2cst>(d2cs)
) where
{
implement(env)
list_foritm$work<d2cst><env>(d2c, env) = tread12_d2cst(d2c)
} (* end of [tread12_d2cstlst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
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
| D2Pnil() => ()
| D2Pany() => ()
//
| D2Pint _ => ()
| D2Pbtf _ => ()
| D2Pchr _ => ()
| D2Pflt _ => ()
| D2Pstr _ => ()
//
| D2Pvar(d2v1) => ()
//
| D2Pcon1(d2c1) => ()
| D2Pcon2(d2cs) => ()
//
| D2Pbang(d2p1) =>
  {
    val () =
    tread12_d2pat(d2p1)
  }
| D2Pflat(d2p1) =>
  {
    val () =
    tread12_d2pat(d2p1)
  }
| D2Pfree(d2p1) =>
  {
    val () =
    tread12_d2pat(d2p1)
  }
//
| D2Psym0
  ( d1p1, dpis ) => ()
//
// HX: nullary
| D2Pdap0(d2p1) =>
  { 
    val () =
    tread12_d2pat(d2p1)
  }
// HX: argless
| D2Pdap1(d2p1) =>
  {
    val () =
    tread12_d2pat(d2p1)
  }
| D2Pdapp
  (d2f0, npf1, d2ps) =>
  {
    val () =
    tread12_d2pat(d2f0)
    val () =
    tread12_d2patlst(d2ps)
  }
//
| D2Ptrcd1
  (knd0, npf1, d2ps) =>
  {
    val () =
    tread12_d2patlst(d2ps)
  }
//
| D2Panno
  (d2p1, s1e2, s2e2) =>
  {
    val () = tread12_s2exp(s2e2)
    val () = tread12_d2pat(d2p1)
  }
//
| D2Pnone0() => ((*void*))
//
| D2Pnone1(_) =>
  let
    val () =
    trerr12_add(TRERR12d2pat(d2p0))
  in
    prerrln!
    ( loc0, ": ***TRERR12***");
    prerrln!
    ( loc0
    , ": TRERR12(D2Pnone1): d2pat-error: ", d2p0);
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
//{}(*tmp*)
tread12_d2patopt(opt) =
(
case+ opt of
| None() => ()
| Some(d2p) => tread12_d2pat(d2p)
)
//
implement
//{}(*tmp*)
tread12_d2patlst(d2ps) =
(
list_foritm<d2pat>(d2ps)
) where
{
implement(env)
list_foritm$work<d2pat><env>(d2p, env) = tread12_d2pat(d2p)
} (* end of [tread12_d2patlst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
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
| D2Ei00(int) => ()
| D2Eb00(btf) => ()
| D2Ec00(chr) => ()
| D2Es00(str) => ()
//
| D2Eint(tok) => ()
| D2Ebtf(tok) => ()
| D2Echr(tok) => ()
| D2Eflt(tok) => ()
| D2Estr(tok) => ()
//
| D2Etop(tok) => ()
//
| D2Evar(d2v) => ()
//
| D2Econ1(d2c) => ()
| D2Ecst1(d2c) => ()
//
| D2Econ2(d2cs) => ()
| D2Ecst2(d2cs) => ()
//
| D2Esym0(_, _) => ()
//
| D2Esapp
  (d2e1, s2es) =>
  {
  val () = tread12_d2exp(d2e1)
  val () = tread12_dsapparg(s2es)
  }
//
| D2Etapp
  (d2e1, s2es) =>
  {
  val () = tread12_d2exp(d2e1)
  val () = tread12_dtapparg(s2es)
  }
//
| D2Edap0(d2e1) =>
  {
  val () = tread12_d2exp(d2e1)
  }
| D2Edapp
  (d2e1, npf2, d2es) =>
  {
  val () = tread12_d2exp(d2e1)
  val () = tread12_d2explst(d2es)
  }
//
| D2Ebrack
  (dpis, d2es) =>
  {
    val () =
      tread12_d2explst(d2es)
    // end of [val]
  } (* end of [D2Ebrack] *)
| D2Edtsel
  (lab1,
   dpis, npf2, opt3) =>
  {
    val () =
    (
    case+ opt3 of
    | None() => ()
    | Some(d2es) =>
        tread12_d2explst(d2es)
      // end of [Some]
    )
  } (* end of [D2Edtsel] *)
//
|
D2Eif0
(d2e1, d2e2, opt3) =>
{
val () = tread12_d2exp(d2e1)
val () = tread12_d2exp(d2e2)
val () = tread12_d2expopt(opt3)
}
//
|
D2Ecas0
(knd0, d2e1, dcls) =>
{
val () = tread12_d2exp(d2e1)
val () = tread12_d2claulst(dcls)
}
//
| D2Elet
  (d2cs, d2e1) =>
  {
    val () =
    tread12_d2eclist(d2cs)
    val () = tread12_d2exp(d2e1)
  }
| D2Ewhere
  (d2e1, d2cs) =>
  {
    val () =
    tread12_d2eclist(d2cs)
    val () = tread12_d2exp(d2e1)
  }
//
| D2Eseqn
  (d2es, d2e1) =>
  {
    val () =
    tread12_d2explst(d2es)
    val () = tread12_d2exp(d2e1)
  }
//
| D2Etrcd1
  (knd0,
   npf1, d2es) =>
  {
    val () =
    tread12_d2explst(d2es)
  }
//
| D2Eassgn
  (d2e1, d2e2) =>
  {
    val () = tread12_d2exp(d2e1)
    val () = tread12_d2exp(d2e2)
  }
//
| D2Elam
  ( knd0, f2as,
    tres, arrw, body) =>
  {
//
    val () =
    tread12_f2arglst(f2as)
    val () =
    tread12_effs2expopt(tres)
//
    val () = tread12_d2exp(body)
//
  }
| D2Efix
  ( knd0,
    d2v0, f2as,
    tres, arrw, body) =>
  {
//
    val () =
    tread12_f2arglst(f2as)
//
    val () = tread12_d2exp(body)
//
  }
//
|
D2Etry0
( knd0, d2e1, dcls ) =>
{
val () = tread12_d2exp(d2e1)
val () = tread12_d2claulst(dcls)
}
//
| D2Eaddr(d2e1) =>
  {
    val () = tread12_d2exp(d2e1)
  }
| D2Efold(d2e1) =>
  {
    val () = tread12_d2exp(d2e1)
  }
| D2Efree(d2e1) =>
  {
    val () = tread12_d2exp(d2e1)
  }
//
| D2Eeval(d2e1) =>
  {
    val () = tread12_d2exp(d2e1)
  }
//
| D2Eraise(d2e1) =>
  {
    val () = tread12_d2exp(d2e1)
  }
//
| D2Elazy(d2e1) =>
  {
    val () = tread12_d2exp(d2e1)
  }
| D2Ellazy
  (d2e1, d2es(*frees*)) =>
  {
    val () =
      tread12_d2exp(d2e1)
    val () =
      tread12_d2explst(d2es)
    // end of [val]
  }
//
| D2Eanno
  (d2e1, s1e2, s2e2) =>
  {
    val () = tread12_d2exp(d2e1)
    val () = tread12_s2exp(s2e2)
  }
//
| D2Eexist1(s2es, d2e1) =>
  {
    val () =
      tread12_s2explst(s2es)
    // end of [val]
    val () = tread12_d2exp(d2e1)
  }
//
| D2Enone0() => ((*void*))
//
| D2Enone1(_) =>
  let
    val () =
    trerr12_add(TRERR12d2exp(d2e0))
  in
    prerrln!
    ( loc0, ": ***TRERR12***");
    prerrln!
    ( loc0
    , ": TRERR12(D2Enone1): d2exp-error: ", d2e0);
  end // end of [D2Enone1]
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
//{}(*tmp*)
tread12_d2expopt(opt) =
(
case+ opt of
| None() => ()
| Some(d2e) => tread12_d2exp(d2e)
)
//
implement
//{}(*tmp*)
tread12_d2explst(d2es) =
(
list_foritm<d2exp>(d2es)
) where
{
implement(env)
list_foritm$work<d2exp><env>(d2e, env) = tread12_d2exp(d2e)
} (* end of [tread12_d2explst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
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
    | _(*non-S2Eany*) => tread12_s2exp(s2e0)
    )
  }
) (* end of [auxlst] *)
} (* end of [tread12_dsapparg] *)

(* ****** ****** *)

implement
//{}(*tmp*)
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
    | _(*non-S2Eany*) => tread12_s2exp(s2e0)
    )
  }
) (* end of [auxlst] *)
} (* end of [tread12_dtapparg] *)

(* ****** ****** *)

implement
//{}(*tmp*)
tread12_d2gua(d2g0) =
(
case+
d2g0.node() of
|
D2GUAexp(d2e1) =>
{
val () = tread12_d2exp(d2e1)
}
|
D2GUAmat(d2e1, d2p2) =>
{
val () = tread12_d2exp(d2e1)
val () = tread12_d2pat(d2p2)
}
) (* end of [tread12_d2gua] *)

(* ****** ****** *)

implement
//{}(*tmp*)
tread12_d2gpat(dgpt) =
(
case+
dgpt.node() of
|
D2GPATpat(d2p1) =>
{
val () = tread12_d2pat(d2p1)
}
|
D2GPATgua(d2p1, d2gs) =>
{
val () = tread12_d2pat(d2p1)
val () = tread12_d2gualst(d2gs)
}  
) (* end of [tread12_d2gpat] *)

(* ****** ****** *)

implement
//{}(*tmp*)
tread12_d2clau(dcl0) =
(
case+
dcl0.node() of
|
D2CLAUpat(dgpt) =>
{
  val () =
  tread12_d2gpat(dgpt)
}
|
D2CLAUexp(dgpt, d2e1) =>
{
//
  val () =
  tread12_d2gpat(dgpt)
//
  val () = tread12_d2exp(d2e1)
//
}
) (* end of [tread12_d2clau] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_d2gualst(d2gs) =
(
list_foritm<d2gua>(d2gs)
) where
{
implement(env)
list_foritm$work<d2gua><env>(d2g, env) = tread12_d2gua(d2g)
} (* end of [tread12_d2gualst] *)
//
implement
//{}(*tmp*)
tread12_d2claulst(dcls) =
(
list_foritm<d2clau>(dcls)
) where
{
implement(env)
list_foritm$work<d2clau><env>(dcl, env) = tread12_d2clau(dcl)
} (* end of [tread12_d2claulst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
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
| D2Cd1ecl _ => ()
//
| D2Cstatic
( tok0, d2c1 ) =>
{
  val () =
  tread12_d2ecl(d2c1)
}
| D2Cextern
( tok0, d2c1) =>
{
  val () =
  tread12_d2ecl(d2c1)
}
//
(* ****** ****** *)
//
| D2Cdclst
(   dcls   ) =>
{
  val () =
  tread12_d2eclist(dcls)
}
//
| D2Clocal
( head, body ) =>
{
  val () =
  tread12_d2eclist(head)
  val () =
  tread12_d2eclist(body)
} (* end of [D2Clocal] *)
//
(* ****** ****** *)
//
| D2Cinclude
  ( tok
  , src, knd
  , fopt, body) =>
  {
    val () =
    (
    case+ body of
    | None() => ()
    | Some(d2cs) =>
      (
        tread12_d2eclist(d2cs)
      )
    )
  }
//
| D2Cstaload _ => ()
//
| D2Cstacst0(s2c, s2t) =>
  {
    val () = tread12_s2cst(s2c)
    val () = tread12_sort2(s2t)
  }
//
| D2Csortdef(s2c, def) =>
  {
    val () = tread12_s2txt(def)
  }
//
| D2Csexpdef(s2c, def) =>
  {
(*
    val def =
    s2cst_get_def(s2c)
    val ( ) =
    assertloc(isneqz(def))
    val def = unsome(def)
*)
//
    val () = tread12_s2cst(s2c)
    val () = tread12_s2exp(def)
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
    val () = tread12_s2cst(s2c)
    val () = tread12_abstdf2(df2)
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
| D2Cabsopen
  (knd, is2c) =>
  {
(*
    val () =
    println!
    ("tread12_d2ecl: D2Cabsopen: is2c = ", is2c)
*)
  }
| D2Cabsimpl
  (knd, is2c, def1) =>
  {
//
    val () = tread12_s2exp(def1)
//
(*
    val () =
    println!
    ("tread12_d2ecl: D2Cabsimpl: is2c = ", is2c)
    val () =
    println!
    ("tread12_d2ecl: D2Cabsimpl: def1 = ", def1)
    val () =
    println!
    ("tread12_d2ecl: D2Cabsimpl: def1.sort = ", def1.sort())
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
| D2Cexcptcon(d1cl, d2cs) =>
  {
    val () = tread12_d2conlst(d2cs)
  }
| D2Cdatatype(d1cl, s2cs) =>
  {
    val () = tread12_s2cstlst(s2cs)
  }
//
| D2Cfundclst
  (knd, mopt, tqas, f2ds) =>
  {
    val () = tread12_tq2arglst(tqas)
    val () = tread12_d2fundeclist(f2ds)
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
| D2Cvaldclst
  (knd, mopt, v2ds) =>
  {
    val () = tread12_d2valdeclist(v2ds)
  }
| D2Cvardclst
  (knd, mopt, v2ds) =>
  {
    val () = tread12_d2vardeclist(v2ds)
  }
//
| D2Cimplmnt1
  ( knd
  , stmp, mopt
  , sqas, tqas
  , id2c, ti2s
  , f2as, res1, d2e2) =>
  {
(*
    val () =
    tread12_sq2arglst(sqas)
*)
    val () =
    tread12_tq2arglst(tqas)
    val () =
    tread12_ti2arglst(ti2s)
//
    val () =
    tread12_f2arglst( f2as )
//
    val () =
    tread12_effs2expopt(res1)
    val () = tread12_d2exp(d2e2)
//
  }
| D2Cimplmnt2
  ( knd
  , stmp, mopt
  , sqas, tqas
  , id2c, ti2s
  , f2as, res1, d2e2) =>
  {
(*
    val () =
    tread12_sq2arglst(sqas)
*)
    val () =
    tread12_tq2arglst(tqas)
    val () =
    tread12_ti2arglst(ti2s)
//
    val () =
      tread12_f2arglst(f2as)
    // end of [val]
//
    val () =
    tread12_effs2expopt(res1)
    val () = tread12_d2exp(d2e2)
  }
//
| D2Cdynconst
  (knd, tqas, d2cs) =>
  {
    val () = tread12_d2cstlst(d2cs)
    val () = tread12_tq2arglst(tqas)
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
//{}(*tmp*)
tread12_d2eclist(d2cs) =
(
list_foritm<d2ecl>(d2cs)
) where
{
implement(env)
list_foritm$work<d2ecl><env>(d2c, env) = tread12_d2ecl(d2c)
} (* end of [tread12_d2eclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_f2arg
  (f2a0) =
(
case+
f2a0.node() of
| F2ARGsome_dyn
  (npf, d2ps) =>
  {
    val () = tread12_d2patlst(d2ps)
  }
| F2ARGsome_sta
  (s2vs, s2ps) =>
  {
    val () = tread12_s2varlst(s2vs)
    val () = tread12_s2explst(s2ps)
  }
//
| F2ARGsome_met(s2es) =>
  {
    val () = tread12_s2explst(s2es)
  }
)
//
implement
//{}(*tmp*)
tread12_f2arglst(f2as) =
(
list_foritm<f2arg>(f2as)
) where
{
implement(env)
list_foritm$work<f2arg><env>(f2a, env) = tread12_f2arg(f2a)
} (* end of [tread12_f2arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_tq2arg
  (tq2a) =
(
  tread12_s2varlst(tq2a.s2vs())
)
//
implement
//{}(*tmp*)
tread12_tq2arglst(tqas) =
(
list_foritm<tq2arg>(tqas)
) where
{
implement(env)
list_foritm$work<tq2arg><env>(tq2a, env) = tread12_tq2arg(tq2a)
} (* end of [tread12_tq2arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_ti2arg
  (ti2a) =
(
  tread12_s2explst(ti2a.s2es())
)
//
implement
//{}(*tmp*)
tread12_ti2arglst(tias) =
(
list_foritm<ti2arg>(tias)
) where
{
implement(env)
list_foritm$work<ti2arg><env>(ti2a, env) = tread12_ti2arg(ti2a)
} (* end of [tread12_ti2arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_d2valdecl
  (v2d0) =
{
//
  val () =
  tread12_d2pat(rcd.pat)
//
  val () =
  tread12_d2expopt(rcd.def)
  val () =
  tread12_s2expopt(rcd.wtp)
//
} where
{
//
  val+D2VALDECL(rcd) = v2d0
//
} (* end of [tread12_d2valdecl] *)
//
implement
//{}(*tmp*)
tread12_d2valdeclist(v2ds) =
(
list_foritm<d2valdecl>(v2ds)
) where
{
implement(env)
list_foritm$work<d2valdecl><env>(v2d, env) = tread12_d2valdecl(v2d)
} (* end of [tread12_d2valdeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_d2vardecl
  (v2d0) =
{
//
  val () =
  tread12_d2expopt(rcd.ini)
  val () =
  tread12_s2expopt(rcd.res)
//
} where
{
//
  val+D2VARDECL(rcd) = v2d0
//
} (* end of [tread12_d2vardecl] *)
//
implement
//{}(*tmp*)
tread12_d2vardeclist(v2ds) =
(
list_foritm<d2vardecl>(v2ds)
) where
{
implement(env)
list_foritm$work<d2vardecl><env>(v2d, env) = tread12_d2vardecl(v2d)
} (* end of [tread12_d2vardeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread12_d2fundecl
  (f2d0) =
{
//
  val () =
  tread12_d2expopt(rcd.def)
  val () =
  tread12_s2expopt(rcd.wtp)
//
  val () =
  tread12_f2arglst(rcd.f2g)
  val () =
  tread12_effs2expopt(rcd.res)
//
} where
{
//
  val+D2FUNDECL(rcd) = f2d0
//
} (* end of [tread12_d2fundecl] *)
//
implement
//{}(*tmp*)
tread12_d2fundeclist(f2ds) =
(
list_foritm<d2fundecl>(f2ds)
) where
{
implement(env)
list_foritm$work<d2fundecl><env>(f2d, env) = tread12_d2fundecl(f2d)
} (* end of [tread12_d2fundeclist] *)
//
(* ****** ****** *)

local

static
fun//{}
the_trerr12lst_get(): trerr12lst
extern
fun//{}
the_trerr12lst_set(trerr12lst): void

implement
//{}(*tmp*)
trerr12_add(xerr) = let
//
val
xerrs = the_trerr12lst_get()
//
in
the_trerr12lst_set(list_cons(xerr, xerrs))
end // end of [trerr12_add]

in (* in-of-local *)
//
local
//
val
the_trerr12lst =
ref<trerr12lst>(list_nil)
//
in(*in-of-local*)
implement
the_trerr12lst_get() = the_trerr12lst[]
implement
the_trerr12lst_set(xs) = the_trerr12lst[] := xs
end // end of [local]
//
implement
tread12_package
(
  p2kg
) = let
//
val+
D2TRANSD(rcd) = p2kg
//
val d2cs =
let
val
d2csopt = rcd.transd
in
case+
d2csopt of
| None() =>
  list_nil((*void*))
| Some(d2cs) => d2cs
end : d2eclist // end-of-val
//
val () =
tread12_d2eclist(d2cs)
val
xerrs = the_trerr12lst_get()
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
tread12_package: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread12_package: \
there is one trans12-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread12_package: \
there are some trans12-errors!")
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
tread12_package: \
there are none of trans12-errors!")
//
} (* end of [else] *)
//
end // end of [tread12_package]

end // end of [local]

(* ****** ****** *)

(* end of [xats_tread12_dynexp.dats] *)
