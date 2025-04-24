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
// Start Time: September, 2019
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
#staload "./../SATS/tread3x.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
overload
print with pprint_t2ype of 10
overload
prerr with pprerr_t2ype of 10
//
(* ****** ****** *)
(* ****** ****** *)

implement
//{}(*tmp*)
tread3x_d3pat(d3p0) = ()
implement
//{}(*tmp*)
tread3x_d3patlst(d3ps) = ()

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxtcst
(d3e0: d3exp): void =
let
//
val loc0 = d3e0.loc()
//
// (*
val () =
println!
("auxtcst: d3e0 = ", d3e0)
// *)
//
val-
D3Etimp
( stmp
, d3e0
, targ
, d3cl
, tsub) = d3e0.node()
val-
D3Etcst
( d2c0
, ti3a
, ti2s) = d3e0.node()
//
val () =
trerr3x_add
(TRERR3Xd3exp_tcst(d3e0))
//
val () =
prerrln!
( loc0, ": ***TRERR3X***")
val () =
prerrln!
( loc0
, ": TRERR3X(D3Etcst): unimplemented")
val () =
prerrln!
( loc0
, ": TRERR3X(D3Etcst): template name = ", d2c0)
val () =
prerrln!
( loc0
, ": TRERR3X(D3Etcst): template argexps = ", ti3a)
(*
val () =
prerrln!
( loc0
, ": TRERR3X(D3Etcst): template argvars = ", ti2s)
*)
in
  // nothing
end // end of [auxtcst]

(* ****** ****** *)

fun
auxterr
(d3e0: d3exp): void =
let
//
val
loc0 = d3e0.loc()
//
val-
D3Eterr
( d3e1
, terr
, path ) = d3e0.node()
//
in
(
  auxtcst(d3e1)
) where
{
val () =
trerr3x_add
(TRERR3Xd3exp_terr(d3e0))
//
val () =
prerrln!
(loc0, ": ***TRERR3X***")
val () =
(
case+ terr of
|
TI3ERRnfd() =>
prerrln!
( loc0
, ": TRERR3X(D3Eterr): temp-missing")
|
TI3ERRrec() =>
prerrln!
( loc0
, ": TRERR3X(D3Eterr): temp-looping")
)
val () =
prerrln!
( loc0
, ": TRERR3X(D3Eterr): d3e1 = ", d3e1)
val () =
let
fun
auxlst
( xs
: t3implst
) : void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x1, xs) => let
val p1 =
d3exp(x1)
val () =
prerrln!
( p1.loc()
, ": TRERR3X(D3Eterr): temp-search: ", x1)
in auxlst(xs) end
)
in auxlst(path) end
} (* end of [where] *)
end (*let*) // end of [auxterr]

(* ****** ****** *)

fun
auxtimp
(d3e0: d3exp): void =
let
//
val-
D3Etimp
( stmp
, tcst, targ
, timp, tsub) = d3e0.node()
//
in
//
case-
timp.node() of
|
D3Cfundclst _ => auxtimp2f(d3e0)
|
D3Cimplmnt3 _ => auxtimp2i(d3e0)
//
end // end of [auxtimp]
//
and
auxtimp2f
(d3e0: d3exp): void =
let
//
val
loc0 = d3e0.loc()
//
val-
D3Etimp
( stmp
, tcst, targ
, timp, tsub) = d3e0.node()
//
val-
D3Etcst
( d2c0, _, _) = tcst.node()
//
val-
D3Cfundclst
( knd0, mopt
, tqas, f3ds) = timp.node()
//
in
//
auxf3ds(f3ds) where
{
//
fun
auxf3d0
( f3d0
: d3fundecl): void =
let
val
loc1 = f3d0.loc()
val+
D3FUNDECL(rcd) = f3d0
in
//
case+
rcd.def of
|
Some(d3e0) => tread3x_d3exp(d3e0)
|
None((*void*)) =>
let
val () =
trerr3x_add
(TRERR3Xd3exp_timp2f(d3e0, f3d0))
in
prerrln!
(loc0, ": ***TRERR3X***");
prerrln!
( loc0
, ": TRERR3X(D3Etimp): undefined: ", rcd.d2c);
prerrln!
( loc0
, ": TRERR3X(D3Etimp): ", loc1, ": f3d0 = ", f3d0);
end // end of [None]
//
end // end of [auxf3d0]
//
fun
auxf3ds
( f3ds
: d3fundeclist): void =
let
val-
list_cons
(f3d0, f3ds) = f3ds
in
case+ f3ds of
|
list_nil() => auxf3d0(f3d0)
|
list_cons _ =>
if
(d2c0=f3d0.d2c())
then auxf3d0(f3d0) else auxf3ds(f3ds)
end
} (* end of [auxf3ds] *)
//
end // end of [auxtimp2f]
//
and
auxtimp2i
(d3e0: d3exp): void =
let
//
val-
D3Etimp
( stmp
, tcst, targ
, timp, tsub) = d3e0.node()
//
val-
D3Cimplmnt3
( tok0
, stmp, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res1, def2) = timp.node()
//
in
  tread3x_d3exp(def2)
