(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Author: Hongwei Xi
Start Time: June 14th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xerrory.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
//
fun
EOLq
(ch: char): bool = (ch = '\n')
//
(* ****** ****** *)

local

datavwtp
pstn1 =
PSTN1 of
( sint(*ntot*)
, sint(*nrow*), sint(*ncol*))

in//local

(* ****** ****** *)

fun
pstn1_inc1_nc
( pos:
! pstn1 ): void =
let
val+
@PSTN1
(!nt0, !nr1, !nc2) = pos
in//in
( nt0 := nt0+1
//nr1 := nr1+0
; nc2 := nc2+1; $fold(pos))
endlet // end of [pstn1_inc1]

fun
pstn1_inc1_nr
( pos:
! pstn1 ): void =
let
val+
@PSTN1
(!nt0, !nr1, !nc2) = pos
in//in
( nc2 := 0
; nt0 := nt0+1
; nr1 := nr1+1; $fold(pos))
endlet // end of [pstn1_inc1_nr]

fun
pstn1_inc1_if
( pos:
! pstn1
, chr: char): void =
let
val+
@PSTN1
(!nt0, !nr1, !nc2) = pos
in//in
if
EOLq(chr)
then pstn1_inc1_nr(pos)
else pstn1_inc1_nc(pos)
endlet // end of [pstn1_inc1_if]

(* ****** ****** *)
//
fun
pstn1_incs_if
( pos:
! pstn1
, cs0: strn): void =
gseq_foreach_e1nv<strn><char>(cs0, pos) where
{
#impltmp
foreach$work_e1nv<char><pstn1>(chr, pos) = pstn1_inc1_if(pos, chr)
} (*where*) // end of [pstn1_incs(pstn1, strn)]
//
(* ****** ****** *)

fun
pstn1_free
(pos: !pstn1): void =
let
  val+ ~PSTN1 _ = pos
endlet // [pstn1_free]

fun
postn_make_pstn1
(pos: !pstn1): pos_t =
(
  postn(nt0, nr0, nc0)
) where
{
val+PSTN1(nt0, nr0, nc0) = pos
} (*let*) // [postn_make_pstn1]

(* ****** ****** *)
//
fun
lexing_lctniz_tnode
( pos:
! pstn1
, tnd: tnode): void =
(
case+ tnd of
//
| T_EOF() => ()
| T_ERR() => ()
//
| T_EOL() => pstn1_inc1_nr(pos)
//
| T_BLANK(bs) => pstn1_incs_if(pos, bs)
//
| T_CLNLT(cs) => pstn1_incs_if(pos, cs)
| T_DOTLT(cs) => pstn1_incs_if(pos, cs)
//
| T_SPCHR(c1) => pstn1_inc1_if(pos, char(c1))
//
| T_IDALP(rep) => pstn1_incs_if(pos, rep)
| T_IDSYM(rep) => pstn1_incs_if(pos, rep)
| T_IDDLR(rep) => pstn1_incs_if(pos, rep)
| T_IDSRP(rep) => pstn1_incs_if(pos, rep)
| T_IDQUA(rep) => pstn1_incs_if(pos, rep)
//
| T_INT01(rep) => pstn1_incs_if(pos, rep)
| T_INT02(_, rep) => pstn1_incs_if(pos, rep)
| T_INT03(_, rep, _) => pstn1_incs_if(pos, rep)
//
| T_FLT01(rep) => pstn1_incs_if(pos, rep)
| T_FLT02(_, rep) => pstn1_incs_if(pos, rep)
| T_FLT03(_, rep, _) => pstn1_incs_if(pos, rep)
//
| T_CHAR1_nil0(rep) => pstn1_incs_if(pos, rep)
| T_CHAR2_char(rep) => pstn1_incs_if(pos, rep)
| T_CHAR3_blsh(rep) => pstn1_incs_if(pos, rep)
//
| T_STRN1_clsd(rep, _) => pstn1_incs_if(pos, rep)
| T_STRN2_ncls(rep, _) => pstn1_incs_if(pos, rep)
//
|
T_CMNT1_line(ini, txt) =>
(pstn1_incs_if(pos, ini);pstn1_incs_if(pos, txt))
|
T_CMNT2_rest(ini, txt) =>
(pstn1_incs_if(pos, ini);pstn1_incs_if(pos, txt))
//
|
T_CMNT3_ccbl(lvl, txt) => pstn1_incs_if(pos, txt)
|
T_CMNT4_mlbl(lvl, txt) => pstn1_incs_if(pos, txt)
//
| _ (*   otherwise   *) =>
  (
    abort_interr() // HX: internal error
  ) where
  { val () =
    prerrln("lexing_lctniz_tnode: tnd = ", tnd) }
//
) (*case*) // end-of-(lexing_lctniz_tnode(pos,tnd))
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
char2node
(ch: sint): tnode =
let
val ch = char_make_code(ch)
in//let
//
case+ 0 of
| _ when(ch = ',') => T_COMMA()
| _ when(ch = ';') => T_SMCLN()
//
| _ when(ch = '\\') => T_BSLSH()
//
| _ when(ch = '\(') => T_LPAREN()
| _ when(ch = '\)') => T_RPAREN()
//
| _ when(ch = '\[') => T_LBRCKT()
| _ when(ch = '\]') => T_RBRCKT()
//
| _ when(ch = '\{') => T_LBRACE()
| _ when(ch = '\}') => T_RBRACE()
//
| _ (* otherwise *) => T_EOF(*nil*)
end (*let*) // end of [char2node]

(* ****** ****** *)

#symload
tnode_search with lexing_tnode_search

(* ****** ****** *)
in//local
(* ****** ****** *)

fun
lexing_tnode2tnode
  (tnd0: tnode): tnode =
(
case+ tnd0 of
|
T_SPCHR(ch) =>
let
  val
  tnd1 = char2node(ch)
in//let
  case+ tnd1 of
  | T_EOF() => tnd0 | _ => tnd1
end // end of [T_SPCHR]
//
|
T_IDALP(id) =>
let
val tnd1 = tnode_search(id)
in//let
case+ tnd1 of
| T_EOF() => tnd0 | _ => tnd1
end (*let*) // end of [T_IDALP]
|
T_IDSYM(id) =>
let
val tnd1 = tnode_search(id)
in//let
case+ tnd1 of
| T_EOF() => tnd0 | _ => tnd1
end (*let*) // end of [T_IDSYM]
//
|
T_IDDLR(id) =>
let
val tnd1 = tnode_search(id)
in//let
case+ tnd1 of
| T_EOF() => tnd0 | _ => tnd1
end (*let*) // end of [T_IDDLR]
|
T_IDSRP(id) =>
let
val tnd1 = tnode_search(id)
in//let
case+ tnd1 of
| T_EOF() => tnd0 | _ => tnd1
end (*let*) // end of [T_IDSRP]
//
| _ (* rest-of-tnode *) => tnd0
//
) (*case*) // lexing_tnode2tnode

(* ****** ****** *)

end (*local*) // end of [ local ]

(* ****** ****** *)

fun
lexing_tnode2token
( pos:
! pstn1
, lcs: lcsrc
, tnd: tnode): token =
(
  token(loc, tnd)) where
{
//
val ps0 =
  postn_make_pstn1(pos)
val ( ) =
  lexing_lctniz_tnode(pos, tnd)
val ps1 = postn_make_pstn1(pos)
val tnd = lexing_tnode2tnode(tnd)
//
val loc = loctn_make_arg3(lcs, ps0, ps1)
//
}(*where*)//end-of-[lexing_tnode2token(pos,tnd)]

(* ****** ****** *)

#implfun
lexing_lctnize_all
  (lcs, txs) =
(
pstn1_free(pos); tys) where
{
//
val pos =
PSTN1(0, 0, 0)
val tys =
list_vt_nil(*void*)
val tys =
fmain(pos, txs, tys) where
{
fnx
fmain
( pos:
! pstn1
, txs
: list_vt(tnode)
, tys
: list_vt(token)
) : list_vt(token) =
(
case+ txs of
| ~
list_vt_nil
( (*void*) ) => reverse0(tys)
| ~
list_vt_cons
( tx1, txs ) =>
  fmain(pos, txs, tys) where
{
  val ty1 = 
  lexing_tnode2token(pos,lcs,tx1)
  val tys = list_vt_cons(ty1, tys)
}
)
}(*where*)//end-of-[fmain(pos,txs,tys)]
//
}(*where*)//end-of-[lexing_lctnize_all(lcs,txs)]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(*

(* ****** ****** *)
//
(*
HX-2022-07-22:
This one stack-overflows when
processing a large number of tokens!
*)
//
#implfun
lexing_preping_all
  (   tks   ) = let
//
#vwtpdef
tklst = list_vt(token)
//
fnx
loop0
( xs: tklst
, res: tklst): tklst =
(
case+ xs of
| ~
list_vt_nil
((*void*)) => res
| ~
list_vt_cons
( x1, xs ) => loop1(x1, xs, res)
)
and
loop1
( x0: token
, xs: tklst
, res: tklst): tklst =
(
case+ xs of
| ~
list_vt_nil
((*void*)) =>
list_vt_cons(x0, res)
| ~
list_vt_cons
( x1, xs ) =>
(
case+ x0.node() of
//
| T_EOL() => loop1(x1, xs, res)
| T_BLANK _ => loop1(x1, xs, res)
//
| T_CMNT1_line _ => loop1(x1, xs, res)
| T_CMNT2_rest _ => loop1(x1, xs, res)
| T_CMNT3_ccbl _ => loop1(x1, xs, res)
| T_CMNT4_mlbl _ => loop1(x1, xs, res)
//
|
_(*rest-of-token*) => loop2(x0, x1, xs, res)
)
) where
{
(*
val () =
prerrln
("lexing_preping_all:loop1: x0=", x0)
*)
}
and
loop2
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
(
case+ x0.node() of
//
| T_AT0() =>
  f0_AT0(x0, x1, xs, res)
| T_OP1() =>
  f0_OP1(x0, x1, xs, res)
//
|
T_DLR() => f0_DLR(x0, x1, xs, res)
|
T_SRP() => f0_SRP(x0, x1, xs, res)
//
|
T_LAM _ => f0_LAM(x0, x1, xs, res)
|
T_FIX _ => f0_FIX(x0, x1, xs, res)
//
|
T_VAL _ => f0_VAL(x0, x1, xs, res)
//
|
T_CASE _ => f0_CASE(x0, x1, xs, res)
//
(*
|
T_LTGT((*void*)) =>
let
  val loc = x0.lctn()
  val y1 = 
  token_make_node(loc, T_LT0())
  val y2 = 
  token_make_node(loc, T_GT0())
in//let
loop1
(x1, xs, cons_vt(y2,cons_vt(y1,res)))
end (* let *) // end of [ T_LTGT() ]
*)
|
T_GTLT((*void*)) =>
let
  val loc = x0.lctn()
  val y1 = 
  token_make_node(loc, T_GT0())
  val y2 = 
  token_make_node(loc, T_LT0())
in//let
loop1
(x1, xs, cons_vt(y2,cons_vt(y1,res)))
end (* let *) // end of [ T_GTLT() ]
//
|
T_IDALP _ => f0_IDALP(x0, x1, xs, res)
//
| _(*rest-of-tnode*) =>
(
//
(*
HX-2022-07-17:
Segfault if // by stack-overflow?
there is no tail-call optimization!!!
*)
//
loop1(x1, xs, list_vt_cons(x0, res))
//
(*
let
val res =
list_vt_cons(x0, res)
in//let
//
case+ xs of
| ~
list_vt_nil
  ((*void*)) => list_vt_cons(x1, res)
| ~
list_vt_cons
  ( x2, xs ) => loop2(x1, x2, xs, res)
//
end // loop1(x1,xs,list_vt_cons(x0,res))
*)
//
)
) (*case*) where
{
//
(* ****** ****** *)
//
fun
f0_AT0
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
(
case+
x1.node() of
|
T_LPAREN() =>
let
val loc =
x0.lctn()+x1.lctn()
in//let
loop0
(xs, cons_vt(xx2, res)) where
{
val xx2 =
token_make_node(loc,T_TRCD10(0))
}
end (*let*) // end of [T_LPAREN]
|
T_LBRACE() =>
let
val loc =
x0.lctn()+x1.lctn()
in//let
loop0
(xs, cons_vt(xx2, res)) where
{
val xx2 =
token_make_node(loc,T_TRCD20(0))
}
end (*let*) // end of [T_LBRACE]
//
|
_(*rest-of-tnode*) =>
(
loop1(x1, xs, list_vt_cons(x0, res)))
//
)(*case*)//end-of-[f0_AT0(x0,x1,xs,res)]
//
(* ****** ****** *)
//
fun
f0_OP1
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
(
case+
x1.node() of
|
T_IDSYM(id) =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node(loc, T_OP2(x1))
in//let
loop0(xs, list_vt_cons(xx2, res))
end (*let*) // end of [T_IDSYM]
|
T_LPAREN() =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node(loc, T_OP3(x1))
in//let
loop0(xs, list_vt_cons(xx2, res))
end(*let*) // end of [T_LPAREN]
| _(* rest-of-tnode *) =>
(
loop1(x1, xs, list_vt_cons(x0, res)))
)(*case*)//end-of(f0_OP1(x0,x1,xs,res))
//
(* ****** ****** *)

fun
f0_DLR
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
(
case+
x1.node() of
|
T_LBRCKT() => let
val loc =
x0.lctn()+x1.lctn()
in
loop0
(xs, cons_vt(xx2, res)) where
{
val xx2 =
token_make_node(loc, T_EXISTS(1))
}
end // end of [T_LBRCKT]
|
_(*rest-of-tnode*) =>
(
loop1(x1, xs, list_vt_cons(x0, res)))
)(*case*)//end-of(f0_DLR(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_SRP
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
(
case+
x1.node() of
|
T_LPAREN() =>
let
val loc =
x0.lctn()+x1.lctn()
in
loop0
(xs, cons_vt(xx2, res)) where
{
val xx2 =
token_make_node(loc,T_TRCD10(1))
}
end (*let*) // end of [T_LPAREN]
|
T_LBRACE() =>
let
val loc =
x0.lctn()+x1.lctn()
in
loop0
(xs, cons_vt(xx2, res)) where
{
val xx2 =
token_make_node(loc,T_TRCD20(1))
}
end (*let*) // end of [T_LBRACE]
//
| _(*rest-of-tnode*) =>
(
loop1(x1, xs, list_vt_cons(x0, res)))
)(*case*)//end-of(f0_SRP(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_LAM
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
let
val-
T_LAM(k0) = x0.node()
in//let
//
case+
x1.node() of
|
T_AT0() => let
  val
  loc =
  x0.lctn()+x1.lctn()
in//let
loop0
(xs, cons_vt(xx2, res)) where
{
val xx2 = // k0 = 0
token_make_node(loc, T_LAM(k0+1))
}
end (* let *) // end of [ T_AT0 ]
|
_(*rest-of-tnode*) =>
(
loop1(x1, xs, list_vt_cons(x0, res)))
//
end(*let*)//end-of(f0_LAM(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_FIX
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
let
val-
T_FIX(k0) = x0.node()
in//let
case+
//
x1.node() of
|
T_AT0() => let
  val
  loc =
  x0.lctn()+x1.lctn()
in//let
loop0
(xs, cons_vt(xx2, res)) where
{
val xx2 = // k0 = 0
token_make_node(loc, T_FIX(k0+1))
}
end (* let *) // end of [ T_AT0 ]
|
_(*rest-of-tnode*) =>
(
loop1(x1, xs, list_vt_cons(x0, res)))
//
end(*let*)//end-of(f0_FIX(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_VAL
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
let
//
val-
T_VAL(vlk) = x0.node()
//
fun
plusq
(sym: strn): bool =
(strn_head_opt(sym) = '+')
fun
mnusq
(sym: strn): bool =
(strn_head_opt(sym) = '-')
//
(*
val () =
prerrln
("lexing_preping_all: f0_VAL: x0 = ", x0)
val () =
prerrln
("lexing_preping_all: f0_VAL: x1 = ", x1)
*)
//
in//let
case+ vlk of
|
VLKval() =>
(
case+
x1.node() of
//
|
T_IDSYM("+") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_VAL(VLKvlp))
in//let
loop0(xs, cons_vt(xx2, res))
end(*let*)//end-of(T_IDSYM("+"))
//
|
T_IDSYM("-") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_VAL(VLKvln))
in//let
loop0(xs, cons_vt(xx2, res))
end(*let*)//end-of(T_IDSYM("-"))
//
|
T_IDSYM(sym) =>
(
case+ 0 of
| _
when plusq(sym) =>
let
val lc0 = x0.lctn()
val lc1 = x1.lctn()
val loc = lc0 + lc1
val sym = strn_tail_raw(sym)
in//let
loop1
( x1
, xs, cons_vt(xx2, res)) where
{
val x1 =
token_make_node(lc1, tnd) where
{
val tnd =
lexing_tnode2tnode(T_IDSYM(sym))
}
val xx2 =
token_make_node(loc, T_VAL(VLKvlp))
}
end(*let*)// end-of-[T_IDSYM(+...)]
//
| _
when mnusq(sym) =>
let
val lc0 = x0.lctn()
val lc1 = x1.lctn()
val loc = lc0 + lc1
val sym = strn_tail_raw(sym)
in//let
loop1
( x1
, xs, cons_vt(xx2, res)) where
{
val x1 =
token_make_node(lc1, tnd) where
{
val tnd =
lexing_tnode2tnode(T_IDSYM(sym))
}
val xx2 =
token_make_node(loc, T_VAL(VLKvln))
}
end(*let*)// end-of-[T_IDSYM(-...)]
//
|
_(*non-plus-mnus*) =>
(
  loop1(x1, xs, cons_vt(x0, res))
)
)
|
_(*rest-of-tnode*) =>
(
  loop1(x1, xs, cons_vt(x0, res))
)
)
| _(* non-VLKval *) =>
(
  loop1(x1, xs, cons_vt(x0, res))
)
end (*let*) // end of [f0_VAL(......)]

