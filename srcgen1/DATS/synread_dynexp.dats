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
#staload "./../SATS/filpath.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing0.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/synread.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/synread_basics.dats"
#staload
_(*TMP*) = "./../DATS/synread_staexp.dats"

(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0pid
  (dpid) =
(
case+
dpid.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRd0pid(dpid))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(d0pid): ", tok0);
  end // end of [let]
) (* end of [synread_d0pid] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0pat
  (d0p0) = let
//
val loc0 = d0p0.loc((*void*))
//
in
//
case+
d0p0.node() of
//
| D0Pint _ => ()
| D0Pchr _ => ()
| D0Pflt _ => ()
| D0Pstr _ => ()
//
| D0Pid0(id0) =>
  {
    val () =
    synread_d0pid(id0)
  }
//
| D0Papps(d0ps) =>
  {
    val () =
    synread_d0patlst(d0ps)
  }
//
| D0Pparen
  ( tbeg
  , d0ps, dend) =>
  {
(*
    val () =
    synread_LPAREN(tbeg)
*)
    val () =
    synread_d0patlst(d0ps)
    val () =
    synread_d0pat_RPAREN(dend)
  }
//
| D0Ptrcd1
  ( tbeg, topt
  , d0ps, dend ) =>
  {
    val () =
    synread_d0patlst(d0ps)
    val () =
    synread_d0pat_RPAREN(dend)
  }
//
| D0Panno
  ( d0p1, s0e2 ) =>
  {
    val () = synread_d0pat(d0p1)
    val () = synread_s0exp(s0e2)
  }
//
| _(* rest-of-d0pat *) =>
  (
    prerrln!
    (loc0, ": synread_d0pat: d0p0 = ", d0p0)
  )
//
end // end of [synread_d0pat]

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0patlst
  (d0ps) =
(
list_foreach<d0pat>(d0ps)
) where
{
implement(env)
list_foreach$fwork<d0pat><env>(d0p, env) = synread_d0pat(d0p)
} (* end of [synread_d0patlst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0pat_RPAREN
  (dend) =
(
case+ dend of
| d0pat_RPAREN_cons0
  (tend) =>
  {
    val () = synread_RPAREN(tend)
  }
// (d0ps1 | d0ps2)
| d0pat_RPAREN_cons1
  (tsep, d0ps, tend) =>
  {
    val () = synread_BAR(tsep)
    val () = synread_RPAREN(tend)
    val () = synread_d0patlst(d0ps)
  }
)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0eid
  (deid) =
(
case+
deid.node() of
|
I0DNTsome _ => ()
|
I0DNTnone(tok0) =>
let
  val () =
  synerr_add(SYNERRd0eid(deid))
in
  prerr(tok0.loc());
  prerrln!(": SYNERR(d0eid): ", tok0);
end // end of [let]
) (* end of [synread_d0eid] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_dq0eid
  (qid0) =
(
case+ qid0 of
| DQ0EIDnone(seid) =>
  {
    val () = synread_s0eid(seid)
  }
| DQ0EIDsome(tok0, deid) =>
  {
    val () = synread_qname(tok0)
    val () = synread_d0eid(deid)
  }
) (* end of [synread_dq0eid] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0exp
  (d0e0) = let
//
val
loc0 = d0e0.loc((*void*))
//
(*
val () =
println!
("synread_d0exp: d0e0 = ", d0e0)
*)
//
in
//
case+
d0e0.node() of
//
| D0Eint _ => ()
| D0Echr _ => ()
| D0Eflt _ => ()
| D0Estr _ => ()
//
| D0Eid0(id0) =>
  {
    val () =
    synread_d0eid(id0)
  }
//
| D0Eapps(d0es) =>
  {
    val () =
    synread_d0explst(d0es)
  }
//
| D0Esqarg
  (tbeg, s0es, tend) =>
  {
(*
    val () =
    synread_LBRACE(tbeg)
*)
    val () =
    synread_RBRACE(tend)
    val () =
    synread_s0explst(s0es)
  }
| D0Etqarg
  (tbeg, s0es, tend) =>
  {
(*
    val () =
    synread_LT(tbeg)
*)
    val () =
    synread_s0explst(s0es)
    val () =
    (
    case+
    tend.node() of
    | T_LTGT() => ()
    | _(*else*) => synread_GT(tend)
    ) : void // end of [val]
  }
//
| D0Eparen
  (tbeg, d0es, dend) =>
  {
(*
    val () =
    synread_LPAREN(tbeg)
*)
    val () =
    synread_d0explst(d0es)
    val () =
    synread_d0exp_RPAREN(dend)
  }
//
| D0Etrcd1
  ( tknd
  , topt, d0es, dend) =>
  {
(*
    val () =
    synread_LPAREN(tknd)
*)
    val () =
    synread_d0explst(d0es)
    val () =
    synread_d0exp_RPAREN(dend)
  }
//
(*
| D0Eif0
  ( tbeg(*IF*)
  , d0e1, d0e2, d0e3, topt) =>
  {
(*
    val () =
    synread_IF(tbeg)
*)
    val () =
    synread_d0exp(d0e1)
    val () =
    synread_d0exp_THEN(d0e2)
    val () =
    synread_d0exp_ELSE(d0e3)
  }
*)
//
| D0Eif0
  ( tbeg(*IF*)
  , d0e1
  , d0e2, d0e3) =>
  {
(*
    val () =
    synread_IF(tbeg)
*)
    val () =
    synread_d0exp(d0e1)
    val () =
    synread_d0exp_THEN(d0e2)
    val () =
    synread_d0exp_ELSE(d0e3)
  } (* D0Eif0 *)
| D0Eif1
  ( tbeg(*IF*)
  , d0e1
  , d0e2, d0e3, tinv) =>
  {
(*
    val () =
    synread_IF(tbeg)
*)
    val () =
    synread_d0exp(d0e1)
    val () =
    synread_d0exp_THEN(d0e2)
    val () =
    synread_d0exp_ELSE(d0e3)
//
    val () = synread_st0inv(tinv)
//
  } (* D0Eif1 *)
//
| D0Ecas0
  ( tbeg
  , d0e1, tmid
  , tbar, dcls) =>
  {
(*
    val () =
    synread_CASE(tbeg)
*)
    val () =
    synread_d0exp(d0e1)
//
    val () = synread_OF(tmid)
    val () =
      synread_d0claulst(dcls)
    // end of [val]
//
  } (* D0Ecas0 *)
| D0Ecas1
  ( tbeg
  , d0e1, tmid
  , tbar, dcls, tinv) =>
  {
(*
    val () =
    synread_CASE(tbeg)
*)
    val () =
    synread_d0exp(d0e1)
//
    val () = synread_OF(tmid)
    val () =
      synread_d0claulst(dcls)
    // end of [val]
//
    val () = synread_st0inv(tinv)
//
  } (* D0Ecas1 *)
//
| D0Elet
  ( tbeg, d0cs
  , topt, d0es, tend) =>
  {
//
(*
    val () =
    synread_LET(tbeg)
*)
//
    val () =
    synread_d0eclist(d0cs)
    val () =
    synread_ifguardlst(d0cs)
//
    val () =
    (
    case+ topt of
    | None() =>
      synread_d0explst(d0es)
    | Some(tok0) =>
      synread_d0expseq(d0es)
    ) : void // end of [val]
//
    val () = synread_ENDLET(tend)
//
  }
//
| D0Ewhere(d0e1, d0cs) =>
  {
    val () =
    synread_d0exp(d0e1)
    val () =
    synread_d0eclseq_WHERE(d0cs)
  }
//
| D0Ebrack
  (tbeg, d0es, tend) =>
  {
(*
    val () =
      synread_LBRACK(tbeg)
    // end of [val]
*)
    val () =
      synread_RBRACK(tend)
    val () =
      synread_d0explst(d0es)
    // end of [val]
  }
| D0Edtsel
  (tdot, lab1, opt2) =>
  {
(*
    val () =
    synread_DOT(tbeg)
*)
    val () =
      synread_l0abl(lab1)
    val () =
      synread_d0expopt(opt2)
    // end of [val]
  }
//
| D0Elam
  ( tok0
  , arg0, res0
  , arrw, body, topt) =>
  {
(*
    val () = 
      synread_LAM(tok0)
*)
//
    val () =
      synread_f0arglst(arg0)
    val () =
      synread_f0unarrow(arrw)
    val () =
      synread_effs0expopt(res0)
//
    val () = synread_d0exp(body)
//
  }
//
| D0Efix
  ( tok0, fid0
  , arg0, res0
  , arrw, body, topt) =>
  {
(*
    val () = 
      synread_FIX(tok0)
*)
    val () =
      synread_d0eid(fid0)
    val () =
      synread_f0arglst(arg0)
    val () =
      synread_f0unarrow(arrw)
    val () =
      synread_effs0expopt(res0)
//
    val () = synread_d0exp(body)
//
  }
//
| D0Etry0
  ( tbeg, d0e1, tmid
  , topt, dcls, tend) =>
  {
(*
    val () =
    synread_TRY(tbeg)
*)
    val () =
    synread_d0exp(d0e1)
//
    val () =
      synread_WITH(tmid)
//
    val () =
      synread_d0claulst(dcls)
//
    val () = synread_ENDTRY(tend)
//
  }
//
| D0Eanno
  (d0e1, s0e2) =>
  {
    val () = synread_d0exp(d0e1)
    val () = synread_s0exp(s0e2)
  }
//
| D0Equal
  (qtok, d0e1) =>
  {
    val () = synread_qname(qtok)
    val () = synread_d0exp(d0e1)
  }
//
| D0Eextnam(g0e1) =>
  {
    val () = synread_g0nam(g0e1)
  }
| D0Eexists
  (tok0, sqas, d0e1) =>
  {
(*
    val () =
    synread_DLR_EXISTS(tok0)
*)
    val () =
    synread_d0explst(sqas)
    val () = synread_d0exp(d0e1)
  }
//
| _(* rest-of-d0exp *) =>
  (
    prerrln!
    (loc0, ": synread_d0exp: d0e0 = ", d0e0)
  )
//
end // end of [synread_d0exp]

(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0expopt
  (opt0) =
(
case+ opt0 of
| None() => ()
| Some(d0e) => synread_d0exp(d0e)
)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0explst
  (d0es) =
(
list_foreach<d0exp>(d0es)
) where
{
implement(env)
list_foreach$fwork<d0exp><env>(d0e, env) = synread_d0exp(d0e)
} (* end of [synread_d0explst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0expseq
  (d0es) =
(
  auxcons_d0explst(d0es)
) where
{
fun
auxcons_d0explst
(d0es: d0explst): void =
(
  case+ d0es of
  | list_nil() => ()
  | list_cons(d0e1, d0es) =>
    auxcons_d0e1_d0es(d0e1, d0es)
)
and
auxcons_d0e1_d0es
( d0e1: d0exp
, d0es: d0explst): void =
(
case+ d0es of
| list_nil
  ((*none*)) =>
  (
  case+ d0e1.node() of
  | D0Enone
    ( tok1 ) =>
    {
      val () =
      (
        case+
        tok1.node() of
        | T_END() => ()
        | T_ENDLET() => ()
(*
        | T_RPAREN() => ()
*)
        | _(* else *) =>
          synread_d0exp(d0e1)
        )
    }
  | _(*else*) =>
    {
    val () = synread_d0exp(d0e1)
    }
  )
| list_cons
  (d0e2, d0es) =>
  let
    val () = synread_d0exp(d0e1)
  in
    auxcons_d0e1_d0es(d0e2, d0es)
  end
) (* end of [auxcons_d0explst] *)
} (* end of [synread_d0expseq] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0exp_THEN
  (d0e0) =
(
case+ d0e0 of
| d0exp_THEN
  (tbeg, d0e1) =>
  {
  val () = synread_d0exp(d0e1)
  }
) (* end of [synread_d0exp_THEN] *)
//
implement
//{}(*tmp*)
synread_d0exp_ELSE
  (d0e0) =
(
case+ d0e0 of
| d0exp_ELSEnone
  ((*void*)) => ((*void*))
| d0exp_ELSEsome
  (tbeg, d0e1) =>
  {
  val () = synread_d0exp(d0e1)
  }
) (* end of [synread_d0exp_ELSE] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0exp_RPAREN
  (dend) =
(
case+ dend of
| d0exp_RPAREN_cons0
  (tend) =>
  {
    val () = synread_RPAREN(tend)
  }
// (d0es1 | d0es2)
| d0exp_RPAREN_cons1
  (tsep, d0es, tend) =>
  {
    val () = synread_BAR(tsep)
    val () = synread_RPAREN(tend)
    val () = auxcons_d0explst(d0es)
  }
// (d0es1 ; d0es2)
| d0exp_RPAREN_cons2
  (tsep, d0es, tend) =>
  {
    val () = synread_SMCLN(tsep)
    val () = synread_RPAREN(tend)
    val () = auxcons_d0explst(d0es)
  }
) where
{
fun
auxcons_d0explst
(d0es: d0explst): void =
(
  case+ d0es of
  | list_nil() => ()
  | list_cons(d0e1, d0es) =>
    auxcons_d0e1_d0es(d0e1, d0es)
)
and
auxcons_d0e1_d0es
( d0e1: d0exp
, d0es: d0explst): void =
(
  case+ d0es of
  | list_nil
    ((*none*)) =>
    (
    case+ d0e1.node() of
    | D0Enone
      ( tok1 ) =>
      {
        val () =
        (
        case+
        tok1.node() of
        | T_RPAREN() => ()
        | _(* else *) =>
          synread_d0exp(d0e1)
        )
      }
    | _(*else*) =>
      {
      val () = synread_d0exp(d0e1)
      }
    )
  | list_cons
    (d0e2, d0es) =>
    let
      val () = synread_d0exp(d0e1)
    in
      auxcons_d0e1_d0es(d0e2, d0es)
    end
) (* end of [auxcons_d0explst] *)
} (* end of [synread_d0exp_RPAREN] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0gua
  (d0g0) =
(
case+
d0g0.node() of
| D0GUAexp(d0e1) =>
  {
    val () =
    synread_d0exp(d0e1)
  }
| D0GUAmat
  (d0e1, tmid, d0p2) =>
  {
//
    val () =
    synread_d0exp(d0e1)
//
    val () = synread_AS(tmid)
    val () = synread_d0pat(d0p2)
//
  }
)
//
implement
//{}(*tmp*)
synread_d0gualst
  (d0gs) =
(
list_foreach<d0gua>(d0gs)
) where
{
implement(env)
list_foreach$fwork<d0gua><env>(d0g, env) = synread_d0gua(d0g)
} (* end of [synread_d0gualst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0clau
  (d0cl) =
(
case+
d0cl.node() of
//
| D0CLAUgpat(d0gp) =>
  {
    val () =
    synread_d0gpat(d0gp)
  }
| D0CLAUclau
  (d0gp, tmid, d0e1) =>
  {
//
    val () =
    synread_d0gpat(d0gp)
//
    val () = synread_EQGT(tmid)
    val () = synread_d0exp(d0e1)
//
  }
)
//
implement
//{}(*tmp*)
synread_d0gpat
  (d0gp) =
(
case+
d0gp.node() of
| D0GPATpat(d0p1) =>
  {
    val () = synread_d0pat(d0p1)
  }
| D0GPATgua
  (d0p1, tmid, d0gs) =>
  {
    val () =
    synread_d0pat(d0p1)
    val () = synread_WHEN(tmid)
    val () = synread_d0gualst(d0gs)
  }
)
//
implement
//{}(*tmp*)
synread_d0claulst
  (dcls) =
(
list_foreach<d0clau>(dcls)
) where
{
implement(env)
list_foreach$fwork<d0clau><env>(dcl, env) = synread_d0clau(dcl)
} (* end of [synread_d0claulst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_abstdf0
  (def) =
(
case+ def of
| ABSTDF0some() => ()
//
|
ABSTDF0lteq(tok0, s0e1) =>
{
(*
  val () = synread_LTEQ(tok0)
*)
  val () = synread_s0exp(s0e1)
}
//
|
ABSTDF0eqeq(tok0, s0e1) =>
{
(*
  val () = synread_EQEQ(tok0)
*)
  val () = synread_s0exp(s0e1)
}
) (* end of [synread_abstdf0] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_g0expdef
  (def) =
(
case+ def of
| G0EDEFnone() => ()
| G0EDEFsome(topt, g0e1) =>
  {
    val () = synread_g0exp(g0e1)
  }
) (* end of [synread_g0expdef] *)

implement
//{}(*tmp*)
synread_d0macdef
  (def) =
(
case+ def of
| D0MDEFnone() => ()
| D0MDEFsome(topt, d0e1) =>
  {
    val () = synread_d0exp(d0e1)
  }
) (* end of [synread_d0macdef] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0ecl
  (d0cl) = let
//
val
loc0 = d0cl.loc((*void*))
//
(*
val () =
println!
("synread_d0ecl: loc0 = ", loc0)
val () =
println!
("synread_d0ecl: d0cl = ", d0cl)
*)
//
in
//
case+
d0cl.node() of
//
|
D0Cnonfix
(tok0, i0ds) =>
{
  val () =
  synread_i0dntlst(i0ds)
}
//
|
D0Cfixity
(tok0, i0ds, opt1) =>
{
  val () =
  synread_i0dntlst(i0ds)
//
  val () =
  (
    synread_precopt(opt1)
  ) (* end of [val] *)
}
//
|
D0Cstatic
(tok0, dcl1) =>
{
  val () =
  (
    synread_d0ecl(dcl1)
  )
}
|
D0Cextern
(tok0, dcl1) =>
{
  val () =
  (
    synread_d0ecl(dcl1)
  )
}
//
|
D0Cdefine
( tok0
, geid
, gmas, def1) =>
{
//
  val () =
  synread_g0eid(geid)
  val () =
  synread_g0marglst(gmas)
  val () =
  (
    synread_g0expdef(def1)
  )
}
|
D0Cmacdef
( tok0
, geid
, gmas, def1) =>
{
//
  val () =
  synread_g0eid(geid)
  val () =
  synread_g0marglst(gmas)
  val () =
  (
    synread_d0macdef(def1)
  )
}
//
|
D0Clocal
( tbeg, head
, topt, body, tend) =>
{
//
  val () = synread_d0eclist(head)
  val () = synread_ifguardlst(head)
//
  val () = synread_d0eclist(body)
  val () = synread_ifguardlst(body)
//
}
//
|
D0Cinclude
( tok0, dsrc(*src*) ) => ()
|
D0Cstaload
( tok0, dsrc(*src*) ) => ()
//
|
D0Cabssort
( tok0, tid0(*name*) ) =>
{
(*
val () =
synread_ABSSORT(tok0)
*)
val () = synread_s0tid(tid0)
}
//
|
D0Cstacst0
( tok0, sid0
, tmas, tcln, s0t1) =>
{
(*
  val () =
  synread_STACST0(tok0)
*)
  val () = synread_CLN(tcln)
//
  val () = synread_s0eid(sid0)
  val () = synread_sort0(s0t1)
//
}
//
|
D0Csortdef
( tok0
, tid0, teq1, def2) =>
{
(*
val () =
synread_SORTDEF(tok0)
*)
val () = synread_EQ(teq1)
val () = synread_s0tid(tid0)
val () = synread_s0rtdef(def2)
}
//
|
D0Csexpdef
( tok0
, sid0, arg0
, res0, teq1, def2) =>
{
//
(*
val () =
synread_SEXPDEF(tok0)
*)
//
val () =
synread_s0eid(sid0)
val () =
synread_s0marglst(arg0)
//
val () =
  synread_sort0opt(res0)
// end of [val]
//
val () = synread_EQ(teq1)
val () = synread_s0exp(def2)
//
}
//
|
D0Cabstype
( tok0, sid0
, arg0, res0, def1) =>
{
//
(*
val () =
synread_ABSTYPE(tok0)
*)
//
val () =
synread_s0eid(sid0)
val () =
synread_t0marglst(arg0)
//
val () =
  synread_sort0opt(res0)
// end of [val]
//
val () = synread_abstdf0(def1)
//
}
//
|
D0Cabsopen
  (tok0, sqid) =>
{
(*
val () =
synread_ABSOPEN(tok0)
*)
val () = synread_sq0eid(sqid)
}
//
|
D0Cabsimpl
( tok0
, sqid, smas
, res1, teq2, s0e1) =>
{
(*
  val () =
  symread_ABSIMPL(tok0)
*)
  val () =
  synread_sq0eid(sqid)
  val () =
  synread_s0marglst(smas)
  val () =
  synread_sort0opt(res1)
  val () = synread_EQ(teq2)
  val () = synread_s0exp(s0e1)
}
//
|
D0Csymload
( tok0, sym0
, twth, dqid, topt) =>
{
(*
  val () =
  synread_SYMLOAD(tok0)
*)
  val () = synread_WITH(twth)
  val () = synread_s0ymb(sym0)
  val () = synread_dq0eid(dqid)
}
//
|
D0Cfundclst
(tok, mopt, tqas, f0ds) =>
{
(*
  val () =
  synread_FUN(tok0)
*)
  val () =
  synread_tq0arglst(tqas)
  val () =
  synread_d0fundeclist(f0ds)
}
//
|
D0Cvaldclst
(tok0, mopt, v0ds) =>
{
(*
  val () =
  synread_VAL(tok0)
*)
  val () =
  synread_d0valdeclist(v0ds)
}
//
|
D0Cvardclst
(tok0, mopt, v0ds) =>
{
(*
  val () =
  synread_VAR(tok0)
*)
  val () =
  synread_d0vardeclist(v0ds)
}
//
|
D0Cimplmnt0
( tok0, mopt
, sqas, tqas
, dqid, tias, f0as
, res0, teq1, body) =>
{
(*
  val () =
  synread_sq0arglst(sqas)
*)
  val () =
  synread_tq0arglst(tqas)
(*
  val () =
  synread_ti0arglst(tias)
*)
  val () =
    synread_f0arglst(f0as)
  val () =
  synread_effs0expopt(res0)
  val () = synread_EQ(teq1)
  val () = synread_d0exp(body)
}
//
|
D0Cexcptcon
(tok0, d0cs) =>
{
(*
  val () =
  synread_EXCEPTION(tok0)
*)
  val () =
    synread_d0atconlst(d0cs)
  // end of [val]
}
//
|
D0Cdatatype
(tok0, d0ts, wdcs) =>
{
  val () =
    synread_wd0eclseq(wdcs)
  // end of [val]
  val () =
    synread_d0atypelst(d0ts)
  // end of [val]
}
//
|
D0Cdynconst
(tok0, tqas, d0cs) =>
{
(*
  val () =
    synread_FUN/VAL(tok0)
  // end of [val]
*)
  val () =
    synread_tq0arglst(tqas)
  // end of [val]
  val () =
    synread_d0cstdeclist(d0cs)
  // end of [val]
}
//
|
D0Cnone(tok0) =>
let
  val () =
  synerr_add(SYNERRd0ecl(d0cl))
in
  prerrln!(loc0, ": SYNERR(d0ecl): ", d0cl);
end // end of [D0Cnone]
//
|
D0Ctokerr(tok0) =>
let
  val () =
  synerr_add(SYNERRd0ecl(d0cl))
in
  prerrln!(loc0, ": SYNERR(d0ecl): ", d0cl);
end // end of [D0Cnone]
//
|
_(* rest-of-d0ecl *) =>
(
  prerrln!(loc0, ": synread_d0ecl: d0cl = ", d0cl)
)
//
end // end of [synread_d0ecl]

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0eclist
  (d0cs) =
(
list_foreach<d0ecl>(d0cs)
) where
{
implement(env)
list_foreach$fwork<d0ecl><env>(d0c, env) = synread_d0ecl(d0c)
} (* end of [synread_d0eclist] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0eclseq_WHERE
  (d0cs) = 
let
val+
d0eclseq_WHERE
( tok0
, topt
, d0cs, tend) = d0cs
//
val () =
synread_d0eclist(d0cs)
val () =
synread_ifguardlst(d0cs)
//
(*
val () =
(
case+ topt of
| None() => ()
| Some(tok1) => synread_LBRACE(tok1)
)
*)
in
//
case+ tend of
| endwhere_cons1
    (tok2) =>
  (
  case+ topt of
  | Some _ =>
    synread_RBRACE(tok2)
  | None _ =>
    synread_ENDWHERE(tok2)
  )
| endwhere_cons2
    (tok2, _) =>
  (
  case+ topt of
  | Some _ =>
    {
    val () =
    synread_RBRACE(tok2)
    }
  | None _ =>
    synread_ENDWHERE(tok2)
  )
//
end // end of [synread_d0eclseq_WHERE]

(* ****** ****** *)

implement
//{}(*tmp*)
synread_f0unarrow
  (arrw) =
(
case+ arrw of
//
|
F0UNARROWnone(tok0) =>
let
  val () =
  synerr_add
  (SYNERRfarrow(tok0))
in
  prerr(tok0.loc());
  prerrln!
  (": SYNERR(farrow): ", tok0);
end
//
|
F0UNARROWdflt(tok0) =>
{
(*
  val () =
  synread_EQGT(tok0)
*)
} (* end of [F0UNARROWdflt] *)
|
F0UNARROWlist
  (tbeg, s0es, tend) =>
{
(*
  val () =
  synread_EQLT(tbeg)
*)
//
  val () =
  synread_s0explst(s0es)
//
  val () = synread_GT(tend)
//
} (* end of [F0UNARROWlist] *)
//
) (* end of [synread_f0unarrow] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_f0arglst
  (f0as) =
(
list_foreach<f0arg>(f0as)
) where
{
implement
(env)//tmp
list_foreach$fwork<f0arg><env>
  (f0a0, env) =
(
case+
f0a0.node() of
//
| F0ARGnone _ =>
  let
  val
  loc0 = f0a0.loc((*void*))
  val () =
  synerr_add(SYNERRf0arg(f0a0))
  in
  prerrln!
  (loc0, ": SYNERR(f0arg): ", f0a0)
  end // end of [F0ARGnone]
//
| F0ARGsome_dyn(d0p0) =>
  {
    val () = synread_d0pat(d0p0)
  }
| F0ARGsome_sta
    (tbeg, s0qs, tend) =>
  {
    val () = synread_LBRACE(tbeg)
    val () = synread_s0qualst(s0qs)
    val () = synread_RBRACE(tend)
  }
| F0ARGsome_met
    (tbeg, s0es, tend) =>
  {
    val () = synread_DOTLT( tbeg )
    val () = synread_s0explst(s0es)
    val () = synread_GTDOT( tend )
  }
//
) (* list_foreach$fwork *)
} (* end of [synread_f0arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_q0arglst
  (q0as) =
(
list_foreach<q0arg>(q0as)
) where
{
//
implement
(env)//tmp
list_foreach$fwork<q0arg><env>
  (q0a0, env) =
(
case+
q0a0.node() of
| Q0ARGsome(sid, opt) =>
  {
    val () = synread_s0eid(sid)
    val () = synread_sort0opt(opt)
  }
)
//
} (* end of [synread_q0arglst] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_tq0arglst
  (tqas) =
(
list_foreach<tq0arg>(tqas)
) where
{
implement
(env)//tmp
list_foreach$fwork<tq0arg><env>
  (tq0a, env) =
(
case+
tq0a.node() of
//
|
TQ0ARGnone(tok0) =>
let
  val
  loc0 = tq0a.loc((*void*))
  val () =
  synerr_add(SYNERRtq0arg(tq0a))
in
  prerrln!
  (loc0, ": SYNERR(tq0arg): ", tq0a)
end // end of [TQ0ARGGnone]
//
|
TQ0ARGsome
(tbeg, q0as, tend) =>
{
  val () =
  synread_LT_GT(tbeg, tend)
  val () = synread_q0arglst(q0as)
} (* end of [TQ0ARGsome] *)
//
)
} (* end of [synread_tq0arglst] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_wths0expopt
  (wopt) =
(
case+ wopt of
|
WTHS0EXPnone
((*void*)) => ()
|
WTHS0EXPsome
(tok0, s0e1) => synread_s0exp(s0e1)
) (* end of [synread_wths0expopt] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_teqd0expopt
  (topt) =
(
case+ topt of
| TEQD0EXPnone() => ()
| TEQD0EXPsome
  (tok0, d0e1) => synread_d0exp(d0e1)
) (* end of [synread_teqd0expopt] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0valdeclist
  (v0ds) =
(
list_foreach<d0valdecl>(v0ds)
) where
{
implement
(env)//tmp
list_foreach$fwork<d0valdecl><env>
  (v0d, env) =
{
//
  val+D0VALDECL(rcd) = v0d
//
  val () = synread_d0pat(rcd.pat)
  val () = synread_d0expopt(rcd.def)
  val () = synread_wths0expopt(rcd.wtp)
//
}
} (* end of [synread_d0valdeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0vardeclist
  (v0ds) =
(
list_foreach<d0vardecl>(v0ds)
) where
{
implement
(env)//tmp
list_foreach$fwork<d0vardecl><env>
  (v0d, env) =
{
//
val+
D0VARDECL(rcd) = v0d
//
val () =
synread_d0pid(rcd.nam)
//
val () =
(
case+ rcd.wth of
| None() => ()
| Some(id0) => synread_d0pid(id0)
)
//
val () = synread_s0expopt(rcd.res)
val () = synread_teqd0expopt(rcd.ini)
//
}
} (* end of [synread_d0vardeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0fundeclist
  (f0ds) =
(
list_foreach<d0fundecl>(f0ds)
) where
{
implement
(env)//tmp
list_foreach$fwork<d0fundecl><env>
  (f0d, env) =
{
//
  val+D0FUNDECL(rcd) = f0d
//
  val () =
    synread_d0pid(rcd.nam)
//
  val () =
    synread_f0arglst(rcd.arg)
//
  val () =
    synread_effs0expopt(rcd.res)
//
  val () = synread_d0expopt(rcd.def)
//
  val () = synread_wths0expopt(rcd.wtp)
//
}
} (* end of [synread_d0fundeclist] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_precopt(opt) =
(
case+ opt of
| PRECOPTnil() => ()
| PRECOPTint(tok0) =>
  {
    val () = synread_INT1(tok0)
  }
| PRECOPTopr
  (topr, pmod) =>
  {
    val () = synread_i0dnt(topr)
    val () = synread_precmod(pmod)
  }
)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_precmod
  (opt) =
(
case+ opt of
| PRECMODnone() => ()
| PRECMODsome
  (tbeg, sint, tend) =>
  {
    val () = synread_LPAREN(tbeg)
    val () = synread_RPAREN(tend)
    val () = synread_signint(sint)
  }
)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_signint
  (sint) =
(
case+ sint of
| SIGNINTint(int) =>
  {
    val () = synread_INT1(int)
  }
| SIGNINTopr(opr, int) =>
  {
    val () = auxopr(opr)
    val () = synread_INT1(int)
  }
) where
{
// HX-2018-11-18:
// int sign is either + or -
fun
auxopr(tok0: token): void =
(
  case+
  tok0.node() of
  | T_IDENT_sym"+" => ()
  | T_IDENT_sym"-" => ()
  | _(*unrecognized*) =>
    let
      val () =
      synerr_add(SYNERRsignopr(tok0))
    in
      prerrln!
      (tok0.loc(), ": SYNERR(SIGNOPR): ", tok0);
    end // end of [let]
) (* end of [auxopr] *)
//
} (* end of [synread_signint] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_a0typlst
  (atps) =
(
list_foreach<a0typ>(atps)
) where
{
implement
(env)//tmp
list_foreach$fwork<a0typ><env>
  (atp, env) =
(
case+
atp.node() of
| A0TYPsome(s0e, tok) =>
  {
    val () = synread_s0exp(s0e)
  }
)
} (* end of [synread_a0typlst] *)

implement
synread_a0typlstopt
  (opt0) =
(
case+ opt0 of
| None() => ()
| Some(atps) => synread_a0typlst(atps)
)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0arglst
  (d0as) =
(
list_foreach<d0arg>(d0as)
) where
{
implement
(env)//tmp
list_foreach$fwork<d0arg><env>
  (d0a, env) =
(
case+
d0a.node() of
|
D0ARGnone(tok) => ()
|
D0ARGsome_sta
(tbeg, s0qs, tend) =>
{
  val () =
  synread_RBRACE(tend)
  val () =
  synread_s0qualst(s0qs)
}
|
D0ARGsome_dyn1(sid) =>
{
  val () = synread_s0eid(sid)
}
|
D0ARGsome_dyn2
(tbeg, atps, opt2, tend) =>
{
val () = synread_RPAREN(tend)
val () = synread_a0typlst(atps)
val () = synread_a0typlstopt(opt2)
}
)
} (* end of [synread_d0arglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0typlst
  (d0ts) =
(
list_foreach<d0typ>(d0ts)
) where
{
implement
(env)//tmp
list_foreach$fwork<d0typ><env>
  (d0t, env) =
(
case+
d0t.node() of
|
D0TYPnone(tok) => ()
|
D0TYPsome(id0, opt) =>
{
  val () = synread_d0pid(id0)
  val () = synread_s0expopt(opt)
}
)
} (*where*) // synread_d0typlst]
//
implement
//{}(*tmp*)
synread_st0qua
  (st0q) =
(
case+ st0q of
|
ST0QUAnone(tok) => ()
|
ST0QUAsome
(tbeg, s0qs, tend) =>
{
(*
val () =
synread_LBRACE(tbeg)
*)
val () =
synread_s0qualst(s0qs)
val () = synread_RBRACE(tend)
}
)
//
implement
//{}(*tmp*)
synread_st0inv
  (tinv) =
(
case+ tinv of
|
ST0INVnone
( stqs, tok ) =>
(
auxstqs( stqs )
)
|
ST0INVsome
( stqs
, tbeg, d0ts, tend) =>
{
val () =
auxstqs( stqs )
(*
val () =
synread_LPAREN(tbeg)
*)
val () =
synread_d0typlst(d0ts)
val () = synread_RPAREN(tend)
}
) where
{
fun
auxstqs
( xs
: st0qualst): void =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x1, xs) =>
(synread_st0qua(x1); auxstqs(xs))
)
} (*where*) // [synread_st0inv]
//
(* ****** ****** *)
//
implement
synread_wd0eclseq
  (wdcs) =
(
case+ wdcs of
|
WD0CSnone() => ()
|
WD0CSsome
(tbeg, topt, d0cs, tend) =>
{
  val () = synread_d0eclist(d0cs)
} (* end of [synread_wd0eclseq] *)
)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0atypelst
  (d0ts) =
(
list_foreach<d0atype>(d0ts)
) where
{
implement
(env)//tmp
list_foreach$fwork<d0atype><env>
  (d0t, env) =
{
  val () =
  synread_d0eid(deid)
  val () =
  synread_t0marglst(tmas)
  val () =
    synread_sort0opt(res1)
  // end of [val]
  val () = synread_EQ(teq2)
  val () =
    synread_d0atconlst(d0cs)
  // end of [val]
} where
{
  val+
  D0ATYPE
  ( deid
  , tmas
  , res1 (*sort0opt*)
  , teq2, d0cs) = d0t.node()
} (* end of [where] *)
} (* end of [synread_d0atypelst] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0cstdeclist
  (d0cs) =
(
list_foreach<d0cstdecl>(d0cs)
) where
{
implement
(env)//tmp
list_foreach$fwork<d0cstdecl><env>
  (d0c, env) =
let
val+
D0CSTDECL(rcd) = d0c
in
let
val () = synread_d0pid(rcd.nam)
val () = synread_d0arglst(rcd.arg)
val () = synread_effs0expopt(rcd.res)
val () = synread_teqd0expopt(rcd.def)
in
  // nothing
end // end of [let]
end // end of [let]
}
//
(* ****** ****** *)
//
implement
synread_ifguardlst
  (d0cs) =
(
  auxmain
  (d0cs, list_vt_nil())
) where
{
//
fun
auxerr
(x0: d0ecl): void =
{
val () =
synerr_add(SYNERRifgua(x0))
val () =
prerr(x0.loc())
val () =
prerrln!(": SYNERR(ifgua): ", x0)
} (* end of [auxerr] *)
//
fun
auxfree
( xs
: d0eclist_vt): void =
(
case+ xs of
|
~list_vt_nil() => ()
|
~list_vt_cons(x0, xs) =>
 let
 val () = auxerr(x0) in auxfree(xs)
 end
)
//
fun
auxmain
( xs
: d0eclist
, ys
: d0eclist_vt): void =
(
//
case+ xs of
|
list_nil() =>
(
  auxfree(ys)
)
|
list_cons(x0, xs) =>
(
case+
x0.node() of
| D0Celse _ =>
  auxmain(xs, ys) where
  {
    val ys = aux_else(x0, ys)
  }
| D0Cifdec _ =>
  auxmain(xs, ys) where
  {
    val ys = aux_ifdec(x0, ys)
  }
| D0Celsif _ =>
  auxmain(xs, ys) where
  {
    val ys = aux_elsif(x0, ys)
  }
| D0Cendif _ =>
  auxmain(xs, ys) where
  {
    val ys = aux_endif(x0, ys)
  }
//
| _(*non-ifguard*) => auxmain(xs, ys)
//
) (* list_cons *)
//
) (* end of [auxmain] *)
//
and
aux_else
( x0
: d0ecl
, ys
: d0eclist_vt): d0eclist_vt =
(
case+ ys of
| @
list_vt_nil() =>
let
  val () = auxerr(x0)
in
  let prval () = fold@(ys) in ys end
end
| @
list_vt_cons(y0, _) =>
(
case+
y0.node() of
| D0Cifdec _ =>
  let
    prval () = fold@(ys)
  in
    list_vt_cons(x0, ys)
  end
| D0Celsif _ =>
  let
    prval () = fold@(ys)
  in
    list_vt_cons(x0, ys)
  end
| _(* non-D0Cifdec *) => 
  let
    val () = auxerr(x0)
  in
    let prval () = fold@(ys) in ys end
  end
)
) (* end of [aux_else] *)
//
and
aux_ifdec
( x0
: d0ecl
, ys
: d0eclist_vt
)
: d0eclist_vt = list_vt_cons(x0, ys)
//
and
aux_elsif
( x0
: d0ecl
, ys
: d0eclist_vt) : d0eclist_vt =
(
case+ ys of
| @
list_vt_nil() =>
let
  val () = auxerr(x0)
in
  let prval () = fold@(ys) in ys end
end
| @
list_vt_cons(y0, _) =>
(
case+
y0.node() of
| D0Cifdec _ =>
  let
    prval () = fold@(ys)
  in
    list_vt_cons(x0, ys)
  end
| D0Celsif _ =>
  let
    prval () = fold@(ys)
  in
    list_vt_cons(x0, ys)
  end
| _(* non-D0Cifdec *) => 
  let
    val () = auxerr(x0)
  in
  let prval () = fold@(ys) in ys end
  end
)
) (* end of [aux_elsif] *)
//
and
aux_endif
( x0
: d0ecl
, ys
: d0eclist_vt): d0eclist_vt =
(
case+ ys of
| ~
list_vt_nil() =>
let
  val () =
  auxerr(x0) in list_vt_nil()
end
| ~
list_vt_cons(y0, ys) =>
(
case+ y0.node() of
| D0Celse _ =>
  (
    aux_endif(x0, ys)
  )
//
| D0Cifdec _ => ys
| D0Celsif _ => aux_endif(x0, ys)
//
| _(* non-D0Cifdec *) => 
  let
  val () =
  auxerr(x0) in list_vt_cons(y0, ys)
  end
)
) (* end of [aux_endif] *)
//
} (* end of [synread_ifguardlst] *)
//
(* ****** ****** *)

local

static
fun//{}
the_synerrlst_get(): synerrlst
extern
fun//{}
the_synerrlst_set(synerrlst): void

implement
//{}(*tmp*)
synerr_add(xerr) = let
//
val
xerrs = the_synerrlst_get()
//
in
  the_synerrlst_set(list_cons(xerr, xerrs))
end // end of [synerr_add]

in (* in-of-local *)
//
local
//
val
the_synerrlst =
ref<synerrlst>(list_nil)
//
in(*in-of-local*)
implement
the_synerrlst_get() = the_synerrlst[]
implement
the_synerrlst_set(xs) = the_synerrlst[] := xs
end // end of [local]
//
implement
synread_package
(
  p0kg
) = let // d0parsed
//
val+
D0PARSED(rcd) = p0kg
//
val d0cs =
(
case+
rcd.parsed of
|
None() =>
list_nil() where
{
val () =
synerr_add
(SYNERRd0parsed(p0kg))
//
#symload
prerr with prerr_filpath_full2
val () =
prerrln!
( "(Meta-Location)"
, ": SYNERR(d0parsed): ", rcd.source)
//
}
|
Some(d0cs) => d0cs
) : d0eclist // end-of-val
//
val () =
synread_d0eclist(d0cs)
val () =
synread_ifguardlst(d0cs)
//
val
xerrs = the_synerrlst_get()
val
nxerr = list_length<synerr>(xerrs)
//
in(* in-of-let *)
//
if
(nxerr > 0)
then
{
//
val () =
prerrln!
("\
synread_package: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("synread_package: there is one synread-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("synread_package: there are some synread-errors!")
//
val () =
($raise(XATSOPT_SYNERR_EXN(*void*))): void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("synread_package: there are none of synread-errors!")
//
} (* end of [else] *)
//
end // end of [synread_package]

end // end of [local]

(* ****** ****** *)

(* end of [xats_synread_dynexp.dats] *)
