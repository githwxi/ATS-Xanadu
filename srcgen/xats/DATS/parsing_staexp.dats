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

#staload
"./../SATS/location.sats"

(* ****** ****** *)

#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/parsing.sats"

(* ****** ****** *)

implement
t_t0int(tnd) =
(
  case+ tnd of
  | T_INT1 _ => true
  | T_INT2 _ => true
  | T_INT3 _ => true
  | _ (* non-INT *) => false
) (* end of [t_t0int] *)

implement
t_t0chr(tnd) =
(
  case+ tnd of
  | T_CHAR_nil _ => true
  | T_CHAR_char _ => true
  | T_CHAR_slash _ => true
  | _ (* non-CHAR *) => false
) (* end of [t_t0chr] *)

implement
t_t0flt(tnd) =
(
  case+ tnd of
  | T_FLOAT1 _ => true
  | T_FLOAT2 _ => true
  | T_FLOAT3 _ => true
  | _ (* non-FLOAT *) => false
) (* end of [t_t0flt] *)

implement
t_t0str(tnd) =
(
  case+ tnd of
  | T_STRING_quote _ => true
  | _ (* non-STRING *) => false
) (* end of [t_t0str] *)

(* ****** ****** *)

implement
p_t0int(buf, err) = let
  val tok = buf.get0()
  val tnd = tok.node()
in
//
if t_t0int(tnd) then
  (buf.incby1(); t0int_some(tok)) else t0int_none(tok)
//
end // end of [p_t0int]

implement
p_t0chr(buf, err) = let
  val tok = buf.get0()
  val tnd = tok.node()
in
//
if t_t0chr(tnd) then
  (buf.incby1(); t0chr_some(tok)) else t0chr_none(tok)
//
end // end of [p_t0chr]

implement
p_t0flt(buf, err) = let
  val tok = buf.get0()
  val tnd = tok.node()
in
//
if t_t0flt(tnd) then
  (buf.incby1(); t0flt_some(tok)) else t0flt_none(tok)
//
end // end of [p_t0flt]

implement
p_t0str(buf, err) = let
  val tok = buf.get0()
  val tnd = tok.node()
in
//
if t_t0str(tnd) then
  (buf.incby1(); t0str_some(tok)) else t0str_none(tok)
//
end // end of [p_t0str]

(* ****** ****** *)

implement
p_l0abl(buf, err) =
let
//
  val e0 = err
  val tok = buf.get0()
//
in
//
  case+
  tok.node() of
  | T_INT1(rep) =>
    (
      buf.incby1(); l0abl_make_int1(tok)
    )
  | T_IDENT_alp(name) =>
    (
      buf.incby1(); l0abl_make_name(tok)
    )
  | _ (* non-INT-IDENT *) =>
    ( err := e0 + 1; l0abl_make_none(tok))
//
end // end of [p_l0abl]

(* ****** ****** *)

implement
t_s0tid(tnd) =
(
case+ tnd of
| T_IDENT_alp _ => true
| T_IDENT_sym _ => true
//
| T_BACKSLASH() => true
//
| _ (* non-IDENT *) => false
) (* end of [t_s0tid] *)

implement
p_s0tid(buf, err) =
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
(*
  | T_AT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( "@" )
      val tok = token_make_node(loc, tnd)
    }
*)
//
  | T_BACKSLASH() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
  | _ (* non-IDENT *) =>
    (err := err + 1; i0dnt_none(tok))
//
end // end of [p_s0tid]

(* ****** ****** *)

implement
t_s0eid(tnd) =
(
case+ tnd of
//
| T_IDENT_alp _ => true
| T_IDENT_sym _ => true
//
| T_IDENT_dlr _ => true
//
| T_LT() => true // "<"
| T_GT() => true // ">"
//
(*
| T_EQGT() => true // "=>"
*)
//
| T_BACKSLASH() => true
//
| _ (* non-IDENT *) => false
) (* end of [t_s0eid] *)

implement
p_s0eid(buf, err) =
let
//
val tok = buf.get0()
val tnd = tok.node()
//
in
  case+ tnd of
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
  | T_IDENT_dlr _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
