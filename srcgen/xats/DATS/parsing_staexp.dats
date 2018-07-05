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
p_i0nt(buf, err) =
let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_INT1 _ =>
    i0nt_some(tok) where
    {
      val () = buf.incby1()
    }
  | T_INT2 _ =>
    i0nt_some(tok) where
    {
      val () = buf.incby1()
    }
  | T_INT3 _ =>
    i0nt_some(tok) where
    {
      val () = buf.incby1()
    }
  | _ (* non-INT *) =>
    (err := err + 1; i0nt_none(tok))
end // end of [p_i0nt]

(* ****** ****** *)

implement
p_i0dnt(buf, err) =
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
  | _ (* non-IDENT *) =>
    (err := err + 1; i0dnt_none(tok))
end // end of [p_i0dnt]

(* ****** ****** *)

implement
p_s0tid(buf, err) =
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
  | T_BACKSLASH() =>
    i0dnt_some(tok) where
    {
      val () = buf.incby1()
    }
  | _ (* non-IDENT *) =>
    (err := err + 1; i0dnt_none(tok))
end // end of [p_s0tid]

(* ****** ****** *)

implement
p_s0qua(buf, err) =
let
  val mark =
  tokbuf_get_mark(buf)
  val tok0 = buf.get1()
in
//
case+
tok0.node() of
| T_IDENT_dlr _ =>
  (
  case+
  tok1.node() of
  | T_DOT() =>
    (
    s0qua_symdot(tok0, tok1)
    ) where
    {
      val () = buf.clear_mark(mark)
    }
  | _ (*non-DOT*) =>
    let
    val () =
    buf.set_mark(mark) in s0qua_none(tok0)
    end
  ) where
  {
    val tok1 = tokbuf_getok1(buf)
  }
| _ (*non-IDENT_dlr*) =>
  let
    val () =
    buf.set_mark(mark) in s0qua_none(tok0)
  end // end of [non-IDENT_dlr]
//
end // end of [p_s0qua]

(* ****** ****** *)
//
extern
fun
p_atmsort0 : parser(sort0)
extern
fun
p_atmsort0seq : parser(sort0lst)
extern
fun
p_sort0seq_COMMA : parser(sort0lst)
//
(* ****** ****** *)

implement
p_sort0(buf, err) =
let
  val s0ts0 =
  p_atmsort0seq(buf, err)
in
//
case+ s0ts0 of
| list_nil
    ((*void*)) => let
    val tok = buf.get0()
  in
    sort0_make_node
    (tok.loc(), SORT0none(tok))
  end // end of [list_nil]
| list_cons
    (s0t0, s0ts1) =>
  (
    case+ s0ts1 of
    | list_nil() => s0t0
    | list_cons _ => let
        val s0t1 = list_last(s0ts1)
      in
        sort0_make_node
        (s0t0.loc()+s0t1.loc(), SORT0app(s0ts0))
      end // end of [list_cons]
    // end of [case+]
  )
//
end // end of [p_sort0]

(* ****** ****** *)

implement
p_atmsort0
  (buf, err) = let
//
val e0 = err
val tok0 = buf.get0()
//
in
//
case+
tok0.node() of
//
| T_IDENT_alp _ => let
    val () = buf.incby1()
  in
    sort0_make_node
    (tok0.loc(), SORT0id(i0dnt_some(tok0)))
  end // end of [T_IDENT_alp]
| T_IDENT_sym _ => let
    val () = buf.incby1()
  in
    sort0_make_node
    (tok0.loc(), SORT0id(i0dnt_some(tok0)))
  end // end of [T_IDENT_sym]
//
| T_LPAREN() => let
    val () = buf.incby1()
    val s0ts =
      p_sort0seq_COMMA(buf, err)
    // end of [val]
    val tbeg = tok0
    val tend = p_RPAREN(buf, err)
  in
    sort0_make_node
    (tbeg.loc()+tend.loc(), SORT0list(tbeg, s0ts, tend))
  end // end of [T_LPAREN]
//
| _ (* error *) => let
    val () = err := e0 + 1
  in
    sort0_make_node(tok0.loc(), SORT0none(tok0))
  end // end of [error]
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

(* end of [xats_parsing_staexp.dats] *)
