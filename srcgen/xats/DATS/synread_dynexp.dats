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
{}(*tmp*)
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
{}(*tmp*)
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
    synread_d0pid<>(id0)
  }
//
| D0Papps(d0ps) =>
  {
    val () =
    synread_d0patlst<>(d0ps)
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
{}(*tmp*)
synread_d0patlst
  (d0ps) =
(
list_foreach<d0pat>(d0ps)
) where
{
implement(env)
list_foreach$fwork<d0pat><env>(d0p, env) = synread_d0pat<>(d0p)
} (* end of [synread_d0patlst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
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
{}(*tmp*)
synread_dq0eid
  (qid) =
(
case+ qid of
| DQ0EIDnone(id0) =>
  {
    val () = synread_s0eid<>(id0)
  }
| DQ0EIDsome(tok, id0) =>
  {
    val () = synread_s0eid<>(id0)
  }
) (* end of [synread_dq0eid] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    synread_d0explst<>(d0es)
  }
//
| D0Eparen
  (tbeg, d0es, dend) =>
  {
    val () =
    synread_d0explst<>(d0es)
    val () =
    synread_d0exp_RPAREN<>(dend)
  }
//
| D0Elet
  (tbeg, d0cs, topt, d0es, tend) =>
  {
//
    val () =
    synread_d0eclist<>(d0cs)
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
| _(* rest-of-d0exp *) =>
  (
    prerrln!
    (loc0, ": synread_d0exp: d0e0 = ", d0e0)
  )
//
end // end of [synread_d0exp]

(* ****** ****** *)

implement
{}(*tmp*)
synread_d0expopt
  (opt0) =
(
case+ opt0 of
| None() => ()
| Some(d0e) => synread_d0exp<>(d0e)
)

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_d0explst
  (d0es) =
(
list_foreach<d0exp>(d0es)
) where
{
implement(env)
list_foreach$fwork<d0exp><env>(d0e, env) = synread_d0exp<>(d0e)
} (* end of [synread_d0explst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
synread_d0exp_RPAREN
  (dend) =
(
case+ dend of
| d0exp_RPAREN_cons0
  (tend) =>
  {
    val () = synread_RPAREN<>(tend)
  }
// (d0es1 | d0es2)
| d0exp_RPAREN_cons1
  (tsep, d0es, tend) =>
  {
    val () = synread_BAR<>(tsep)
    val () = synread_RPAREN<>(tend)
    val () = synread_d0explst<>(d0es)
  }
// (d0es1 ; d0es2)
| d0exp_RPAREN_cons2
  (tsep, d0es, tend) =>
  {
    val () = synread_SMCLN<>(tsep)
    val () = synread_RPAREN<>(tend)
    val () = synread_d0explst<>(d0es)
  }
)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_d0ecl
  (d0c0) = let
//
val loc0 = d0c0.loc((*void*))
//
(*
val () =
println!
("synread_d0ecl: d0c0 = ", d0c0)
*)
//
in
//
case+
d0c0.node() of
//
| D0Cnonfix
  (tok, ids) =>
  {
    val () =
    synread_i0dntlst<>(ids)
  }
//
| D0Cfixity
  (tok, ids, opt) =>
  {
    val () =
    synread_i0dntlst<>(ids)
//
    val () =
    (
      synread_precopt<>(opt)
    ) (* end of [val] *)
  }
//
| D0Cstatic
  (tok, d0c) =>
  {
    val () = synread_d0ecl<>(d0c)
  }
| D0Cextern
  (tok, d0c) =>
  {
    val () = synread_d0ecl<>(d0c)
  }
//
| D0Cabssort
  (tok, tid) =>
  {
(*
    val () =
    synread_ABSSORT<>(tok)
*)
    val () = synread_s0tid<>(tid)
  }
//
| D0Cstacst0
  ( tok, sid
  , tmas, tcln, s0t0) =>
  {
(*
    val () =
    synread_STACST0<>(tok)
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
    synread_SORTDEF<>(tok)
*)
    val () = synread_EQ<>(teq)
    val () = synread_s0tid<>(tid)
    val () = synread_s0rtdef<>(def)
  }
//
| D0Csexpdef
  ( tok, sid
  , arg, res, teq, def) =>
  {
(*
    val () =
      synread_SEXPDEF<>(tok)
    // end of [val]
*)
    val () = synread_EQ<>(teq)  
    val () = synread_s0eid<>(sid)
    val () = synread_sort0opt<>(res)
    val () = synread_s0marglst<>(arg)
    val () = synread_s0exp<>(def)
  }
//
| D0Cvaldecl
  (tok, mopt, v0ds) =>
  {
(*
    val () =
    synread_VAL<>(tok)
*)
    val () =
    synread_v0aldeclist<>(v0ds)
  }
//
| D0Cvardecl
  (tok(*VAR*), v0ds) =>
  {
(*
    val () =
    synread_VAR<>(tok)
*)
    val () =
    synread_v0ardeclist<>(v0ds)
  }
//
| D0Cfundecl
  (tok, mopt, tqas, f0ds) =>
  {
(*
    val () =
    synread_FUN<>(tok)
*)
    val () =
    synread_tq0arglst(tqas)
    val () =
    synread_f0undeclist<>(f0ds)
  }
//
| D0Csymload
  (tok, sym0, twth, dqid, topt) =>
  {
(*
    val () =
    synread_SYMLOAD<>(tok)
*)
    val () = synread_s0ymb<>(sym0)
    val () = synread_WITH<>( twth )
    val () = synread_dq0eid<>(dqid)
  }
//
| D0Cnone(tok) =>
  let
    val () =
    synerr_add(SYNERRd0ecl(d0c0))
  in
    prerrln!(loc0, ": SYNERR(d0ecl): ", d0c0);
  end // end of [D0Cnone]
//
| D0Ctokerr(tok) =>
  let
    val () =
    synerr_add(SYNERRd0ecl(d0c0))
  in
    prerrln!(loc0, ": SYNERR(d0ecl): ", d0c0);
  end // end of [D0Cnone]
//
| _(* rest-of-d0ecl *) =>
  (
    prerrln!(loc0, ": synread_d0ecl: d0c0 = ", d0c0)
  )
//
end // end of [synread_d0ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_d0eclist
  (d0cs) =
(
list_foreach<d0ecl>(d0cs)
) where
{
implement(env)
list_foreach$fwork<d0ecl><env>(d0c, env) = synread_d0ecl<>(d0c)
} (* end of [synread_d0eclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
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
    val () = synread_d0pat<>(d0p0)
  }
| F0ARGsome_sta
    (tbeg, s0qs, tend) =>
  {
    val () = synread_LBRACE<>(tbeg)
    val () = synread_RBRACE<>(tend)
    val () = synread_s0qualst<>(s0qs)
  }
| F0ARGsome_met
    (tbeg, s0es, tend) =>
  {
    val () = synread_LBRACE<>(tbeg)
    val () = synread_RBRACE<>(tend)
    val () = synread_s0explst<>(s0es)
  }
//
) (* list_foreach$fwork *)
} (* end of [synread_f0arglst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
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
    val () = synread_s0eid<>(sid)
    val () = synread_sort0opt<>(opt)
  }
)
//
} (* end of [synread_q0arglst] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    val () = synread_LT<>(tbeg)
    val () = synread_GT<>(tend)
    val () = synread_q0arglst<>(q0as)
  }
//
)
} (* end of [synread_tq0arglst] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_wths0expopt
  (wopt) =
(
case+ wopt of
| WTHS0EXPnone() => ()
| WTHS0EXPsome(tok, s0e) => synread_s0exp<>(s0e)
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
synread_teqd0expopt
  (topt) =
(
case+ topt of
| TEQD0EXPnone() => ()
| TEQD0EXPsome(tok, d0e) => synread_d0exp<>(d0e)
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
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
  val () = synread_d0pat<>(rcd.pat)
  val () = synread_d0expopt<>(rcd.def)
  val () = synread_wths0expopt<>(rcd.wtp)
//
}
} (* end of [synread_v0aldeclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
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
  val+V0ARDECL(rcd) = v0d
//
  val () = synread_d0pid<>(rcd.nam)
  val () =
  (
  case+ rcd.wth of
  | None() => ()
  | Some(id0) => synread_d0pid<>(id0)
  )
  val () = synread_s0expopt<>(rcd.res)
  val () = synread_teqd0expopt<>(rcd.ini)
//
}
} (* end of [synread_v0ardeclist] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
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
    synread_f0arglst<>(rcd.arg)
//
  val () =
    synread_effs0expopt<>(rcd.res)
//
  val () = synread_d0expopt<>(rcd.def)
//
  val () = synread_wths0expopt<>(rcd.wtp)
//
}
} (* end of [synread_f0undeclist] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_precopt(opt) =
(
case+ opt of
| PRECOPTnil() => ()
| PRECOPTint(tok) =>
  {
    val () = synread_INT1<>(tok)
  }
| PRECOPTopr
  (topr, pmod) =>
  {
    val () = synread_i0dnt<>(topr)
    val () = synread_precmod<>(pmod)
  }
)

(* ****** ****** *)

implement
{}(*tmp*)
synread_precmod
  (opt) =
(
case+ opt of
| PRECMODnone() => ()
| PRECMODsome
  (tbeg, sint, tend) =>
  {
    val () = synread_LPAREN<>(tbeg)
    val () = synread_signint<>(sint)
    val () = synread_RPAREN<>(tend)
  }
)

(* ****** ****** *)

implement
{}(*tmp*)
synread_signint
  (sint) =
(
case+ sint of
| SIGNINTint(int) =>
  {
    val () = synread_INT1<>(int)
  }
| SIGNINTopr(opr, int) =>
  {
    val () = auxopr(opr)
    val () = synread_INT1<>(int)
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

local

extern
fun{}
the_synerrlst_get(): synerrlst
extern
fun{}
the_synerrlst_set(synerrlst): void

implement
{}(*tmp*)
synerr_add(xerr) = let
//
val
xerrs = the_synerrlst_get()
//
in
  the_synerrlst_set(list_cons(xerr, xerrs))
end // end of [synerr_add]

in (* in-of-local *)

implement
synread_main(d0cs) = let
//
local
//
val
the_synerrlst =
ref<synerrlst>(list_nil)
//
in(*in-of-local*)
val () =
$tempenver(the_synerrlst)
implement
the_synerrlst_get<>() = the_synerrlst[]
implement
the_synerrlst_set<>(xs) = the_synerrlst[] := xs
end // end of [local]
//
val () =
synread_d0eclist<>(d0cs)
val
xerrs = the_synerrlst_get()
val
nxerr = list_length<synerr>(xerrs)
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
("synread_main: nxerr = ", nxerr)
//
val () =
if
(nxerr = 1)
then
prerrln!
("synread_main: there is one synerr!")
val () =
if
(nxerr > 1)
then
prerrln!
("synread_main: there are some synerrs!")
//
val () =
(
$raise(XATSOPT_SYNERR_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("synread_main: there are no synerrs!")
//
} (* end of [else] *)
//
end // end of [synread_main]

end // end of [local]

(* ****** ****** *)

(* end of [xats_synread_dynexp.dats] *)
