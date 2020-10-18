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
// Start Time: June, 2018
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

#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/parsing.sats"

(* ****** ****** *)

implement
fprint_val<sort0> = fprint_sort0
implement
fprint_val<s0exp> = fprint_s0exp
implement
fprint_val<d0exp> = fprint_d0exp

(* ****** ****** *)

implement
fprint_val<f0arg> = fprint_f0arg

(* ****** ****** *)
//
extern
fun
p_idint: parser(token)
extern
fun
p_idintseq: parser(tokenlst)
//
implement
p_idint
  (buf, err) = let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
//
| T_INT1 _ =>
  (buf.incby1(); tok)
//
| T_IDENT_alp _ =>
  (buf.incby1(); tok)
| T_IDENT_sym _ =>
  (buf.incby1(); tok)
//
| T_LT() => tok where
  {
    val () = buf.incby1()
    val loc = tok.loc((*void*))
    val tnd = T_IDENT_LT(*void*)
    val tok = token_make_node(loc, tnd)
  }
| T_GT() => tok where
  {
    val () = buf.incby1()
    val loc = tok.loc((*void*))
    val tnd = T_IDENT_GT(*void*)
    val tok = token_make_node(loc, tnd)
  }
//
| T_EQGT() => tok where
  {
    val () = buf.incby1()
    val loc = tok.loc((*void*))
    val tnd = T_IDENT_EQGT(*void*)
    val tok = token_make_node(loc, tnd)
  }
//
| _ (* non-IDENT *) =>
  (err := err + 1; tok)
//
end // end of [p_idint]
implement
p_idintseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{token}(buf, err, p_idint))
//
) (* end of [p_idintseq] *)
//
(* ****** ****** *)

implement
t_d0pid(tnd) =
(
case+ tnd of
//
| T_IDENT_alp _ => true
| T_IDENT_sym _ => true
//
| T_AT((*void*)) => true // "@"
//
| T_BSLASH((*void*)) => true
//
| _ (* non-identifier *) => false
)

implement
p_d0pid(buf, err) =
let
//
val tok = buf.get0()
//
in
  case+
  tok.node() of
//
  | T_IDENT_alp _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
  | T_IDENT_sym _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | T_AT((*void*)) =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_AT(*void*)
      val tok = token_make_node(loc, tnd)
    }
//
  | T_BSLASH((*void*)) =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | _ (* non-identifier *) =>
    (err := err + 1; i0dnt_none(tok))
end // end of [p_d0pid]

(* ****** ****** *)

implement
t_d0eid(tnd) =
(
case+ tnd of
//
| T_IDENT_alp _ => true
| T_IDENT_sym _ => true
//
| T_IDENT_dlr _ => true
(*
| T_IDENT_srp _ => true
*)
//
| T_AT((*void*)) => true // "@"
| T_EQ((*void*)) => true // "="
//
(*
| T_LT((*void*)) => true // "<"
| T_GT((*void*)) => true // ">"
*)
//
| T_EQGT((*void*)) => true // "=>"
//
| T_BSLASH((*void*)) => true
//
| _ (* non-identifier *) => false
//
) (* end of [t_d0eid] *)

implement
p_d0eid(buf, err) =
let
//
val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_IDENT_alp _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
  | T_IDENT_sym _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | T_IDENT_dlr _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
(*
  | T_IDENT_srp _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
*)
//
  | T_AT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_AT(*void*)
      val tok = token_make_node(loc, tnd)
    }
//
  | T_EQ() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_EQ(*void*)
      val tok = token_make_node(loc, tnd)
    }
//
(*
  | T_LT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_LT(*void*)
      val tok = token_make_node(loc, tnd)
    }
  | T_GT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_GT(*void*)
      val tok = token_make_node(loc, tnd)
    }
*)
//
  | T_EQGT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_EQGT(*void*)
      val tok = token_make_node(loc, tnd)
    }
//
  | T_BSLASH((*void*)) =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | _ (* non-identifier *) =>
    (err := err + 1; i0dnt_none(tok))
end // end of [p_d0eid]

(* ****** ****** *)
//
implement
p_dq0eid
  (buf, err) = let
//
  val e0 = err
  val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_IDENT_qual _ => let
    val () = buf.incby1()
  in
    err := e0;
    DQ0EIDsome
      (tok, p_d0eid(buf, err))
    // DQ0EIDsome
  end // end of [T_IDENT_qual]
//
| _(*non-IDENT_qual*) =>
    DQ0EIDnone(p_d0eid(buf, err))
//
end // end of [p_dq0eid]
//
(* ****** ****** *)

implement
p_i0dnt(buf, err) =
let
//
  val e0 = err
  val tok = buf.get0()
//
in
//
case+
tok.node() of
//
| tnd
  when
  t_s0eid(tnd) =>
    p_s0eid(buf, err)
//
| tnd
  when
  t_d0eid(tnd) =>
    p_d0eid(buf, err)
//
| _ (* non-i0dnt *) =>
    (err := e0 + 1; i0dnt_none(tok))
//
end // end of [p_i0dnt]

(* ****** ****** *)
//
extern
fun
p_i0dntseq: parser(i0dntlst)
extern
fun
p_i0dntseq_COMMA: parser(i0dntlst)
//
implement
p_i0dntseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{i0dnt}(buf, err, p_i0dnt))
//
) (* end of [p_i0dntseq] *)
implement
p_i0dntseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{i0dnt}(buf, err, p_i0dnt))
//
) (* end of [p_i0dntseq_COMMA] *)
//
(* ****** ****** *)
//
extern
fun
p_q0arg: parser(q0arg)
extern
fun
p_q0argseq_COMMA: parser(q0arglst)
//
(* ****** ****** *)
//
implement
p_q0arg
(buf, err) = let
//
val e0 = err
//
val sid =
  p_s0aid(buf, err)
//
val tok = buf.get0()
//
val opt =
(
case+
tok.node() of
| T_CLN() =>
  Some
  (
   p_appsort0_NGT(buf, err)
  ) where
  {
    val () = buf.incby1()
  }
| _(* non-COLON *) => None()
) : sort0opt // end of [val]
//
val loc0 = let
  val loc = sid.loc()
in
  case+ opt of
  | None() => loc
  | Some(s0t) => loc+s0t.loc()
end : loc_t // end of [val]
//
in
  err := e0;
  q0arg_make_node(loc0, Q0ARGsome(sid, opt))
end (* end of [p_q0arg] *)

(* ****** ****** *)
//
implement
p_q0argseq_COMMA
  (buf, err) =
(
  list_vt2t
  (pstar_COMMA_fun{q0arg}(buf, err, p_q0arg))
) (* end of [p_q0argseq_COMMA] *)
//
(* ****** ****** *)
//
extern
fun
p_sq0arg: parser(sq0arg)
extern
fun
p_sq0argseq: parser(sq0arglst)
//
implement
p_sq0arg
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
(*
val () =
println! ("p_sq0arg: tok = ", tok)
*)
//
in
case+
tok.node() of
| T_LBRACE() => let
    val () = buf.incby1()
    val q0as =
      p_q0argseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_RBRACE(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    sq0arg_make_node
    (loc_res, SQ0ARGsome(tbeg, q0as, tend))
  end // end of [T_LBRACE]
| _(* non-LBRACE *) =>
  ( err := e0 + 1;
    sq0arg_make_node(tok.loc(), SQ0ARGnone(tok))
  ) (* end of [non-LBRACE] *)
//
end // end of [p_sq0arg]
//
implement
p_sq0argseq
  (buf, err) =
(
  list_vt2t
  (pstar_fun{sq0arg}(buf, err, p_sq0arg))
) (* end of [p_sq0argseq] *)
//
(* ****** ****** *)
//
extern
fun
p_tq0arg: parser(tq0arg)
extern
fun
p_tq0argseq: parser(tq0arglst)
//
implement
p_tq0arg
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
(*
val () =
println! ("p_tq0arg: tok = ", tok)
*)
//
in
//
case+
tok.node() of
| T_LT() => let
    val () =
    buf.incby1()
    val tbeg = tok
    val q0as =
      p_q0argseq_COMMA(buf, err)
    // end of [val]
    val tend = p_GT(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    tq0arg_make_node
    (loc_res, TQ0ARGsome(tbeg, q0as, tend))
  end
| T_LTGT() => let
    val () =
    buf.incby1()
    val tbeg = tok
    val tend = tok
    val q0as = list_nil()
    val loc_res = tok.loc()
  in
    tq0arg_make_node
    (loc_res, TQ0ARGsome(tbeg, q0as, tend))
  end
| _(* non-LT/GT *) =>
  ( err := e0 + 1;
    tq0arg_make_node(tok.loc(), TQ0ARGnone(tok))
  ) (* end of [non-LT/GT] *)
//
end // end of [p_tq0arg]
//
implement
p_tq0argseq
  (buf, err) =
(
  list_vt2t
  (pstar_fun{tq0arg}(buf, err, p_tq0arg))
) (* end of [p_tq0argseq] *)
//
(* ****** ****** *)
//
extern
fun
p_ti0arg: parser(ti0arg)
extern
fun
p_ti0argseq: parser(ti0arglst)
//
implement
p_ti0arg
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
(*
val () =
println! ("p_ti0arg: tok = ", tok)
*)
//
in
//
case+
tok.node() of
//
| T_LT() => let
    val () =
    buf.incby1()
//
    val tbeg = tok
//
    val s0es =
    list_vt2t
    (
      pstar_COMMA_fun
      {s0exp}(buf, err, p_apps0exp_NGT)
    )
//
    val tend = p_GT(buf, err)
//
    val loc_res = tbeg.loc() + tend.loc()
//
  in
    err := e0;
    ti0arg_make_node
    (loc_res, TI0ARGsome(tbeg, s0es, tend))
  end // end of [T_LT]
| T_LTGT() => let
//
    val () =
    buf.incby1()
//
    val tbeg = tok
    val tend = tok
//
    val s0es = list_nil()
    val loc_res = tok.loc()
//
  in
    err := e0;
    ti0arg_make_node
    (loc_res, TI0ARGsome(tbeg, s0es, tend))
  end
| _(* non-LT/GT *) =>
  ( err := e0 + 1;
    ti0arg_make_node(tok.loc(), TI0ARGnone(tok))
  ) (* end of [non-LT/GT] *)
//
end // end of [p_ti0arg]
//
implement
p_ti0argseq
  (buf, err) =
(
  list_vt2t
  (pstar_fun{ti0arg}(buf, err, p_ti0arg))
) (* end of [p_ti0argseq] *)
//
(* ****** ****** *)
(*
//
a0typ ::=
  | token
  | d0pid COLON s0exp
//
*)
extern
fun
p_a0typ: parser(a0typ)
extern
fun
p_a0typseq_COMMA: parser(a0typlst)
extern
fun
p_a0typseqopt_COMMA: parser(a0typlstopt)
//
(* ****** ****** *)
//
implement
p_a0typ
  (buf, err) = let
//
val e0 = err
//
val mark =
  buf.get_mark()
//
val tok0 = buf.get1()
val tok1 = buf.get0()
//
val tnd0 = tok0.node()
//
in
//
case+
tok1.node() of
| T_CLN()
  when 
  t_d0eid(tnd0) => let
    val () =
    buf.clear_mark(mark)
    val () = buf.incby1()
    val s0e = p_s0exp(buf, err)
    val loc_res = tok0.loc() + s0e.loc()
  in
    err := e0;
    a0typ_make_node
    (loc_res, A0TYPsome(s0e, Some(tok0)))
  end // end of [T_CLN]
| _(*non-T_CLN*) => let
    val () =
      buf.set_mark(mark)
    // end of [val]
    val s0e = p_s0exp(buf, err)
  in
    a0typ_make_node
    (s0e.loc(), A0TYPsome(s0e, None(*void*)))
  end // end of [non-T_CLN]
//
end // end of [p_a0typ]

(* ****** ****** *)
//
implement
p_a0typseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun
 {a0typ}(buf, err, p_a0typ))
//
)
implement
p_a0typseqopt_COMMA
  (buf, err) = let