(*
  | T_AT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( "@" )
      val tok = token_make_node(loc, tnd)
    }
*)
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
  | T_BACKSLASH() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
//
(*
  | T_EQGT() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
      val loc = tok.loc((*void*))
      val tnd = T_IDENT_sym( "=>" )
      val tok = token_make_node(loc, tnd)
    }
*)
//
  | _ (* non-IDENT *) =>
    (err := err + 1; i0dnt_none(tok))
end // end of [p_s0eid]

(* ****** ****** *)
//
(*
atmsort0::
//
  | s0tid
  | qualid atmsort0
  | ( sort0seq_COMMA )
//
atmsort0seq::
  | {atmsort0}+
//
sort0seq_COMMA::
  | sort0, ... , sort0
//
*)
//
extern
fun
p_atmsort0: parser(sort0)
extern
fun
p_atmsort0seq: parser(sort0lst)
extern
fun
p_sort0seq_COMMA: parser(sort0lst)
//
(* ****** ****** *)

local

static
fun
p_napps: parser(sort0)
implement
p_napps(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  err := e0 + 1;
  sort0_make_node(tok.loc(), S0Tnone(tok))
end // end of [p_napps]

in (* in-of-local *)

implement
p_sort0
  (buf, err) = let
//
val s0ts0 =
p_atmsort0seq(buf, err)
//
in
//
case+ s0ts0 of
| list_nil
    ((*void*)) => p_napps(buf, err)
| list_cons
    (s0t0, s0ts1) =>
  (
    case+ s0ts1 of
    | list_nil() => s0t0
    | list_cons _ => let
        val s0t1 = list_last(s0ts1)
      in
        sort0_make_node
        (s0t0.loc()+s0t1.loc(), S0Tapps(s0ts0))
      end // end of [list_cons]
  ) (* end of [list_cons] *)
//
end // end of [p_sort0]

end // end of [local]

(* ****** ****** *)

implement
p_atmsort0
  (buf, err) = let
//
val e0 = err
val tok0 = buf.get0()
//
(*
val () =
println!
("p_atmsort0: e0 = ", e0)
val () =
println!
("p_atmsort0: tok0 = ", tok0)
*)
//
in
//
case+
tok0.node() of
//
| tnd when t_s0tid(tnd) =>
  let
    val id = p_s0tid(buf, err)
  in
    err := e0;
    sort0_make_node(id.loc(), S0Tid(id))
  end // end of [t_s0tid]
//
| T_LPAREN() => let
    val () = buf.incby1()
    val s0ts =
      p_sort0seq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok0
    val tend = p_RPAREN(buf, err)
  in
    err := e0;
    sort0_make_node
    ( loc_res
    , S0Tlist(tbeg, s0ts, tend)) where
    {
      val loc_res = tbeg.loc()+tend.loc()
    }
  end // end of [T_LPAREN]
//
| T_IDENT_qual _ => let
    val () = buf.incby1()
    val s0t0 = p_atmsort0(buf, err)
  in
    err := e0;
    sort0_make_node
    (loc_res, S0Tqual(tok0, s0t0)) where
    {
      val loc_res = tok0.loc()+s0t0.loc()
    }
  end // end of [T_IDENT_qual]
//
| _ (* error *) => let
    val () = (err := e0 + 1)
  in
    sort0_make_node(tok0.loc(), S0Tnone(tok0))
  end // HX: indicating a parsing error
//
end // end of [p_atmsort0]
//
(* ****** ****** *)

implement
p_atmsort0seq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{sort0}(buf, err, p_atmsort0))
//
) (* end of [p_atmsort0seq] *)

(* ****** ****** *)

implement
p_sort0seq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{sort0}(buf, err, p_sort0))
//
) (* end of [p_sort0seq_COMMA] *)

(* ****** ****** *)
//
(*
s0rtcon::
| s0eid [OF sort0]
*)
extern
fun
p_s0rtcon: parser(s0rtcon)
extern
fun
p_s0rtconseq_BAR: parser(s0rtconlst)
//
implement
p_s0rtcon
  (buf, err) = let
