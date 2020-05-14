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
#staload "./../SATS/lexing.sats"
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
  (id0) =
(
case+
id0.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok) =>
  let
    val () =
    synerr_add(SYNERRd0pid(id0))
  in
    prerr(tok.loc());
    prerrln!(": SYNERR(d0pid): ", tok);
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
| D0Pid(id0) =>
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
  (tbeg, d0ps, dend) =>
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
| D0Panno(d0p1, s0e2) =>
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
  (id0) =
(
case+
id0.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok) =>
  let
    val () =
    synerr_add(SYNERRd0eid(id0))
  in
    prerr(tok.loc());
    prerrln!(": SYNERR(d0eid): ", tok);
  end // end of [let]
) (* end of [synread_d0eid] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_dq0eid
  (qid) =
(
case+ qid of
| DQ0EIDnone(id0) =>
  {
    val () = synread_s0eid(id0)
  }
| DQ0EIDsome(tok, id0) =>
  {
    val () = synread_s0eid(id0)
  }
) (* end of [synread_dq0eid] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_d0exp
  (d0e0) = let
//
val loc0 = d0e0.loc((*void*))
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
| D0Eid(id0) =>
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
//
| D0Ecase
  ( tbeg, d0e1, tmid
  , topt, dcls, tend) =>
  {
(*
    val () =
    synread_CASE(tbeg)
*)
    val () =
    synread_d0exp(d0e1)
//
    val () = synread_OF(tmid)
//
    val () = synread_d0claulst(dcls)
  }
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
//
    val () =
    (
    case+ topt of
    | None() =>
      synread_d0explst(d0es)
    | Some(tok) =>
      synread_d0explst(d0es)
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
| D0Elam
  ( tok
  , arg0, res0
  , arrw, body, topt) =>
  {
(*
    val () = 
      synread_LAM(tok)
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
  ( tok, fid
  , arg0, res0
  , arrw, body, topt) =>
  {
(*
    val () = 
      synread_FIX(tok)
*)
    val () =
      synread_d0eid(fid)
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
| D0Etry
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
    val () = synread_d0explst(d0es)
  }
// (d0es1 ; d0es2)
| d0exp_RPAREN_cons2
  (tsep, d0es, tend) =>
  {
    val () = synread_SMCLN(tsep)
    val () = synread_RPAREN(tend)
    val () = synread_d0explst(d0es)
  }
)
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
synread_d0ecl
  (d0cl) = let
//
val loc0 = d0cl.loc((*void*))
//
(*
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
| D0Cnonfix
  (tok, ids) =>
  {
  val () =
  synread_i0dntlst(ids)
  }
//
| D0Cfixity
  (tok, ids, opt) =>
  {
  val () =
  synread_i0dntlst(ids)
//
  val () =
  (
    synread_precopt(opt)
  ) (* end of [val] *)
  }
//
| D0Cstatic
  (tok, dcl1) =>
  {
    val () =
    (
      synread_d0ecl(dcl1)
    )
  }
| D0Cextern
  (tok, dcl1) =>
  {
    val () =
    (
      synread_d0ecl(dcl1)
    )
  }
//
| D0Cinclude
  (tok, d0e(*src*)) => ()
| D0Cstaload
  (tok, d0e(*src*)) => ()
//
| D0Cabssort
  (tok, tid(*name*)) =>
  {
(*
    val () =
    synread_ABSSORT(tok)
*)
    val () = synread_s0tid(tid)
  }
//
| D0Cstacst0
  ( tok, sid
  , tmas, tcln, s0t0) =>
  {
(*
    val () =
    synread_STACST0(tok)
*)
    val () = synread_CLN(tcln)
    val () = synread_s0eid(sid)
    val () = synread_sort0(s0t0)
  }
//
//
| D0Csortdef
  (tok, tid, teq, def) =>
  {
(*
    val () =
    synread_SORTDEF(tok)
*)
    val () = synread_EQ(teq)
    val () = synread_s0tid(tid)
    val () = synread_s0rtdef(def)
  }
//
| D0Csexpdef
  ( tok, sid
  , arg, res, teq, def) =>
  {
(*
    val () =
    synread_SEXPDEF(tok)
*)
    val () = synread_EQ(teq)  
    val () = synread_s0eid(sid)
    val () = synread_s0marglst(arg)
    val () = synread_sort0opt(res)
    val () = synread_s0exp(def)
  }
//
| D0Cvaldecl
  (tok, mopt, v0ds) =>
  {
(*
    val () =
    synread_VAL(tok)
*)
    val () =
    synread_v0aldeclist(v0ds)
  }
//
| D0Cvardecl
  (tok, mopt, v0ds) =>
  {
(*
    val () =
    synread_VAR(tok)
*)
    val () =
    synread_v0ardeclist(v0ds)
  }
//
| D0Cfundecl
  (tok, mopt, tqas, f0ds) =>
  {
(*
    val () =
    synread_FUN(tok)
*)
    val () =
    synread_tq0arglst(tqas)
    val () =
    synread_f0undeclist(f0ds)
  }
//
| D0Csymload
  (tok, sym0, twth, dqid, topt) =>
  {
(*
    val () =
    synread_SYMLOAD(tok)
*)
    val () = synread_WITH(twth)
    val () = synread_s0ymb(sym0)
    val () = synread_dq0eid(dqid)
  }
//
| D0Cdynconst
  (tok, tqas, d0cs) =>
  {
(*
    val () =
    synread_FUN/VAL(tok)
*)
    val () = synread_tq0arglst(tqas)
    val () = synread_d0cstdeclist(d0cs)
  }
//
| D0Cnone(tok) =>
  let
    val () =
    synerr_add(SYNERRd0ecl(d0cl))
  in
    prerrln!(loc0, ": SYNERR(d0ecl): ", d0cl);
  end // end of [D0Cnone]
//
| D0Ctokerr(tok) =>
  let
    val () =
    synerr_add(SYNERRd0ecl(d0cl))
  in
    prerrln!(loc0, ": SYNERR(d0ecl): ", d0cl);
  end // end of [D0Cnone]
//
| _(* rest-of-d0ecl *) =>
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
| F0UNARROWnone(tok) =>
  let
    val () =
    synerr_add
    (SYNERRf0unarrow(tok))
  in
    prerr(tok.loc());
    prerrln!
    (": SYNERR(f0unarrow): ", tok);
  end
//
| F0UNARROWdflt(tok) =>
  {
(*
    val () =
    synread_EQGT(tok)
*)
  }
| F0UNARROWlist
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
  }
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
implement(env)
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
    val () = synread_RBRACE(tend)
    val () = synread_s0qualst(s0qs)
  }
| F0ARGsome_met
    (tbeg, s0es, tend) =>
  {
    val () = synread_LBRACE(tbeg)
    val () = synread_RBRACE(tend)
    val () = synread_s0explst(s0es)
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
(env)
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
implement(env)
list_foreach$fwork<tq0arg><env>
  (tq0a, env) =
(
case+
tq0a.node() of
//
| TQ0ARGnone(tok) =>
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
| TQ0ARGsome
    (tbeg, q0as, tend) =>
  {
    val () =
    synread_LT_GT(tbeg, tend)
    val () = synread_q0arglst(q0as)
  }
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
| WTHS0EXPnone() => ()
| WTHS0EXPsome(tok, s0e) => synread_s0exp(s0e)
)
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
| TEQD0EXPsome(tok, d0e) => synread_d0exp(d0e)
)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_v0aldeclist
  (v0ds) =
(
list_foreach<v0aldecl>(v0ds)
) where
{
implement(env)
list_foreach$fwork<v0aldecl><env>
  (v0d, env) =
{
//
  val+V0ALDECL(rcd) = v0d
//
  val () = synread_d0pat(rcd.pat)
  val () = synread_d0expopt(rcd.def)
  val () = synread_wths0expopt(rcd.wtp)
//
}
} (* end of [synread_v0aldeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_v0ardeclist
  (v0ds) =
(
list_foreach<v0ardecl>(v0ds)
) where
{
implement(env)
list_foreach$fwork<v0ardecl><env>
  (v0d, env) =
{
//
  val+
  V0ARDECL(rcd) = v0d
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
} (* end of [synread_v0ardeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_f0undeclist
  (f0ds) =
(
list_foreach<f0undecl>(f0ds)
) where
{
implement(env)
list_foreach$fwork<f0undecl><env>
  (f0d, env) =
{
//
  val+F0UNDECL(rcd) = f0d
//
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
} (* end of [synread_f0undeclist] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_precopt(opt) =
(
case+ opt of
| PRECOPTnil() => ()
| PRECOPTint(tok) =>
  {
    val () = synread_INT1(tok)
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
  auxopr(tok: token): void =
  (
    case+
    tok.node() of
    | T_IDENT_sym"+" => ()
    | T_IDENT_sym"-" => ()
    | _(*unrecognized*) =>
      let
        val () =
        synerr_add(SYNERRsignint_opr(tok))
      in
        prerrln!
        (tok.loc(), ": SYNERR(SIGNINT_OPR): ", tok);
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
implement(env)
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
implement(env)
list_foreach$fwork<d0arg><env>
  (d0a, env) =
(
case+
d0a.node() of
| D0ARGnone(tok) => ()
| D0ARGsome_sta
  (tbeg, s0qs, tend) =>
  synread_s0qualst(s0qs)
| D0ARGsome_dyn1
  (sid) => synread_s0eid(sid)
| D0ARGsome_dyn2
  (tbeg, atps, opt2, tend) =>
  {
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
synread_d0cstdeclist
  (d0cs) =
(
list_foreach<d0cstdecl>(d0cs)
) where
{
implement(env)
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
synread_program(d0cs) =
let
//
val () =
synread_d0eclist(d0cs)
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
synread_program: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("synread_program: there is one syntax0-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("synread_program: there are some syntax0-errors!")
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
("synread_program: there are none of syntax0-errors!")
//
} (* end of [else] *)
//
end // end of [synread_program]

end // end of [local]

(* ****** ****** *)

(* end of [xats_synread_dynexp.dats] *)