end // end of [auxtimp2i]

(* ****** ****** *)

in(* in-of-local *)

implement
//{}(*tmp*)
tread3x_d3exp
  (d3e0) = let
//
val
loc0 = d3e0.loc((*void*))
//
(*
val () =
println!
("tread3x_d3exp: d3e0 = ", d3e0)
*)
//
//
in(*in-of-let*)
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
| D3Ekvar _ => ()
//
| D3Econ1 _ => ()
| D3Ecst1 _ => ()
//
| D3Econ2 _ => ()
//
| D3Esym0 _ => ()
//
| D3Efcon _ => ()
| D3Efcst _ => ()
//
| D3Etcon _ => ()
//
| D3Etcst _ =>
  {
  val () = auxtcst(d3e0)
  }
//
//
| D3Eterr _ =>
  {
  val () = auxterr(d3e0)
  }
//
| D3Etimp _ =>
  {
  val () = auxtimp(d3e0)
  }
//
| D3Esap0
  (d3e1, s2e2) =>
  {
    val () =
    tread3x_d3exp( d3e1 )
  }
| D3Esap1
  (d3e1, s2e2) =>
  {
    val () =
    tread3x_d3exp( d3e1 )
  }
//
| D3Etapp
  (d2e1, s2es) =>
  let
    val () =
    trerr3x_add
    (TRERR3Xd3exp_tapp(d3e0))
  in
    prerrln!
    (loc0, ": ***TRERR3X***");
    prerrln!
    ( loc0
    , ": TRERR3X(D3Etapp): the d3exp-error: ", d3e0);
  end
//
| D3Edapp
  (d3f1, npf2, d3es) =>
  {
    val () =
    tread3x_d3exp(d3f1)
    val () =
    tread3x_d3explst(d3es)
  }
//
| D3Epcon
  (d3e1, lab2) =>
  {
(*
  val () = aux_D3Epcon(d3e0)
*)
  val () = tread3x_d3exp(d3e1)
  }
| D3Epbox
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Epbox(d3e0)
*)
  val () = tread3x_d3exp(d3e1)
  }
//
| D3Eproj
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Eproj(d3e0)
*)
  val () = tread3x_d3exp(d3e1)
  }
| D3Eplft
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Eplft(d3e0)
*)
  val () = tread3x_d3exp(d3e1)
  }
| D3Epptr
  (d3e1, lab2, idx2) =>
  {
(*
  val () = aux_D3Epptr(d3e0)
*)
  val () = tread3x_d3exp(d3e1)
  }
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  {
//
  val () =
    tread3x_d3exp(d3e1)
  val () =
    tread3x_d3exp(d3e2)
  val () =
    tread3x_d3expopt( opt3 )
//
  }
//
| D3Ecas0
  (knd0, d3e1, d3cs) =>
  {
    val () =
    tread3x_d3exp( d3e1 )
    val () =
    tread3x_d3claulst( d3cs )
  }