(* ****** ****** *)

fun
f0_CASE
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
let
val-
T_CASE(csk) = x0.node()
in//let
case+
x1.node() of
//
| T_IDSYM("+") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_CASE(CSKcasp))
in
loop0(xs, cons_vt(xx2, res))
endlet // end of-(T_IDSYM("+"))
//
| T_IDSYM("-") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_CASE(CSKcasn))
in
loop0(xs, cons_vt(xx2, res))
endlet // end of-(T_IDSYM("-"))
//
|
_(*rest-of-tnode*) =>
(
  loop1(x1, xs, cons_vt(x0, res))
)
end (*let*) // end-of-[f0_CASE(...)]

(* ****** ****** *)

fun
f0_IDALP
( x0: token
, x1: token
, xs: tklst
, res: tklst): tklst =
let
val-
T_IDALP(id0) = x0.node()
in//let
//
case+
x1.node() of
|
T_IDSYM(sym) =>
if
qbeg(sym)
then
let
val loc =
x0.lctn()+x1.lctn()
val id1 =
strn_append(id0, sym)
val xx2 =
token_make_node
( loc, T_IDALP(id1) )
in//let
loop0(xs, cons_vt(xx2, res))
end // [then] // T_IDSYM(?...)
else
(
loop1(x1, xs, cons_vt(x0, res)))
// end of [if]
|
_(*rest-of-tnode*) =>
(
loop1(x1, xs, cons_vt(x0, res)))
//
end where
{
  fun
  qbeg
  (sym: strn): bool =
  (strn_head_opt(sym) = '?')

} (*where*)//end-of[f0_IDALP(......)]
//
(* ****** ****** *)
//
} (*where*)//end-of-[loop2(x0,x1,xs,res)]
//
in//let
//
  list_vt_reverse0(loop0(tks, nil_vt()))
