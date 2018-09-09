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
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/lexing.sats"
#staload "./../SATS/parsing.sats"

(* ****** ****** *)

(*
implement
{}(*tmp*)
synent_null() = $UN.cast(the_null_ptr)
implement
{}(*tmp*)
synent_is_null(x) = iseqz($UN.cast{ptr}(x))
implement
{}(*tmp*)
synent_isnot_null(x) = isneqz($UN.cast{ptr}(x))
*)

(* ****** ****** *)

implement
p_EQ
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_EQ() =>
    let val () = buf.incby1() in tok end
  | _ (* non-EQ *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_EQ]

(* ****** ****** *)

implement
p_GT
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_GT() =>
    let val () = buf.incby1() in tok end
  | _ (* non-GT *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_GT]

(* ****** ****** *)

implement
p_BAR
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_BAR() =>
    let val () = buf.incby1() in tok end
  | _ (* non-BAR *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_BAR]

(* ****** ****** *)

implement
p_EQGT
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_EQGT() =>
    let val () = buf.incby1() in tok end
  | _ (* non-EQ *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_EQGT]

(* ****** ****** *)

implement
p_COLON
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_COLON() =>
    let val () = buf.incby1() in tok end
  | _ (* non-COLON *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_COLON]

(* ****** ****** *)

implement
p_LPAREN
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_LPAREN() =>
    let val () = buf.incby1() in tok end
  | _ (* non-RLAREN *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_LPAREN]
implement
p_RPAREN
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_RPAREN() =>
    let val () = buf.incby1() in tok end
  | _ (* non-RPAREN *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_RPAREN]

(* ****** ****** *)

implement
p_LBRACE
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_LBRACE() =>
    let val () = buf.incby1() in tok end
  | _ (* non-RLRACE *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_LBRACE]
implement
p_RBRACE
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_RBRACE() =>
    let val () = buf.incby1() in tok end
  | _ (* non-RBRACE *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_RBRACE]

(* ****** ****** *)

implement
p_LBRACK
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_LBRACK() =>
    let val () = buf.incby1() in tok end
  | _ (* non-LBRACK *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_LBRACK]
implement
p_RBRACK
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_RBRACK() =>
    let val () = buf.incby1() in tok end
  | _ (* non-RBRACK *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_RBRACK]

(* ****** ****** *)

implement
p_IN(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_IN() =>
    let val () = buf.incby1() in tok end
  | _ (* non-IN *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_IN]

(* ****** ****** *)

implement
p_END(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_END() =>
    let val () = buf.incby1() in tok end
  | _ (* non-END *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_END]

implement
p_ENDLET(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_END() =>
    let val () = buf.incby1() in tok end
  | T_ENDLET() =>
    let val () = buf.incby1() in tok end
  | _ (* non-END *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_ENDLET]

implement
p_ENDWHERE(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_END() =>
    let val () = buf.incby1() in tok end
  | T_ENDWHERE() =>
    let val () = buf.incby1() in tok end
  | _ (* non-END *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_ENDWHERE]

implement
p_ENDLOCAL(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_END() =>
    let val () = buf.incby1() in tok end
  | T_ENDLOCAL() =>
    let val () = buf.incby1() in tok end
  | _ (* non-END *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_ENDLOCAL]

(* ****** ****** *)

implement
popt_BAR
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_BAR() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_BAR *)
  | _ (* non-BAR *) => None(*void*)
end // end of [popt_BAR]

(* ****** ****** *)

implement
popt_LBRACE
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_LBRACE() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_LBRACE *)
  | _ (* non-LBRACE *) => None(*void*)
end // end of [popt_LBRACE]

(* ****** ****** *)
//
(*
fun
pstar_fun
  {a:type}
(
  buf: &tokbuf >> _
, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_fun]
*)
//
implement
pstar_fun
  {a}
(
  buf, err, fpar
) = let
//
val e0 = err
//
fun
loop
( buf:
 &tokbuf >> _
, err: &int >> _
, res: &ptr? >> List0_vt(a)
) : void = let
  val x0 = fpar(buf, err)
in
  if
  (err = e0)
  then let
    val () =
    (
      res :=
      list_vt_cons{a}{0}(x0, _)
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
  let var res: ptr in loop(buf, err, res); res end
end // end of [pstar_fun]
//
(* ****** ****** *)

(*
fun
pstar_sep_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _
, fsep: (tnode) -> bool, fpar: parser(a)
) : List0_vt(a) // end of [pstar_sep_fun]
*)
implement
pstar_sep_fun
  {a}
( buf, err
, fsep, fpar) = let
//
fun
loop
( buf:
 &tokbuf >> _
, err: &int >> _
, res: &ptr? >> List0_vt(a)
) : void = let
  val sep = buf.get0()
in
  if
  fsep(sep.node())
  then let
    val () = buf.incby1()
    val x0 = fpar(buf, err)
    val () =
    (
      res :=
      list_vt_cons{a}{0}(x0, _)
    )
    val+list_vt_cons(_, res1) = res
    val () = loop(buf, err, res1)
    prval ((*folded*)) = fold@(res)
  in
    // nothing
  end // end of [then]
  else (res := list_vt_nil(*void*))
end // end of [loop]
//
val e0 = err
val x0 = fpar(buf, err)
//
in
  if
  (err = e0)
  then let
    var res: ptr
  in
    loop(buf, err, res);
    list_vt_cons(x0, res)
  end // end of [then]
  else let
    val () = (err := e0) in list_vt_nil(*void*)
  end // end of [else]
end // end of [pstar_sep_fun]

(* ****** ****** *)
//
implement
pstar_AND_fun
  {a}
(
  buf, err, fpar
) = (
//
pstar_sep_fun
(buf, err, tnode_is_AND, fpar)
//
) (* end of [pstar_AND_fun] *)
//
implement
pstar_BAR_fun
  {a}
(
  buf, err, fpar
) = (
//
pstar_sep_fun
(buf, err, tnode_is_BAR, fpar)
//
) (* end of [pstar_BAR_fun] *)
//
(* ****** ****** *)
//
implement
pstar_COMMA_fun
  {a}
(
  buf, err, fpar
) = (
//
pstar_sep_fun
(buf, err, tnode_is_COMMA, fpar)
//
) (* end of [pstar_COMMA_fun] *)
//
(* ****** ****** *)
//
implement
pstar_BARSEMI_fun
  {a}
(
  buf, err, fpar
) = (
//
pstar_sep_fun
(buf, err, tnode_is_BARSEMI, fpar)
//
) (* end of [pstar_BARSEMI_fun] *)
//
implement
pstar_SEMICOLON_fun
  {a}
(
  buf, err, fpar
) = (
//
pstar_sep_fun
(buf, err, tnode_is_SEMICOLON, fpar)
//
) (* end of [pstar_SEMICOLON_fun] *)
//
(* ****** ****** *)

(* end of [xats_parsing_basics.dats] *)