//
val tok = buf.get0()
//
in (* in-of-let *)
//
case+
tok.node() of
| T_BAR() => let
    val () = buf.incby1()
  in
    Some(p_a0typseq_COMMA(buf, err))
  end // end of [T_BAR]
| _(* non-BAR *) => None(*void*)
//
end // end of [p_a0typseqopt]
//
(* ****** ****** *)

implement
p_d0arg
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
//
| T_LPAREN() => let
    val () = buf.incby1()
    val arg0 =
      p_a0typseq_COMMA(buf, err)
    val opt1 =
      p_a0typseqopt_COMMA(buf, err)
    val tbeg = tok
    val tend = p_RPAREN(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := 0;
    d0arg_make_node
    ( loc_res
    , D0ARGsome_dyn2(tbeg, arg0, opt1, tend))
  end
//
| T_LBRACE() => let
    val () = buf.incby1()
    val s0qs =
      p_s0quaseq_BARSMCLN(buf, err)
    val tbeg = tok
    val tend = p_RBRACE(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    d0arg_make_node
    (loc_res, D0ARGsome_sta(tbeg, s0qs, tend))
  end // end of [T_LBRACE]
//
| _ when
    t_s0eid(tnd) => let
    val sid =
      p_s0eid(buf, err)
    // end of [val]
    val loc = sid.loc()
  in
    err := e0;
    d0arg_make_node(loc, D0ARGsome_dyn1(sid))
  end
//
| _ (* error *) =>
  (
    err := e0 + 1;
    d0arg_make_node(tok.loc(), D0ARGnone(tok))
  )
//
end // end of [p_d0arg]

(* ****** ****** *)

extern
fun
p_d0argseq: parser(d0arglst)
implement
p_d0argseq
  (buf, err) =
(
  list_vt2t
  (pstar_fun{d0arg}(buf, err, p_d0arg))
) (* end of [p_d0argseq] *)

(* ****** ****** *)
(*
atmd0pat::
//
  | d0pid
//
  | t0int // int
  | t0chr // char
  | t0flt // float
  | t0str // string
//
*)
//
extern
fun
p_atmd0pat: parser(d0pat)
extern
fun
p_atmd0patseq: parser(d0patlst)
//
(* ****** ****** *)
//
extern
fun
p_d0patseq_COMMA: parser(d0patlst)
extern
fun
p_labd0patseq_COMMA: parser(labd0patlst)
//
(* ****** ****** *)
//
(*
d0pat_RPAREN ::=
  | RPAREN
  | BAR d0patseq_COMMA RPAREN
labd0pat_RBRACE ::=
  | RPAREN
  | BAR labd0patseq_COMMA RBRACE
*)
extern
fun
p_d0pat_RPAREN: parser(d0pat_RPAREN)
extern
fun
p_labd0pat_RBRACE: parser(labd0pat_RBRACE)
//
(* ****** ****** *)

local

static
fun
p_napps: parser(d0pat)
implement
p_napps(buf, err) = let
//
  val e0 = err
  val tok = buf.get0()
  val tnd = tok.node()
//
in
//
case+ tnd of
| _ (* error *) =>
  ( err := e0 + 1;
    d0pat_make_node(tok.loc(), D0Pnone(tok))
  ) (* end-of-error *)
//
end // end of [p_napps]

in (* in-of-local *)

implement
p_d0pat(buf, err) =
let
  val e0 = err
  val d0ps0 =
  p_atmd0patseq(buf, err)
in
//
case+ d0ps0 of
| list_nil
    ((*void*)) => p_napps(buf, err)
  // end of [list_nil]
| list_cons
    (d0p0, d0ps1) => let
    val opt =
    popt_s0exp_anno(buf, err)
  in
    case+ d0ps1 of
    | list_nil() =>
      d0pat_anno_opt(d0p0, opt)
    | list_cons _ => let
        val d0p1 = list_last(d0ps1)
        val loc01 = d0p0.loc()+d0p1.loc()
      in
        d0pat_anno_opt
        (d0pat_make_node(loc01, D0Papps(d0ps0)), opt)
      end // end of [list_cons]
  end (* end of [list_cons] *)
//
end // end of [let] // end of [p_d0pat]

end // end of [local]

(* ****** ****** *)

implement
p_labd0pat
  (buf, err) = let
//
val e0 = err
//
val l0 =
(
  p_l0abl(buf, err)
)
val tok = p_EQ(buf, err)
val d0p = p_d0pat(buf, err)
//
(*
val ((*void*)) =
println! ("p_labd0pat: l0 = ", l0)
val ((*void*)) =
println! ("p_labd0pat: tok = ", tok)
val ((*void*)) =
println! ("p_labd0pat: d0p = ", d0p)
*)
//
in
  err := e0; DL0ABELED(l0, tok, d0p)
end // end of [p_labd0pat]

(* ****** ****** *)

implement
p_atmd0pat
(buf, err) = let
//
val e0 = err
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
//
| _ when t_d0pid(tnd) =>
  let
    val id = p_d0pid(buf, err)
  in
    err := e0;
    d0pat_make_node(id.loc(), D0Pid0(id))
  end // end of [t_d0pid]
//
| _ when t_t0int(tnd) =>
  let
    val i0 = p_t0int(buf, err)
  in
    err := e0;
    d0pat_make_node(i0.loc(), D0Pint(i0))
  end // end of [t_t0int]
| _ when t_t0chr(tnd) =>
  let
    val c0 = p_t0chr(buf, err)
  in
    err := e0;
    d0pat_make_node(c0.loc(), D0Pchr(c0))
  end // end of [t_t0chr]
| _ when t_t0flt(tnd) =>
  let
    val c0 = p_t0flt(buf, err)
  in
    err := e0;
    d0pat_make_node(c0.loc(), D0Pflt(c0))
  end // end of [t_t0flt]
| _ when t_t0str(tnd) =>
  let
    val c0 = p_t0str(buf, err)
  in
    err := e0;
    d0pat_make_node(c0.loc(), D0Pstr(c0))
  end // end of [t_t0str]
//
| T_LBRACE() => let
    val () = buf.incby1()
    val s0as =
    p_s0argseq_COMMA(buf, err)
    val tbeg = tok
    val tend = p_RBRACE(buf, err)
    val loc_res = tbeg.loc()+tend.loc()
  in
    err := e0;
    d0pat_make_node
    (loc_res, D0Psqarg(tbeg, s0as, tend))
  end // end of [T_LBRACE]
//
| T_LPAREN() => let
    val () = buf.incby1()
    val d0ps =
      p_d0patseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_d0pat_RPAREN(buf, err)
  in
    err := e0;
    d0pat_make_node
    ( loc_res
    , D0Pparen(tbeg, d0ps, tend)) where
    {
      val loc_res =
        tbeg.loc()+d0pat_RPAREN_loc(tend)
      // end of [val]
    }
  end // end of [T_LPAREN]
//
| T_TUPLE(k0) => let
    val () = buf.incby1()
    val topt =
    ( if
      (k0 <= 1)
      then None()
      else Some(p_LPAREN(buf, err))
    ) : tokenopt // end of [val]
    val d0ps =
      p_d0patseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_d0pat_RPAREN(buf, err)
  in
    err := e0;
    d0pat_make_node
    ( loc_res
    , D0Ptuple
      (tbeg, topt, d0ps, tend)) where
    {
      val loc_res =
        tbeg.loc()+d0pat_RPAREN_loc(tend)
      // end of [val]
    }
  end // end of [T_TUPLE]
//
| T_IDENT_qual _ => let
    val () = buf.incby1()
    val d0p0 = p_atmd0pat(buf, err)
  in
    err := e0;
    d0pat_make_node
    (loc_res, D0Pqual(tok, d0p0)) where
    {
      val loc_res = tok.loc()+d0p0.loc()
    }
  end // end of [T_IDENT_qual]
//
| _ (* error *) => let
    val () = (err := e0 + 1)
  in
    d0pat_make_node(tok.loc(), D0Pnone(tok))
  end // HX: indicating a parsing error
//
end // end of [p_atmd0pat]

(* ****** ****** *)

implement
p_atmd0patseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{d0pat}(buf, err, p_atmd0pat))
//
) (* end of [p_atmd0patseq] *)

(* ****** ****** *)
//
implement
p_d0patseq_COMMA
  (buf, err) =
(
  list_vt2t
  (pstar_COMMA_fun{d0pat}(buf, err, p_d0pat))
) (* end of [p_d0patseq_COMMA] *)

implement
p_labd0patseq_COMMA
  (buf, err) =
(
  list_vt2t
  (pstar_COMMA_fun{labd0pat}(buf, err, p_labd0pat))
) (* end of [p_labd0patseq_COMMA] *)
//
(* ****** ****** *)