//
end (*let*) // end of [lexing_preping_all]

(* ****** ****** *)

*)

(* ****** ****** *)

#implfun
lexing_preping_all
  (   tks   ) = let
//
#vwtpdef
tklst = list_vt(token)
#vwtpdef
tktrm = strm_vt(token)
#vwtpdef
tktcn = strmcon_vt(token)
//
fun
auxmain0
( xs: tklst ): tktrm =
$llazy
(
case+ xs of
| ~
list_vt_nil
((*void*)) =>
strmcon_vt_nil()
| ~
list_vt_cons
( x1, xs ) => auxloop1(x1, xs)
)
and
auxmain1
( x0: token
, xs: tklst): tktrm =
$llazy
( auxloop1(x0, xs) )
//
and
auxloop1
( x0: token
, xs: tklst): tktcn =
(
case+ xs of
| ~
list_vt_nil
((*void*)) =>
strmcon_vt_sing(x0)
| ~
list_vt_cons
( x1, xs ) =>
(
case+ x0.node() of
//
| T_EOL() => auxloop1(x1, xs)
| T_BLANK _ => auxloop1(x1, xs)
//
|
T_CMNT1_line _ => auxloop1(x1, xs)
|
T_CMNT2_rest _ => auxloop1(x1, xs)
|
T_CMNT3_ccbl _ => auxloop1(x1, xs)
|
T_CMNT4_mlbl _ => auxloop1(x1, xs)
//
|
_(*otherwise*) => auxloop2(x0, x1, xs)
)
) where
{
(*
val () =
prerrln
("lexing_preping_all:loop1: x0=", x0)
*)
}
and
auxloop2
( x0: token
, x1: token
, xs: tklst): tktcn =
(
case+ x0.node() of
//
|
T_AT0() => f0_AT0(x0, x1, xs)
|
T_OP1() => f0_OP1(x0, x1, xs)
//
|
T_DLR() => f0_DLR(x0, x1, xs)
|
T_SRP() => f0_SRP(x0, x1, xs)
//
|
T_LAM _ => f0_LAM(x0, x1, xs)
|
T_FIX _ => f0_FIX(x0, x1, xs)
//
|
T_VAL _ => f0_VAL(x0, x1, xs)
//
|
T_CASE _ => f0_CASE(x0, x1, xs)
//
(*
|
T_LTGT((*void*)) =>
let
  val loc = x0.lctn()
  val y1 = 
  token_make_node(loc, T_LT0())
  val y2 = 
  token_make_node(loc, T_GT0())
in//let
  strmcon_vt_cons
  (
  y1,
  $llazy
  (
  strmcon_vt_cons
  (
  y2, $llazy(auxloop1(x1, xs)))))
end (* let *) // end of [ T_LTGT() ]
*)
|
T_GTLT((*void*)) =>
let
  val loc = x0.lctn()
  val y1 = 
  token_make_node(loc, T_GT0())
  val y2 = 
  token_make_node(loc, T_LT0())
in//let
  strmcon_vt_cons
  (
  y1,
  $llazy(
  strmcon_vt_cons
  (y2, $llazy(auxloop1(x1, xs)))))
end (* let *) // end of [ T_GTLT() ]
//
|
T_IDALP _ => f0_IDALP( x0, x1, xs )
//
| _(*rest-of-tnode*) =>
(
//
(*
HX-2022-07-17:
Segfault if // by stack-overflow?
there is no tail-call optimization!!!
*)
//
strmcon_vt_cons(x0, auxmain1(x1, xs))
//
(*
let
val res =
list_vt_cons(x0)
in//let
//
case+ xs of
| ~
list_vt_nil
  ((*void*)) => list_vt_cons(x1)
| ~
list_vt_cons
  ( x2, xs ) => loop2(x1, x2, xs)
//
end // loop1(x1,xs,list_vt_cons(x0,res))
*)
//
)
) (*case*) where
{
//
(* ****** ****** *)
//
fun
f0_AT0
( x0: token
, x1: token
, xs: tklst): tktcn =
(
case+
x1.node() of
|
T_LPAREN() =>
let
val loc =
x0.lctn()+x1.lctn()
in//let
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 =
token_make_node(loc,T_TRCD10(0))
}
end (*let*) // end of [T_LPAREN]
|
T_LBRACE() =>
let
val loc =
x0.lctn()+x1.lctn()
in//let
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 =
token_make_node(loc,T_TRCD20(0))
}
end (*let*) // end of [T_LBRACE]
//
|
_(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
//
)(*case*)//end-of(f0_AT0(x0,x1,xs,res))
//
(* ****** ****** *)
//
fun
f0_OP1
( x0: token
, x1: token
, xs: tklst): tktcn =
(
case+
x1.node() of
|
T_IDSYM(id) =>
let
val loc =
x0.lctn()+x1.lctn()
in//let
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 =
token_make_node(loc, T_OP2(x1))
}
end (*let*) // end of [T_IDSYM]
|
T_LPAREN() =>
let
val loc =
x0.lctn()+x1.lctn()
in//let
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 =
token_make_node(loc, T_OP3(x1))
}
end(*let*) // end of [T_LPAREN]
| _(* rest-of-tnode *) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
)(*case*)//end-of(f0_OP1(x0,x1,xs,res))
//
(* ****** ****** *)