//
val e0 = err
//
val id =
  p_s0eid(buf, err)
//
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
| T_OF() => let
    val () = buf.incby1()
    val s0t = p_sort0(buf, err)
    val loc_res = id.loc()+s0t.loc()
  in
    err := e0;
    s0rtcon_make_node
    (loc_res, S0RTCON(id, Some(s0t)))
  end // end of [T_OF]
| _ (* non-OF *) =>
  ( err := e0;
    s0rtcon_make_node
    (id.loc(), S0RTCON(id, None(*void*)))
  )
//
end // end of [p_s0rtcon]
//
(* ****** ****** *)

implement
p_s0rtconseq_BAR
  (buf, err) =
(
//
list_vt2t
(pstar_BAR_fun{s0rtcon}(buf, err, p_s0rtcon))
//
) (* end of [p_s0rtconseq_BAR] *)

(* ****** ****** *)

implement
p_d0tsort
  (buf, err) = let
//
val e0 = err
//
val tid =
  p_s0tid(buf, err)
//
val tok = p_EQ(buf, err)
val opt = popt_BAR(buf, err)
val s0cs =
  p_s0rtconseq_BAR(buf, err)
//
val loc_res =
(
case+ s0cs of
| list_nil() =>
  (
  case+ opt of
  | None() => tid.loc() + tok.loc()
  | Some(tok) => tid.loc() + tok.loc()
  ) (* end of [list_nil] *)
| list_cons _ => let
    val s0c =
    list_last(s0cs) in tid.loc() + s0c.loc()
  end // end of [list_cons]
) : loc_t // end of [val]
//
in
//
  err := e0;
  d0tsort_make_node
  (loc_res, D0TSORT(tid, tok, s0cs))
//
end // end of [p_d0tsort]

(* ****** ****** *)

implement
p_d0tsortseq_AND
  (buf, err) =
(
//
list_vt2t
(pstar_AND_fun{d0tsort}(buf, err, p_d0tsort))
//
) (* end of [p_d0tsortseq_AND] *)

(* ****** ****** *)

extern
fun
p_s0expseq_SEMICOLON: parser(s0explst)

(* ****** ****** *)

implement
p_s0rtdef
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
| T_LBRACE() => let
    val () = buf.incby1()
    val tbeg = tok
    val s0a0 =
      p_s0arg(buf, err)
    val tok1 = p_BAR(buf, err)
    val s0es = p_s0expseq_SEMICOLON(buf, err)
    val tend = p_RBRACE(buf, err)
  in
    err := e0;
    s0rtdef_make_node
    ( tbeg.loc()+tend.loc()
    , S0RTDEFsubset(tbeg, s0a0, tok1, s0es, tend)
    )
  end // end of [LBRACE]
| _(* non-LBRACE *) =>
  let
    val s0t = p_sort0(buf, err)
  in
    err := e0;
    s0rtdef_make_node(s0t.loc(), S0RTDEFsort(s0t))
  end // end of [non-LBRACE]
//
end // end of [p_s0rtdef]

(* ****** ****** *)
//
extern
fun
t_s0aid(tnode): bool
extern
fun
p_s0aid: parser(s0eid)
//
implement
t_s0aid(tnd) =
(
case+ tnd of
| T_IDENT_alp _ => true
| _(*non-IDENT-alp*) => false
)
//
implement
p_s0aid
  (buf, err) = let
//
  val tok = buf.get0()
  val tnd = tok.node()
//
in
//
  case+ tnd of
  | T_IDENT_alp _ =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
  | _ (*non-IDENT-alp*) =>
      (err := err + 1; i0dnt_none(tok))
//
end // end of [p_s0aid]
//
(* ****** ****** *)
//
extern
fun
p_s0aidseq_COMMA: parser(i0dntlst)
//
implement
p_s0aidseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{s0eid}(buf, err, p_s0aid))
//
) (* end of [p_s0aidseq_COMMA] *)
//
(* ****** ****** *)
//
extern
fun
p_s0argseq_COMMA: parser(s0arglst)
//
(* ****** ****** *)

