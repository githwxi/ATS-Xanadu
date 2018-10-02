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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
"./../SATS/location.sats"
//
(* ****** ****** *)

#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/parsing.sats"

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
    val tnd = T_IDENT_sym( "<" )
    val tok = token_make_node(loc, tnd)
  }
| T_GT() => tok where
  {
    val () = buf.incby1()
    val loc = tok.loc((*void*))
    val tnd = T_IDENT_sym( ">" )
    val tok = token_make_node(loc, tnd)
  }
//
| T_EQGT() => tok where
  {
    val () = buf.incby1()
    val loc = tok.loc((*void*))
    val tnd = T_IDENT_sym( "=>" )
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
| T_IDENT_alp _ => true
| T_IDENT_sym _ => true
| T_BACKSLASH() => true
| _ (* non-IDENT *) => false
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
  | T_BACKSLASH() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | _ (* non-IDENT *) =>
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
| T_BACKSLASH() => true
//
| T_LT((*void*)) => true // "<"
| T_GT((*void*)) => true // ">"
//
| T_EQGT((*void*)) => true // ">"
//
| _ (* non-IDENT *) => false
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
      val tnd = T_IDENT_sym( "@" )
      val tok = token_make_node(loc, tnd)
    }
//
  | T_LT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( "<" )
      val tok = token_make_node(loc, tnd)
    }
  | T_GT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( ">" )
      val tok = token_make_node(loc, tnd)
    }
//
  | T_EQGT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( "=>" )
      val tok = token_make_node(loc, tnd)
    }
//
  | T_BACKSLASH() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | _ (* non-IDENT *) =>
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
p_q0argseq_SEMICOLON: parser(q0arglst)
//
(* ****** ****** *)
//
implement
p_q0arg
  (buf, err) = let
//
val e0 = err
//
val ids =
  auxids(buf, err)