fun
f0_DLR
( x0: token
, x1: token
, xs: tklst): tktcn =
(
case+
x1.node() of
|
T_LBRCKT() => let
val loc =
x0.lctn()+x1.lctn()
in
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 =
token_make_node(loc, T_EXISTS(1))
}
end // end of [T_LBRCKT]
|
_(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
)(*case*)//end-of(f0_DLR(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_SRP
( x0: token
, x1: token
, xs: tklst): tktcn =
(
case+
x1.node() of
|
T_LPAREN() =>
let
val loc =
x0.lctn()+x1.lctn()
in
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 =
token_make_node(loc,T_TRCD10(1))
}
end (*let*) // end of [T_LPAREN]
|
T_LBRACE() =>
let
val loc =
x0.lctn()+x1.lctn()
in
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 =
token_make_node(loc,T_TRCD20(1))
}
end (*let*) // end of [T_LBRACE]
//
| _(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
)(*case*)//end-of(f0_SRP(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_LAM
( x0: token
, x1: token
, xs: tklst): tktcn =
let
val-
T_LAM(k0) = x0.node()
in//let
//
case+
x1.node() of
|
T_AT0() => let
  val
  loc =
  x0.lctn()+x1.lctn()
in//let
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 = // k0 = 0
token_make_node(loc, T_LAM(k0+1))
}
end (* let *) // end of [ T_AT0 ]
|
_(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
//
end(*let*)//end-of(f0_LAM(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_FIX
( x0: token
, x1: token
, xs: tklst): tktcn =
let
val-
T_FIX(k0) = x0.node()
in//let
case+
//
x1.node() of
|
T_AT0() => let
  val
  loc =
  x0.lctn()+x1.lctn()
in//let
strmcon_vt_cons
(xx2, auxmain0(xs)) where
{
val xx2 = // k0 = 0
token_make_node(loc, T_FIX(k0+1))
}
end (* let *) // end of [ T_AT0 ]
|
_(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
//
end(*let*)//end-of(f0_FIX(x0,x1,xs,res))

(* ****** ****** *)

fun
f0_VAL
( x0: token
, x1: token
, xs: tklst): tktcn =
let
//
val-
T_VAL(vlk) = x0.node()
//
fun
plusq
(sym: strn): bool =
(strn_head_opt(sym) = '+')
fun
mnusq
(sym: strn): bool =
(strn_head_opt(sym) = '-')
//
(*
val () =
prerrln
("lexing_preping_all:f0_VAL: x0 = ", x0)
val () =
prerrln
("lexing_preping_all:f0_VAL: x1 = ", x1)
*)
//
in//let
case+ vlk of
|
VLKval() =>
(
case+
x1.node() of
//
|
T_IDSYM("+") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_VAL(VLKvlp))
in//let
strmcon_vt_cons(xx2,auxmain0(xs))
end(*let*)//end-of-( T_IDSYM("+") )
//
|
T_IDSYM("-") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_VAL(VLKvln))
in//let
strmcon_vt_cons(xx2,auxmain0(xs))
end(*let*)//end-of-( T_IDSYM("-") )
//
|
T_IDSYM(sym) =>
(
case+ 0 of
| _
when plusq(sym) =>
let
val lc0 = x0.lctn()
val lc1 = x1.lctn()
val loc = lc0 + lc1
val sym = strn_tail_raw(sym)
in//let
strmcon_vt_cons
( xx2
, auxmain1(x1,xs)) where
{
val x1 =
token_make_node(lc1, tnd) where
{
val tnd =
lexing_tnode2tnode(T_IDSYM(sym))
}
val xx2 =
token_make_node(loc, T_VAL(VLKvlp))
}
end(*let*)// end-of-[T_IDSYM(+...)]
//
| _
when mnusq(sym) =>
let
val lc0 = x0.lctn()
val lc1 = x1.lctn()
val loc = lc0 + lc1
val sym = strn_tail_raw(sym)
in//let
strmcon_vt_cons
( xx2
, auxmain1(x1,xs)) where
{
val x1 =
token_make_node(lc1, tnd) where
{
val tnd =
lexing_tnode2tnode(T_IDSYM(sym))
}
val xx2 =
token_make_node(loc, T_VAL(VLKvln))
}
end(*let*)// end-of-[T_IDSYM(-...)]
//
|
_(*non-plus-mnus*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs))
)
)
|
_(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs))
)
) (* [VALval] *)
| _(* non-VLKval *) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
//
end (*let*) // end of [f0_VAL(......)]

