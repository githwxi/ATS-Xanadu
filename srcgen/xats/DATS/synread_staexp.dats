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
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/synread.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) = "./../DATS/synread_basics.dats"
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_g0eid
  (geid) =
(
case+
geid.node() of
|
I0DNTsome _ => ()
|
I0DNTnone(tok0) =>
let
val () =
synerr_add(SYNERRg0eid(geid))
in
  prerr(tok0.loc());
  prerrln!(": SYNERR(g0eid): ", tok0);
end // end of [let]
) (* end of [synread_g0eid] *)
(* ****** ****** *)
implement
synread_g0arg
  (g0a0) =
(
  synread_g0eid(g0a0)
) (* end of [synread_g0arg] *)
(* ****** ****** *)

implement
synread_g0exp
  (g0e0) =
(
case+
g0e0.node() of
//
|
G0Eid0(gid) =>
{
  val () =
  synread_g0eid(gid)
}
//
|
G0Eint(tint) =>
{
  val () =
  synread_t0int(tint)
}
|
G0Estr(tstr) =>
{
  val () =
  synread_t0str(tstr)
}
//
|
G0Eapps(g0es) =>
{
  val () =
  synread_g0explst(g0es)
}
|
G0Elist
(tbeg, g0es, tend) =>
{
  val () =
  synread_RPAREN(tend)
  val () =
  synread_g0explst(g0es)
}
//
|
G0Enone(tok0) =>
let
val () =
synerr_add(SYNERRg0exp(g0e0))
in
  prerr(tok0.loc());
  prerrln!(": SYNERR(g0exp): ", tok0);
end // end of [let]
//
) (* end of [synread_g0exp] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_g0explst
  (g0as) =
(
list_foreach<g0exp>(g0as)
) where
{
implement
(env)//tmp
list_foreach$fwork<g0exp><env>(g0a, env) = synread_g0exp(g0a)
} (* end of [synread_g0explst] *)
//
(* ****** ****** *)

implement
synread_g0marg
  (g0ma) =
(
case+
g0ma.node() of
|
G0MARGsarg
(tbeg, g0as, tend) =>
{
(*
  val () =
  synread_LBRACE(tbeg)
*)
  val () =
  synread_RBRACE(tend)
  val () =
  synread_g0arglst(g0as)
}
|
G0MARGdarg
(tbeg, g0as, tend) =>
{
(*
  val () =
  synread_LPAREN(tbeg)
*)
  val () =
  synread_RPAREN(tend)
  val () =
  synread_g0arglst(g0as)
}
|
G0MARGnone(tok0) =>
let
val () =
synerr_add(SYNERRg0marg(g0ma))
in
  prerr(tok0.loc());
  prerrln!(": SYNERR(g0marg): ", tok0);
end
)
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_g0arglst
  (g0as) =
(
list_foreach<g0arg>(g0as)
) where
{
implement
(env)//tmp
list_foreach$fwork<g0arg><env>(g0a, env) = synread_g0arg(g0a)
} (* end of [synread_g0arglst] *)
//
implement
//{}(*tmp*)
synread_g0marglst
  (gmas) =
(
list_foreach<g0marg>(gmas)
) where
{
implement
(env)//tmp
list_foreach$fwork<g0marg><env>(g0ma, env) = synread_g0marg(g0ma)
} (* end of [synread_g0marglst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_t0int
  (int) =
(
case+
int.node() of
|
T0INTsome _ => ()
|
T0INTnone(tok0) =>
let
  val () =
  synerr_add(SYNERRt0int(int))
in
  prerr(tok0.loc());
  prerrln!(": SYNERR(t0int): ", tok0);
end // end of [let]
)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_t0chr
  (chr) =
(
case+
chr.node() of
| T0CHRsome(tok0) =>
  (
    synread_CHAR(tok0)
  )
| T0CHRnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRt0chr(chr))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(t0chr): ", tok0);
  end // end of [let]
)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_t0flt
  (flt) =
(
case+
flt.node() of
| T0FLTsome _ => ()
| T0FLTnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRt0flt(flt))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(t0flt): ", tok0);
  end // end of [let]
)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_t0str
  (str) =
(
case+
str.node() of
| T0STRsome _ => ()
| T0STRnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRt0str(str))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(t0str): ", tok0);
  end // end of [let]
)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_i0dnt
  (id0) =