implement
p_d0pat_RPAREN
  (buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
  val tnd1 = tok1.node()
in
//
case+ tnd1 of
| T_BAR() => let
    val () = buf.incby1()
    val d0ps =
      p_d0patseq_COMMA(buf, err)
    val tok2 = p_RPAREN(buf, err)
  in
    err := e0;
    d0pat_RPAREN_cons1(tok1, d0ps, tok2)
  end // end of [T_BAR]
| _ (* non-BAR *) =>
  (
    case+ tnd1 of
    | T_RPAREN() => let
        val () = buf.incby1()
      in
        err := e0; d0pat_RPAREN_cons0(tok1)
      end // end of [RPAREN]
    | _(*non-RPAREN*) =>
      (
        err := e0 + 1; d0pat_RPAREN_cons0(tok1)
      ) (* end of [non-RPAREN *)
  )
//
end // end of [p_d0pat_RPAREN]

implement
p_labd0pat_RBRACE
  (buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
  val tnd1 = tok1.node()
in
//
case+ tnd1 of
| T_BAR() => let
    val () = buf.incby1()
    val ld0ps =
    p_labd0patseq_COMMA(buf, err)
    val tok2 = p_RBRACE(buf, err)
  in
    err := e0;
    labd0pat_RBRACE_cons1(tok1, ld0ps, tok2)
  end // end of [T_BAR]
| _ (* non-BAR *) =>
  (
    case+ tnd1 of
    | T_RBRACE() => let
        val () = buf.incby1()
      in
        err := e0; labd0pat_RBRACE_cons0(tok1)
      end // end of [RBRACE]
    | _(*non-RPAREN*) =>
      (
        err := e0 + 1; labd0pat_RBRACE_cons0(tok1)
      ) (* end of [non-RPAREN] *)
  )
//
end // end of [p_labd0pat_RBRACE]

(* ****** ****** *)

implement
p_f0arg
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
//
| T_DOTLT(_) => let
    val () = buf.incby1()
    val s0es =
    p_s0expseq_COMMA(buf, err)
    val tbeg = tok
    val tend = p_GTDOT(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    f0arg_make_node
    (loc_res, F0ARGsome_met(tbeg, s0es, tend))
  end // end of [T_DOTLT]
//
| T_LBRACE() => let
    val () = buf.incby1()
    val s0qs =
    p_s0quaseq_BARSMCLN(buf, err)
    val tbeg = tok
    val tend = p_RBRACE(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    f0arg_make_node
    (loc_res, F0ARGsome_sta(tbeg, s0qs, tend))
  end // end of [T_LBRACE]
//
| _(*non-sta-met*) =>
  let
    val d0p = p_atmd0pat(buf, err)
  in
    f0arg_make_node(d0p.loc(), F0ARGsome_dyn(d0p))
  end
//
end // end of [p_f0arg]

(* ****** ****** *)

extern
fun
p_f0argseq: parser(f0arglst)
extern
fun
p_f0unarrow: parser(f0unarrow)

(* ****** ****** *)

implement
p_f0argseq
  (buf, err) =
(
  list_vt2t
  (pstar_fun{f0arg}(buf, err, p_f0arg))
) (* end of [p_f0argseq] *)

(* ****** ****** *)
//
implement
p_f0unarrow
  (buf, err) = let
//
val e0 = err
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
//
| T_EQGT() => let
    val () =
      buf.incby1()
    // end of [val]
  in
    F0UNARROWdflt(tok)
  end // end of [T_EQGT]
//
| T_EQLT() => let
    val () =
      buf.incby1()
    // end of [val]
    val s0es =
    list_vt2t
    (
      pstar_COMMA_fun
      {s0exp}
      (buf, err, p_apps0exp_NGT)
    )
    val tbeg = tok
    val tend = p_GT(buf, err)
  in
    err := e0;
    F0UNARROWlist(tbeg, s0es, tend)
  end // end of [T_EQLT]
//
| _(*non-arrow*) => F0UNARROWnone(tok)
//
end // end of [p_f0unarrow]

(* ****** ****** *)
(*
//
atmd0exp ::
//
  | d0eid
//
  | t0int // int
  | t0chr // char
  | t0flt // float
  | t0str // string
//
  | qualid atm0exp
//
  | { d0eclseq }
  | LET d0eclseq END
  | LET d0eclseq IN d0expseq END
//
  | ( d0expseq_COMMA )
  | ( d0expseq_COMMA | d0expseq_COMMA )
  | ( d0expseq_COMMA ; d0expseq_SMCLN )
//
  | { labd0expseq_COMMA }
  | { labd0expseq_COMMA | labd0expseq_COMMA }
//
*)
extern
fun
p_atmd0exp: parser(d0exp)
//
extern
fun
p_appd0exp: parser(d0exp)
//
extern
fun
p_atmd0expseq: parser(d0explst)
//
(* ****** ****** *)
//
extern
fun
p_d0expseq_COMMA: parser(d0explst)
extern
fun
p_labd0expseq_COMMA: parser(labd0explst)
//
(* ****** ****** *)
//
extern
fun
p_d0expseq_SMCLN: parser(d0explst)
//
(* ****** ****** *)
//
(*
d0exp_RPAREN ::=
  | RPAREN
  | BAR d0expseq_COMMA RPAREN
  | SMCLN d0expseq_SMCLN RPAREN
*)
(*
labd0exp_RBRACE ::=
  | RPAREN
  | BAR labd0expseq_COMMA RBRACE
*)
extern
fun
p_d0exp_RPAREN: parser(d0exp_RPAREN)
extern
fun
p_labd0exp_RBRACE: parser(labd0exp_RBRACE)
//
(* ****** ****** *)
//
extern
fun
p_d0exp_THEN: parser(d0exp_THEN)
and
p_d0exp_ELSE: parser(d0exp_ELSE)
//
(* ****** ****** *)
//
extern
fun
p_ENDWHERE: parser(endwhere)
//
extern
fun
pseq_d0eclseq_WHERE:
  parser(List0(d0eclseq_WHERE))
//
(*
extern
fun
popt_d0eclseq_WHERE:
  parser(Option(d0eclseq_WHERE))
*)
//
(* ****** ****** *)
//
extern
fun
p_d0clau: parser(d0clau)
extern
fun
p_d0clauseq_BAR: parser(d0claulst)
//
(* ****** ****** *)

local

static
fun
p_napps: parser(d0exp)
implement
p_napps(buf, err) = let
//
  val e0 = err
  val tok = buf.get0()
  val tnd = tok.node()
//
in
//
case+ tnd of
//
| T_IF() => let
//
    val () = buf.incby1()
//
    val d0e1 =
      p_appd0exp(buf, err)
    val d0e2 =
      p_d0exp_THEN(buf, err)
    val d0e3 =
      p_d0exp_ELSE(buf, err)
    val topt = popt_ENDIF(buf, err)
//
    val
    loc_res =
    (
    case+ topt of
    | None() =>
      (
      case d0e3 of
      | d0exp_ELSEnone
          () =>
        (
          case+ d0e2 of
          | d0exp_THEN
              (_, d0e) =>
              tok.loc() + d0e.loc()
            // end of [d0exp_THEN]
        )
      | d0exp_ELSEsome
          (_, d0e) =>
          tok.loc() + d0e.loc()
        // end of [d0exp_ELSEsome]
      )
    | Some(tok2) => tok.loc() + tok2.loc()
    ) : loc_t // end of [val]
//
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Eif0(tok, d0e1, d0e2, d0e3, topt))
  end // end of [T_IF]
//
| T_CASE _ => let
//
    val () = buf.incby1()
//
    val d0e1 =
      p_appd0exp(buf, err)
//
    val tok2 = p_OF(buf, err)
    val tbar = popt_BAR(buf, err)
    val d0cs = p_d0clauseq_BAR(buf, err)
    val tend = popt_ENDCASE(buf, err)
//
    val loc_res = let
      val loc = tok.loc()
    in
      case+ tend of
      | None() =>
        (
        case+ d0cs of
        | list_nil() =>
          (
            case+ tbar of
            | None() => loc + tok2.loc()
            | Some(tok) => loc + tok.loc()
          )
        | list_cons(_, _) =>
          let
            val d0c =
              list_last(d0cs) in loc + d0c.loc()
            // end of [val]
          end // end of [list_cons]
        )
      | Some(tok) => loc + tok.loc()
    end : loc_t // end of [let] // end of [val]
//
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Ecase(tok, d0e1, tok2, tbar, d0cs, tend))
    // end of [d0exp_make_node]
  end // end of [T_CASE]
//
| T_LAM(k0) => let
//
    val () = buf.incby1()
//
    val arg =
      p_f0argseq(buf, err)
    val res =
      p_effs0expopt(buf, err)
    val farrw =
      p_f0unarrow(buf, err)
    val fbody = p_d0exp(buf, err)
    val tfini = popt_ENDLAM(buf, err)
//
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Elam
      ( tok // lam|lam@
      , arg, res, farrw, fbody, tfini)
    ) where
    {
      val loc_res =
      (
        case+ tfini of 
        | None() => tok.loc()+fbody.loc()
        | Some(tok2) => tok.loc()+tok2.loc()
      ) : loc_t // end of [val]
    }
  end 
//
| T_FIX(k0) => let
//
    val () = buf.incby1()
//
    val fid =
      p_d0eid(buf, err)
    val arg =
      p_f0argseq(buf, err)
    val res =
      p_effs0expopt(buf, err)
    val farrw =
      p_f0unarrow(buf, err)
    val fbody = p_d0exp(buf, err)
    val tfini = popt_ENDLAM(buf, err)
//
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Efix
      ( tok // fix|fix@
      , fid, arg, res, farrw, fbody, tfini)
    ) where
    {
      val loc_res =
      (
        case+ tfini of 
        | None() => tok.loc()+fbody.loc()
        | Some(tok2) => tok.loc()+tok2.loc()
      ) : loc_t // end of [val]
    }
  end 
//
| _ (* error *) =>
  ( err := e0 + 1;
    d0exp_make_node(tok.loc(), D0Enone(tok))
  ) (* end-of-error *)
//
end // end of [p_napps]

fun
auxlst_where
( d0e0
: d0exp
, wd0cs
: List0(d0eclseq_WHERE)
) : d0exp =
(
case+ wd0cs of
| list_nil
  ((*void*)) => d0e0
| list_cons
  (wd0c0, wd0cs) => let
    val d0e1 =
    (
    d0exp_make_node
    (loc1, D0Ewhere(d0e0, wd0c0))
    ) where
    {
      val loc1 =
      (
        case+ wd0c0 of
        | d0eclseq_WHERE
          (_, _, _, tend) => d0e0.loc()+tend.loc()
      ) : loc_t // end of [val]
    } (* end of [where] *)
  in
    auxlst_where(d0e1, wd0cs)
  end // end of [list_cons]
) (* end of [auxlst_where] *)

in (* in-of-local *)

implement
p_d0exp(buf, err) =
let
//
val e0 = err
val d0es =
  p_atmd0expseq(buf, err)
// end of [val]
//
(*
val () =
println!("p_d0exp: d0es = ", d0es)
*)
//
in
//
case+ d0es of
| list_nil
    ((*void*)) =>
    p_napps(buf, err)
  // end of [list_nil]
| list_cons
    (d0e1, d0es2) =>
  (
  let
    val d0e0 =
    auxlst_where(d0e0, wd0cs)
    val opt =
    popt_s0exp_anno(buf, err)
  in
    d0exp_anno_opt(d0e0, opt)
  end
  ) where
  {
    val d0e0 =
    (
    case+ d0es2 of
    | list_nil() => d0e1
    | list_cons _ => let
        val d0e2 = list_last(d0es2)
        val loc0 = d0e1.loc()+d0e2.loc()
      in
        d0exp_make_node(loc0, D0Eapps(d0es))
      end // end of [list_cons]
    ) : d0exp // end of [val]
    val wd0cs = pseq_d0eclseq_WHERE(buf, err)
  } (* end of [list_cons] *)
//
end // end of [p_d0exp]

end // end of [local]

(* ****** ****** *)

implement
p_labd0exp
  (buf, err) = let
//
val e0 = err
//
val l0 =
(
  p_l0abl(buf, err)
)
val tok = p_EQ(buf, err)
val d0e = p_d0exp(buf, err)
//
(*
val ((*void*)) =
println! ("p_labd0exp: l0 = ", l0)
val ((*void*)) =
println! ("p_labd0exp: tok = ", tok)
val ((*void*)) =
println! ("p_labd0exp: d0e = ", d0e)
*)
//
in
  err := e0; DL0ABELED(l0, tok, d0e)
end // end of [p_labd0exp]

(* ****** ****** *)

implement
p_atmd0exp
(buf, err) = let
//
val e0 = err
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
//
|
_ when t_d0eid(tnd) =>
let
  val id = p_d0eid(buf, err)
in
  err := e0;
  d0exp_make_node(id.loc(), D0Eid0(id))
end // end of [t_d0eid]
//
|
_ when t_t0int(tnd) =>
let
  val i0 = p_t0int(buf, err)
in
  err := e0;
  d0exp_make_node(i0.loc(), D0Eint(i0))
end // end of [t_t0int]
|
_ when t_t0chr(tnd) =>
let
  val c0 = p_t0chr(buf, err)
in
  err := e0;
  d0exp_make_node(c0.loc(), D0Echr(c0))
end // end of [t_t0chr]
|
_ when t_t0flt(tnd) =>
let
  val f0 = p_t0flt(buf, err)
in
  err := e0;
  d0exp_make_node(f0.loc(), D0Eflt(f0))
end // end of [t_t0flt]
|
_ when t_t0str(tnd) =>
let
  val s0 = p_t0str(buf, err)
in
  err := e0;
  d0exp_make_node(s0.loc(), D0Estr(s0))
end // end of [t_t0str]
//
| T_LT() => let
    val () =
      buf.incby1()
    val mark =
      buf.get_mark()
    // end of [val]
    val s0es =
    list_vt2t
    (
      pstar_COMMA_fun
      {s0exp}(buf, err, p_apps0exp_NGT)
    )
    val tok2 = buf.get0()
  in
    case+
    tok2.node() of
    | T_GT() => let
        val () =
        buf.incby1()
        val () =
        buf.clear_mark(mark)
        val tbeg = tok
        val tend = tok2
        val loc_res = tok.loc() + tok2.loc()
      in
        d0exp_make_node
          (loc_res, D0Etqarg(tbeg, s0es, tend))
        // d0exp_make_node
      end // end of [T_GT]
    | _(* non-GT *) => let
        val () =
          buf.set_mark(mark)
        // end of [val]
        val loc = tok.loc()
        val tnd = T_IDENT_LT
        val tok = token_make_node(loc, tnd)
      in
        d0exp_make_node(loc, D0Eid0(i0dnt_some(tok)))
      end // end of [non-GT]
  end // end of [T_LT]
//
| T_GT() => let
    val () =
      buf.incby1()
    // end of [val]
    val loc = tok.loc()
    val tnd = T_IDENT_GT
    val tok =
      token_make_node(loc, tnd)
    // end of [val]
  in
    d0exp_make_node
      (loc, D0Eid0(i0dnt_some(tok)))
    // d0exp_make_node
  end // end of [T_GT]
//
| T_LTGT() => let
    val () =
      buf.incby1()
    // end of [val]
    val tbeg = tok
    val tend = tok
    val s0es = list_nil()
    val loc_res = tok.loc()
  in
    d0exp_make_node
    (loc_res, D0Etqarg(tbeg, s0es, tend))
  end // end of [T_LTGT]
//
| T_LBRACE() => let
    val () = buf.incby1()
    val s0es =
      p_s0expseq_COMMA(buf, err)
    val tbeg = tok
    val tend = p_RBRACE(buf, err)
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Esqarg(tbeg, s0es, tend)) where
    {
      val loc_res = tbeg.loc()+tend.loc()
    }
  end // end of [T_LBRACE]
