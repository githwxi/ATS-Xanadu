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

#staload "./../SATS/filpath.sats"

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
p_CLN
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_CLN() =>
    let val () = buf.incby1() in tok end
  | _ (* non-COLON *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_CLN]

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
p_GTDOT
  (buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_GTDOT() =>
    let val () = buf.incby1() in tok end
  | _ (* non-GTDOT *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_GTDOT]

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
p_OF(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_OF() =>
    let val () = buf.incby1() in tok end
  | _ (* non-OF *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_OF]

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
p_WITH(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_WITH() =>
    let val () = buf.incby1() in tok end
  | _ (* non-WITH *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_WITH]

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

(* ****** ****** *)

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
p_ENDTRY(buf, err) = let
  val e0 = err
  val tok = buf.get0()
in
  case+
  tok.node() of
  | T_END() =>
    let val () = buf.incby1() in tok end
  | T_ENDTRY() =>
    let val () = buf.incby1() in tok end
  | _ (* non-END *) =>
    let val ( ) = (err := e0 + 1) in tok end
end // end of [p_ENDTRY]

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
popt_EQ
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_EQ() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_EQ *)
  | _ (* non-EQ *) => None(*void*)
end // end of [popt_EQ]

(* ****** ****** *)

implement
popt_IN
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_IN() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_IN *)
  | _ (* non-IN *) => None(*void*)
end // end of [popt_IN]

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
popt_SMCLN
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_SMCLN() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_SMCLN *)
  | _ (* non-SMCLN *) => None(*void*)
end // end of [popt_SMCLN]

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

implement
popt_ENDIF
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
(*
  | T_END() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_END *)
*)
  | T_ENDIF() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_ENDIF *)
  | _ (* non-END *) => None(*void*)
end // end of [popt_ENDIF]

implement
popt_ENDCASE
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
(*
  | T_END() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_END *)
*)
  | T_ENDCASE() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_ENDCASE *)
  | _ (* non-END *) => None(*void*)
end // end of [popt_ENDCASE]

(* ****** ****** *)

implement
popt_ENDLAM
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
(*
  | T_END() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_END *)
*)
  | T_ENDLAM() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_ENDLAM *)
  | _ (* non-END *) => None(*void*)
end // end of [popt_ENDLAM]

(* ****** ****** *)

implement
popt_SRP_THEN
  (buf, err) = let
//
  val tok = buf.get0()
//
in
  case+
  tok.node() of
  | T_SRP_THEN() =>
    Some(tok) where
    {
      val () = buf.incby1()
    } (* T_ENDLAM *)
  | _ (* non-END *) => None(*void*)
end // end of [popt_SRP_THEN]

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
pstar_SMCLN_fun
  {a}
(
  buf, err, fpar
) = (
//
pstar_sep_fun
(buf, err, tnode_is_SMCLN, fpar)
//
) (* end of [pstar_SMCLN_fun] *)
//
implement
pstar_BARSMCLN_fun
  {a}
(
  buf, err, fpar
) = (
//
pstar_sep_fun
(buf, err, tnode_is_BARSMCLN, fpar)
//
) (* end of [pstar_BARSMCLN_fun] *)
//
//
(* ****** ****** *)
//
// HX-2018-10-07
// static/dynamic: 0/1
//
implement
parse_from_stdin_toplevel
  (stadyn) =
let
  val inp = stdin_ref
in
//
parse_from_fileref_toplevel
  (stadyn, inp)
//
end
// end of [parser_from_stdin_toplevel]
//
implement
parse_from_fileref_toplevel
  (stadyn, inp) = let
//
val
toks =
fileref_tokenize(inp)
val
toks =
list_vt2t
(lexing_preprocess_tokenlst(toks))
//
(*
val _(*ntok*) =
list_iforeach<token>(toks) where
{
//
implement(env)
list_iforeach$fwork<token><env>
  (i, x, env) =
  println!("TOKEN(", i, ") = ", x)
//
} // end of [where] // end of [val]
*)
//
in
//
let
  var err: int
  var buf: tokbuf
  val ((*void*)) = (err := 0)
  val ((*void*)) = tokbuf_initize_list(buf, toks)
in
  fptop_d0eclseq(stadyn, buf, err)
end
//
end // end of [parse_from_fileref_toplevel]
//
(* ****** ****** *)

implement
parse_from_filpath_toplevel
  (stadyn, fp0) =
(
//
ifcase
|
filpath_is_stdin(fp0) =>
Some_vt(d0cs) where
{
val
d0cs =
parse_from_stdin_toplevel(stadyn)
}
| _(* filename:given *) =>
let
//
val fnm = fp0.full1()
val opt =
fileref_open_opt(fnm, file_mode_r)
//
in
//
case+ opt of
| ~None_vt() =>
   None_vt()
| ~Some_vt(inp) =>
  let
    val d0cs =
    parse_from_fileref_toplevel
      (stadyn, inp)
    val ((*void*)) = fileref_close(inp)
  in
    Some_vt(d0cs)
  end // end of [Some_vt]
//
end
//
) (* parser_from_filpath_toplevel *)

(* ****** ****** *)

(* end of [xats_parsing_basics.dats] *)
