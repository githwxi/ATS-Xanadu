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

implement
{}(*tmp*)
synent_null() = $UN.cast(the_null_ptr)
implement
{}(*tmp*)
synent_is_null(x) = iseqz($UN.cast{ptr}(x))
implement
{}(*tmp*)
synent_isnot_null(x) = isneqz($UN.cast{ptr}(x))

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
in
  let var res: ptr in loop(buf, err, res); res end
end // end of [pstar_sep_fun]

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
(buf, err, fpar, tnode_is_COMMA)
//
) (* end of [pstar_COMMA_fun] *)
//
(* ****** ****** *)

(* end of [xats_parsing_basics.dats] *)