//
val tok = buf.get0()
//
val ids =
(
if
isneqz(ids)
then ids else
  list_sing(i0dnt_none(tok))
// end-of-if
) : i0dntlst
//
val opt =
(
case+
tok.node() of
| T_COLON() =>
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
val loc0 =
(
case+ ids of
| list_nil() =>
  (
    tok.loc()
  )
| list_cons _ =>
  let
    val
    id0 = list_last(ids) in id0.loc()
  end // end of [list_cons]
) : loc_t // end of [val]
val loc_res =
(
case+ opt of
| None() => loc0
| Some(s0t) => loc0 + s0t.loc()
) : loc_t // end of [val]
//
in
//
err := e0;
q0arg_make_node(loc_res, Q0ARGsome(ids, opt))
//
end where
{
  fun
  auxids
  ( buf: &tokbuf >> _
  , err: &int >> _): i0dntlst =
  list_vt2t
  (pstar_COMMA_fun{s0eid}(buf, err, p_s0aid))
} (* end of [p_q0arg] *)

(* ****** ****** *)
//
implement
p_q0argseq_SEMICOLON
  (buf, err) =
(
//
list_vt2t
(pstar_SEMICOLON_fun{q0arg}(buf, err, p_q0arg))
//
) (* end of [p_q0argseq_SEMICOLON] *)
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
    val s0qs =
      p_s0quaseq_BARSEMI(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_RBRACE(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    sq0arg_make_node
    (loc_res, SQ0ARGsome(tbeg, s0qs, tend))
  end
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
println! ("p_tq0arg: tok = ", tok)
*)
//
in
//
case+
tok.node() of
//
| T_LT() => let
    val () = buf.incby1()
    val s0es =
    list_vt2t
    (
      pstar_COMMA_fun
      {s0exp}(buf, err, p_apps0exp_NGT)
    )
    val tbeg = tok
    val tend = p_GT(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    ti0arg_make_node
    (loc_res, TI0ARGsome(tbeg, s0es, tend))
  end // end of [T_LT]
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
    val () = buf.incby1()
    val q0as =
      p_q0argseq_SEMICOLON(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_GT(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    tq0arg_make_node
    (loc_res, TQ0ARGsome(tbeg, q0as, tend))
  end
| T_LTGT() => let
    val () = buf.incby1()
    val q0as = list_nil(*void*)
    val tbeg = tok
    val tend = tok
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
in
//
case+
tok1.node() of
| T_COLON() => let
    val () =
    buf.clear_mark(mark)
    val () = buf.incby1()
    val s0e = p_s0exp(buf, err)
    val loc_res = tok0.loc() + s0e.loc()
  in
    err := e0;
    a0typ_make_node
    (loc_res, A0TYPsome(s0e, Some(tok0)))
  end // end of [COLON]
| _(*non-COLON*) => let
    val () =
      buf.set_mark(mark)
    // end of [val]
    val s0e = p_s0exp(buf, err)
  in
    err := e0;
    a0typ_make_node
    (s0e.loc(), A0TYPsome(s0e, None(*void*)))
  end // end of [non-COLON]
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
      p_s0quaseq_BARSEMI(buf, err)
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
    d0pat_make_node(id.loc(), D0Pid(id))
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
    p_s0quaseq_BARSEMI(buf, err)
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
      {s0exp}(buf, err, p_apps0exp_NGT)
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
  | LET d0eclseq IN d0expseq END
//
  | ( d0expseq_COMMA )
  | ( d0expseq_COMMA | d0expseq_COMMA )
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
p_d0expseq: parser(d0explst)
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
(*
d0exp_RPAREN ::=
  | RPAREN
  | BAR d0expseq_COMMA RPAREN
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
popt_d0eclseq_WHERE:
  parser(Option(d0eclseq_WHERE))
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
      (loc_res, D0Eif0(tok, d0e1, d0e2, d0e3, topt))
    // d0exp_make_node
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
    val () = buf.incby1()
    val arg =
      p_f0argseq(buf, err)
    val res =
      p_effs0expopt(buf, err)
    val farrw =
      p_f0unarrow(buf, err)
    val fbody = p_d0exp(buf, err)
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Elam(tok, arg, res, farrw, fbody)
    ) where
    {
      val loc_res = tok.loc()+fbody.loc()
    }
  end 
//
| _ (* error *) =>
  ( err := e0 + 1;
    d0exp_make_node(tok.loc(), D0Enone(tok))
  ) (* end-of-error *)
//
end // end of [p_napps]

in (* in-of-local *)

implement
p_d0exp(buf, err) =
let
  val e0 = err
  val d0es =
    p_atmd0expseq(buf, err)
  // end of [val]
in
//
case+ d0es of
| list_nil
    ((*void*)) =>
    p_napps(buf, err)
  // end of [list_nil]
| list_cons
    (d0e1, d0es2) => let
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
    val opt1 = popt_d0eclseq_WHERE(buf, err)
  in
    case+ opt1 of
    | None() => d0e0
    | Some(d0cs) =>
      (
        d0exp_make_node
        (loc1, D0Ewhere(d0e0, d0cs))
      ) where
      {
        val loc1 =
        (
          case+ d0cs of
          | d0eclseq_WHERE
            (_, _, _, tend) => d0e0.loc() + tend.loc()
        ) : loc_t // end of [val]
      } (* end of [Some] *)
  end (* end of [list_cons] *)
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
p_d0expseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{d0exp}(buf, err, p_d0exp))
//
) (* end of [p_d0expseq] *)

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
| _ when t_d0eid(tnd) =>
  let
    val id = p_d0eid(buf, err)
  in
    err := e0;
    d0exp_make_node(id.loc(), D0Eid(id))
  end // end of [t_d0eid]
//
| _ when t_t0int(tnd) =>
  let
    val i0 = p_t0int(buf, err)
  in
    err := e0;
    d0exp_make_node(i0.loc(), D0Eint(i0))
  end // end of [t_t0int]
| _ when t_t0chr(tnd) =>
  let
    val c0 = p_t0chr(buf, err)
  in
    err := e0;
    d0exp_make_node(c0.loc(), D0Echr(c0))
  end // end of [t_t0chr]
| _ when t_t0flt(tnd) =>
  let
    val c0 = p_t0flt(buf, err)
  in
    err := e0;
    d0exp_make_node(c0.loc(), D0Eflt(c0))
  end // end of [t_t0flt]
| _ when t_t0str(tnd) =>
  let
    val c0 = p_t0str(buf, err)
  in
    err := e0;
    d0exp_make_node(c0.loc(), D0Estr(c0))
  end // end of [t_t0str]
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
    val () = buf.incby1()
    val d0cs =
    p_d0eclseq_dyn(buf, err)
    val tok1 = p_IN(buf, err)
    val d0es =
      p_d0expseq(buf, err)
    val tok2 = p_ENDLET(buf, err)
    val loc_res = tok.loc() + tok2.loc()
  in
    err := e0;
    d0exp_make_node
    ( loc_res
    , D0Elet(tok, d0cs, tok1, d0es, tok2))
  end // end of [T_LET]
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
p_d0exp_RPAREN
  (buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
  val tnd1 = tok1.node()
in
//
case+ tnd1 of
| T_BAR() => let
    val () = buf.incby1()
    val d0es =
      p_d0expseq_COMMA(buf, err)
    val tok2 = p_RPAREN(buf, err)
  in
    err := e0;
    d0exp_RPAREN_cons1(tok1, d0es, tok2)
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

(* ****** ****** *)
//
extern
fun
p_d0gua: parser(d0gua)
extern
fun
p_d0guaseq_AND: parser(d0gualst)
//
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
p_dg0pat: parser(dg0pat)
//
(* ****** ****** *)

implement
p_dg0pat
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
        let
          val d0g =
            list_last(d0gs)
          // end of [val]
        in d0p.loc() + d0g.loc() end
    ) : loc_t // end of [val]
  in
    dg0pat_make_node
      (loc_res, DG0PATgua(d0p, tok, d0gs))
    // end of [dg0pat_make_node]
  end
| _ (* non-WHEN *) =>
    dg0pat_make_node(d0p.loc(), DG0PATpat(d0p))
//
end // end of [p_dg0pat]

(* ****** ****** *)

implement
p_d0clau
  (buf, err) = let
//
val
dgp =
p_dg0pat(buf, err)
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

(*
stadef::
| si0de s0margseq colons0rtopt EQ s0exp
abstype::
| si0de s0margseq colons0rtopt [EQ/EQEQ s0exp]
*)

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

static
fun
p_precopt
 : parser(precopt)
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
| T_INT1 _ =>
  PRECOPTsing(tok) where
  {
    val () = buf.incby1()
  }
| T_LPAREN() => let
    val () = buf.incby1()
    val toks =
      p_idintseq(buf, err)
    // end of [val]
    val tok2 = p_RPAREN(buf, err)
  in
    PRECOPTlist(tok, toks, tok2)
  end
//
| _(*non-INT1-LPAREN*) => PRECOPTnil()
//
end // end of [p_precopt]

static
fun
p_abstdf0
 : parser(abstdf0)
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
| T_IDENT_sym("<=") => let
    val () = buf.incby1()
  in
    ABSTDF0lteq
    (tok, p_s0exp(buf, err))
  end
| T_IDENT_sym("==") => let
    val () = buf.incby1()
  in
    ABSTDF0eqeq
    (tok, p_s0exp(buf, err))    
  end
| _(*non-eq-eqeq*) => ABSTDF0nil()
//
end // end of [p_abstdf0]

(* ****** ****** *)
//
static
fun
p_declmodopt: parser(declmodopt)
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
p_declmodopt
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
| T_COLON() => let
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
        DECLMODlist(tok0, tbeg, ids, tend)
      end // end of [T_LPAREN]
//
    | _(*non-LPAREN*) => let
        val id0 =
          p_i0dnt(buf, err) in DECLMODsing(tok0, id0)
        // end of [val]
      end // end of [non-LPAREN]
//
  end // end of [T_COLON]
//
| _ (* non-COLON *) => DECLMODnone(*void*)
//
end // end of [p_declmodopt]

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
  | EFFS0EXPsome
      (sfe, s0e) => loc+s0e.loc()
    // EFFS0EXPsome
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
val teq = p_EQ(buf, err)
val d0e = p_d0exp(buf, err)
//
val
wopt = p_wths0expopt(buf, err)
//
val loc0 = d0p.loc()
//
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
  (@{loc=loc1,pat=d0p,teq=teq,def=d0e,wtp=wopt})
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
    p_declmodopt(buf, err)
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
val
nam =
p_d0pid(buf, err)
//
val arg =
p_f0argseq(buf, err)
val res =
p_effs0expopt(buf, err)
//
val teq = p_EQ(buf, err)
val d0e = p_d0exp(buf, err)
//
val
wopt = p_wths0expopt(buf, err)
//
val loc0 = nam.loc()
//
val loc1 =
(
case+ wopt of
| WTHS0EXPnone() => loc0+d0e.loc()
| WTHS0EXPsome(_, s0e) => loc0+s0e.loc()
) : loc_t // end-of-val
//
in
  err := e0;
  F0UNDECL
  (@{loc=loc1,nam=nam,arg=arg,res=res,teq=teq,def=d0e,wtp=wopt})
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
    p_declmodopt(buf, err)
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
    p_declmodopt(buf, err)
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
  val f0as =
    p_f0argseq(buf, err)
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
    val () = buf.incby1()
    val tbeg = tok
    val head =
    fp_d0eclseq(f0, buf, err)
    val tmid = p_IN(buf, err)
    val body =
    fp_d0eclseq(f0, buf, err)
    val tend = p_ENDLOCAL(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    d0ecl_make_node
    (loc_res, D0Clocal(tbeg, head, tmid, body, tend))
  end // end of [T_LOCAL]
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
| T_ABSTYPE(k0) => let
//
    val () = buf.incby1()
//
    val sid =
      p_s0eid(buf, err)
    val tmas =
      p_t0margseq(buf, err)
    // end of [val]
    val tdef = p_abstdf0(buf, err)
    val loc_res =
    (
    case+ tdef of
    | ABSTDF0nil() =>
      (
      case+ tmas of
      | list_nil() => loc+sid.loc()
      | list_cons _ => let
        val t0ma =
        list_last(tmas) in loc+t0ma.loc()
        end // end of [list_cons]
      ) (* ABSTDF0nil *)
    | ABSTDF0lteq(_, s0e) => loc+s0e.loc()
    | ABSTDF0eqeq(_, s0e) => loc+s0e.loc()
    ) : loc_t // end of [val]
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Cabstype(tok, sid, tmas, tdef) )
  end
//
| T_ABSIMPL() => let
//
    val () = buf.incby1()
//
    val s0e0 = 
      p_apps0exp_NEQ(buf, err)
    val teq1 = p_EQ(buf, err)
    val def2 = p_s0exp(buf, err)
    val loc_res = loc + def2.loc()
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Cabsimpl(tok, s0e0, teq1, def2))
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
| T_DATATYPE(k0) => let
    val () = buf.incby1()
    val d0cs =
      p_d0atypeseq_AND(buf, err)
    val tok1 = buf.get0()
    val wopt =
    (
    case+
    tok1.node() of
    | T_WHERE() => let
        val () = buf.incby1()
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
    val d0c =
      p_d0ecl_sta(buf, err)
    val loc_res = loc+d0c.loc()
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cstatic(tok, d0c))
  end // end of [T_SRP_STATIC]
//
| T_SRP_EXTERN() => let
    val () =
      buf.incby1()
    val d0c =
      p_d0ecl_sta(buf, err)
    val loc_res = loc+d0c.loc()
  in
    err := e0;
    d0ecl_make_node(loc_res, D0Cextern(tok, d0c))
  end // end of [T_SRP_EXTERN]
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
| T_SRP_STACST () => let
//
    val () = buf.incby1()
    val sid = p_s0eid(buf, err)
    val tok1 = p_COLON(buf, err)
    val s0t2 = p_sort0(buf, err)
    val loc_res = loc + s0t2.loc()
  in
    err := e0;
    d0ecl_make_node
      ( loc_res, D0Cstacst0(tok, sid, tok1, s0t2) )
    // d0ecl_make_node
  end // end of [T_SRP_STACST]
//
| T_SRP_NONFIX () => let
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
    val opt =
      p_precopt(buf, err)
    val ids =
      p_i0dntseq(buf, err)
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
    d0ecl_make_node(loc_res, D0Cfixity(tok, opt, ids))
  end // end of [FIXITY(knd)]
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
      d0ecl_make_node(loc, D0Ctkerr(tok))
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