//
| T_LPAREN() => let
    val () = buf.incby1()
    val d0es =
      p_d0expseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_d0exp_RPAREN(buf, err)
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Eparen(tbeg, d0es, tend)) where
    {
      val loc_res =
        tbeg.loc()+d0exp_RPAREN_loc(tend)
      // end of [val]
    }
  end // end of [T_LPAREN]
//
| T_TUPLE(k0) => let
    val () = buf.incby1()
    val topt =
    ( if
      (k0 <= 1)
      then None()
      else Some(p_LPAREN(buf, err))
    ) : tokenopt // end of [val]
    val d0es =
      p_d0expseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_d0exp_RPAREN(buf, err)
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Etuple
      (tbeg, topt, d0es, tend)) where
    {
      val loc_res =
        tbeg.loc()+d0exp_RPAREN_loc(tend)
      // end of [val]
    }
  end // end of [T_TUPLE]
//
| T_LET() => let
//
    val () = buf.incby1()
//
    val d0cs =
    p_d0eclseq_dyn(buf, err)
//
    val
    topt = popt_IN(buf, err)
    val d0es =
    p_d0expseq_SMCLN(buf, err)
    val tok2 = p_ENDLET(buf, err)
//
    val loc_res = tok.loc()+tok2.loc()
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Elet(tok, d0cs, topt, d0es, tok2))
  end // end of [T_LET]
//
| T_TRY() => let
//
    val () = buf.incby1()
//
    val d0e1 =
      p_appd0exp(buf, err)
    // end of [val]
//
    val tok2 =
      p_WITH(buf, err)
    val tbar =
      popt_BAR(buf, err)
    val d0cs =
      p_d0clauseq_BAR(buf, err)
    val tend = p_ENDTRY(buf, err)
//
    val loc_res = tok.loc()+tend.loc()
//
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Etry0
      (tok, d0e1, tok2, tbar, d0cs, tend))
  end // end of [T_TRY]
//
| T_DOT() => let
    val () =
      buf.incby1()
    // end of [val]
    val lab =
      p_l0abl(buf, err)
    val arg = let
      val tok2 = buf.get0()
    in
      case+
      tok2.node() of
      | T_LPAREN() =>
        Some( d0e ) where
        {
          val d0e =
            p_atmd0exp(buf, err)
          // end of [val]
        }
      | _(* non-LPAREN *) => None()
    end : d0expopt // end of [val]
    val loc_res = let
      val loc = tok.loc()
    in
      case+ arg of
      | None() => loc + lab.loc()
      | Some(d0e) => loc + d0e.loc()
    end // end of [val]
  in
    d0exp_make_node
      (loc_res, D0Edtsel(tok, lab, arg))
    // d0exp_make_node
  end // end of [T_DOT]
//
| T_LBRACK() => let
    val () = buf.incby1()
    val d0es =
      p_d0expseq_COMMA(buf, err)
    val tbeg = tok
    val tend = p_RBRACK(buf, err)
    val loc_res = tbeg.loc()+tend.loc()
  in
    err := e0;
    d0exp_make_node
      (loc_res, D0Ebrack(tbeg, d0es, tend))
    // end of [d0exp_make_node]
  end // end of [T_LBRACK]
//
| T_IDENT_qual _ => let
    val () = buf.incby1()
    val d0e = p_atmd0exp(buf, err)
  in
    err := e0;
    d0exp_make_node
    (loc_res, D0Equal(tok, d0e)) where
    {
      val loc_res = tok.loc()+d0e.loc()
    }
  end // end of [T_IDENT_qual]
//
| _ (* error *) => let
    val () = (err := e0 + 1)
  in
    d0exp_make_node(tok.loc(), D0Enone(tok))
  end // HX: indicating a parsing error
//
end // end of [p_atmd0exp]

(* ****** ****** *)

implement
p_appd0exp
  (buf, err) = let
//
val
d0e0 = p_atmd0exp(buf, err)
val
d0es = p_atmd0expseq(buf, err)
//
in
//
case+ d0es of
| list_nil() => d0e0
| list_cons _ => let
    val d0e1 = list_last(d0es)
    val loc0 = d0e0.loc() + d0e1.loc()
  in
    d0exp_make_node
      (loc0, D0Eapps(list_cons(d0e0, d0es)))
    // d0exp_make_node
  end // end of [list_cons]
//
end // end of [p_appd0exp]

(* ****** ****** *)

implement
p_atmd0expseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{d0exp}(buf, err, p_atmd0exp))
//
) (* end of [p_atmd0expseq] *)

(* ****** ****** *)

implement
p_d0expseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{d0exp}(buf, err, p_d0exp))
//
) (* end of [p_d0expseq_COMMA] *)

implement
p_labd0expseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun
 {labd0exp}(buf, err, p_labd0exp))
//
) (* end of [p_labd0expseq_COMMA] *)

(* ****** ****** *)

implement
p_d0expseq_SMCLN
  (buf, err) =
(
//
list_vt2t
(pstar_SMCLN_fun{d0exp}(buf, err, p_d0exp))
//
) (* end of [p_d0expseq_SMCLN] *)

(* ****** ****** *)