implement
p_s0arg
  (buf, err) = let
//
val e0 = err
val id = p_s0aid(buf, err)
//
in
//
if
(
err = e0
)
then let
val
tok = buf.get0()
in
//
case+
tok.node() of
| T_COLON() => let
    val () = buf.incby1()
    val
    s0t = p_sort0(buf, err)
    val
    loc = id.loc() + s0t.loc()
  in
    err := e0;
    s0arg_make_node
    ( loc
    , S0ARGsome(id, Some(s0t))
    )
  end // end of [T_COLON]
| _ (*non-COLON*) =>
  (
    s0arg_make_node
    ( id.loc()
    , S0ARGsome(id, None(*void*)))
  ) (* end of [non-COLON] *)
//
end // end of [then]
else
(
//
s0arg_make_node
  (id.loc(), S0ARGsome(id, None()))
//
) (* end of [else] *)
//
end // end of [p_s0arg]

(* ****** ****** *)

implement
p_s0argseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{s0arg}(buf, err, p_s0arg))
//
) (* end of [p_s0argseq_COMMA] *)

(* ****** ****** *)

implement
p_s0marg
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
    val s0as =
      p_s0argseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_RPAREN(buf, err)
(*
    val () =
    println! ("p_s0marg: s0as = ", s0as)
*)
  in
    err := e0;
    s0marg_make_node
    ( loc_res
    , S0MARGlist(tbeg, s0as, tend)
    ) where
    {
      val
      loc_res = tbeg.loc() + tend.loc()
    } // s0marg_make_node
  end // end of [T_LPAREN]
//
| _ when
    t_s0aid(tnd) => let
    val id = p_s0aid(buf, err)
  in
    err := e0;
    s0marg_make_node(id.loc(), S0MARGsing(id))
  end
//
| _ (*non-LPAREN*) =>
  let
    val () = (err := e0 + 1)
  in
    s0marg_make_node(tok.loc(), S0MARGnone(tok))
  end // end of [non-LPAREN]
//
(*
  let
    val id = p_s0aid(buf, err)
  in
    if
    (err = e0)
    then let
      val tok = buf.get0()
    in
      case+
      tok.node() of
      | T_COLON() => let
          val () = buf.incby1()
          val
          s0t = p_atmsort0(buf, err)
          val
          s0a =
          s0arg_make_node
          ( loc_res
          , S0ARGsome(id, Some(s0t))
          ) where
          {
            val
            loc_res = id.loc() + s0t.loc()
          }
        in
          s0marg_make_node
            (s0a.loc(), S0MARGsing(s0a))
          // s0marg_make_node
        end // end of [T_COLON]
      | _ (*non-COLON*) => s0marg_make_s0eid(id)
    end // end of [then]
    else s0marg_make_s0eid(id)
  end // end of [non-LPAREN]
*)
//
end // end of [p_s0marg]

(* ****** ****** *)
//
implement
p_s0margseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{s0marg}(buf, err, p_s0marg))
//
) (* end of [p_s0margseq] *)
//
(* ****** ****** *)
//
(*
t0arg ::
  | [s0aid COLON] sort0
*)
extern
fun
p_t0arg: parser(t0arg)
extern
fun
p_t0argseq_COMMA: parser(t0arglst)
//
(* ****** ****** *)

implement
p_t0arg
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
    val s0t = p_sort0(buf, err)
    val loc_res = tok0.loc() + s0t.loc()
  in
    err := e0;
    t0arg_make_node
    (loc_res, T0ARGsome(s0t, Some(tok0)))
  end // end of [COLON]
| _(*non-COLON*) => let
    val () =
      buf.set_mark(mark)
    // end of [val]
    val s0t = p_sort0(buf, err)
  in
    err := e0;
    t0arg_make_node
    (s0t.loc(), T0ARGsome(s0t, None(*void*)))
  end // end of [non-COLON]
//
end // end of [p_t0arg]

