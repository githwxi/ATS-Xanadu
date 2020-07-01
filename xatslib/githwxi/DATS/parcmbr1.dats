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
//
#extern
fun
<tok:t0>
input_getok
(inp: input(tok)):
(input(tok), optn_vt(tok))
#extern
fun
<tok:t0>
input_ungetok
(inp: input(tok), tok: tok): input(tok)
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res:vt>
parser_make
(
P0:
input(tok)
-<cfr>
( input(tok)
, optn_vt(res))): parser(tok, res)
#extern
fun
<tok:t0>
<res:vt>
parser_apply
( P0
: parser
  (tok, res)
, inp
: input(tok)): (input(tok), optn_vt(res))
//
#symload parser with parser_make
#symload papply with parser_apply
//
(* ****** ****** *)

#extern
fun
<tok:t0>
parcmbr_getok
((*void*)): parser(tok,tok)
impltmp
<tok>
parcmbr_getok() =
parser(lam(inp) => input_getok(inp))

(* ****** ****** *)

#extern
fun
<tok:t0>
<res:vt>
parcmbr_test
( P0
: parser(tok,res)
, test
: res -<cfr> bool): parser(tok, bool)
//
impltmp
<tok><res>
parcmbr_test
(P0, test) = parser
(
lam(inp) =>
let
val
(inp, res) = papply(P0, inp)
in
case+ res of
| ~none_vt() => (inp, none_vt())
| ~some_vt(res) => (inp, some_vt(test(res)))
end // end-of-lam
) (* end of [parcmbr_test] *)
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res1:vt
,res2:vt>
parcmbr_seq2
(
P1: parser(tok,res1)
,
P2: parser(tok,res2)
) : parser(tok, (res1, res2))
#extern
fun
<tok:t0>
<res1:vt
,res2:vt>
<res3:vt>
parcmbr_seq2map
(
P1: parser(tok,res1)
,
P2: parser(tok,res2)
,
f3: (res1,res2) -<cfr> res3): parser(tok, res3)
//
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
(
P0: parser(tok,res)
) : parser(tok,repeat0(res))
#extern
fun
<tok:t0>
<res:vt>
parcmbr_repeat1
(
P0: parser(tok,res)
) : parser(tok,repeat1(res))

(* ****** ****** *)

impltmp
<tok><res>
parcmbr_repeat0
  (P0) = parser_make
(
let
val rez = list_vt_nil()
in
lam(inp) => auxrep(inp, rez)
end
) where
{
//
fun
auxrep
(inp, rez) =
let
val
(inp, opt) = papply(P0, inp)
in
case+ opt of
| ~
none_vt() =>
( inp
, some_vt(list_vt_reverse(rez)))
| ~
some_vt(res) =>
auxrep(inp, list_vt_cons(res, rez))
end
//
} (* end of [parcmbr_repeat0] *)

(* ****** ****** *)
//
impltmp
<tok><res>
parcmbr_repeat1
  (P0) =
(
parcmbr_seq2map
( P0
, parcmbr_repeat0(P0)
, lam(x0, xs) => list_vt_cons(x0, xs)
) (* parcmbr_seqmap2 *)
)
//
(* ****** ****** *)

(* end of [parcmbr1.dats] *)