implement
p_d0exp_RPAREN
  (buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
  val tnd1 = tok1.node()
in
//
case+ tnd1 of
| T_BAR() => let
    val () =
      buf.incby1()
    val d0es =
      p_d0expseq_COMMA
        (buf, err)
    val tok2 = p_RPAREN(buf, err)
  in
    err := e0;
    d0exp_RPAREN_cons1(tok1, d0es, tok2)
  end // end of [T_BAR]
| T_SMCLN() => let
    val () =
      buf.incby1()
    val d0es =
      p_d0expseq_SMCLN
        (buf, err)
    val tok2 = p_RPAREN(buf, err)
  in
    err := e0;
    d0exp_RPAREN_cons2(tok1, d0es, tok2)
  end // end of [T_BAR]
| _ (* non-BAR *) =>
  (
    case+ tnd1 of
    | T_RPAREN() => let
        val () = buf.incby1()
      in
        err := e0; d0exp_RPAREN_cons0(tok1)
      end // end of [RPAREN]
    | _(*non-RPAREN*) =>
      (
        err := e0 + 1; d0exp_RPAREN_cons0(tok1)
      ) (* end of [non-RPAREN *)
  )
//
end // end of [p_d0exp_RPAREN]

implement
p_labd0exp_RBRACE
  (buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
  val tnd1 = tok1.node()
in
//
case+ tnd1 of
| T_BAR() => let
    val () = buf.incby1()
    val ld0es =
    p_labd0expseq_COMMA(buf, err)
    val tok2 = p_RBRACE(buf, err)
  in
    err := e0;
    labd0exp_RBRACE_cons1(tok1, ld0es, tok2)
  end // end of [T_BAR]
| _ (* non-BAR *) =>
  (
    case+ tnd1 of
    | T_RBRACE() => let
        val () = buf.incby1()
      in
        err := e0; labd0exp_RBRACE_cons0(tok1)
      end // end of [RBRACE]
    | _(*non-RPAREN*) =>
      (
        err := e0 + 1; labd0exp_RBRACE_cons0(tok1)
      ) (* end of [non-RPAREN] *)
  )
//
end // end of [p_labd0exp_RBRACE]

(* ****** ****** *)

implement
p_d0exp_THEN
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_THEN() => let
    val () =
      buf.incby1()
    val d0e =
      p_d0exp(buf, err)
  in
    err := e0; d0exp_THEN(tok, d0e)
  end // end of [T_THEN]
| _(*non-THEN*) =>
  ( // HX-2018-09-25: error
    d0exp_THEN(tok, p_d0exp(buf, err))
  ) (* end of [non-THEN] *)
//
end // end of [p_d0exp_THEN]

(* ****** ****** *)

implement
p_d0exp_ELSE
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_ELSE() => let
    val () =
      buf.incby1()
    val d0e =
      p_d0exp(buf, err)
  in
    err := e0; d0exp_ELSEsome(tok, d0e)
  end // end of [T_THEN]
| _(*non-ELSE*) =>
  (
    d0exp_ELSEnone((*void*)) // HX: ELSE-less
  )
//
end // end of [p_d0exp_ELSE]

(* ****** ****** *)
//
implement
p_ENDWHERE(buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
in
  case+
  tok1.node() of
//
(*
  | T_END() =>
    let
    val () =
      buf.incby1() in endwhere_cons1(tok1)
    // end of [val]
    end
*)
//
  | T_RBRACE() =>
    let
      val () = buf.incby1()
      val tok2 = buf.get0()
    in
      case+
      tok2.node() of
(*
      | T_END() =>
        let
          val () = buf.incby1()
        in
          endwhere_cons2(tok1, Some(tok2))
        // end of [val]
        end
*)
      | T_ENDWHERE() =>
        let
          val () = buf.incby1()
        in
          endwhere_cons2(tok1, Some(tok2))
        // end of [val]
        end
      | _ (* non-END *) => endwhere_cons1(tok1)
    end
//
  | T_ENDWHERE() =>
    let
      val () = buf.incby1() in endwhere_cons1(tok1)
    end
//
  | _ (* non-END *) =>
    let
    val () = (err := e0 + 1) in endwhere_cons1(tok1)
    end
end // end of [p_ENDWHERE]
//
(* ****** ****** *)

implement
pseq_d0eclseq_WHERE
  (buf, err) = let
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_WHERE() => let
//
    val () = buf.incby1()
//
    val opt =
      popt_LBRACE(buf, err)
    val d0cs =
      p_d0eclseq_dyn(buf, err)
//
    val tend = p_ENDWHERE(buf, err)
//
    val d0c0 =
      d0eclseq_WHERE(tok, opt, d0cs, tend)
    // end of [val]
    val d0cs = pseq_d0eclseq_WHERE(buf, err)
  in
    list_cons(d0c0, d0cs)
  end
| _(* non-WHERE *) => list_nil(*void*)
//
end // end of [pseq_d0eclseq_WHERE]

(* ****** ****** *)

(*
implement
popt_d0eclseq_WHERE
  (buf, err) = let
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_WHERE() => let
//
    val () = buf.incby1()
//
    val opt =
      popt_LBRACE(buf, err)
    val d0cs =
      p_d0eclseq_dyn(buf, err)
//
    val tend = p_ENDWHERE(buf, err)
//
  in
    Some(d0eclseq_WHERE(tok, opt, d0cs, tend))
  end
| _(* non-WHERE *) => None((*void*))
//
end // end of [popt_d0eclseq_WHERE]
*)

(* ****** ****** *)
//
(*
HX-2019-02-15:
//
case [d0exp] of
|
[d0pat] when [d0exp]
|
[d0pat] when [d0exp] as [d0pat]
//
*)
//
extern
fun
p_d0gua: parser(d0gua)
extern
fun
p_d0guaseq_AND: parser(d0gualst)
//
(* ****** ****** *)

local

fun
p_appd0exp
( buf
: &tokbuf >> _
, err: &int >> _): d0exp = let

fun
auxdexp
( buf: &tokbuf >> _
, err: &int >> _): d0exp = let
//
  val e0 = err
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_EQGT() => let
      val () = (err := e0 + 1)
    in
      d0exp_make_node
        (tok.loc(), D0Enone(tok))
      // end of [d0exp_make_node]
    end // end of [T_EQGT]
  | _(*non-EQGT...*) => p_atmd0exp(buf, err)
end // end of [auxngt]
//
val d0e0 =
  auxdexp(buf, err)
val d0es = 
  list_vt2t
  (pstar_fun{d0exp}(buf, err, auxdexp))
//
in
//
case+ d0es of
| list_nil() => d0e0
| list_cons _ => let
    val d0e1 = list_last(d0es)
    val loc01 = d0e0.loc()+d0e1.loc()
  in
    d0exp_make_node(loc01, D0Eapps(list_cons(d0e0, d0es)))
  end // end of [list_cons]
//
end // end of [p_appd0exp]

in(*in-of-local*)

implement
p_d0gua
  (buf, err) = let
//
val
d0e =
p_appd0exp(buf, err)
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_AS() => let
    val () = buf.incby1()
    val d0p = p_d0pat(buf, err)
    val loc_res = d0e.loc() + d0p.loc()
  in
    d0gua_make_node
      (loc_res, D0GUAmat(d0e, tok, d0p))
    // d0gua_make_node
  end // end of [T_AS]
| _(* non-AS *) =>
  (
    d0gua_make_node(d0e.loc(), D0GUAexp(d0e))
  ) (* end of [non-AS] *)
//
end // end of [p_d0gua]

end // end of [local]

(* ****** ****** *)
//
implement
p_d0guaseq_AND
  (buf, err) =
(
//
  list_vt2t
  (pstar_AND_fun{d0gua}(buf, err, p_d0gua))
//
) (* end of [p_d0guaseq_AND] *)
//
(* ****** ****** *)
//
extern
fun
p_d0gpat: parser(d0gpat)
//
(* ****** ****** *)

implement
p_d0gpat
  (buf, err) = let
//
val
d0p =
p_d0pat(buf, err)
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_WHEN() => let
    val () = buf.incby1()
    val d0gs =
      p_d0guaseq_AND(buf, err)
    // end of [val]
    val loc_res =
    (
      case+ d0gs of
      | list_nil() =>
        (
          d0p.loc() + tok.loc()
        )
      | list_cons _ =>
        (
          d0p.loc() + d0g.loc()
        ) where
        {
          val d0g = list_last(d0gs)
        }
    ) : loc_t // end of [val]
  in
    d0gpat_make_node
      (loc_res, D0GPATgua(d0p, tok, d0gs))
    // end of [d0gpat_make_node]
  end
| _ (* non-WHEN *) =>
    d0gpat_make_node(d0p.loc(), D0GPATpat(d0p))
//
end // end of [p_d0gpat]

(* ****** ****** *)

implement
p_d0clau
  (buf, err) = let
//
val
dgp =
p_d0gpat(buf, err)
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_EQGT() => let
    val () = buf.incby1()
    val d0e = p_d0exp(buf, err)
    val loc_res = dgp.loc() + d0e.loc()
  in
    d0clau_make_node
    (loc_res, D0CLAUclau(dgp, tok, d0e))
  end
| _ (* non-EQGT *) =>
    d0clau_make_node(dgp.loc(), D0CLAUgpat(dgp))
//
end // end of [p_d0clau]

implement
p_d0clauseq_BAR
  (buf, err) =
(
//
list_vt2t
(pstar_BAR_fun{d0clau}(buf, err, p_d0clau))
//
) (* end of [p_d0clauseq_BAR] *)

(* ****** ****** *)

static
fun
t_dctkind
 : tnode -> bool
implement
t_dctkind
  (tnd) =
(
case+ tnd of
| T_FUN _ => true
| T_VAL _ => true | _ => false
)

(* ****** ****** *)
//
static
fun
p_precopt: parser(precopt)
and
p_precmod: parser(precmod)
and
p_signint: parser(signint)
//
(* ****** ****** *)

implement
p_precopt
  (buf, err) = let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
//
| T_INT1 _ =>
  PRECOPTint(tok) where
  {
    val () = buf.incby1()
  }
| _ (* non-INT1 *) =>
  PRECOPTopr(id0, pmod) where
  {
    val id0 = p_i0dnt(buf, err)
    val pmod = p_precmod(buf, err)
  }
//
end // end of [p_precopt]

(* ****** ****** *)

implement
p_signint
  (buf, err) = let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
| T_INT1 _ =>
  SIGNINTint(tok) where
  {
    val () = buf.incby1()
  }
| _ (* non-INT1 *) =>
  SIGNINTopr(tok, tint) where
  {
    val () = buf.incby1()
    val tint = buf.get1()
  }
//
end // end of [p_signint]

(* ****** ****** *)

implement
p_precmod
  (buf, err) = let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
| T_LPAREN() =>
  PRECMODsome
  (tbeg, sint, tend) where
  {
    val () = buf.incby1()
    val sint =
      p_signint(buf, err)
    val tbeg = tok
    val tend = p_RPAREN(buf, err)
  }
| _ (* non-LPAREN *) => PRECMODnone()
//
end // end of [p_precmod]

(* ****** ****** *)

static
fun
p_abstdf0: parser(abstdf0)

(* ****** ****** *)

implement
p_abstdf0
  (buf, err) = let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
(*
| T_IDENT_sym("=") => let
    val () = buf.incby1()
  in
    ABSTDF0eqeq
    (tok, p_s0exp(buf, err))    
  end
*)
| T_IDENT_sym("==") => let
    val () = buf.incby1()
  in
    ABSTDF0eqeq
    (tok, p_s0exp(buf, err))    
  end
| T_IDENT_sym("<=") => let
    val () = buf.incby1()
  in
    ABSTDF0lteq
    (tok, p_s0exp(buf, err))
  end
| _(*non-lteq-eqeq*) => ABSTDF0some()
//
end // end of [p_abstdf0]

(* ****** ****** *)
//
static
fun
p_g0expdef: parser(g0expdef)
static
fun
p_d0macdef: parser(d0macdef)
//
(* ****** ****** *)

implement
p_g0expdef
  (buf, err) = let
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_EQ() => let
    val () = buf.incby1()
    val g0e = p_g0exp(buf, err)
  in
    G0EDEFsome(Some(tok), g0e(*def*))
  end
| _(*non-EQ*) => let
    val g0e = p_g0exp(buf, err)
  in
    case+
    g0e.node() of
    | G0Enone(_) =>
      G0EDEFnone(*void*)
    | _(*non-G0Enone*) =>
      G0EDEFsome(None(*void*), g0e(*def*))
  end
//
end // end of [p_g0expdef]

(* ****** ****** *)

implement
p_d0macdef
  (buf, err) = let
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_EQ() => let
    val () = buf.incby1()
    val d0e = p_d0exp(buf, err)
  in
    D0MDEFsome(Some(tok), d0e(*def*))
  end
| _(*non-EQ*) => let
    val d0e = p_d0exp(buf, err)
  in
    case+
    d0e.node() of
    | D0Enone(_) =>
      D0MDEFnone(*void*)
    | _(*non-G0Enone*) =>
      D0MDEFsome(None(*void*), d0e(*def*))
  end
//
end // end of [p_d0macdef]

(* ****** ****** *)
//
static
fun
p_decmodopt: parser(decmodopt)
//
(* ****** ****** *)
//
static
fun
p_teqd0expopt: parser(teqd0expopt)
static
fun
p_wths0expopt: parser(wths0expopt)
//
(* ****** ****** *)

implement
p_decmodopt
  (buf, err) = let
//
val e0 = err
//
val tok0 = buf.get0()
//
in
//
case+
tok0.node() of
//
| T_CLN() => let
    val () = buf.incby1()
    val tok1 = buf.get0()
  in
    case+
    tok1.node() of
    | T_LPAREN() => let
        val () = buf.incby1()
//
        val ids =
          p_i0dntseq_COMMA(buf, err)
        // end of [val]
//
        val tbeg = tok1
        val tend = p_RPAREN(buf, err)
//
      in
        DECMODlist(tok0, tbeg, ids, tend)
      end // end of [T_LPAREN]
//
    | _(*non-LPAREN*) => let
        val id0 =
          p_i0dnt(buf, err) in DECMODsing(tok0, id0)
        // end of [val]
      end // end of [non-LPAREN]
//
  end // end of [T_CLN]
//
| _ (* non-COLON *) => DECMODnone(*void*)
//
end // end of [p_decmodopt]

(* ****** ****** *)

implement
p_teqd0expopt
  (buf, err) = let
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_EQ() =>
  TEQD0EXPsome
    (tok, d0e) where
  {
    val () = buf.incby1()
    val d0e = p_d0exp(buf, err)
  }
| _(*non-EQ*) => TEQD0EXPnone(*void*)
//
end // end of [p_teqd0expopt]

(* ****** ****** *)

implement
p_wths0expopt
  (buf, err) = let
//
val tok = buf.get0()
//
in
//
case+
tok.node() of
| T_WITHTYPE _ =>
  WTHS0EXPsome
    (tok, s0e) where
  {
    val () = buf.incby1()
    val s0e = p_s0exp(buf, err)
  }
| _(*non-WITH*) => WTHS0EXPnone(*void*)
//
end // end of [p_wths0expopt]

(* ****** ****** *)

local

(* ****** ****** *)
//
static
fun
p_d0cstdecl
 : parser(d0cstdecl)
and
p_d0cstdeclseq_AND
 : parser(d0cstdeclist)
//
static
fun
p_dynconst : parser(d0ecl)
//
implement
p_d0cstdecl
  (buf, err) = let
//
val e0 = err
//
val
nam = p_d0pid(buf, err)
val
arg = p_d0argseq(buf, err)
val
res = p_effs0expopt(buf, err)
val
def = p_teqd0expopt(buf, err)
//
val
loc = nam.loc()
val
loc =
(
case+ def of
| TEQD0EXPnone() =>
  (
  case+ res of
  | EFFS0EXPnone() =>
    (case+ arg of
     | list_nil() => loc
     | list_cons
       (tqa, _) => loc+tqa.loc()
    )
  | EFFS0EXPsome(s0e) => loc+s0e.loc()
(*
  | EFFS0EXPsome(sfe, s0e) => loc+s0e.loc()
*)
  )
| TEQD0EXPsome(_, d0e) => loc+d0e.loc()
) : loc_t // end of [val]
//
in
  err := e0;
  D0CSTDECL
  (@{loc=loc,nam=nam,arg=arg,res=res,def=def})
end // end of [p_d0cstdecl]

(* ****** ****** *)
//
implement
p_d0cstdeclseq_AND
  (buf, err) =
(
//
list_vt2t
(pstar_AND_fun
 {d0cstdecl}(buf, err, p_d0cstdecl))
//
) (* end of [p_d0cstdeclseq_AND] *)
//
(* ****** ****** *)
//
static
fun
p_v0aldecl
 : parser(v0aldecl)
and
p_v0aldeclseq_AND
 : parser(v0aldeclist)
//
(* ****** ****** *)

implement
p_v0aldecl
  (buf, err) = let
//
val e0 = err
//
val
d0p = p_d0pat(buf, err)
//
val
teq = popt_EQ(buf, err)
//
in
//
case+ teq of
|
None() => let
val dopt = None()
val wopt = WTHS0EXPnone()
val loc0 = d0p.loc()
val loc1 =
(
case+ wopt of
| WTHS0EXPnone() => loc0
| WTHS0EXPsome(_, s0e) => loc0+s0e.loc()
) : loc_t // end of [val]
//
in
  err := e0;
  V0ALDECL
  (@{loc=loc1,pat=d0p,teq=teq,def=dopt,wtp=wopt})
end
|
Some(tok) => let
val d0e =
p_d0exp(buf, err)
val dopt = Some(d0e)
val wopt =
p_wths0expopt(buf, err)
//
val loc0 = d0p.loc()
val loc1 =
(
case+ wopt of
| WTHS0EXPnone() => loc0+d0e.loc()
| WTHS0EXPsome(_, s0e) => loc0+s0e.loc()
) : loc_t // end-of-val
//
in
  err := e0;
  V0ALDECL
  (@{loc=loc1,pat=d0p,teq=teq,def=dopt,wtp=wopt})
end
//
end // end of [p_v0aldecl]

(* ****** ****** *)
//
implement
p_v0aldeclseq_AND
  (buf, err) =
(
//
list_vt2t
(pstar_AND_fun
 {v0aldecl}(buf, err, p_v0aldecl))
//
) (* end of [p_v0aldeclseq_AND] *)
//
(* ****** ****** *)

extern
fun
ptok_valdecl
( tok: token
, buf: &tokbuf >> _
, err: &int >> _): d0ecl
implement
ptok_valdecl
(
tok, buf, err
) = let
  val e0 = err
  val () =
    buf.incby1()
  // end of [val]
  val loc = tok.loc()
  val mopt =
    p_decmodopt(buf, err)
  val d0cs =
    p_v0aldeclseq_AND(buf, err)
  val loc_res =
  (
    case+ d0cs of
    | list_nil() => loc
    | list_cons _ => let
        val d0c =
          list_last(d0cs) in loc+d0c.loc()
        // end of [val]
      end // end of [list_cons]
  ) : loc_t // end of [val]
in
  err := e0;
  d0ecl_make_node
    ( loc_res, D0Cvaldecl(tok, mopt, d0cs) )
  // d0ecl_make_node
end // end of [ptok_valdecl]

(* ****** ****** *)
//
static
fun
p_v0ardecl
 : parser(v0ardecl)
and
p_v0ardeclseq_AND
 : parser(v0ardeclist)
//
(* ****** ****** *)
//
implement
p_v0ardecl
  (buf, err) = let
//
val e0 = err
//
val nam =
p_d0pid(buf, err)
//
(*
val res =
p_effs0expopt(buf, err)
*)
val res =
popt_s0exp_anno(buf, err)
//
val wth =
let
  val tok = buf.get0()
in (* in-of-let *)
//
case+
tok.node() of
| T_WITH() => let
    val () = buf.incby1()
  in
    Some(p_d0pid(buf, err))
  end // end of [T_WITH]
| _(*non-WITH*) => None(*void*)
//
end : d0pidopt // end of [val]
//
val ini = p_teqd0expopt(buf, err)
//
val loc0 = nam.loc((*void*))
//
val loc1 =
(
case+ ini of
| TEQD0EXPnone() =>
  ( case+ wth of
    | None() =>
      (
      case+ res of
      | None() => loc0
      | Some(s0e) => loc0+s0e.loc()
      )
    | Some(pid) => (loc0 + pid.loc())
  )
| TEQD0EXPsome(teq, d0e) => loc0 + d0e.loc()
) : loc_t // end of [val]
//
in
  err := e0;
  V0ARDECL
  (@{loc=loc1,nam=nam,wth=wth,res=res,ini=ini})
end // end of [p_v0ardecl]
//
(* ****** ****** *)
//
implement
p_v0ardeclseq_AND
  (buf, err) =
(
//
list_vt2t
(pstar_AND_fun
 {v0ardecl}(buf, err, p_v0ardecl))
//
) (* end of [p_v0ardeclseq_AND] *)
//
(* ****** ****** *)
//
extern
fun
ptok_vardecl
( tok: token
, buf: &tokbuf >> _
, err: &int >> _): d0ecl
implement
ptok_vardecl
(
tok, buf, err
) = let
  val e0 = err
  val () =
    buf.incby1()
  // end of [val]
  val loc = tok.loc()
//
  val mopt =
    p_decmodopt(buf, err)
  val d0cs =
    p_v0ardeclseq_AND(buf, err)
//
  val loc_res =
  (
    case+ d0cs of
    | list_nil() => loc
    | list_cons _ => let
        val d0c =
          list_last(d0cs) in loc+d0c.loc()
        // end of [val]
      end // end of [list_cons]
  ) : loc_t // end of [val]
in
  err := e0;
  d0ecl_make_node
    (loc_res, D0Cvardecl(tok, mopt, d0cs))
  // d0ecl_make_node
end // end of [ptok_vardecl]
//
(* ****** ****** *)
//
static
fun
p_f0undecl
 : parser(f0undecl)
and
p_f0undeclseq_AND
 : parser(f0undeclist)
//
(* ****** ****** *)
//
implement
p_f0undecl
  (buf, err) = let
//
val e0 = err
//
val nam =
p_d0pid(buf, err)
//
val arg =
p_f0argseq(buf, err)
val res =
p_effs0expopt(buf, err)
//
val teq = popt_EQ(buf, err)
//
in
//
case+ teq of
|
None() =>
let
val dopt = None()
val wopt = WTHS0EXPnone()
val loc0 = nam.loc((*void*))
val loc1 =
(
case+ res of
|
EFFS0EXPnone() =>
(
case+ arg of
| list_nil() => loc0
| list_cons _ =>
  let
  val f0a =
  list_last(arg) in loc0+f0a.loc()
  end
)
|
EFFS0EXPsome(s0e) => loc0+s0e.loc()
) : loc_t // end of [val]
in
  err := e0;
  F0UNDECL
  (@{loc=loc1,nam=nam,arg=arg,res=res,teq=teq,def=dopt,wtp=wopt})
end
| Some(tok) =>
let
val d0e =
p_d0exp(buf, err)
val dopt = Some(d0e)
val wopt =
p_wths0expopt(buf, err)
//
val loc0 = nam.loc((*void*))
//
val loc1 =
( case+ wopt of
| WTHS0EXPnone() => loc0+d0e.loc()
| WTHS0EXPsome(_, s0e) => loc0+s0e.loc()
) : loc_t // end-of-val
//
in
  err := e0;
  F0UNDECL
  (@{loc=loc1,nam=nam,arg=arg,res=res,teq=teq,def=dopt,wtp=wopt})
end
//
end // end of [p_f0undecl]
//
implement
p_f0undeclseq_AND
  (buf, err) =
(
//
list_vt2t
(pstar_AND_fun
 {f0undecl}(buf, err, p_f0undecl))
//
) (* end of [p_f0undeclseq_AND] *)
//
(* ****** ****** *)
//
extern
fun
ptok_fundecl
( tok: token
, buf: &tokbuf >> _
, err: &int >> _): d0ecl
implement
ptok_fundecl
(
tok, buf, err
) = let
//
  val e0 = err
  val () =
    buf.incby1()
  // end of [val]
  val loc = tok.loc()
//
  val mopt =
    p_decmodopt(buf, err)
//
  val tqas =
    p_tq0argseq(buf, err)
//
  val d0cs =
    p_f0undeclseq_AND(buf, err)
//
  val loc_res =
  (
    case+ d0cs of
    | list_nil() => loc
    | list_cons _ => let
        val d0c =
          list_last(d0cs) in loc+d0c.loc()
        // end of [val]
      end // end of [list_cons]
  ) : loc_t // end of [val]
in
  err := e0;
  d0ecl_make_node
    (loc_res, D0Cfundecl(tok, mopt, tqas, d0cs))
  // d0ecl_make_node
end // end of [ptok_fundecl]
//
(* ****** ****** *)
//
extern
fun
ptok_impdecl
( tok: token
, buf: &tokbuf >> _
, err: &int >> _): d0ecl
//
local
//
fun
auxs0q0
( s0q0
: s0qua): s0qua =
(
case+
s0q0.node() of
| S0QUAprop(s0p) =>
  (
  case+
  s0p.node() of
  | S0Eid0(sid) =>
    let
      val loc = s0p.loc()
      val opt = None(*sort0*)
      val ids = list_sing(sid)
    in
      s0qua_make_node
      (loc, S0QUAvars(ids, opt))
    end
  | _ (* non-S0Eid0 *) => s0q0
  )
| _(* non-S0QUAprop *) => s0q0
)
and
auxs0qs
( xs
: s0qualst): s0qualst =
list_vt2t
(
list_map<s0qua><s0qua>(xs)
) where
{
implement
list_map$fopr<s0qua><s0qua>(x0) = auxs0q0(x0)
}
//
fun
auxf0a0
( f0a0
: f0arg): f0arg =
(
case+
f0a0.node() of
| F0ARGsome_sta
  (tbeg, s0qs, tend) =>
  (
    f0arg_make_node(loc, node)
  ) where
  {
    val loc = f0a0.loc()
    val s0qs = auxs0qs(s0qs)
    val node =
    F0ARGsome_sta(tbeg, s0qs, tend)
  }
| _ (* non-F0ARGsom_sta *) => f0a0
)
and
auxf0as
( xs
: f0arglst): f0arglst =
list_vt2t
(
list_map<f0arg><f0arg>(xs)
) where
{
implement
list_map$fopr<f0arg><f0arg>(x0) = auxf0a0(x0)
}
//
in (*in-of-local*)

implement
ptok_impdecl
(
tok, buf, err
) = let
//
  val e0 = err
  val () =
    buf.incby1()
  // end of [val]
  val loc = tok.loc()
//
  val mopt =
    p_decmodopt(buf, err)
//
  val sqas =
    p_sq0argseq(buf, err)
  val tqas =
    p_tq0argseq(buf, err)
//
  val dqid =
    p_dq0eid(buf, err)
  val tias =
    p_ti0argseq(buf, err)
//
  val f0as =
    p_f0argseq(buf, err)
  val f0as = auxf0as(f0as)
//
  val tres =
    p_effs0expopt(buf, err)
//
  val teq0 = p_EQ(buf, err)
  val d0e1 = p_d0exp(buf, err)
//
  val loc_res = tok.loc() + d0e1.loc()
in
  err := e0;
  d0ecl_make_node
  ( loc_res
  , D0Cimpdecl
    ( tok, mopt
    , sqas, tqas
    , dqid, tias, f0as, tres, teq0, d0e1)
  ) (* d0ecl_make_node *)
end // end of [ptok_impdecl]
//
end // end of [local]
//
(* ****** ****** *)
//
extern
fun
ptok_dynconst
( tok: token
, buf: &tokbuf >> _
, err: &int >> _): d0ecl
implement
ptok_dynconst
(
tok, buf, err
) = let
  val e0 = err
  val () =
    buf.incby1()
  // end of [val]
  val loc = tok.loc()
  val tqas =
    p_tq0argseq(buf, err)
  val d0cs =
    p_d0cstdeclseq_AND(buf, err)
  val loc_res =
  (
    case+ d0cs of
    | list_nil() =>
      (case+ tqas of
       | list_nil() => loc
       | list_cons
           (tqa, _) => loc + tqa.loc()
         // list_cons
      )
    | list_cons(d0c, _) => loc+d0c.loc()
  ) : loc_t // end of [val]
in
  err := e0;
  d0ecl_make_node
    ( loc_res, D0Cdynconst(tok, tqas, d0cs) )
  // d0ecl_make_node
end // end of [ptok_dynconst]
//
(* ****** ****** *)

in (* in-of-local *)

implement
fp_d0ecl
(f0, buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
val loc = tok.loc()
val tnd = tok.node()
//
in
//
case+ tnd of
//
| T_LOCAL() => let
    val () =
      buf.incby1()
    // end of [val]
    val tbeg = tok
    val head =
    fp_d0eclseq(f0, buf, err)
    val tmid = popt_IN(buf, err)
    val body =
    fp_d0eclseq(f0, buf, err)
    val tend = p_ENDLOCAL(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Clocal(tbeg, head, tmid, body, tend))
  end // end of [T_LOCAL]
//
| T_ABSSORT() => let
    val () =
      buf.incby1()
    val tid =
      p_s0tid(buf, err)
    val loc_res = tok.loc() + tid.loc()
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cabssort(tok, tid))
  end
//
| T_SORTDEF() => let
//
    val () = buf.incby1()
//
    val tid =
      p_s0tid(buf, err)
    val tok1 = p_EQ(buf, err)
    val def2 = p_s0rtdef(buf, err)
    val loc_res = loc+def2.loc()
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Csortdef(tok, tid, tok1, def2)
    ) (* d0ecl_make_node *)
  end
//
(*
sexpdef::
| si0de
  s0margseq
  colons0rtopt EQ s0exp
*)
| T_SEXPDEF(k0) => let
//
    val () = buf.incby1()
//
    val sid =
      p_s0eid(buf, err)
    val s0mas =
      p_s0margseq(buf, err)
    // end of [val]
    val anno =
      popt_sort0_anno(buf, err)
    // end of [val]
    val tok1 = p_EQ(buf, err)
    val s0e0 = p_s0exp(buf, err)
    val loc_res = loc + s0e0.loc()
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Csexpdef
      (tok, sid, s0mas, anno, tok1, s0e0)
    ) (* d0ecl_make_node *)
  end
//
(*
abstype ::=
| si0de
  t0margseq
  colons0rtopt
  [LTEQ/EQEQ s0exp]  
*)
| T_ABSTYPE(k0) => let
//
    val () = buf.incby1()
//
    val sid =
      p_s0eid(buf, err)
    val tmas =
      p_t0margseq(buf, err)
    // end of [val]
    val anno =
      popt_idsort0_anno(buf, err)
    // end of [val]
    val tdef = p_abstdf0(buf, err)
    val loc_res =
    (
    case+ tdef of
    | ABSTDF0some() =>
      (
      case+ tmas of
      | list_nil() => loc+sid.loc()
      | list_cons _ =>
        let
        val t0ma =
        list_last(tmas) in loc+t0ma.loc()
        end // end of [list_cons]
      ) (* ABSTDF0some *)
    | ABSTDF0lteq(_, s0e) => loc+s0e.loc()
    | ABSTDF0eqeq(_, s0e) => loc+s0e.loc()
    ) : loc_t // end of [val]
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Cabstype(tok, sid, tmas, anno, tdef) )
  end
//
| T_ABSOPEN() => let
//
    val () = buf.incby1()
//
    val
    sqid = p_sq0eid(buf, err)
    val
    loc_res = loc + sqid.loc()
//
  in
    err := e0;
    d0ecl_make_node
    (loc_res, D0Cabsopen(tok, sqid))
  end
//
| T_ABSIMPL() => let
//
    val () = buf.incby1()
//
    val sqid =
    p_sq0eid(buf, err)
//
    val smas =
    p_s0margseq(buf, err)
    val res0 =
    popt_sort0_anno(buf, err)
//
    val teq1 = p_EQ(buf, err)
    val def2 = p_s0exp(buf, err)
    val loc_res = loc + def2.loc()
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Cabsimpl(tok, sqid, smas, res0, teq1, def2))
  end // end of [T_ABSIMPL]