//
| D3Elet(d3cs, d3e1) =>
  {
    val () =
    tread3x_d3eclist(d3cs)
    val () = tread3x_d3exp(d3e1)
  }
| D3Ewhere(d3e1, d3cs) =>
  {
    val () =
    tread3x_d3eclist(d3cs)
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Eseqn(d3es, d3e1) =>
  {
    val () =
    tread3x_d3explst(d3es)
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Etrcd1
    (knd0, npf1, d3es) =>
  {
    val () =
    tread3x_d3explst(d3es)
  }
//
| D3Eassgn(d3e1, d3e2) =>
  {
    val () = tread3x_d3exp(d3e1)
    val () = tread3x_d3exp(d3e2)
  }
//
| D3Elam
  (knd0, f3as,
   tres, arrw, body) =>
  {
(*
    val () =
    tread3x_f3arglst(f3as)
*)
    val () = tread3x_d3exp(body)
  }
| D3Efix
  (knd0,
   d2v0, f3as,
   tres, arrw, body) =>
  {
(*
    val () =
    tread3x_f3arglst(f3as)
*)
    val () = tread3x_d3exp(body)
  }
//
| D3Etry0
  (tok0, d3e1, d3cs) =>
  {
    val () = tread3x_d3exp(d3e1)
(*
    val () = tread3x_d3claulst(d3cs)
*)
  }
//
| D3Eaddr(d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
| D3Eflat(d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
| D3Etalf(d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Efold(d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Eeval
  ( knd0, d3e1 ) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Efree
  (knd0, d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Eraise(d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Elazy(d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
| D3Ellazy(d3e1, d3es) =>
  {
  val () = tread3x_d3exp(d3e1)
  val () = tread3x_d3explst(d3es)
  }
//
| D3Eanno
  (d3e1, s1e2, s2e2) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Elcast(d3e1, lab2) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
| D3Etcast(d3e1, t2p2) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
//
| D3Enone0() => ((*void*))
//
| D3Enone1(_) =>
  let
    val () =
    trerr3x_add(TRERR3Xd3exp(d3e0))
  in
    prerrln!
    (loc0, ": ***TRERR3X***");
    prerrln!
    ( loc0
    , ": TRERR3X(D3Enone1): the d3exp-error: ", d3e0);
  end // end of [D3Enone1]
//
| _(* rest-of-d3exp *) =>
  {
    val () = prerrln!(loc0, ": tread3x_d3exp(", d3e0, ")")
  }
//
end // end of [tread3x_d3exp]

end // end of [local]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread3x_d3expopt(opt) =
(
case+ opt of
| None() => ()
| Some(d3e) => tread3x_d3exp(d3e)
)
//
implement
//{}(*tmp*)
tread3x_d3explst(d3es) =
(
list_foritm<d3exp>(d3es)
) where
{
implement(env)
list_foritm$work<d3exp><env>(d3e, env) = tread3x_d3exp(d3e)
} (* end of [tread3x_d3explst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread3x_d3gua
  (d3g0) =
(
case+
d3g0.node() of
| D3GUAexp(d3e1) =>
  {
    val () = tread3x_d3exp(d3e1)
  }
| D3GUAmat(d3e1, d3p2) =>
  {
    val () = tread3x_d3exp(d3e1)
    val () = tread3x_d3pat(d3p2)
  }
)
//
implement
//{}(*tmp*)
tread3x_d3clau
  (d3cl) =
(
case+
d3cl.node() of
| D3CLAUpat(dgp1) =>
  {
    val () =
    tread3x_d3gpat(dgp1)
  }
| D3CLAUexp(dgp1, d3e2) =>
  {
    val () =
    tread3x_d3gpat(dgp1)
    val () = tread3x_d3exp(d3e2)
  }
)
implement
//{}(*tmp*)
tread3x_d3gpat
  (dgp0) =
(
case+
dgp0.node() of
| D3GPATpat(d3p1) =>
  {
    val () = tread3x_d3pat(d3p1)
  }
| D3GPATgua(d3p1, d3gs) =>
  {
    val () = tread3x_d3pat(d3p1)
    val () = tread3x_d3gualst(d3gs)
  }
)
//
implement
//{}(*tmp*)
tread3x_d3gualst(d3gs) =
(
list_foritm<d3gua>(d3gs)
) where
{
implement(env)
list_foritm$work<d3gua><env>(d3g, env) = tread3x_d3gua(d3g)
} (* end of [tread3x_d3gualst] *)
//
implement
//{}(*tmp*)
tread3x_d3claulst(d3cs) =
(
list_foritm<d3clau>(d3cs)
) where
{
implement(env)
list_foritm$work<d3clau><env>(d3cl, env) = tread3x_d3clau(d3cl)
} (* end of [tread3x_d3claulst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread3x_d3ecl(d3cl) =
let
//
val loc0 = d3cl.loc()
//
(*
val () =
println!
("tread3x_d3ecl: d3cl = ", d3cl)
*)
//
in(*in-of-let*)
//
case+
d3cl.node() of
//
(* ****** ****** *)
//
|D3Cd2ecl _ => ()
//
(* ****** ****** *)
//
|D3Cstatic
(tok0, d3c1) =>
{
val () =
(
tread3x_d3ecl(d3c1))
}
//
|D3Cextern
(tok0, d3c1) =>
{
val () =
(
tread3x_d3ecl(d3c1))
}
//
(* ****** ****** *)
//
|D3Cdclst
(  dcls  ) =>
{
val () =
tread3x_d3eclist(dcls)
} (* end of [D3Cdclst] *)
//
|D3Clocal
(head, body) =>
{
val () =
tread3x_d3eclist(head)
val () =
tread3x_d3eclist(body)
} (* end of [D3Clocal] *)
//
(* ****** ****** *)
//
| D3Cinclude
  ( tok
  , src, knd
  , fopt, body) =>
{
  val () =
  (
  case+ body of
  | None() => ()
  | Some(d3cs) =>
    (
      tread3x_d3eclist(d3cs)
    )
  )
}
//
(* ****** ****** *)
//
| D3Cstaload _ => (    (*void*)    )
//
(* ****** ****** *)
//
| D3Cabstype _ => (    (*void*)    )
| D3Cabsopen _ => (    (*void*)    )
| D3Cabsimpl _ => (    (*void*)    )
//
(* ****** ****** *)
//
| D3Cexcptcon _ => (    (*void*)    )
| D3Cdatatype _ => (    (*void*)    )
//
(* ****** ****** *)
//
| D3Cvardclst
  ( knd, mopt, v3ds ) =>
  {
    val () = tread3x_d3vardeclist(v3ds)
(*
    val () =
    println!
    ("tread3x_d3ecl: D3Cvaldecl: v3ds = ", v3ds)
*)
  }
//
| D3Cvaldclst
  ( knd, mopt, v3ds ) =>
  {
    val () = tread3x_d3valdeclist(v3ds)
(*
    val () =
    println!
    ("tread3x_d3ecl: D3Cvaldecl: v3ds = ", v3ds)
*)
  }
//
| D3Cfundclst
  ( knd
  , mopt, tqas, f3ds) =>
  if
  iseqz(tqas)
  then
  {
    val () =
    tread3x_d3fundeclist(f3ds) //ntmp
(*
    val () =
    println!
    ("tread3x_d3ecl: D3Cfundecl: f3ds = ", f3ds)
*)
  }
  else
  {
(*
    val () =
    tread3x_d3fundeclist(f3ds) // temp
*)
  }
//
(* ****** ****** *)
//
| D3Cimplmnt3
  ( tok0
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s
  , f3as, res0, d3e0) =>
  (
    case+ ti3a of
    |
    TI3ARGnone _ => // non-temp
    {
      val () = tread3x_d3exp(d3e0) // non-temp
    }
    |
    TI3ARGsome _ => // template
    {
(*
      val () = tread3x_d3exp(d3e0) // template
*)
    }
  ) (* D3Cimplmnt3 *)
//
(* ****** ****** *)
//
| _(* rest-of-d3ecl *) =>
{
  val () = println!(loc0, ": tread3x_d3ecl(", d3cl, ")")
}
//
(* ****** ****** *)
//
end // end of [tread3x_d3ecl]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread3x_d3eclist(d3cs) =
(
list_foritm<d3ecl>(d3cs)
) where
{
implement(env)
list_foritm$work<d3ecl><env>(d3c, env) = tread3x_d3ecl(d3c)
} (* end of [tread3x_d3eclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread3x_d3valdecl
  (v3d0) =
{
  val () =
  tread3x_d3pat(rcd.pat)
  val () =
  tread3x_d3expopt(rcd.def)
(*
  val () =
  tread3x_s2expopt(rcd.wth)
*)
} where
{
//
  val+D3VALDECL(rcd) = v3d0
//
} (* end of [tread3x_d3valdecl] *)
//
implement
//{}(*tmp*)
tread3x_d3valdeclist(v3ds) =
(
list_foritm<d3valdecl>(v3ds)
) where
{
implement(env)
list_foritm$work<d3valdecl><env>(v3d, env) = tread3x_d3valdecl(v3d)
} (* end of [tread3x_d3valdeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread3x_d3vardecl
  (v3d0) =
{
  val () =
  tread3x_d3expopt(rcd.ini)
(*
  val () =
  tread3x_s2expopt(rcd.res)
*)
} where
{
//
  val+D3VARDECL(rcd) = v3d0
//
} (* end of [tread3x_d3vardecl] *)
//
implement
//{}(*tmp*)
tread3x_d3vardeclist(v3ds) =
(
list_foritm<d3vardecl>(v3ds)
) where
{
implement(env)
list_foritm$work<d3vardecl><env>(v3d, env) = tread3x_d3vardecl(v3d)
} (* end of [tread3x_d3vardeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread3x_d3fundecl
  (f3d0) =
{
  val () =
  tread3x_d3expopt(rcd.def)
(*
  val () =
  tread3x_s2expopt(rcd.wtp)
*)
} where
{
//
  val+D3FUNDECL(rcd) = f3d0
//
} (* end of [tread3x_d3fundecl] *)
//
implement
//{}(*tmp*)
tread3x_d3fundeclist(f3ds) =
(
list_foritm<d3fundecl>(f3ds)
) where
{
implement(env)
list_foritm$work<d3fundecl><env>(f3d, env) = tread3x_d3fundecl(f3d)
} (* end of [tread3x_d3fundeclist] *)
//
(* ****** ****** *)

local

static
fun//{}
the_trerr3xlst_get(): trerr3xlst
extern
fun//{}
the_trerr3xlst_set(trerr3xlst): void

implement
//{}(*tmp*)
trerr3x_add(xerr) = let
//
val
xerrs = the_trerr3xlst_get()
//
in
the_trerr3xlst_set(list_cons(xerr, xerrs))
end // end of [trerr3x_add]

in (* in-of-local *)
//
local
//
val
the_trerr3xlst =
ref<trerr3xlst>(list_nil)
//
in(*in-of-local*)
implement
the_trerr3xlst_get() = the_trerr3xlst[]
implement
the_trerr3xlst_set(xs) = the_trerr3xlst[] := xs
end // end of [local]
//
implement
tread3x_package
(
  p3kg
) = let
//
(*
val () =
println!
("tread3x_package")
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
tread3x_d3eclist(d3cs)
//
val
xerrs = the_trerr3xlst_get()
val
nxerr = list_length<trerr3x>(xerrs)
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
tread3x_package: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread3x_package: \
there is one trans3x-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread3x_package: \
there are some trans3x-errors!")
//
val () =
(
$raise(XATSOPT_TRERR3X_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("\
tread3x_package: \
there are none of trans3x-errors!")
//
} (* end of [else] *)
//
end // end of [tread3x_package]

end // end of [local]

(* ****** ****** *)

(* end of [xats_tread3x_dynexp.dats] *)
