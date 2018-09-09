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
| T_INT1 _ =>
  (buf.incby1(); tok)
| T_IDENT_alp _ =>
  (buf.incby1(); tok)
| T_IDENT_sym _ =>
  (buf.incby1(); tok)
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
| T_BACKSLASH() => true
//
| T_LT((*void*)) => true // "<"
| T_GT((*void*)) => true // ">"
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
  | T_BACKSLASH() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
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
  | _ (* non-IDENT *) =>
    (err := err + 1; i0dnt_none(tok))
end // end of [p_d0eid]

(* ****** ****** *)

implement
p_i0dnt
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
in
//
case+
tok.node() of
| tnd
  when
  t_s0eid(tnd) =>
    p_s0eid(buf, err)
| tnd
  when
  t_d0eid(tnd) =>
    p_d0eid(buf, err)
| _ (* non-i0dnt *) =>
    (err := e0 + 1; i0dnt_none(tok))
//
end // end of [p_i0dnt]

(* ****** ****** *)
//
extern
fun
p_i0dntseq: parser(i0dntlst)
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
extern
fun
p_tq0arg: parser(tq0arg)
//
implement
p_tq0arg
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
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
    tq0arg_make_node
    (loc_res, TQ0ARGsome(tbeg, q0as, tend))
  end
| _(* non-LT *) =>
  (
    err := e0 + 1;
    tq0arg_make_node(tok.loc(), TQ0ARGnone())
  )
//
end // end of [p_q0marg]
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
//
in
//
case+
tok.node() of
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
    , D0ARGsome_dyn(tbeg, arg0, opt1, tend))
  end
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
//
list_vt2t
(pstar_fun{d0arg}(buf, err, p_d0arg))
//
) (* end of [p_d0argseq] *)

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
p_atmd0exp : parser(d0exp)
//
extern
fun
p_atmd0expseq : parser(d0explst)
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
  val d0es0 =
  p_atmd0expseq(buf, err)
in
//
case+ d0es0 of
| list_nil
    ((*void*)) => p_napps(buf, err)
  // end of [list_nil]
| list_cons
    (d0e0, d0es1) =>
  (
    case+ d0es1 of
    | list_nil() => d0e0
    | list_cons _ => let
        val d0e1 = list_last(d0es1)
      in
        d0exp_make_node
        (d0e0.loc()+d0e1.loc(), D0Eapps(d0es0))
      end // end of [list_cons]
  ) (* end of [list_cons] *)
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

extern
fun
p_d0expseq: parser(d0explst)
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
| T_LET() => let
    val () = buf.incby1()
    val d0cs =
      p_d0eclseq(buf, err)
    val tok1 = p_IN(buf, err)
    val d0es =
      p_d0expseq(buf, err)
    val tok2 = p_ENDLET(buf, err)
    val loc_res = tok.loc() + tok2.loc()
  in
    err := e0;
    d0exp_make_node
    (loc_res, D0Elet(tok, d0cs, tok1, d0es, tok2))
  end // end of [T_LET]
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
p_atmd0expseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{d0exp}(buf, err, p_atmd0exp))
//
) (* end of [p_atmd0expseq] *)

(* ****** ****** *)

(*
stadef::
| si0de s0margseq colons0rtopt EQ s0exp
abstype::
| si0de s0margseq colons0rtopt [EQ/EQEQ s0exp]
*)

(* ****** ****** *)

local

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


in (* in-of-local *)

implement
p_d0ecl
  (buf, err) = let
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
    val t0mas =
      p_t0margseq(buf, err)
    // end of [val]
    val tdef0 = p_abstdf0(buf, err)
    val loc_res =
    (
    case+ tdef0 of
    | ABSTDF0nil() =>
      (
      case+ t0mas of
      | list_nil() => loc+sid.loc()
      | list_cons _ => let
        val t0ma =
        list_last(t0mas) in loc+t0ma.loc()
        end // end of [list_cons]
      ) (* ABSTDF0nil *)
    | ABSTDF0lteq(_, s0e) => loc+s0e.loc()
    | ABSTDF0eqeq(_, s0e) => loc+s0e.loc()
    ) : loc_t // end of [val]
  in
    err := e0;
    d0ecl_make_node
    ( loc_res
    , D0Cabstype(tok, sid, t0mas, tdef0))
  end
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
          p_d0eclseq(buf, err)
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
| T_LOCAL() => let
    val () = buf.incby1()
    val tbeg = tok
    val head =
      p_d0eclseq(buf, err)
    val tmid = p_IN(buf, err)
    val body =
      p_d0eclseq(buf, err)
    val tend = p_ENDLOCAL(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    d0ecl_make_node
    (loc_res, D0Clocal(tbeg, head, tmid, body, tend))
  end // end of [T_LOCAL]
//
| _ (* errorcase *) =>
  let
    val () = (err := e0 + 1) in d0ecl_make_node(loc, D0Cnone(tok))
  end // end of [let]
//
end // end of [p_d0ecl]

end // end of [local]

(* ****** ****** *)

implement
p_d0eclseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{d0ecl}(buf, err, p_d0ecl))
//
) (* end of [p_d0eclseq] *)

(* ****** ****** *)

implement
p_d0eclseq_top
  (buf, err) = let
//
fnx
loop1
( buf: &tokbuf >> _
, err: &int >> _
, res: d0eclist_vt): d0eclist_vt =
let
  val d0c = p_d0ecl(buf, err)
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
end // end of [p_d0eclseq_top]

(* ****** ****** *)

(* end of [xats_parsing_dynexp.dats] *)