//
| T_DATASORT() => let
//
    val () = buf.incby1()
//
    val d0cs =
      p_d0tsortseq_AND(buf, err)
    // end of [val]
    val loc_res =
    (
      case+ d0cs of
      | list_nil() => loc
      | list_cons _ =>
        let
        val d0c =
        list_last(d0cs) in loc+d0c.loc()
        end
    ) : loc_t // end of [val]
  in
    err := e0;
    d0ecl_make_node
      ( loc_res, D0Cdatasort(tok, d0cs) )
    // d0ecl_make_node
  end
//
| T_EXCPTCON() => let
    val () = buf.incby1()
    val opt = popt_BAR(buf, err)
//
    val d0cs =
      p_d0atconseq_BAR(buf, err)
    // end of [val d0cs]
//
    val loc_res =
    (
    case+ d0cs of
    | list_nil() =>
      (
      case+ opt of
      | None() => tok.loc()
      | Some(tok) => tok.loc()
      )
    | list_cons _ => let
        val d0c =
        list_last(d0cs) in tok.loc() + d0c.loc()
      end // end of [list_cons]
    ) : loc_t // end of [val loc_res]
//
  in
    err := e0;
    d0ecl_make_node
      (loc_res, D0Cexcptcon(tok, d0cs))
    // end of [d0ecl_make_node]
  end
