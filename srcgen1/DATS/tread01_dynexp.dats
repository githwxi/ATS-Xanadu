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
// Start Time: September, 2018
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
#staload "./../SATS/lexing0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/tread01.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/tread01_staexp.dats"

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1pat(d1p0) = ()
//
implement
//{}(*tmp*)
tread01_d1patlst(d1ps) =
(
list_foreach<d1pat>(d1ps)
) where
{
implement(env)
list_foreach$fwork<d1pat><env>(d1p, env) = tread01_d1pat(d1p)
} (* end of [tread01_d1patlst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1exp(d1e0) = ()
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1expopt(opt0) =
(
case+ opt0 of
| None() => ()
| Some(d1e) => tread01_d1exp(d1e)
) (* end of [tread01_d1expopt] *)
//
implement
//{}(*tmp*)
tread01_d1explst(d1es) =
(
list_foreach<d1exp>(d1es)
) where
{
implement(env)
list_foreach$fwork<d1exp><env>(d1e, env) = tread01_d1exp(d1e)
} (* end of [tread01_d1explst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread01_d1ecl(d1cl) = let
//
val loc0 = d1cl.loc((*void*))
//
(*
val () =
println!
("tread01_d1ecl: d1cl = ", d1cl)
*)
//
in
//
case+
d1cl.node() of
//
|
D1Cstatic
(tok, d1c1) =>
{
  val () =
  tread01_d1ecl(d1c1)
}
|
D1Cextern
(tok, d1c1) =>
{
  val () =
  tread01_d1ecl(d1c1)
}
//
|
D1Cdefine
( tok0
, geid
, gmas, def1) =>
{
(*
  val () =
  tread01_g0eid(geid)
*)
  val () =
  tread01_g1marglst(gmas)
  val () =
  (
    tread01_g1expopt(def1)
  )
}
|
D1Clocal(head, body) =>
{
  val () =
    tread01_d1eclist(head)
  val () =
    tread01_d1eclist(body)
} (* end of [D1Clocal] *)
//
//
|
D1Cinclude
( tok
, src, knd
, fopt, body) =>
{
  val () =
  (
  case+ body of
  | None() => ()
  | Some(d1cs) =>
    (
      tread01_d1eclist(d1cs)
    )
  )
}
//
| D1Cstaload _ => ()
//
| D1Csymload
  ( tok
  , sym1
  , dqid, prec) =>
  {
(*
    val () =
    tread01_dq0eid(dqid)
*)
  }
//
| D1Csortdef
  ( knd
  , tid0, def1) =>
  {
(*
    val () =
    tread01_s0tid(tid0)  
*)
    val () =
    tread01_s1rtdef(def1)
  }
//
| D1Csexpdef
  ( knd
  , sid0, smas
  , res1, def2) =>
  {
(*
    val () =
    tread01_s0eid(sid0)
*)
    val () =
    tread01_s1marglst(smas)
//
    val () =
      tread01_sort1opt(res1)
    // end of [val]
//
    val () = tread01_s1exp(def2)
//
  }
//
| D1Cabstype
  ( knd
  , sid0, tmas
  , res1, def2) =>
  {
//
(*
    val () =
    tread01_s0eid(sid0)
*)
//
    val () =
    tread01_t1marglst(tmas)
//
    val () =
      tread01_sort1opt(res1)
    // end of [val]
//
    val () = tread01_abstdf1(def2)
//
  }
//
| D1Cabsopen _ => ()
| D1Cabsimpl _ => ()
//
| D1Cexcptcon
  (tok0, d1cs) =>
  {
    val () =
    tread01_d1atconlst(d1cs)
  }
| D1Cdatatype
  (tok0, d1ts, wdcs) =>
  {
    val () =
      tread01_wd1eclseq(wdcs)
    // end of [val]
    val () =
      tread01_d1atypelst(d1ts)
    // end of [val]
  }
//
| D1Cdynconst
  (knd, tqas, d1cs) =>
  {
    val () =
      tread01_tq1arglst(tqas)
    // end of [val]
(*
    val () =
      tread01_d1cstdeclist(d1cs)
    // end of [val]
*)
  }
//
| D1Cvaldclst
  ( knd
  , mopt, v1ds) =>
  {
    val () =
    tread01_d1valdeclist(v1ds)
  }
| D1Cvardclst
  ( knd
  , mopt, v1ds) =>
  {
    val () =
    tread01_d1vardeclist(v1ds)
  }
//
| D1Cfundclst
  ( knd
  , mopt
  , tqas, f1ds) =>
  {
    val () =
    tread01_d1fundeclist(f1ds)
  }
//
|
D1Cimplmnt0
( knd, mopt
, sqas, tqas
, dqid, ti1s
, f1as, res1, teq2, body) =>
{
  val () =
  tread01_sq1arglst(sqas)
  val () =
  tread01_tq1arglst(tqas)
//
  val () =
  tread01_ti1arglst(ti1s)
//
  val () =
    tread01_f1arglst(f1as)
  // end of [val]
//
  val () =
    tread01_effs1expopt(res1)
  // end of [val]
//
  val () = tread01_d1exp(body)
//
}
//
| _(* rest-of-d1ecl *) =>
  (
    prerrln!(loc0, ": tread01_d1ecl: d1cl = ", d1cl)
  )
//
end // end of [tread01_d1ecl]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1eclist(dcls) =
(
list_foreach<d1ecl>(dcls)
) where
{
implement(env)
list_foreach$fwork<d1ecl><env>(dcl, env) = tread01_d1ecl(dcl)
} (* end of [tread01_d1eclist] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread01_abstdf1
  (def) =
(
case+ def of
| ABSTDF1some() => ()
| ABSTDF1lteq(s1e) => tread01_s1exp(s1e)
| ABSTDF1eqeq(s1e) => tread01_s1exp(s1e)
) (* end of [tread01_abstdf0] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_teqd1expopt
  (opt0) =
(
case+ opt0 of
| TEQD1EXPnone() => ()
| TEQD1EXPsome(tok, d1e) => tread01_d1exp(d1e)
)
//
implement
//{}(*tmp*)
tread01_wths1expopt
  (opt0) =
(
case+ opt0 of
| WTHS1EXPnone() => ()
| WTHS1EXPsome(tok, s1e) => tread01_s1exp(s1e)
)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_f1arg(f1a0) =
(
case+
f1a0.node() of
| F1ARGsome_dyn(d1p0) => tread01_d1pat(d1p0)
| F1ARGsome_sta(s1qs) => tread01_s1qualst(s1qs)
| F1ARGsome_met(s1es) => tread01_s1explst(s1es)
) (* end of [tread01_f1arg] *)
//
implement
//{}(*tmp*)
tread01_f1arglst(f1as) =
(
list_foreach<f1arg>(f1as)
) where
{
implement(env)
list_foreach$fwork<f1arg><env>(f1a, env) = tread01_f1arg(f1a)
} (* end of [tread01_f1arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_q1arg(q1a0) =
(
case+
q1a0.node() of
(*
| Q1ARGnone(tok) => ()
*)
| Q1ARGsome(sid, opt) =>
  {
    val () = tread01_sort1opt(opt)
  }
)
//
implement
//{}(*tmp*)
tread01_q1arglst(q1as) =
(
list_foreach<q1arg>(q1as)
) where
{
implement(env)
list_foreach$fwork<q1arg><env>(q1a, env) = tread01_q1arg(q1a)
} (* end of [tread01_q1arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_sq1arg(sq1a) =
(
case+
sq1a.node() of
| SQ1ARGnone(tok) => ()
| SQ1ARGsome(q1as) => tread01_q1arglst(q1as)
)
//
implement
//{}(*tmp*)
tread01_sq1arglst(sqas) =
(
list_foreach<sq1arg>(sqas)
) where
{
implement(env)
list_foreach$fwork<sq1arg><env>(sqa, env) = tread01_sq1arg(sqa)
} (* end of [tread01_sq1arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_tq1arg(tq1a) =
(
case+
tq1a.node() of
| TQ1ARGnone(tok) => ()
| TQ1ARGsome(q1as) => tread01_q1arglst(q1as)
)
//
implement
//{}(*tmp*)
tread01_tq1arglst(tqas) =
(
list_foreach<tq1arg>(tqas)
) where
{
implement(env)
list_foreach$fwork<tq1arg><env>(tqa, env) = tread01_tq1arg(tqa)
} (* end of [tread01_tq1arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_ti1arg(ti1a) =
(
case+
ti1a.node() of
| TI1ARGnone(tok) => ()
| TI1ARGsome(s1es) => tread01_s1explst(s1es)
)
//
implement
//{}(*tmp*)
tread01_ti1arglst(tias) =
(
list_foreach<ti1arg>(tias)
) where
{
implement(env)
list_foreach$fwork<ti1arg><env>(tia, env) = tread01_ti1arg(tia)
} (* end of [tread01_ti1arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1valdecl
  (v1d0) =
{
  val () =
  tread01_d1pat(rcd.pat)
  val () =
  tread01_d1expopt(rcd.def)
  val () =
  tread01_wths1expopt(rcd.wtp)
} where
{
//
  val+D1VALDECL(rcd) = v1d0
//
} (* end of [tread01_d1valdecl] *)
//
implement
//{}(*tmp*)
tread01_d1vardecl
  (v1d0) =
{
  val () =
  tread01_s1expopt(rcd.res)
  val () =
  tread01_teqd1expopt(rcd.ini)
} where
{
//
  val+D1VARDECL(rcd) = v1d0
//
} (* end of [tread01_d1vardecl] *)
//
implement
//{}(*tmp*)
tread01_d1fundecl
  (f1d0) =
{
  val () =
  tread01_d1expopt(rcd.def)
  val () =
  tread01_f1arglst(rcd.arg)
  val () =
  tread01_wths1expopt(rcd.wtp)
} where
{
//
  val+D1FUNDECL(rcd) = f1d0
//
} (* end of [tread01_d1fundecl] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1valdeclist(v1ds) =
(
list_foreach<d1valdecl>(v1ds)
) where
{
implement(env)
list_foreach$fwork<d1valdecl><env>(v1d, env) = tread01_d1valdecl(v1d)
} (* end of [tread01_d1valdeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1vardeclist(v1ds) =
(
list_foreach<d1vardecl>(v1ds)
) where
{
implement(env)
list_foreach$fwork<d1vardecl><env>(v1d, env) = tread01_d1vardecl(v1d)
} (* end of [tread01_d1vardeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread01_d1fundeclist(f1ds) =
(
list_foreach<d1fundecl>(f1ds)
) where
{
implement(env)
list_foreach$fwork<d1fundecl><env>(f1d, env) = tread01_d1fundecl(f1d)
} (* end of [tread01_d1fundeclist] *)
//
(* ****** ****** *)
//
implement
tread01_wd1eclseq
  (wdcs) =
(
case+ wdcs of
|
WD1CSnone() => ()
|
WD1CSsome(d1cs) =>
{
  val () = tread01_d1eclist(d1cs)
} (* end of [tread01_wd1eclseq] *)
)
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread01_d1atypelst
  (d1ts) =
(
list_foreach<d1atype>(d1ts)
) where
{
implement
(env)//tmp
list_foreach$fwork<d1atype><env>
  (d1t, env) =
{
(*
  val () =
  tread01_d1eid(deid)
*)
  val () =
  tread01_t1marglst(tmas)
  val () =
    tread01_sort1opt(res1)
  // end of [val]
  val () =
    tread01_d1atconlst(d1cs)
  // end of [val]
} where
{
  val+
  D1ATYPE
  ( deid
  , tmas
  , res1, d1cs) = d1t.node()
} (* end of [where] *)
} (* end of [tread01_d0atypelst] *)

(* ****** ****** *)

local

static
fun//{}
the_trerr01lst_get(): trerr01lst
extern
fun//{}
the_trerr01lst_set(trerr01lst): void

implement
//{}(*tmp*)
trerr01_add(xerr) = let
//
val
xerrs = the_trerr01lst_get()
//
in
  the_trerr01lst_set(list_cons(xerr, xerrs))
end // end of [trerr01_add]

in (* in-of-local *)
//
local
//
val
the_trerr01lst =
ref<trerr01lst>(list_nil)
//
in(*in-of-local*)
implement
the_trerr01lst_get() = the_trerr01lst[]
implement
the_trerr01lst_set(xs) = the_trerr01lst[] := xs
end // end of [local]
//
implement
tread01_package
(
  p1kg
) = let // d1transd
//
val+
D1TRANSD(rcd) = p1kg
//
val d1cs =
let
val
d1csopt = rcd.transd
in
case+ d1csopt of
| None() =>
  list_nil((*void*))
| Some(d1cs) => d1cs
end : d1eclist // end-of-val
//
val () =
tread01_d1eclist(d1cs)
val
xerrs = the_trerr01lst_get()
val
nxerr = list_length<trerr01>(xerrs)
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
tread01_package: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread01_package: \
there is one trans01-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread01_package: \
there are some trans01-errors!")
//
val () =
(
$raise(XATSOPT_TRERR01_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("\
tread01_package: \
there are none of trans01-errors!")
//
} (* end of [else] *)
//
end // end of [tread01_package]

end // end of [local]

(* ****** ****** *)

(* end of [xats_tread01_dynexp.dats] *)