(* ****** ****** *)
//
implement
p_t0argseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{t0arg}(buf, err, p_t0arg))
//
) (* end of [p_t0argseq_COMMA] *)
//
(* ****** ****** *)

implement
p_t0marg
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
    val t0as =
      p_t0argseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_RPAREN(buf, err)
(*
    val () =
    println! ("p_t0marg: t0as = ", t0as)
*)
  in
    err := e0;
    t0marg_make_node
    ( loc_res
    , T0MARGlist(tbeg, t0as, tend)
    ) where
    {
      val
      loc_res = tbeg.loc() + tend.loc()
    } // t0marg_make_node
  end // end of [T_LPAREN]
//
| _ (*non-LPAREN*) =>
  let
    val () = (err := e0 + 1)
  in
    t0marg_make_node(tok.loc(), T0MARGnone(tok))
  end // end of [non-LPAREN]
//
end // end of [p_t0marg]

(* ****** ****** *)
//
implement
p_t0margseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{t0marg}(buf, err, p_t0marg))
//
) (* end of [p_t0margseq] *)
//
(* ****** ****** *)

implement
popt_sort0_anno
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
//
(*
val ((*void*)) =
println!
("popt_sort0_anno: tok = ", tok)
*)
//
in (* in-of-let *)
//
case+
tok.node() of
| T_COLON() => let
    val () = buf.incby1()
    val s0t = p_sort0(buf, err)
  in
    let
      val () = err := e0 in Some(s0t)
    end
  end // end of [T_COLON]
| _(*non-COLON*) => None(*void*)
//
end // end of [popt_sort0_anno]

(* ****** ****** *)

(*
atms0exp ::
//
  | t0int
  | t0chr
  | t0flt
  | t0str
//
  | f0loat
  | s0tring
//
  | s0eid
  | qualid atm0exp
//
  | ( s0expseq_COMMA )
  | ( s0expseq_COMMA | s0expseq_COMMA )
//
  | TUPLE( s0expseq_COMMA )
  | TUPLE( s0expseq_COMMA | s0expseq_COMMA )
//
  | RECORD{ labs0expseq_COMMA }
  | RECORD{ labs0expseq_COMMA | labs0expseq_COMMA }
//
*)
extern
fun
p_atms0exp : parser(s0exp)
//
extern
fun
p_atms0expseq : parser(s0explst)
//
extern
fun
p_s0expseq_COMMA : parser(s0explst)
extern
fun
p_labs0expseq_COMMA : parser(labs0explst)
//
(*
s0exp_RPAREN ::=
  | RPAREN
  | BAR s0expseq_COMMA RPAREN
labs0exp_RBRACE ::=
  | RPAREN
  | BAR labs0expseq_COMMA RBRACE
*)
extern
fun
p_s0exp_RPAREN : parser(s0exp_RPAREN)
extern
fun
p_labs0exp_RBRACE : parser(labs0exp_RBRACE)
//
(* ****** ****** *)

local

static
fun
p_napps: parser(s0exp)
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
| T_LAM(k0) => let
//
    val () = buf.incby1()
    val s0mas =
      p_s0margseq(buf, err)
    // end of [val]
    val anno =
      popt_sort0_anno(buf, err)
    // end of [val]
    val tok1 = p_EQGT(buf, err)
    val s0e0 = p_s0exp(buf, err)
    val loc_res = tok.loc() + s0e0.loc()
//
(*
    val () =
      println! ("p_s0exp: err = ", err)
    val () =
      println! ("p_s0exp: tok = ", tok)
    val () =
      println! ("p_s0exp: s0mas = ", s0mas)
    val () =
      println! ("p_s0exp: anno = ", anno)
    val () =
      println! ("p_s0exp: tok1 = ", tok1)
    val () =
      println! ("p_s0exp: s0e0 = ", s0e0)
*)
//
  in
    err := e0;
    s0exp_make_node
    ( loc_res
    , S0Elam(tok, s0mas, anno, tok1, s0e0)
    )
  end // end of [T_LAM]
