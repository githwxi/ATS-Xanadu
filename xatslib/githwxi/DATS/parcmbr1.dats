(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
HX-2020-06-30:
for testing type-inference :)
*)
//
(* ****** ****** *)
//
abstbox input(tok:t0)
abstbox parser(tok:t0,res:vt)
//
(* ****** ****** *)

#extern
fun
<tok:t0>
<res:vt>
parser_make
(
P0:
input(tok)
-<cfr>
(input(tok), res)): parser(tok, res)
#extern
fun
<tok:t0>
<res:vt>
parser_apply
( P0: parser(tok, res)
, inp: input(tok)): (input(tok), res)

(* ****** ****** *)

#symload parser with parser_make
#symload papply with parser_apply

(* ****** ****** *)
//
#extern
fun
<tok:t0>
input_getok
(inp: input(tok)): (input(tok), tok)
#extern
fun
<tok:t0>
input_ungetok
(inp: input(tok), tok: tok): input(tok)
//
#extern
fun
<tok:t0>
input_getok_exn
(inp: input(tok)): (input(tok), tok)
#extern
fun
<tok:t0>
input_getok_opt
( inp
: input(tok)): (input(tok), optn_vt(tok))
//
(* ****** ****** *)

#extern
fun
<tok:t0>
parcmbr_getok(): parser(tok,tok)

(* ****** ****** *)
//
typedef
repeat0(res:vt) =
listgte_vt(res, 0)
typedef
repeat1(res:vt) =
listgte_vt(res, 1)
//
#extern
fun
<tok:t0>
<res:vt>
parcmbr_repeat0
( parser(inp,tok,res)
) : parser(tok,repeat0(res))
#extern
fun
<tok:t0>
<res:vt>
parcmbr_repeat1
( parser(tok,res)
) : parser(tok,repeat1(res))
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res:vt>
parcmbr_test
( P0
: parser(tok,res)
, test
: res -<cfr> bool)
: parser( tok,optn_vt(res) )
//
(* ****** ****** *)

impltmp
<tok><res>
parcmbr_test
(P0, test) = parser
(
lam(inp) =>
let
val
(inp, res) =
parser_apply(P0, inp)
in
  if
  test(res)
  then
  (inp, some_vt(res))
  else
  (g_free(res); (inp, none_vt()))
end
) (* end of [parcmbr_satisfy] *)

(* ****** ****** *)

(* end of [parcmbr1.dats] *)
