(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
#staload "./../SATS/location.sats"
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
implement
{}(*tmp*)
synerr_add(xerr) = ()
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_EQ
  (tok) =
(
case+
tok.node() of
| T_EQ() => ()
| _(*non-EQ*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_EQ, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_EQ: tok = ", tok)
  end // end of [let]
) (* end of [synread_EQ] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_BAR
  (tok) =
(
case+
tok.node() of
| T_BAR() => ()
| _(*non-BAR*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_BAR, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_BAR: tok = ", tok)
  end // end of [let]
) (* end of [synread_BAR] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_LPAREN
  (tok) =
(
case+
tok.node() of
| T_LPAREN() => ()
| _(*non-LPAREN*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_LPAREN, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LPAREN: tok = ", tok)
  end // end of [let]
) (* end of [synread_LPAREN] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_RPAREN
  (tok) =
(
case+
tok.node() of
| T_RPAREN() => ()
| _(*non-RPAREN*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_RPAREN, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_RPAREN: tok = ", tok)
  end // end of [let]
) (* end of [synread_RPAREN] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_LBRACE
  (tok) =
(
case+
tok.node() of
| T_LBRACE() => ()
| _(*non-LBRACE*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_LBRACE, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LBRACE: tok = ", tok)
  end // end of [let]
) (* end of [synread_LBRACE] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_RBRACE
  (tok) =
(
case+
tok.node() of
| T_RBRACE() => ()
| _(*non-RBRACE*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_RBRACE, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_RBRACE: tok = ", tok)
  end // end of [let]
) (* end of [synread_RBRACE] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_IDENT_qual
  (tok) =
(
case+
tok.node() of
| T_IDENT_qual _ => ()
| _(* non-IDENT_qual *) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_IDENT_qual(""), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_IDENT_qual: tok = ", tok)
  end // end of [let]
)

(* ****** ****** *)

implement
{}(*tmp*)
synread_t0int
  (int) =
(
case+
int.node() of
| T0INTsome _ => ()
| T0INTnone(tok) =>
  let
    val () =
    synerr_add(SYNERRt0int(int))
  in
    prerr(tok.loc());
    prerrln!(": synread_t0int: tok = ", tok)
  end // end of [let]
) (* end of [synread_t0int] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_s0tid
  (tid) =
(
case+
tid.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok) =>
  let
    val () =
    synerr_add(SYNERRs0tid(tid))
  in
    prerr(tok.loc());
    prerrln!(": synread_s0tid: tok = ", tok)
  end // end of [let]
) (* end of [synread_s0tid] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_s0eid
  (sid) =
(
case+
sid.node() of
| I0DNTsome _ => ()
| I0DNTnone(tok) =>
  let
    val () =
    synerr_add(SYNERRs0eid(sid))
  in
    prerr(tok.loc());
    prerrln!(": synread_s0eid: tok = ", tok)
  end // end of [let]
) (* end of [synread_s0eid] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
| S0Tid(tid) =>
  synread_s0tid<>(tid)
//
| S0Tint(int) =>
  synread_t0int<>(int)
//
| S0Tapps(s0ts) =>
  synread_sort0lst<>(s0ts)
//
| S0Tlist
  (tok1, s0ts, tok2) =>
  {
    val () = synread_LPAREN<>(tok1)
    val () = synread_RPAREN<>(tok2)
    val () = synread_sort0lst<>(s0ts)
  }
//
| S0Tqual(tok, s0t) =>
  synread_sort0(s0t) where
  {
    val () = synread_IDENT_qual<>(tok)
  }
| S0Tnone(tok) =>
  let
    val () =
    synerr_add(SYNERRsort0(s0t0))
  in
    prerrln!(loc0, ": [sort0] needed");
    prerrln!(tok.loc(), ": tokerr: ", tok);
  end // end of [S0Tnone]
//
end // end of [synread_sort0]

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_sort0opt
  (opt0) =
(
case+ opt0 of
| None() => () | Some(s0t) => synread_sort0<>(s0t)
)
//
implement
{}(*tmp*)
synread_sort0lst
  (s0ts) =
(
list_foreach<sort0>(s0ts)
) where
{
implement(env)
list_foreach$fwork<sort0><env>(s0t, env) = synread_sort0<>(s0t)
} (* end of [synread_sort0lst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_s0arg
  (s0a0) = let
//
val loc0 = s0a0.loc()
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
| S0ARGsome(sid, opt) =>
  {
    val () = synread_s0eid<>(sid)
    val () = synread_sort0opt<>(opt)
  }
| S0ARGnone(tok) =>
  (
    prerrln!(loc0, ": [s0arg] needed");
    prerrln!(tok.loc(), ": tokerr: ", tok);
  )
//
end // end of [synread_s0arg]

(* ****** ****** *)

implement
{}(*tmp*)
synread_s0marg
  (s0ma) = let
//
val loc0 = s0ma.loc()
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
| S0MARGsing(sid) =>
  synread_s0eid<>(sid)
| S0MARGlist(tbeg, s0as, tend) =>
  {
    val () = synread_LPAREN<>(tbeg)
    val () = synread_s0arglst<>(s0as)
    val () = synread_RPAREN<>(tend)
  }
| S0MARGnone(tok) =>
  (
    prerrln!(loc0, ": [s0marg] needed");
    prerrln!(tok.loc(), ": tokerr: ", tok);
  )
//
end // end of [synread_s0marg]

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_s0arglst
  (s0es) =
(
list_foreach<s0arg>(s0es)
) where
{
implement(env)
list_foreach$fwork<s0arg><env>(s0e, env) = synread_s0arg<>(s0e)
} (* end of [synread_s0arglst] *)
//
implement
{}(*tmp*)
synread_s0marglst
  (s0es) =
(
list_foreach<s0marg>(s0es)
) where
{
implement(env)
list_foreach$fwork<s0marg><env>(s0e, env) = synread_s0marg<>(s0e)
} (* end of [synread_s0marglst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
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
case-
s0e0.node() of
//
| S0Eid(sid) =>
  synread_s0eid<>(sid)
//
| S0Eop1(tok) => ()
| S0Eop2
  (tbeg, sid, tend) =>
  {
    val () = synread_LPAREN<>(tbeg)
    val () = synread_s0eid<>(sid)
    val () = synread_RPAREN<>(tend)
  }
//
| S0Eint(int) =>
  synread_t0int<>(int)
//
| S0Eapps(s0es) =>
  synread_s0explst<>(s0es)
//
| S0Eparen
  (tbeg, s0es, tend) =>
  {
    val () = synread_LPAREN<>(tbeg)
    val () = synread_s0explst<>(s0es)
    val () = synread_s0exp_RPAREN<>(tend)
  }
//
| S0Eanno(s0e1, s0t2) =>
  {
    val () = synread_s0exp<>(s0e1)
    val () = synread_sort0<>(s0t2)
  }
//
| S0Enone(tok) =>
  (
    prerrln!(loc0, ": [s0exp] needed");
    prerrln!(tok.loc(), ": tokerr: ", tok);
  )
//
end // end of [synread_s0exp]

(* ****** ****** *)
//
implement
{}(*tmp*)
synread_s0expopt
  (opt0) =
(
case+ opt0 of
| None() => () | Some(s0t) => synread_s0exp<>(s0t)
)
//
implement
{}(*tmp*)
synread_s0explst
  (s0es) =
(
list_foreach<s0exp>(s0es)
) where
{
implement(env)
list_foreach$fwork<s0exp><env>(s0e, env) = synread_s0exp<>(s0e)
} (* end of [synread_s0explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
synread_s0exp_RPAREN
  (tend) =
(
case+ tend of
| s0exp_RPAREN_cons0
    (tok) => synread_RPAREN(tok)
  // s0exp_RPAREN_cons0
| s0exp_RPAREN_cons1
    (tok1, s0es, tok2) =>
  {
    val () = synread_LPAREN<>(tok1)
    val () = synread_s0explst<>(s0es)
    val () = synread_RPAREN<>(tok2)
  }
)

(* ****** ****** *)

implement
{}(*tmp*)
synread_s0rtdef
  (def) =
(
case+
def.node() of
| S0RTDEFsort(s0t) =>
  synread_sort0(s0t)
| S0RTDEFsubset
  (tbeg, s0a0, tbar, s0es, tend) =>
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
    | S0ARGsome(sid, opt) =>
      (
      case+ opt of
      | Some _ => ()
      | None _ =>
        let
          val loc = s0a0.loc()
        in
          prerrln!(loc, ": [s0arg]: sort needed");   
        end // end of [None]
      )
    ) (* end of [val] *)
//
  } (* end of [S0RTDEFsubset] *)
)

(* ****** ****** *)

(* end of [xats_synread_staexp.dats] *)