//
| _ (* error *) =>
  ( err := e0 + 1;
    s0exp_make_node(tok.loc(), S0Enone(tok))
  ) (* end-of-error *)
end // end of [p_napps]

in (* in-of-local *)

implement
p_s0exp(buf, err) = let
//
  val e0 = err
  val s0es0 =
  p_atms0expseq(buf, err)
//
in
//
case+ s0es0 of
| list_nil
    ((*void*)) => p_napps(buf, err)
| list_cons
    (s0e0, s0es1) =>
  (
    case+ s0es1 of
    | list_nil() => s0e0
    | list_cons _ => let
        val s0e1 = list_last(s0es1)
      in
        s0exp_make_node
        (s0e0.loc()+s0e1.loc(), S0Eapps(s0es0))
      end // end of [list_cons]
  ) (* end of [list_cons] *)
//
end // end of [p_s0exp]

end // end of [local]

(* ****** ****** *)

implement
p_labs0exp
  (buf, err) = let
//
val e0 = err
//
val l0 =
(
  p_l0abl(buf, err)
)
val tok = p_EQ(buf, err)
val s0e = p_s0exp(buf, err)
//
(*
val ((*void*)) =
println! ("p_labs0exp: l0 = ", l0)
val ((*void*)) =
println! ("p_labs0exp: tok = ", tok)
val ((*void*)) =
println! ("p_labs0exp: s0e = ", s0e)
*)
//
in
  err := e0; SL0ABELED(l0, tok, s0e)
end // end of [p_labs0exp]

(* ****** ****** *)

implement
p_atms0exp
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
| _ when t_s0eid(tnd) =>
  let
    val id = p_s0eid(buf, err)
  in
    err := e0;
    s0exp_make_node(id.loc(), S0Eid(id))
  end // end of [t_s0eid]
//
| _ when t_t0int(tnd) =>
  let
    val i0 = p_t0int(buf, err)
  in
    err := e0;
    s0exp_make_node(i0.loc(), S0Eint(i0))
  end // end of [t_t0int]
| _ when t_t0chr(tnd) =>
  let
    val c0 = p_t0chr(buf, err)
  in
    err := e0;
    s0exp_make_node(c0.loc(), S0Echr(c0))
  end // end of [t_t0chr]
| _ when t_t0flt(tnd) =>
  let
    val c0 = p_t0flt(buf, err)
  in
    err := e0;
    s0exp_make_node(c0.loc(), S0Eflt(c0))
  end // end of [t_t0flt]
| _ when t_t0str(tnd) =>
  let
    val c0 = p_t0str(buf, err)
  in
    err := e0;
    s0exp_make_node(c0.loc(), S0Estr(c0))
  end // end of [t_t0str]
//
| T_LPAREN() => let
    val () = buf.incby1()
    val s0es =
      p_s0expseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_s0exp_RPAREN(buf, err)
  in
    err := e0;
    s0exp_make_node
    ( loc_res
    , S0Eparen(tbeg, s0es, tend)) where
    {
      val loc_res =
        tbeg.loc()+s0exp_RPAREN_loc(tend)
      // end of [val]
    }
  end // end of [T_LPAREN]
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
    s0exp_make_node
    (loc_res, S0Eforall(tbeg, s0qs, tend))
  end // end of [T_LBRACE]
| T_LBRACK() => let
    val () = buf.incby1()
    val s0qs =
      p_s0quaseq_BARSEMI(buf, err)
    val tnd = T_EXISTS(0)
    val loc = tok.loc((*void*))
    val tbeg =
      token_make_node(loc, tnd)
    val tend = p_RBRACK(buf, err)
    val loc_res = loc + tend.loc()
  in
    err := e0;
    s0exp_make_node
    (loc_res, S0Eexists(tbeg, s0qs, tend))
  end // end of [T_LBRACK]
| T_EXISTS(k0) => let
    val () = buf.incby1()
    val s0qs =
      p_s0quaseq_BARSEMI(buf, err)
    val tbeg = tok
    val tend = p_RBRACK(buf, err)
    val loc_res = tbeg.loc() + tend.loc()
  in
    err := e0;
    s0exp_make_node
    (loc_res, S0Eexists(tbeg, s0qs, tend))
  end // end of [T_EXISTS]