(
case+
id0.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRi0dnt(id0))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(i0dnt): ", tok0);
  end // end of [let]
) (* end of [synread_i0dnt] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_qname
  (tok0) =
(
case+
tok0.node() of
| T_IDENT_qual _ => ()
| _ (*non-qual*) =>
  let
    val () =
    synerr_add(SYNERRqname(tok0))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(qname): ", tok0);
  end // end of [let]
) (* end of [synread_qname] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_l0abl
  (lab) =
(
case+
lab.node() of
| L0ABLsome _ => ()
| L0ABLnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRl0abl(lab))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(l0abl): ", tok0);
  end // end of [let]
) (* end of [synread_l0abl] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_s0ymb
  (sym) =
(
case+
sym.node() of
| S0YMBi0dnt(id0) =>
  {
    val () =
    synread_i0dnt(id0)
  }
(*
| S0YMBdtlab(tdot, l0ab) =>
  {
    val () =
    synread_DOT(tdot)
    val () =
    synread_l0abl(l0ab)
  }
*)
| S0YMBbrack(tbeg, tend) =>
  {
    val () =
    synread_LBRACK(tbeg)
    val () =
    synread_RBRACK(tend)
  }
) (* end of [synread_s0ymb] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_s0tid
  (id0) =
(
case+
id0.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRs0tid(id0))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(s0tid): ", tok0);
  end // end of [let]
) (* end of [synread_s0tid] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_s0eid
  (id0) =
(
case+
id0.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRs0eid(id0))
  in
    prerr(tok0.loc());
    prerrln!(": SYNERR(s0eid): ", tok0);
  end // end of [let]
) (* end of [synread_s0eid] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_sq0eid
  (qid) =
(
case+ qid of
| SQ0EIDnone(sid0) =>
  {
    val () = synread_s0eid(sid0)
  }
| SQ0EIDsome(tok0, sid0) =>
  {
    val () = synread_qname(tok0)
    val () = synread_s0eid(sid0)
  }
) (* end of [synread_sq0eid] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_i0dntlst
  (i0ds) =
(
list_foreach<i0dnt>(i0ds)
) where
{
implement(env)
list_foreach$fwork<i0dnt><env>(id0, env) = synread_i0dnt(id0)
} (* end of [synread_i0dntlst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_sort0
  (s0t0) = let
//
val loc0 = s0t0.loc()
//
(*
val () =
println!
("synread_sort0: s0t0 = ", s0t0)
*)
//
in
//
case+
s0t0.node() of
| S0Tid0(id0) =>
  synread_s0tid(id0)
//
| S0Tint(int) =>
  synread_t0int(int)
//
| S0Tapps(s0ts) =>
  synread_sort0lst(s0ts)
//
| S0Tlist
  (tok1, s0ts, tok2) =>
  {
    val () = synread_LPAREN(tok1)
    val () = synread_RPAREN(tok2)
    val () = synread_sort0lst(s0ts)
  }
//
| S0Tqual(tok0, s0t1) =>
  synread_sort0(s0t1) where
  {
    val () = synread_IDENT_qual(tok0)
  }
| S0Tnone(tok0) =>
  let
    val () =
    synerr_add(SYNERRsort0(s0t0))
  in
    prerrln!(loc0, ": SYNERR(sort0): ", tok0)
  end // end of [S0Tnone]
//
end // end of [synread_sort0]

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_sort0opt
  (opt0) =
(
case+ opt0 of
| None() => ()
| Some(s0t) => synread_sort0(s0t)
)
//
implement
//{}(*tmp*)
synread_sort0lst
  (s0ts) =
(
list_foreach<sort0>(s0ts)
) where
{
implement(env)
list_foreach$fwork<sort0><env>(s0t, env) = synread_sort0(s0t)
} (* end of [synread_sort0lst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_s0arg
  (s0a0) = let
//
(*
val () =
println!
("synread_s0arg: s0a0 = ", s0a0)
*)
//
in
//
case+
s0a0.node() of
| S0ARGsome
  (id0, opt) =>
  {
    val () = synread_s0eid(id0)
    val () = synread_sort0opt(opt)
  }
| S0ARGnone(tok0) =>
  let
    val
    loc0 = s0a0.loc()
    val () =
    synerr_add(SYNERRs0arg(s0a0))
  in
    prerrln!(loc0, ": SYNERR(s0arg): ", tok0);
  end // end of [S0ARGnone]
//
end // end of [synread_s0arg]

(* ****** ****** *)

implement
//{}(*tmp*)
synread_s0marg
  (s0ma) = let
//
(*
val () =
println!
("synread_s0marg: s0ma = ", s0ma)
*)
//
in
//
case+
s0ma.node() of
| S0MARGsing(id0) =>
  synread_s0eid(id0)
| S0MARGlist
  (tbeg, s0as, tend) =>
  {
    val () = synread_LPAREN(tbeg)
    val () = synread_RPAREN(tend)
    val () = synread_s0arglst(s0as)
  }
| S0MARGnone(tok0) =>
  let
    val
    loc0 = s0ma.loc()
    val () =
    synerr_add(SYNERRs0marg(s0ma))
  in
    prerrln!(loc0, ": SYNERR(s0marg): ", tok0);
  end // end of [S0MARGnone]
//
end // end of [synread_s0marg]

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_s0arglst
  (s0as) =
(
list_foreach<s0arg>(s0as)
) where
{
implement(env)
list_foreach$fwork<s0arg><env>(s0a, env) = synread_s0arg(s0a)
} (* end of [synread_s0arglst] *)
//
implement
//{}(*tmp*)
synread_s0marglst
  (smas) =
(
list_foreach<s0marg>(smas)
) where
{
implement(env)
list_foreach$fwork<s0marg><env>(sma, env) = synread_s0marg(sma)
} (* end of [synread_s0marglst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_t0arg
  (t0a0) = let
//
(*
val () =
println!
("synread_t0arg: t0a0 = ", t0a0)
*)
//
in
//
case+
t0a0.node() of
| T0ARGsome
  (s0t, opt) =>
  {
    val () = synread_sort0(s0t)
(*
    val () = synread_tokenopt(opt)
*)
  }
| T0ARGnone(tok0) =>
  let
    val
    loc0 = t0a0.loc()
    val () =
    synerr_add(SYNERRt0arg(t0a0))
  in
    prerrln!(loc0, ": SYNERR(t0arg): ", tok0);
  end // end of [T0ARGnone]
//
end // end of [synread_t0arg]

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_t0marg
  (t0ma) = let
//
(*
val () =
println!
("synread_t0marg: t0ma = ", t0ma)
*)
//
in
//
case+
t0ma.node() of
| T0MARGlist
  (tbeg, t0as, tend) =>
  {
    val () = synread_LPAREN(tbeg)
    val () = synread_RPAREN(tend)
    val () = synread_t0arglst(t0as)
  }
| T0MARGnone(tok0) =>
  let
    val
    loc0 = t0ma.loc()
    val () =
    synerr_add(SYNERRt0marg(t0ma))
  in
    prerrln!(loc0, ": SYNERR(t0marg): ", tok0);
  end // end of [T0MARGnone]
//
end // end of [synread_t0marg]
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_t0arglst
  (t0as) =
(
list_foreach<t0arg>(t0as)
) where
{
implement(env)
list_foreach$fwork<t0arg><env>(t0a, env) = synread_t0arg(t0a)
} (* end of [synread_t0arglst] *)
//
implement
//{}(*tmp*)
synread_t0marglst
  (tmas) =
(
list_foreach<t0marg>(tmas)
) where
{
implement(env)
list_foreach$fwork<t0marg><env>(tma, env) = synread_t0marg(tma)
} (* end of [synread_t0marglst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_s0qua
  (s0q0) =
(
case+
s0q0.node() of
| S0QUAprop(s0e) =>
  synread_s0exp(s0e)
| S0QUAvars(ids, opt) =>
  {
    val () = synread_i0dntlst(ids)
    val () = synread_sort0opt(opt)
  }
)
//
implement
//{}(*tmp*)
synread_s0qualst
  (s0qs) =
(
list_foreach<s0qua>(s0qs)
) where
{
implement(env)
list_foreach$fwork<s0qua><env>(s0q, env) = synread_s0qua(s0q)
} (* end of [synread_s0qualst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_s0uni
  (s0u0) =
(
case+
s0u0.node() of
| S0UNIsome
  ( tbeg
  , s0qs, tend) =>
  {
(*
    val () =
    synread_LBRACE(tbeg)
*)
    val () =
    synread_s0qualst(s0qs)
    val () = synread_RBRACE(tend)
  }
| S0UNInone(tok0) =>
  let
    val
    loc0 = s0u0.loc()
    val () =
    synerr_add(SYNERRs0uni(s0u0))
  in
    prerrln!(loc0, ": SYNERR(s0uni): ", tok0);
  end // end of [S0UNInone]
)
//
implement
//{}(*tmp*)
synread_s0unilst
  (s0us) =
(
list_foreach<s0uni>(s0us)
) where
{
implement(env)
list_foreach$fwork<s0uni><env>(s0u, env) = synread_s0uni(s0u)
} (* end of [synread_s0unilst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_s0exp
  (s0e0) = let
//
val loc0 = s0e0.loc()
//
(*
val () =
println!
("synread_s0exp: s0e0 = ", s0e0)
*)
//
in
//
case+
s0e0.node() of
//
| S0Eid0(sid) =>
  synread_s0eid(sid)
//
| S0Eop1(tok0) => ()
| S0Eop2
  (tbeg, sid0, tend) =>
  {
(*
    val () = synread_OP_par(tbeg)
*)
    val () = synread_s0eid(sid0)
    val () = synread_RPAREN(tend)
  }
//
| S0Eint(int) =>
  synread_t0int(int)
| S0Echr(chr) =>
  synread_t0chr(chr)
| S0Eflt(flt) =>
  synread_t0flt(flt)
| S0Estr(str) =>
  synread_t0str(str)
//
| S0Eapps(s0es) =>
  synread_s0explst(s0es)
//
| S0Eimp
  (tbeg, s0es, tend) =>
  {
    val () =
      synread_MSLT(tbeg)
    // end of [val]
    val () =
      synread_s0explst(s0es)
    // end of [val]
    val () = synread_GT(tend)
  }
//
| S0Eparen
  (tbeg, s0es, tend) =>
  {
    val () = synread_LPAREN(tbeg)
    val () = synread_s0explst(s0es)
    val () = synread_s0exp_RPAREN(tend)
  }
//
|
S0Etuple
(tbeg, topt, s0es, tend) =>
{
  val () = synread_TUPLE(tbeg)
(*
  val () =
  (
  case+ topt of
  | None() => ()
  | Some(tok0) => synread_LPAREN(tok0)
  )
*)
  val () = synread_s0explst(s0es)
  val () = synread_s0exp_RPAREN(tend)
}
|
S0Erecord
(tbeg, topt, ls0es, tend) =>
{
  val () = synread_RECORD(tbeg)
(*
  val () =
  (
  case+ topt of
  | None() => ()
  | Some(tok0) => synread_LBRACE(tok0)
  )
*)
  val () = synread_labs0explst(ls0es)
  val () = synread_labs0exp_RBRACE(tend)
}
//
| S0Eforall
  (tbeg, s0qs, tend) =>
  {
    val () = synread_LBRACE(tbeg)
    val () = synread_RBRACE(tend)
    val () = synread_s0qualst(s0qs)
  }
| S0Eexists
  (tbeg, s0qs, tend) =>
  {
    val () = synread_EXISTS(tbeg)
    val () = synread_RBRACK(tend)
    val () = synread_s0qualst(s0qs)
  }
//
| S0Elam
  ( tbeg
  , arg0, res1
  , arrw, body, tend) =>
  {
//
    val () =
      synread_LAM(tbeg)
//
    val () =
      synread_s0marglst(arg0)
//
    val () = synread_EQGT(arrw)
    val () = synread_s0exp(body)
    val () = synread_sort0opt(res1)
    val () = synread_ENDLAM_opt(tend)
  }
//
| S0Eanno(s0e1, s0t2) =>
  {
    val () = synread_s0exp(s0e1)
    val () = synread_sort0(s0t2)
  }
//
| S0Equal(tok0, s0e1) =>
  synread_s0exp(s0e1) where
  {
    val () = synread_IDENT_qual(tok0)
  }
//
| S0Enone(tok0) =>
  let
    val () =
    synerr_add(SYNERRs0exp(s0e0))
  in
    prerrln!(loc0, ": SYNERR(s0exp): ", tok0);
  end // end of [S0Enone]
//
end // end of [synread_s0exp]

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_s0expopt
  (opt0) =
(
case+ opt0 of
| None() => ()
| Some(s0t) => synread_s0exp(s0t)
)
//
implement
//{}(*tmp*)
synread_s0explst
  (s0es) =
(
list_foreach<s0exp>(s0es)
) where
{
implement(env)
list_foreach$fwork<s0exp><env>(s0e, env) = synread_s0exp(s0e)
} (* end of [synread_s0explst] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_labs0exp
  (ls0e) =
(
case+ ls0e of
| SL0ABLED(l0, teq, s0e) =>
  {
    val () = synread_EQ(teq)
    val () = synread_s0exp(s0e)
  }
)
//
implement
//{}(*tmp*)
synread_labs0explst
  (ls0es) =
(
list_foreach<labs0exp>(ls0es)
) where
{
implement(env)
list_foreach$fwork<labs0exp><env>(ls0e, env) = synread_labs0exp(ls0e)
} (* end of [synread_labs0explst] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_s0exp_RPAREN
  (tend) =
(
case+ tend of
| s0exp_RPAREN_cons0
    (tok0) => synread_RPAREN(tok0)
  // s0exp_RPAREN_cons0
| s0exp_RPAREN_cons1
    (tok1, s0es, tok2) =>
  {
    val () = synread_BAR(tok1)
    val () = synread_RPAREN(tok2)
    val () = synread_s0explst(s0es)
  }
)

implement
//{}(*tmp*)
synread_labs0exp_RBRACE
  (tend) =
(
case+ tend of
| labs0exp_RBRACE_cons0
    (tok0) => synread_RBRACE(tok0)
  // s0exp_RPAREN_cons0
| labs0exp_RBRACE_cons1
    (tok1, ls0es, tok2) =>
  {
    val () = synread_BAR(tok1)
    val () = synread_RBRACE(tok2)
    val () = synread_labs0explst(ls0es)
  }
)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_effs0expopt
  (opt0) =
(
case+ opt0 of
| EFFS0EXPnone() => ()
| EFFS0EXPsome(s0e) => synread_s0exp(s0e)
)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_s0rtdef
  (def0) =
(
case+
def0.node() of
| S0RTDEFsort(s0t) =>
  {
    val () = synread_sort0(s0t)
  }
| S0RTDEFsbst
  ( tbeg, s0a0
  , tbar, s0es, tend) =>
  {
    val () = synread_LBRACE(tbeg)
    val () = synread_s0arg(s0a0)
    val () = synread_BAR(tbar)
    val () = synread_s0explst(s0es)
    val () = synread_RBRACE(tend)
//
    val () =
    (
    case+
    s0a0.node() of
    | S0ARGnone _ => ()
    | S0ARGsome(id0, opt) =>
      (
      case+ opt of
      | None _ =>
        let
          val
          loc = s0a0.loc()
        in
          prerrln!(loc, ": [s0rtdef]: [s0arg]: sort needed")
        end // end of [None]
      | Some _ => ((*void*))
      )
    ) (* end of [val] *)
//
  } (* end of [S0RTDEFsbst] *)
)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_d0atcon
  (d0c0) =
(
case+
d0c0.node() of
|
D0ATCON
( s0us
, name, s0es, args) =>
{
val () = synread_d0eid(name) // dyncon
val () = synread_s0unilst(s0us) // quanty
val () = synread_s0explst(s0es) // indexes
val () = synread_s0expopt(args) // arguments
}
)
//
implement
//{}(*tmp*)
synread_d0atconlst
  (d0cs) =
(
list_foreach<d0atcon>(d0cs)
) where
{
implement(env)
list_foreach$fwork<d0atcon><env>(d0c, env) = synread_d0atcon(d0c)
} (* end of [synread_d0atconlst] *)
//
(* ****** ****** *)

(* end of [xats_synread_staexp.dats] *)
