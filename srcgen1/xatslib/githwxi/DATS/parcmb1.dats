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
#abstbox
input_tbox(tok:t0)
#abstbox
parser_tbox(tok:t0,res:vt)
//
#sexpdef input = input_tbox
#sexpdef parser = parser_tbox
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
input_make
( xs
: strm(tok)): input(tok)
#extern
fun
<tok:t0>
input_getok
( inp
: input(tok))
: (input(tok), optn_vt(tok))
//
(*
#extern
fun
<tok:t0>
input_ungetok
(inp: input(tok), tok: tok): input(tok)
*)
//
(* ****** ****** *)

local
//
#absimpl
input_tbox
(tok:t0) = strm(tok)
//
in(*in-of-local*)
//
#impltmp
<tok>
input_make(xs) = xs
//
#impltmp
<tok>
input_getok
  (xs) =
(
case+ !xs of
|
strmcon_nil
() => (xs, none_vt())
|
strmcon_cons
(x0, xs) => (xs, some_vt(x0))
)
//
(*#impltmp
<tok>
input_ungetok
  (xs, x0) =
(
  $lazy(strmcon_cons(x0, xs))
)
*)
//
end // end of [local]

(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res:vt>
parser_make
(
cfr:
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

local
//
#absimpl
parser_tbox
( tok:t0
, res:vt) =
(input(tok))
-<cfr>
(input(tok), optn_vt(res))
//
in(*in-of-local*)
//
#impltmp
<tok><res>
parser_make(cfr) = cfr
#impltmp
<tok><res>
parser_apply(cfr, inp) = cfr(inp)
//
end // end of [local]

(* ****** ****** *)
//
#extern
fun
<tok:t0>
parcmb1_input
(xs: strm(tok)): input(tok)
#impltmp
<tok>
parcmb1_input(xs) = input_make(xs)
//
#extern
fun
<tok:t0>
parcmb1_token
((*void*)): parser(tok,tok)
#impltmp
<tok>
parcmb1_token() =
parser(lam(inp) => input_getok(inp))
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res:vt>
parcmb1_sat
( P0
: parser(tok,res)
, f0
: res -<cfr> bool): parser(tok, res)
//
#impltmp
<tok><res>
parcmb1_sat
(P0, f0) = parser
(
lam(inp0) =>
let
val
(
inp1, opt0) =
parser_apply(P0, inp0)
in
case+ opt0 of
| ~none_vt() => (inp0, none_vt())
| ~some_vt(res0) =>
  if
  f0(res0)
  then
  (inp1, some_vt(res0)) else (inp0, none_vt())
end // end-of-lam
) (* end of [parcmb1_sat] *)
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res1:vt>
<res2:vt>
parcmb1_map
( P0
: parser(tok,res1)
, f0
: res1 -<cfr> res2): parser(tok,res2)
//
#impltmp
<tok>
<res1>
<res2>
parcmb1_map
  (P0, f0) = parser
(
lam(inp) =>
let
val
(inp, opt) =
parser_apply(P0, inp)
in
case+ opt of
| ~
none_vt() => (inp, none_vt())
| ~
some_vt(res) => (inp, some_vt(f0(res)))
end
)
//
(* ****** ****** *)

#extern
fun
<tok:t0>
<res:vt>
parcmb1_alt2
(
P1: parser(tok, res)
,
P2: parser(tok, res)
) : parser(tok, res)
#extern
fun
<tok:t0>
<res1:vt
,res2:vt>
parcmb1_seq2
(
P1: parser(tok,res1)
,
P2: parser(tok,res2)
) : parser(tok, (res1, res2))

(* ****** ****** *)
//
#symload || with parcmb1_alt2
#symload && with parcmb1_seq2
//
#symload alt with parcmb1_alt2
#symload seq with parcmb1_seq2
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res1:vt
,res2:vt>
<res3:vt>
parcmb1_seq2map
(
P1: parser(tok,res1)
,
P2: parser(tok,res2)
,
f0: (res1,res2) -<cfr> res3): parser(tok, res3)
//
(* ****** ****** *)

#impltmp
parcmb1_alt2
(P1, P2) = parser
(
lam(inp) =>
let
val
(
inp, opt) =
parser_apply(P1, inp)
in
//
case+ opt of
| ~none_vt() =>
  (
    parser_apply(P2, inp)
  )
| !some_vt(res) => (inp, opt)
//
end
) (* end of [parcmb1_alt2] *)

(* ****** ****** *)

#impltmp
<tok>
<res1
,res2>
parcmb1_seq2
  (P1, P2) =
parcmb1_seq2map
(P1, P2, lam(x1, x2) => (x1, x2))

(* ****** ****** *)

#impltmp
<tok>
<res1
,res2>
<res3>
parcmb1_seq2map
  (P1, P2, f0) = parser
(
lam(inp0) =>
(
let
val
(
inp1, opt1) =
parser_apply(P1, inp0)
in
case+ opt1 of
| ~
none_vt() => (inp0, none_vt())
| ~
some_vt(res1) =>
let
val
(
inp2, opt2) =
parser_apply(P2, inp1)
in
case opt2 of
| ~
none_vt() => (inp0, none_vt())
| ~
some_vt(res2) => (inp2, some_vt(f0(res1, res2)))
end // end of [let]
end // end of [let]
)
) (* end of [parcmb1_seq2map] *)

(* ****** ****** *)

#extern
fun
<tok:t0>
<res1:vt
,res2:vt>
parcmb1_seq2get0
(
P1: parser(tok,res1)
,
P2: parser(tok,res2)
) : parser(tok, res1)
#extern
fun
<tok:t0>
<res1:vt
,res2:vt>
parcmb1_seq2get1
(
P1: parser(tok,res1)
,
P2: parser(tok,res2)
) : parser(tok, res2)

#symload << with parcmb1_seq2get0
#symload >> with parcmb1_seq2get1

(* ****** ****** *)

#impltmp
<tok>
<res1
,res2>
parcmb1_seq2get0
(P1, P2) = 
parcmb1_seq2map
(P1, P2, lam(res1, res2) => res1)
#impltmp
<tok>
<res1
,res2>
parcmb1_seq2get1
(P1, P2) = 
parcmb1_seq2map
(P1, P2, lam(res1, res2) => res2)

(* ****** ****** *)

#extern
fun
<tok:t0>
<res:vt>
parcmb1_ignore
(
P0: parser(tok,res)
) : parser(tok,nint)
#impltmp
<tok><res>
parcmb1_ignore
  (P0) = parser_make
(
let
val nrs = 0
in
lam(inp) => auxrep(inp, nrs)
end
) where
{
//
fun
auxrep
(inp, nrs) =
let
val
(inp, opt) =
parser_apply(P0, inp)
in
case+ opt of
| ~
none_vt() => (inp, some_vt(nrs))
| ~
some_vt(_) => auxrep(inp, suc(nrs))
end
//
} (* end of [parcmb1_ignore] *)

(* ****** ****** *)
//
#vwtpdef
repeat0(res:vt) =
listgte_vt(res, 0)
#vwtpdef
repeat1(res:vt) =
listgte_vt(res, 1)
//
#extern
fun
<tok:t0>
<res:vt>
parcmb1_repeat0
(
P0: parser(tok,res)
) : parser(tok,repeat0(res))
#extern
fun
<tok:t0>
<res:vt>
parcmb1_repeat1
(
P0: parser(tok,res)
) : parser(tok,repeat1(res))

(* ****** ****** *)

#impltmp
<tok><res>
parcmb1_repeat0
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
(inp, opt) =
parser_apply(P0, inp)
in
case+ opt of
| ~
none_vt() =>
( inp
, some_vt(list_vt_reverse0(rez)))
| ~
some_vt(res) =>
auxrep(inp, list_vt_cons(res, rez))
end
//
} (* end of [parcmb1_repeat0] *)

(* ****** ****** *)
//
#impltmp
<tok><res>
parcmb1_repeat1
  (P0) =
(
parcmb1_seq2map
( P0
, parcmb1_repeat0(P0)
, lam(x0, xs) => list_vt_cons(x0, xs)
) (* end of [parcmb1_repeat1] *)
)
//
(* ****** ****** *)
//
#extern
fun
<tok:t0>
<res:vt>
parcmb1_lazy
(
LP:
lazy
(parser(tok,res))
)
: parser(tok,res)
//
#impltmp
<tok><res>
parcmb1_lazy(LP) = parser
(lam(inp) => parser_apply(!LP, inp))
//
#extern
fun
<tok:t0>
<res:vt>
parcmb1_thunk
(
FP:
() -<cfr>
parser(tok,res)
)
: parser(tok,res)
//
#impltmp
<tok><res>
parcmb1_thunk(FP) = parser
(lam(inp) => parser_apply(FP(), inp))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xatslib_githwxi_DATS_parcmb1.dats] *)
(***********************************************************************)