//
| T_TUPLE(k0) => let
    val () = buf.incby1()
    val topt =
    ( if
      (k0 <= 1)
      then None()
      else Some(p_LPAREN(buf, err))
    ) : tokenopt // end of [val]
    val s0es =
      p_s0expseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_s0exp_RPAREN(buf, err)
  in
    err := e0;
    s0exp_make_node
    ( loc_res
    , S0Etuple
      (tbeg, topt, s0es, tend)) where
    {
      val loc_res =
        tbeg.loc()+s0exp_RPAREN_loc(tend)
      // end of [val]
    }
  end // end of [T_TUPLE]
| T_RECORD(k0) => let
    val () = buf.incby1()
    val topt =
    ( if
      (k0 <= 1)
      then None()
      else Some(p_LBRACE(buf, err))
    ) : tokenopt // end of [val]
    val ls0es =
      p_labs0expseq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok
    val tend = p_labs0exp_RBRACE(buf, err)
  in
    err := e0;
    s0exp_make_node
    ( loc_res
    , S0Erecord
      (tbeg, topt, ls0es, tend)) where
    {
      val loc_res =
        tbeg.loc()+labs0exp_RBRACE_loc(tend)
      // end of [val]
    }
  end // end of [T_RECORD]
//
(*
| T_LBRACKET() => let
    val () = buf.incby1()
    val s0es =
      p_s0expseq_COMMA(buf, err)
    val tbeg = tok
    val tend = p_RBRACKET(buf, err)
    val loc_res = tbeg.loc()+tend.loc()
  in
    err := e0;
    s0exp_make_node
      (loc_res, S0Ebrack(tbeg, s0es, tend))
    // end of [s0exp_make_node]
  end // end of [T_LBRACKET]
*)
//
| T_IDENT_qual _ => let
    val () = buf.incby1()
    val s0e0 = p_atms0exp(buf, err)
  in
    err := e0;
    s0exp_make_node
    (loc_res, S0Equal(tok, s0e0)) where
    {
      val loc_res = tok.loc()+s0e0.loc()
    }
  end // end of [T_IDENT_qual]
//
| _ (* error *) => let
    val () = (err := e0 + 1)
  in
    s0exp_make_node(tok.loc(), S0Enone(tok))
  end // HX: indicating a parsing error
//
end // end of [p_atms0exp]

(* ****** ****** *)

implement
p_atms0expseq
  (buf, err) =
(
//
list_vt2t
(pstar_fun{s0exp}(buf, err, p_atms0exp))
//
) (* end of [p_atms0expseq] *)

(* ****** ****** *)

implement
p_s0expseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{s0exp}(buf, err, p_s0exp))
//
) (* end of [p_s0expseq_COMMA] *)

implement
p_labs0expseq_COMMA
  (buf, err) =
(
//
list_vt2t
(pstar_COMMA_fun{labs0exp}(buf, err, p_labs0exp))
//
) (* end of [p_s0expseq_COMMA] *)

(* ****** ****** *)

implement
p_s0expseq_SEMICOLON
  (buf, err) =
(
//
list_vt2t
(pstar_SEMICOLON_fun{s0exp}(buf, err, p_s0exp))
//
) (* end of [p_s0expseq_SEMICOLON] *)

(* ****** ****** *)