| T_DATATYPE(k0) => let
    val () =
    buf.incby1()
    val d0cs =
      p_d0atypeseq_AND(buf, err)
    val tok1 = buf.get0()
    val wopt =
    (
    case+
    tok1.node() of
    | T_WHERE() => let
        val () =
        buf.incby1()
        val topt =
        popt_LBRACE(buf, err)
        val wdcs =
        p_d0eclseq_sta(buf, err)
        val tok2 = buf.get0()
        val ((*void*)) =
        (
        case+
        tok2.node() of
        | T_END() => buf.incby1()
        | T_RBRACE() => buf.incby1()
        | T_ENDWHERE() => buf.incby1()
        | _(*non-closing*) => (err := err+1)
        ) : void // end of [val]
      in
        WD0CSsome(tok1, topt, wdcs, tok2)
      end // end of [T_WHERE]
    | _(*non-WHERE*) => WD0CSnone(*void*)
    ) : wd0eclseq // end of [val]
    val loc_res =
    (
      case+ wopt of
      | WD0CSnone() =>
        (
        case+ d0cs of
        | list_nil() => loc
        | list_cons _ =>
          let
          val d0c =
          list_last(d0cs) in loc+d0c.loc()
          end
        )
      | WD0CSsome(_, _, _, tok) => loc+tok.loc()
    ) : loc_t // end of [val]
  in
    err := e0;
    d0ecl_make_node
      ( loc_res, D0Cdatatype(tok, d0cs, wopt) )
    // d0ecl_make_node
  end
//
| T_VAL _ when f0 > 0 =>
  (
    ptok_valdecl(tok, buf, err)
  )
//
| T_VAR _ when f0 > 0 =>
  (
    ptok_vardecl(tok, buf, err)
  )
//
| T_FUN _ when f0 > 0 =>
  (
    ptok_fundecl(tok, buf, err)
  )
//
| T_IMPLMNT _ =>
  (
    ptok_impdecl(tok, buf, err)
  )