(* ****** ****** *)

fun
f0_CASE
( x0: token
, x1: token
, xs: tklst): tktcn =
let
val-
T_CASE(csk) = x0.node()
in//let
case+
x1.node() of
//
| T_IDSYM("+") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_CASE(CSKcasp))
in//let
strmcon_vt_cons(xx2, auxmain0(xs))
end (*let*) // end-of-(T_IDSYM("+"))
//
| T_IDSYM("-") =>
let
val loc =
x0.lctn()+x1.lctn()
val xx2 =
token_make_node
(loc, T_CASE(CSKcasn))
in
strmcon_vt_cons(xx2, auxmain0(xs))
end (*let*) // end-of-(T_IDSYM("-"))
//
|
_(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
end (*let*) // end-of-[f0_CASE(...)]

(* ****** ****** *)

fun
f0_IDALP
( x0: token
, x1: token
, xs: tklst): tktcn =
let
val-
T_IDALP(id0) = x0.node()
in//let
//
case+
x1.node() of
|
T_IDSYM(sym) =>
if
qbeg(sym)
then
let
val loc =
x0.lctn()+x1.lctn()
val id1 =
strn_append(id0, sym)
val xx2 =
token_make_node
( loc, T_IDALP(id1) )
in//let
strmcon_vt_cons(xx2, auxmain0(xs))
end //[then]//end-of(T_IDSYM(?...))
else
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
// end of [if]
|
_(*rest-of-tnode*) =>
(
strmcon_vt_cons(x0, auxmain1(x1,xs)))
//
end where
{
  fun
  qbeg
  (sym: strn): bool =
  (strn_head_opt(sym) = '?')

} (*where*)//end-of[f0_IDALP(......)]
//
(* ****** ****** *)
//
} (*where*)//end-of-[loop2(x0,x1,xs,res)]
//
in//let
//
(
  strm_vt_listize0<token>(auxmain0(tks)) )
//
end (*let*) // end of [lexing_preping_all(...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_lexing0_utils2.dats] *)