implement
p_s0exp_RPAREN
  (buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
  val tnd1 = tok1.node()
in
//
case+ tnd1 of
| T_BAR() => let
    val () = buf.incby1()
    val s0es =
      p_s0expseq_COMMA(buf, err)
    val tok2 = p_RPAREN(buf, err)
  in
    err := e0;
    s0exp_RPAREN_cons1(tok1, s0es, tok2)
  end // end of [T_BAR]
| _ (* non-BAR *) =>
  (
    case+ tnd1 of
    | T_RPAREN() => let
        val () = buf.incby1()
      in
        err := e0; s0exp_RPAREN_cons0(tok1)
      end // end of [RPAREN]
    | _(*non-RPAREN*) =>
      (
        err := e0 + 1; s0exp_RPAREN_cons0(tok1)
      ) (* end of [non-RPAREN *)
  )
//
end // end of [p_s0exp_RPAREN]

implement
p_labs0exp_RBRACE
  (buf, err) = let
  val e0 = err
  val tok1 = buf.get0()
  val tnd1 = tok1.node()
in
//
case+ tnd1 of
| T_BAR() => let
    val () = buf.incby1()
    val ls0es =
    p_labs0expseq_COMMA(buf, err)
    val tok2 = p_RBRACE(buf, err)
  in
    err := e0;
    labs0exp_RBRACE_cons1(tok1, ls0es, tok2)
  end // end of [T_BAR]
| _ (* non-BAR *) =>
  (
    case+ tnd1 of
    | T_RBRACE() => let
        val () = buf.incby1()
      in
        err := e0; labs0exp_RBRACE_cons0(tok1)
      end // end of [RBRACE]
    | _(*non-RPAREN*) =>
      (
        err := e0 + 1; labs0exp_RBRACE_cons0(tok1)
      ) (* end of [non-RPAREN] *)
  )
//
end // end of [p_labs0exp_RBRACE]

(* ****** ****** *)

implement
p_s0qua
  (buf, err) = let
//
val e0 = err
val tok = buf.get0()
val tnd = tok.node()
//
in
//
case+ tnd of
| _ when
    t_s0aid(tnd) => let
    val id0 = p_s0aid(buf, err)
    val tok1 = buf.get0()
    val tnd1 = tok1.node()
  in
    case+ tnd1 of
//
    | T_COLON() => let
        val ids = list_sing(id0)
        val tok2 = p_COLON(buf, err)
        val s0t0 = p_sort0(buf, err)
        val loc_res = id0.loc() + s0t0.loc()
      in
        err := e0;
        s0qua_make_node
        (loc_res, S0QUAvars(ids, tok2, s0t0))
      end // end of [T_COLON]
//
    | T_COMMA() => let
        val () = buf.incby1()
        val ids =
          p_s0aidseq_COMMA(buf, err)
        // end of [val]
        val ids = list_cons(id0, ids)
        val tok2 = p_COLON(buf, err)
        val s0t0 = p_sort0(buf, err)
        val loc_res = id0.loc() + s0t0.loc()
      in
        err := e0;
        s0qua_make_node
        (loc_res, S0QUAvars(ids, tok2, s0t0))
      end // end of [T_COMMA]
//
    | _ (*atms0expseq*) => let
        val s0es =
          p_atms0expseq(buf, err)
        // end of [val]
        val loc1 =
        (
          case+ s0es of
          | list_nil() => id0.loc()
          | list_cons _ =>
            let
              val s0e =
              list_last(s0es) in id0.loc()+s0e.loc()
            end // end of [list_cons]
        ) : loc_t // end of [val]
        val s0e0 =
        s0exp_make_node(id0.loc(), S0Eid(id0))
        val s0e1 =
        s0exp_make_node
          (loc1, S0Eapps(list_cons(s0e0, s0es)))
        // end of [val]
      in
        err := e0;
        s0qua_make_node(s0e1.loc(), S0QUAprop(s0e1))
      end // end of [atms0expseq]
  end // end of [S0Eid]
//
| _ (*non-S0Eid*) => let
    val s0e = p_s0exp(buf, err)
  in
    err := e0;
    s0qua_make_node(s0e.loc(), S0QUAprop(s0e))
  end // end of [non-S0Eid]
//
end // end of [p_s0qua]

(* ****** ****** *)

implement
p_s0quaseq_BARSEMI
  (buf, err) =
(
//
list_vt2t
(pstar_BARSEMI_fun{s0qua}(buf, err, p_s0qua))
//
) (* end of [p_s0quaseq_BARSEMI] *)

(* ****** ****** *)

(* end of [xats_parsing_staexp.dats] *)