//
| tnd when
  t_dctkind(tnd) =>
  (
    ptok_dynconst(tok, buf, err)
  )
//
| T_SRP_STATIC() => let
    val () =
      buf.incby1()
(*
    val d0c =
      p_d0ecl_sta(buf, err)
*)
    val d0c =
      fp_d0ecl(f0, buf, err)
    // end of [val]
    val loc_res = loc+d0c.loc()
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cstatic(tok, d0c))
  end // end of [T_SRP_STATIC]
//
| T_SRP_EXTERN() => let
//
    val () = buf.incby1()
//
(*
    val d0c =
      p_d0ecl_sta(buf, err)
*)
    val d0c =
      fp_d0ecl(f0, buf, err)
    // end of [val]
    val loc_res = loc+d0c.loc()
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cextern(tok, d0c))
  end // end of [T_SRP_EXTERN]
//
| T_SRP_DEFINE() => let
//
    val () = buf.incby1()
//
    val gid =
      p_g0eid(buf, err)
    val gmas =
      p_g0margseq(buf, err)
    val gdef =
      (p_g0expdef(buf, err))
//
    val loc_res =
    (
      case+ gdef of
      | G0EDEFnone() =>
        (
          case+ gmas of
          | list_nil _ =>
            (
              gid.loc()
            )
          | list_cons _ =>
            (
              gid.loc() + loc_arg
            ) where
            {
              val loc_arg = (list_last(gmas)).loc()
            }
        )
      | G0EDEFsome(opt, g0e) => gid.loc() + g0e.loc()
    ) : loc_t // end of [val]
//
  in
    err := e0;
    d0ecl_make_node
    (loc_res, D0Cdefine(tok, gid, gmas, gdef))
  end // end of [T_SRP_DEFINE]
//
| T_SRP_MACDEF() => let
//
    val () = buf.incby1()
//
    val gid =
      p_g0eid(buf, err)
    val gmas =
      p_g0margseq(buf, err)
    val mdef =
      (p_d0macdef(buf, err))
//
    val loc_res =
    (
      case+ mdef of
      | D0MDEFnone() =>
        (
          case+ gmas of
          | list_nil _ =>
            (
              gid.loc()
            )
          | list_cons _ =>
            (
              gid.loc() + loc_arg
            ) where
            {
              val loc_arg = (list_last(gmas)).loc()
            }
        )
      | D0MDEFsome(opt, def) => gid.loc() + def.loc()
    ) : loc_t // end of [val]
//
  in
    err := e0;
    d0ecl_make_node
    (loc_res, D0Cmacdef(tok, gid, gmas, mdef))
  end // end of [T_SRP_MACDEF]
//
| T_SRP_INCLUDE() => let
    val () = buf.incby1()
    val d0e =
      p_appd0exp(buf, err)
    // end of [val]
    val loc_res = loc+d0e.loc()
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cinclude(tok, d0e))
  end // end of [#INCLUDE(...)]
//
| T_SRP_STALOAD() => let
//
    val () = buf.incby1()
//
    val d0e =
      p_appd0exp(buf, err)
    // end of [val]
    val loc_res = loc+d0e.loc()
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cstaload(tok, d0e))
  end // end of [#STALOAD(...)]
//
| T_SRP_SYMLOAD() => let
//
    val () = buf.incby1()
//
    val sym = p_s0ymb(buf, err)
    val twth = p_WITH(buf, err)
    val dqid = p_dq0eid(buf, err)
//
(*
    val () =
    println!("p_d0ecl: tok = ", tok)
    val () =
    println!("p_d0ecl: sym = ", sym)
    val () =
    println!("p_d0ecl: twth = ", twth)
    val () =
    fprintln!
    (stdout_ref, "p_d0ecl: dqid = ", dqid)
*)
//
    val tint = let
      val tok = buf.get0()
      val tnd = tok.node()
    in
      case+ tnd of
      | T_OF() =>
        (
        Some(p_t0int(buf, err))
        ) where
        {
          val () = buf.incby1()
        }
      | _(*non-OF*) => None(*void*)
    end : t0intopt // end-of-let
//
    val loc_res =
    let
      val loc = tok.loc()
    in
      case+ tint of
      | None() => loc+dqid.loc()
      | Some(int) => loc+int.loc()
    end : location // end of [val]
//
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Csymload(tok, sym, twth, dqid, tint))
  end // end of [#STALOAD(...)]
//
| T_SRP_STACST() => let
//
    val () = buf.incby1()
//
    val sid =
      p_s0eid(buf, err)
    val tmas =
      p_t0margseq(buf, err)
//
    val tok1 = p_CLN(buf, err)
    val s0t2 = p_sort0(buf, err)
//
    val loc_res = loc + s0t2.loc()
//
  in
    err := e0;
    d0ecl_make_node
    (loc_res, D0Cstacst0(tok, sid, tmas, tok1, s0t2))
  end // end of [T_SRP_STACST]
//
| T_SRP_NONFIX() => let
//
    val () = buf.incby1()
//
    val ids =
      p_i0dntseq(buf, err)
    // end of [val]
    val loc_res =
    (
      case+ ids of
      | list_nil() => loc
      | list_cons _ =>
        let
        val id1 = list_last(ids) in loc+id1.loc()
        end // end of [list_cons]
    ) : loc_t // end of [val]
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cnonfix(tok, ids))
  end // end of [NONFIX]
//
| T_SRP_FIXITY(knd) => let
//
    val () = buf.incby1()
//
    val ids =
      p_i0dntseq(buf, err)
    val tok2 = buf.get0()
    val opt2 =
    (
      case+
      tok2.node() of
      | T_OF() =>
        p_precopt
        (buf, err) where
        {
          val () = buf.incby1()
        }
      | _(* non-OF *) => PRECOPTnil()
    ) : precopt // end of [val]
//
    val loc_res =
    (
      case+ ids of
      | list_nil() => loc
      | list_cons _ =>
        let
        val id1 = list_last(ids) in loc + id1.loc()
        end // end of [list_cons]
    ) : loc_t // end of [val]
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cfixity(tok, ids, opt2))
  end // end of [FIXITY(knd)]
//
//
| T_SRP_ELSE() => let
//
    val () = buf.incby1()
    val loc_res = tok.loc()
//
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Celse(tok))
  end
| T_SRP_ENDIF() => let
//
    val () = buf.incby1()
    val loc_res = tok.loc()
//
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cendif(tok))
  end
//  
| T_SRP_IFDEC(knd) => let
//
    val () = buf.incby1()
    val g0e1 = p_g0exp(buf, err)
    val topt = popt_SRP_THEN(buf, err)
//
    val loc_res =
    (
    case+ topt of
    | None() => tok.loc()
    | Some(tok2) => tok.loc() + tok2.loc()
    ) : loc_t // end of [val]
//
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cifdec(tok, g0e1, topt))
  end // end of [SRP_IFDEC(knd)]
| T_SRP_ELSIF(knd) => let
//
    val () = buf.incby1()
    val g0e1 = p_g0exp(buf, err)
    val topt = popt_SRP_THEN(buf, err)
//
    val loc_res =
    (
    case+ topt of
    | None() => tok.loc()
    | Some(tok2) => tok.loc() + tok2.loc()
    ) : loc_t // end of [val]
//
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Celsif(tok, g0e1, topt))
  end // end of [SRP_IFDEC(knd)]
//
| _ (* errorcase *) =>
  let
    val () =
    (err := e0 + 1) in d0ecl_make_node(loc, D0Cnone(tok))
  end // end of [let]
//
end // end of [fp_d0ecl]

end // end of [local]

(* ****** ****** *)

implement
fp_d0eclseq
(f0, buf, err) = let
//
val e0 = err
//
fun
loop
( buf:
 &tokbuf >> _
, err: &int >> _
, res: &ptr? >> List0_vt(d0ecl)
) : void = let
  val x0 = fp_d0ecl(f0, buf, err)
in
  if
  (err = e0)
  then let
    val () =
    (
    res :=
    list_vt_cons{d0ecl}{0}(x0, _)
    )
    val+
    list_vt_cons(_, res1) = res
    val () = loop(buf, err, res1)
    prval ((*folded*)) = fold@(res)
  in
    // nothing
  end // end of [then]
  else let
    val () = err := e0
  in
    res := list_vt_nil((*void*))
  end // end of [else]
end // end of [loop]
//
in
  let
    var res: ptr
  in
    loop(buf, err, res); list_vt2t{d0ecl}(res)
  end
end // (* end of [fp_d0eclseq] *)

(* ****** ****** *)

implement
fptop_d0eclseq
(f0, buf, err) = let
//
fnx
loop1
( buf
: &tokbuf >> _
, err
: &int >> int
, res
: List0_vt(d0ecl)
) : List0_vt(d0ecl) =
let
  val d0c = fp_d0ecl(f0, buf, err)
in
  case+
  d0c.node() of
  | D0Cnone(tok) =>
    (
      case+
      tok.node() of
      | T_EOF() => res
      | _(*non-EOF*) => let
          val loc = tok.loc()
          val n0r = loc.beg_nrow()
        in
          loop2(buf, err, n0r, res)
        end
    )
  | _ (*non-none*) =>
    loop1(buf, err, list_vt_cons(d0c, res))
end // end of [loop]
//
and
loop2
( buf: &tokbuf >> _
, err: &int >> _, n0r: int
, res: d0eclist_vt): d0eclist_vt =
let
  val tok =
  tokbuf_getok0(buf)
  val tnd = tok.node()
in
//
case+ tnd of
| T_EOF() => res
| _(*non-EOF*) => let
    val loc = tok.loc()
    val n1r = loc.beg_nrow()
(*
    val (_) = println! ("n0r = ", n0r)
    val (_) = println! ("n1r = ", n1r)
*)
  in
//
  if
  (n1r <= n0r)
  then let
    val () = buf.incby1()
    val () = err := err + 1
    val d0c =
      d0ecl_make_node(loc, D0Ctokerr(tok))
    // end of [val]
  in
    loop2(buf, err, n0r, list_vt_cons(d0c, res))
  end // end of [then]
  else loop1(buf, err, res) // end of [else]
//
  end // end of [let]
//
end // end of [loop2]
//
in
//
list_vt2t
(list_vt_reverse(loop1(buf, err, list_vt_nil)))
//
end // end of [fp_d0eclseq_top]

(* ****** ****** *)

local
//
#define STATIC 0
#define DYNAMIC 1
//
in
//
implement
p_d0ecl_sta(buf, err) = 
  fp_d0ecl(STATIC, buf, err)
implement
p_d0ecl_dyn(buf, err) = 
  fp_d0ecl(DYNAMIC, buf, err)
//
implement
p_d0eclseq_sta(buf, err) = 
  fp_d0eclseq(STATIC, buf, err)
implement
p_d0eclseq_dyn(buf, err) = 
  fp_d0eclseq(DYNAMIC, buf, err)
//
implement
ptop_d0eclseq_sta(buf, err) = 
  fptop_d0eclseq(STATIC, buf, err)
implement
ptop_d0eclseq_dyn(buf, err) = 
  fptop_d0eclseq(DYNAMIC, buf, err)
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_parsing_dynexp.dats] *)
