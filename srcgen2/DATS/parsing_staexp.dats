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
Start Time: June 16th, 2022
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#symload
lctn with token_get_lctn//lexing0
(* ****** ****** *)
#symload
lctn with t0int_get_lctn//lexing0
#symload
lctn with t0chr_get_lctn//lexing0
#symload
lctn with t0flt_get_lctn//lexing0
#symload
lctn with t0str_get_lctn//lexing0
(* ****** ****** *)
#symload
lctn with i0dnt_get_lctn//staexp0
#symload
lctn with l0abl_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with g0exp_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with sort0_get_lctn//staexp0
#symload
lctn with s0exp_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with s0tcn_get_lctn//staexp0
#symload
lctn with d0tcn_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with s0arg_get_lctn//staexp0
#symload
lctn with s0uni_get_lctn//staexp0
(* ****** ****** *)
#symload
node with token_get_node//lexing0
#symload
node with i0dnt_get_node//staexp0
#symload
node with l0abl_get_node//staexp0
(* ****** ****** *)
#symload
tnode with token_get_node//lexing0
(* ****** ****** *)
#symload + with add_loctn_loctn//locinfo
(* ****** ****** *)
//
#extern
fun
p1_g0namseq_COMMA: p1_fun(g0namlst)
//
(* ****** ****** *)
//
#extern
fun
p1_g0exp_THEN: p1_fun(g0exp_THEN)
#extern
fun
p1_g0exp_ELSE: p1_fun(g0exp_ELSE)
//
#extern
fun
p1_g0expseq_atm: p1_fun(g0explst)
#extern
fun
p1_g0expseq_COMMA: p1_fun(g0explst)
//
(* ****** ****** *)
//
#extern
fun
p1_g0argseq_COMMA: p1_fun(g0arglst)
//
(* ****** ****** *)
//
#extern
fun p1_sort0_tid: p1_fun(sort0)
#extern
fun p1_sort0seq_atm: p1_fun(sort0lst)
#extern
fun p1_sort0seq_COMMA: p1_fun(sort0lst)
//
(* ****** ****** *)
#extern
fun p1_s0arg: p1_fun(s0arg)
#extern
fun p1_s0mag: p1_fun(s0mag)
#extern
fun p1_t0arg: p1_fun(t0arg)
#extern
fun p1_t0mag: p1_fun(t0mag)
(* ****** ****** *)
#extern
fun p1_s0qua: p1_fun(s0qua)
(* ****** ****** *)
//
#extern
fun p1_l0s0e: p1_fun(l0s0e)
//
#extern
fun
p1_s0expseq_atm: p1_fun(s0explst)
//
#extern
fun
p1_l0s0eseq_COMMA: p1_fun(l0s0elst)
//
(* ****** ****** *)
//
(*
s0exp_RPAREN ::=
  | RPAREN
  | BAR s0expseq_COMMA RPAREN
l0s0e_RBRACE ::=
  | RPAREN
  | BAR l0s0eseq_COMMA RBRACE
*)
#extern
fun
p1_s0exp_RPAREN: p1_fun(s0exp_RPAREN)
#extern
fun
p1_l0s0e_RBRACE: p1_fun(l0s0e_RBRACE)
//
#extern
fun
s0exp_RPAREN_lctn:(s0exp_RPAREN)->loc_t
#extern
fun
l0s0e_RBRACE_lctn:(l0s0e_RBRACE)->loc_t
//
(* ****** ****** *)

#implfun
p1_t0int(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0int(tnd)
then
( buf.skip1()
; T0INTsome(tok)) else T0INTnone(tok)
//
end(*let*)//end-of-[p1_t0int(buf,err)]

(* ****** ****** *)

#implfun
p1_t0chr(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0chr(tnd)
then
( buf.skip1()
; T0CHRsome(tok)) else T0CHRnone(tok)
//
end(*let*)//end-of-[p1_t0chr(buf,err)]

(* ****** ****** *)

#implfun
p1_t0flt(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0flt(tnd)
then
( buf.skip1()
; T0FLTsome(tok)) else T0FLTnone(tok)
//
end(*let*)//end-of-[p1_t0flt(buf,err)]

(* ****** ****** *)

#implfun
p1_t0str(buf, err) =
let
val tok = buf.getk0()
val tnd = token_get_node(tok)
in//let
//
if
t0_t0str(tnd)
then
( buf.skip1()
; T0STRsome(tok)) else T0STRnone(tok)
//
end(*let*)//end-of-[p1_t0str(buf,err)]

(* ****** ****** *)

#implfun
p1_g0nid(buf, err) =
let
//
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
T_IDALP _ =>
i0dnt_some(tok) where
{
  val () = buf.skip1()
}
|
T_IDSYM _ =>
i0dnt_some(tok) where
{
  val () = buf.skip1()
}
//
|
_(*non-ident*) =>
 ( err := err + 1; i0dnt_none(tok) )
//
end(*let*)//end-of-[p1_g0nid(buf,err)]

(* ****** ****** *)

#implfun
p1_g0eid(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
//
|
T_IDALP _ =>
i0dnt_some(tok) where
{
  val () = buf.skip1()
}
|
T_IDSYM _ =>
i0dnt_some(tok) where
{
  val () = buf.skip1()
}
//
|
T_IDDLR _ =>
i0dnt_some(tok) where
{
  val () = buf.skip1()
}
//
|
T_AT0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_AT0(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_EQ0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_EQ0(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_LT0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_LT0(*void*)
val tok = token_make_node(loc,tnd)
}
|
T_GT0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_GT0(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_BSLSH((*void*)) =>
let
val ( ) =
buf.skip1() in i0dnt_some(tok) end
//
|
_(*non-ident*) =>
 ( err := err+1; i0dnt_none( tok ) )
//
end(*let*)//end-of-[p1_g0eid(buf,err)]

(* ****** ****** *)

#implfun
p1_s0tid(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
//
|
T_IDALP _ =>
(buf.skip1(); i0dnt_some(tok))
|
T_IDSYM _ =>
(buf.skip1(); i0dnt_some(tok))
//
| T_MSGT() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_MSGT(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_BSLSH _ =>
(buf.skip1(); i0dnt_some(tok))
//
|
_(*non-IDENT*) =>
(err := e00+1; i0dnt_none(tok))
//
end // end-of-let // end of [p1_s0tid]

(* ****** ****** *)

#implfun
p1_s0aid(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
|
T_IDALP _ =>
i0dnt_some(tok) where
{
  val () = buf.skip1()
}
|
_(*non-T_IDALP*) =>
 (err := e00 + 1; i0dnt_none(tok))
//
end(*let*)//end-of-[p1_s0aid(buf,err)]

(* ****** ****** *)

#implfun
p1_s0eid(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
T_IDALP _ =>
(buf.skip1(); i0dnt_some(tok))
|
T_IDSYM _ =>
(buf.skip1(); i0dnt_some(tok))
|
T_IDDLR _ =>
(buf.skip1(); i0dnt_some(tok))
//
| T_AT0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_AT0(*void*)
val tok = token_make_node(loc,tnd)
}
//
| T_EQ0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_EQ0(*void*)
val tok = token_make_node(loc,tnd)
}
//
| T_LT0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_LT0(*void*)
val tok = token_make_node(loc,tnd)
}
| T_GT0() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_GT0(*void*)
val tok = token_make_node(loc,tnd)
}
//
| T_LTGT() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_LTGT(*void*)
val tok = token_make_node(loc,tnd)
}
//
| T_MSGT() =>
( buf.skip1()
; i0dnt_some(tok)) where
{
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_MSGT(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_BSLSH() =>
let
val ( ) =
buf.skip1() in i0dnt_some(tok) end
//
|
_(*non-IDENT*) =>
 ( err := e00+1; i0dnt_none( tok ) )
//
end(*let*)//end-of-[p1_s0eid(buf, err)]

(* ****** ****** *)
//
#implfun
p1_s0qid(buf, err) =
let
//
  val e00 = err
  val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
|
T_IDQUA _ =>
let
val ( ) = buf.skip1()
val id0 = p1_s0eid(buf, err)
in
(err := e00; S0QIDsome(tok, id0))
end // end of [T_IDQUA]
//
|
_(*non-T_IDQUA*) =>
(
  S0QIDnone(id0)) where
{
  val id0 = p1_s0eid(buf, err)
}
//
end(*let*)//end-of-[p1_s0qid(buf,err)]
//
(* ****** ****** *)

#implfun
p1_d0pid(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
//
|
T_IDALP _ =>
let
val () =
buf.skip1() in i0dnt_some(tok)
end (*let*) // T_IDALP
|
T_IDSYM _ =>
let
val () =
buf.skip1() in i0dnt_some(tok)
end (*let*) // T_IDSYM
//
|
T_AT0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_AT0(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_BSLSH((*void*)) =>
let
val ( ) =
buf.skip1() in i0dnt_some(tok) end
//
|
_(*non-ident*) =>
 (err := err+1; i0dnt_none( tok ) )
//
end (*let*) // end of [p1_d0pid(buf, err)]

(* ****** ****** *)

#implfun
p1_d0eid(buf, err) =
let
//
val tok = buf.getk0()
val tnd = tok.tnode()
//
in
case+ tnd of
|
T_IDALP _ =>
let
val () =
buf.skip1() in i0dnt_some(tok)
end // T_IDALP
|
T_IDSYM _ =>
let
val () =
buf.skip1() in i0dnt_some(tok)
end // T_IDSYM
//
|
T_IDDLR _ =>
let
val () =
buf.skip1() in i0dnt_some(tok)
end // T_IDDLR
//
(*
|
T_IDSRP _ =>
let
val () =
buf.skip1() in i0dnt_some(tok)
end // T_IDSRP
*)
//
|
T_AT0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_AT0(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_BAR() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_BAR(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_EQ0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_EQ0(*void*)
val tok = token_make_node(loc,tnd)
}
//
(*
|
T_LT0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_LT0(*void*)
val tok = token_make_node(loc,tnd)
}
|
T_GT0() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_GT0(*void*)
val tok = token_make_node(loc,tnd)
}
*)
//
|
T_EQGT() =>
i0dnt_some(tok) where
{
val ( ) = buf.skip1()
val loc = tok.lctn((*void*))
val tnd = T0IDSYM_EQGT(*void*)
val tok = token_make_node(loc,tnd)
}
//
|
T_BSLSH((*void*)) =>
let
val ( ) =
buf.skip1() in i0dnt_some(tok) end
//
|
_(*non-ident*) =>
 (err := err+1; i0dnt_none( tok ) )
//
end(*let*)//end-of-[p1_d0eid(buf, err)]

(* ****** ****** *)
//
#implfun
p1_d0qid(buf, err) =
let
//
  val e00 = err
  val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
|
T_IDQUA _ =>
let
val ( ) = buf.skip1()
val id0 = p1_d0eid(buf, err)
in
(err := e00; D0QIDsome(tok, id0))
end // end of [T_IDQUA]
//
|
_(*non-T_IDQUA*) =>
(
  D0QIDnone(id0)) where
{
  val id0 = p1_d0eid(buf, err)
}
//
end(*let*)//end-of-[p1_d0qid(buf,err)]
//
(* ****** ****** *)

#implfun
p1_i0dnt(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+
tok.tnode() of
//
| _
when
t0_s0eid(tnd) => p1_s0eid(buf, err)
//
| _
when
t0_d0eid(tnd) => p1_d0eid(buf, err)
//
|
_(* non-i0dnt *) =>
 ( err := e00 + 1; i0dnt_none(tok) )
//
end (*let*) // end of [p1_i0dnt(buf,err)]

(* ****** ****** *)

#implfun
p1_l0abl(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val ( ) =
prerrln("p1_l0abl: tok = ", tok)
*)
//
in
//
case+ tnd of
|
T_INT01 _ =>
(
buf.skip1(); l0abl_make_int1(tok)
)
|
T_IDALP _ =>
(
buf.skip1(); l0abl_make_name(tok)
)
|
_(*non-INT-IDENT*) =>
(
  err := e00 + 1; l0abl_make_none(tok)
) (* end of [non-INT-IDALP] *)
//
end (*let*) // end of [p1_l0abl(buf,err)]

(* ****** ****** *)

#implfun
p1_s0ymb(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
//
in
//
case+
tok.node() of
|
T_LBRCKT() => let
  val tok1 = tok
  val (  ) = buf.skip1()
  val tok2 = p1_RBRCKT(buf, err)
  val lres = tok1.lctn()+tok2.lctn()
in
  s0ymb(lres, S0YMBbrckt(tok, tok2))
end // end of [T_LBRCKT]
|
_(*rest-of-token*) =>
let
  val dnt0 = p1_i0dnt(buf, err)
in
  s0ymb(dnt0.lctn(), S0YMBi0dnt(dnt0))
end (*let*) // end of [ rest-of-token ]
//
end (*let*) // end of [p1_s0ymb(buf,err)]

(* ****** ****** *)

local
//
in//local
//
#implfun
p1_g0nam(buf, err) =
let
//
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
//
in//let
//
case+ tnd of
|
T_LPAREN() => let
  val tbeg = tok
  val (  ) = buf.skip1()
  val gnms =
    p1_g0namseq_COMMA(buf, err)
  val tend = p1_RPAREN(buf, err)
in
  err := e00;
  g0nam_make_node
  ( lres
  , G0Nlist(tbeg, gnms, tend)) where
  {
    val lres = (tbeg.lctn()+tend.lctn())
  }
end // end of [T_LPAREN]
|
_(*rest-of-token*) => p1_g0nam_atm(buf, err)
end (*let*) // end of [ p1_g0nam(buf, err) ]
//
endloc (*local*) // end-of-[ local(p1_g0nam) ]

(* ****** ****** *)

#implfun
p1_g0nam_atm
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val () =
println!
("p1_g0nam_atm: e0 = ", e0)
val () =
println!
("p1_g0nam_atm: tok = ", tok)
*)
//
in
//
case+ tnd of
//
|
_ when t0_g0nid(tnd) =>
let
  val id0 =
  p1_g0nid(buf, err)
  val loc = id0.lctn()
in
  err := e00;
  g0nam_make_node(loc, G0Nid0(id0))
end // end of [t0_g0nid]
//
|
_ when t0_t0int(tnd) =>
let
  val i00 =
  p1_t0int(buf, err)
  val loc = i00.lctn()
in//let
  err := e00;
  g0nam_make_node(loc, G0Nint(i00))
end // end of [t0_t0int]
//
|
_ when t0_t0chr(tnd) =>
let
  val c00 =
  p1_t0chr(buf, err)
  val loc = c00.lctn()
in//let
  err := e00;
  g0nam_make_node(loc, G0Nchr(c00))
end // end of [t0_t0chr]
//
|
_ when t0_t0flt(tnd) =>
let
  val f00 =
  p1_t0flt(buf, err)
  val loc = f00.lctn()
in//let
  err := e00;
  g0nam_make_node(loc, G0Nflt(f00))
end // end of [t0_t0flt]
//
|
_ when t0_t0str(tnd) =>
let
  val s00 =
  p1_t0str(buf, err)
  val loc = s00.lctn()
in//let
  err := e00;
  g0nam_make_node(loc, G0Nstr(s00))
end // end of [t0_t0str]
//
| _ (* rest-of-token *) =>
(
  err := e00 + 1;
  g0nam_make_node(tok.lctn(), G0Ntkerr(tok))
)
//
end (*let*) // end of [p1_g0nam_atm(buf,err)]

(* ****** ****** *)
//
#implfun
p1_g0namseq_COMMA
  (buf, err) =
(
list_vt2t
(
ps_COMMA_p1fun{g0nam}(buf, err, p1_g0nam_atm))
) (* end of [ p1_g0namseq_COMMA(buf, err) ] *)
//
(* ****** ****** *)

local

fun
p1_napps
( buf:
! tkbf0
, err:
& sint >> _): g0exp =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in//let
//
case+ tnd of
//
|
T_IF0() => let
//
val tknd = tok
val (  ) = buf.skip1()
val g0e1 =
  p1_g0exp_app(buf, err)
val g0e2 =
  p1_g0exp_THEN(buf, err)
val g0e3 =
  p1_g0exp_ELSE(buf, err)
//
val topt = optn_nil{token}()
//
(*
  val topt = pq_ENDIF(buf, err)
*)
//
val lres =
(
case+ topt of
|optn_nil() =>
 (
 case g0e3 of
 |
 g0exp_ELSE
 (tels, g0e3) =>
 (tknd.lctn() + g0e3.lctn())
 )
|optn_cons(tok1) =>
 (tknd.lctn() + tok1.lctn())
) : loc_t // end of [val(lres)]
//
in
err := e00;
g0exp_make_node
( lres
, G0Eift0(tok, g0e1, g0e2, g0e3, topt))
end (*let*) // end of [T_IF0]
//
| _ (* rest-of-token *) =>
(
err := e00 + 1;
g0exp_make_node(tok.lctn(), G0Etkerr(tok)))
//
end (*let*) // end of [ p1_napps(buf,err) ]

in//local

#implfun
p1_g0exp(buf, err) =
let
//
val g0es =
p1_g0expseq_atm(buf, err)
//
in//let
//
case+ g0es of
|
list_nil() => p1_napps(buf, err)
|
list_cons
(g0e1, ges1) =>
(
case+ ges1 of
|list_nil() => g0e1
|list_cons _ =>
 let
   val g0e2 = list_last(ges1)
 in//let
   g0exp_make_node
   (g0e1.lctn()+g0e2.lctn(), G0Eapps(g0es))
 end // end of [list_cons]
) (*case*) // end of [list_cons]
//
end (*let*) // end of [p1_g0exp]

endloc (*local*) // end of [local(p1_g0exp)]

(* ****** ****** *)

#implfun
p1_g0exp_atm
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
_ when t0_g0eid(tnd) =>
let
  val id0 =
  p1_g0eid(buf, err)
  val loc = id0.lctn()
in
  err := e00;
  g0exp_make_node(loc, G0Eid0(id0))
end // end of [t0_g0eid]
//
|
_ when t0_t0int(tnd) =>
let
  val i00 =
  p1_t0int(buf, err)
  val loc = i00.lctn()
in//let
  err := e00;
  g0exp_make_node(loc, G0Eint(i00))
end // end of [t0_t0int]
//
|
_ when t0_t0chr(tnd) =>
let
  val c00 =
  p1_t0chr(buf, err)
  val loc = c00.lctn()
in//let
  err := e00;
  g0exp_make_node(loc, G0Echr(c00))
end // end of [t0_t0chr]
//
|
_ when t0_t0flt(tnd) =>
let
  val f00 =
  p1_t0flt(buf, err)
  val loc = f00.lctn()
in//let
  err := e00;
  g0exp_make_node(loc, G0Eflt(f00))
end // end of [t0_t0flt]
//
|
_ when t0_t0str(tnd) =>
let
  val s00 =
  p1_t0str(buf, err)
  val loc = s00.lctn()
in//let
  err := e00;
  g0exp_make_node(loc, G0Estr(s00))
end // end of [t0_t0str]
//
|
T_LPAREN() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val g0es =
    p1_g0expseq_COMMA(buf, err)
  // end of [val]
  val tend = p1_RPAREN(buf, err)
in
  err := e00;
  g0exp_make_node
  ( lres
  , G0Elpar(tbeg, g0es, tend)) where
  {
    val lres = tbeg.lctn()+tend.lctn()
  }
end (*let*) // end of [T_LPAREN]
//
|
_ (* rest-of-token *) =>
let
  val () = (err := e00 + 1)
  // HX: indicating a parsing error
in
  g0exp_make_node(tok.lctn(), G0Etkerr(tok))
end (* this-is-a-case-of-error *)
//
end (*let*) // end of [p1_g0exp_atm(buf,err)]
//
(* ****** ****** *)
//
#implfun
p1_g0exp_app
  (buf, err) = let
//
val
g0e0 = p1_g0exp_atm(buf, err)
val
g0es = p1_g0expseq_atm(buf, err)
//
in//let
//
case+ g0es of
|
list_nil() => g0e0
|
list_cons _ =>
let
  val g0e1 = list_last(g0es)
  val loc0 = g0e0.lctn() + g0e1.lctn()
in
  g0exp_make_node
  (loc0, G0Eapps(list_cons(g0e0, g0es)))
end (*let*) // end of [list_cons]
//
end (*let*) // end of [p1_g0exp_app(buf,err)]
//
(* ****** ****** *)
//
#implfun
p1_g0exp_THEN
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in
//
case+ tnd of
|
T_THEN() => let
  val tknd = tok
  val (  ) = buf.skip1()
  val g0e1 = p1_g0exp(buf, err)
in
  err := e00; g0exp_THEN(tknd, g0e1)
end // end of [T_THEN]
|
_(*non-T_THEN*) =>
( // HX-2018-09-25: error
  g0exp_THEN(tok, p1_g0exp(buf, err))
) (* end of [non-T_THEN] *)
//
end(*let*)//end of [p1_g0exp_THEN(...)]
//
#implfun
p1_g0exp_ELSE
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in
//
case+ tnd of
|
T_ELSE() => let
  val tknd = tok
  val (  ) = buf.skip1()
  val g0e1 = p1_g0exp(buf, err)
in
  err := e00; g0exp_ELSE(tknd, g0e1)
end // end of [T_ELSE]
|
_(*non-T_ELSE*) =>
( // HX-2018-09-25: error
  g0exp_ELSE(tok, p1_g0exp(buf, err))
) (* end of [non-T_ELSE] *)
//
end(*let*)//end of [p1_g0exp_ELSE(...)]
//
(* ****** ****** *)
//
#implfun
p1_g0expseq_atm
  (buf, err) =
(
list_vt2t
(ps_p1fun{g0exp}(buf, err, p1_g0exp_atm))
)
//
(* ****** ****** *)
//
#implfun
p1_g0expseq_COMMA
  (buf, err) =
(
list_vt2t
(ps_COMMA_p1fun{g0exp}(buf, err, p1_g0exp))
)
//
(* ****** ****** *)
//
#implfun
p1_g0argseq_COMMA
  (buf, err) =
(
list_vt2t
(ps_COMMA_p1fun{g0eid}(buf, err, p1_g0eid))
)
//
(* ****** ****** *)
//
#implfun
p1_g0mag(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in (* in-of-let *)
//
case+ tnd of
//
|
T_LBRACE() => let
//
val tbeg = tok
val (  ) = buf.skip1()
val g0as =
  p1_g0argseq_COMMA(buf, err)
val tend = p1_RBRACE(buf, err)
//
val
lres = tbeg.lctn()+tend.lctn()
//
in//let
err := e00;
g0mag_make_node
(lres, G0MAGsarg(tbeg,g0as,tend))
end (*let*) // end of [T_LBRACE()]
//
|
T_LPAREN() => let
//
val tbeg = tok
val (  ) = buf.skip1()
val g0as =
  p1_g0argseq_COMMA(buf, err)
val tend = p1_RPAREN(buf, err)
//
val
lres = tbeg.lctn()+tend.lctn()
//
in//let
err := e00;
g0mag_make_node
(lres, G0MAGdarg(tbeg,g0as,tend))
end (*let*) // end of [T_LPAREN()]
//
|
_ (*non-LBRACE/LPAREN*) =>
let
  val () = (err := e00 + 1)
in
  g0mag( tok.lctn(), G0MAGnone(tok) )
end (*let*) // end-of(non-LBRACE/LPAREN)
//
end (*let*) // end of [p1_g0mag(buf,err)]
//
(* ****** ****** *)
//
(*
idsort0::
  | s0tid
//
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
(* ****** ****** *)

local
//
fun
p1_napps
( buf:
! tkbf0
, err: &sint >> _): sort0 =
let
  val e00 = err
  val tok = buf.getk0()
in
err := e00 + 1;
sort0(tok.lctn(),S0Ttkerr(tok))
end (*let*) // end of [p1_napps]
//
in//local

(* ****** ****** *)

#implfun
p1_sort0(buf, err) =
let
//
val s0ts =
p1_sort0seq_atm(buf, err)
//
in//let
//
case+ s0ts of
|
list_nil
((*void*)) =>
p1_napps(buf, err)
|
list_cons
(s0t0, sts1) =>
(
case+ sts1 of
|
list_nil() => s0t0
|
list_cons _ =>
let
  val loc0 =
  s0t0.lctn()+s0t1.lctn()
in
  sort0(loc0, S0Tapps(s0ts))
end where
{
val s0t1 =
gseq_last_ini<sort0lst><sort0>(sts1, s0t0)
} (*where*) // end of [list_cons]
)
//
end(*let*)//end-of-[p1_sort0(buf,err)]

(* ****** ****** *)

endloc (*local*) // end of [local(p1_sort0)]

(* ****** ****** *)

#implfun
p1_sort0_tid
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val () =
println!
("p1_sort0_tid: e00 = ", e00)
val () =
println!
("p1_sort0_tid: tok = ", tok)
*)
//
in//let
//
case+ tnd of
//
| _
when
t0_s0tid(tnd) =>
let
val id0 = p1_s0tid(buf, err)
in//let
err := e00;
sort0(id0.lctn(), S0Tid0(id0))
end (*let*) // end of [t0_s0tid]
| _
(*otherwise*) =>
let
  val () = (err := e00 + 1)
in//let
  sort0(tok.lctn(), S0Ttkerr(tok))
endlet(*HX:this-is-a-case-of-error*)
//
end (*let*) // end of [p1_sort0_tid]

(* ****** ****** *)

#implfun
p1_sort0_atm
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val () =
println!
("p1_sort0_atm: e00 = ", e00)
val () =
println!
("p1_sort0_atm: tok = ", tok)
*)
//
in
//
case+ tnd of
//
| _
when t0_s0tid(tnd) =>
let
  val id0 = p1_s0tid(buf, err)
in
  err := e00
; sort0(id0.lctn(), S0Tid0(id0))
end (*let*) // end of [t0_s0tid]
//
| _
when t0_t0int(tnd) =>
let
  val i00 = p1_t0int(buf, err)
in
  err := e00
; sort0(i00.lctn(), S0Tint(i00))
end (*let*) // end of [t0_t0int]
|
T_LPAREN() =>
let
val tbeg = tok
val (  ) = buf.skip1()
val s0ts =
p1_sort0seq_COMMA(buf, err)
val tend = p1_RPAREN(buf, err)
val loc0 = tbeg.lctn()+tend.lctn()
in
  err := e00
; sort0
  (loc0,S0Tlpar(tbeg, s0ts, tend))
end (*let*) // end of [T_LPAREN]
//
|
T_IDQUA(qid) =>
let
val tqua = tok
val (  ) = buf.skip1()
val s0t0 = p1_sort0_atm(buf, err)
val loc0 = tqua.lctn()+s0t0.lctn()
in//let
  err := e00
; sort0(loc0, S0Tqid(tqua, s0t0))
end (*let*) // end of [ T_IDQUA ]
//
| _ (* error *) =>
let
  val () = (err := e00 + 1)
in//let
  sort0(tok.lctn(), S0Ttkerr(tok))
endlet // HX:this-is-a-case-of-error
//
end (*let*) // end of [ p1_sort0_atm ]
//
(* ****** ****** *)
//
#implfun
p1_sort0seq_atm
(  buf, err  ) =
list_vt2t
(
ps_p1fun{sort0}(buf, err, p1_sort0_atm)
)
#implfun
p1_sort0seq_COMMA
(  buf, err  ) =
list_vt2t
(
ps_COMMA_p1fun{sort0}(buf, err, p1_sort0)
)
//
(* ****** ****** *)

local
//
fun
p1_sort0_app_ntk
( buf:
! tkbf0
, err: &sint >> _
, ntk
: (tnode) -> bool): sort0 =
let
//
fun
f1_ntk
( buf:
! tkbf0
, err: &sint >> _): sort0 =
let
//
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
//
in
if
ntk(tnd)
then
p1_sort0_atm(buf, err)
else
let
val () =
(err := e00 + 1) in//let
sort0(tok.lctn(), S0Ttkerr(tok))
end (*let*) // end of [else]
end (*let*) // end of [f1_ntk]
//
val s0t1 = f1_ntk(buf, err)
val s0ts =
list_vt2t
(ps_p1fun{sort0}(buf,err,f1_ntk))
//
in
//
case+ s0ts of
|
list_nil
((*void*)) => s0t1
|
list_cons _ =>
let
  val s0t2 = list_last(s0ts)
  val lres = s0t1.lctn()+s0t2.lctn()
in//let
sort0(lres, S0Tapps(list_cons(s0t1,s0ts)))
end // end of [list_cons]
//
end(*let*)//end(p1_sort0_app_ntk(buf,err,ntk))
//
in//local
//
#implfun
p1_sort0_app_NGT0
  (buf, err) =
(
p1_sort0_app_ntk(buf, err, ntk)
) where
{
fun
ntk(tnd: tnode): bool =
(case+ tnd of T_GT0() => false | _ => true)
} (*where*)//end-of(p1_sort0_app_NGT0(buf,err))
//
endloc(*local*)//end-of[local(p1_sort0_app_ntk]

(* ****** ****** *)

#implfun
p1_s0tcn(buf, err) =
let
//
val e00 = err
//
val sid0 =
  p1_s0eid(buf, err)
//
val tok1 = buf.getk0()
val tnd1 = tok1.tnode()
//
in//let
//
case+ tnd1 of
|
T_OF0() => let
  val ( ) = buf.skip1()
  val s0t0 = p1_sort0(buf, err)
  val lres = sid0.lctn()+s0t0.lctn()
in//let
err := e00;
s0tcn_make_node
(lres, S0TCNnode(sid0, optn_cons(s0t0)))
end (*let*) // end of [T_OF0]
|
_
(* non-T_OF0 *) =>
let
val lres = sid0.lctn()
in
(*
err := e00; // HX: [p1_s0eid] can err!
*)
s0tcn_make_node
(lres, S0TCNnode(sid0, optn_nil(*void*)))
end (*let*) // end of [non-T-OF0]
//
end (*let*) // end of [p1_s0tcn(buf,err)]

(* ****** ****** *)

#implfun
p1_d0tst
  (buf, err) = let
//
val e00 = err
//
val tid0 =
  p1_s0tid(buf, err)
//
val loc0 = tid0.lctn()
//
val teq1 = p1_EQ0(buf, err)
val topt = pq_BAR(buf, err)
//
val stcs =
  p1_s0tcnseq_BAR(buf, err)
//
val lres =
(
case+ stcs of
|
list_nil() =>
(
case+ topt of
|
optn_nil
((*void*)) => loc0 + teq1.lctn()
|
optn_cons
(  tbar  ) => loc0 + tbar.lctn()
) (* end of [list_nil] *)
|
list_cons _ =>
let
val stc1 =
list_last(stcs) in loc0+stc1.lctn()
end(*let*)// end of [list_cons]
) : loc_t // end of [val(lres)]
//
in
//
err := e00;
d0tst_make_node
(lres, D0TSTnode(tid0, teq1, topt, stcs))
//
end (* let *) // end of [p1_d0tst(buf,err)]

(* ****** ****** *)

#implfun
pq_sort0_anno
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
//
(*
val ( )
prerrln
("pq_sort0_anno: tok = ", tok)
*)
//
in(*let*)
//
case+
tok.node() of
|
T_CLN() =>
let
val ( ) = buf.skip1()
val s0t = p1_sort0(buf, err)
in//let
  (err := e00; optn_cons(s0t))
end (*let*) // end of [T_CLN]
|
_(*non-T_CLN*) => optn_nil(*void*)
//
end (*let*)//end-of(pq_sort0_anno)

(* ****** ****** *)

#implfun
pq_ids0t_anno
  (buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
|
T_CLN() =>
( err := e00
; optn_cons(s0t)) where
{
  val ( ) = buf.skip1()
  val s0t = p1_sort0_atm(buf, err)
}
|
_(*non-COLON*) => optn_nil(*void*)
//
end (*let*) // end-of-[pq_ids0t_anno]

(* ****** ****** *)

#implfun
p1_s0arg(buf, err) = let
//
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
//
in//let
//
case+
tok.node() of
| _
when t0_s0aid(tnd) =>
let
val id0 = p1_s0aid(buf, err)
val tok = buf.getk0((*void*))
in//let
//
case+
tok.node() of
//
|
T_CLN() =>
let
val ( ) = buf.skip1()
val s0t = p1_sort0(buf, err)
val loc = id0.lctn() + s0t.lctn()
in//let
  err := e00
; s0arg(loc, S0ARGsome(id0, some(s0t)))
end (*end*) // end of [T_CLN]
//
|
_(*non-T_CLN*) =>
let
val loc = id0.lctn()
in
s0arg(loc, S0ARGsome(id0, none((*nil*))))
end (*let*) // end of [non-T_CLN]
//
end (*let*) // end of [t0_s0aid(tok)]
//
| _ (* otherwise *) =>
(err := e00 + 1; s0arg(tok.lctn(), S0ARGnone(tok)))
//
end (*let*) // end-of-[p1_s0arg(buf,err)]

(* ****** ****** *)

#implfun
p1_s0mag(buf, err) =
let
//
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
T_LPAREN() =>
let
val tbeg = tok
val () = buf.skip1()
val s0as =
p1_s0argseq_COMMA(buf, err)
val tend = p1_RPAREN(buf, err)
val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00
; s0mag(lres, S0MAGlist(tbeg, s0as, tend))
end (*let*) // end of [T_LPAREN]
//
| _
when t0_s0aid(tnd) =>
let
  val id0 = p1_s0aid(buf, err)
in//let
(err := e00; s0mag(id0.lctn(), S0MAGsing(id0)))
end (*let*) // end of [t0_s0aid]
//
| _(*otherwise*) =>
(err := e00 + 1; s0mag(tok.lctn(), S0MAGnone(tok)))
//
end (*let*) // end of [p1_s0mag(buf,err)]

(* ****** ****** *)

#implfun
p1_t0arg(buf, err) =
let
//
val e00 = err
//
val mark =
tokbuf_mark_get(buf)
//
val tok0 = buf.getk1()
val tok1 = buf.getk0()
val tnd0 = tok0.tnode()
//
in//let
//
case+
tok1.node() of
//
|
T_CLN()
when t0_s0aid(tnd0) =>
let
  val (  ) = buf.skip1()
  val (  ) =
  tokbuf_mark_clr(buf, mark)
  val s0t0 = p1_sort0(buf, err)
  val lres = tok0.lctn() + s0t0.lctn()
in
  err := e00
; t0arg_make_node
  (lres, T0ARGsome(s0t0, optn_cons(tok0)))
end // end of [CLN]
//
|
_(*non-T_CLN*) =>
let
  val (  ) =
  tokbuf_mark_set(buf, mark)
  val s0t0 = p1_sort0(buf, err)
in//let
  if
  (err > e00)
  then
  t0arg_make_node
  (tok0.lctn(), T0ARGnone(tok0))
  else
  t0arg_make_node
  (s0t0.lctn(), T0ARGsome(s0t0, optn_nil(*void*)))
end // end of [non-T_CLN]
//
end (*let*) // end of [p1_t0arg(buf,err)]

(* ****** ****** *)
//
(*
t0marg ::
  | ( t0argseq )
*)
#implfun
p1_t0mag(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in
//
case+ tnd of
//
|
T_LPAREN() =>
let
val tbeg = tok
val (  ) = buf.skip1()
val t0as =
p1_t0argseq_COMMA(buf, err)
val tend = p1_RPAREN(buf, err)
val lres = tbeg.lctn()+tend.lctn()
in//let
err := e00;
t0mag_make_node
(lres, T0MAGlist(tbeg, t0as, tend))
end (*let*) // end of [T_LPAREN]
//
|
_(*non-T_LPAREN*) =>
let
val loc = tok.lctn()
val ( ) = (err := e00 + 1)
in
  t0mag_make_node(loc, T0MAGnone(tok))
end
//
end (*let*) // end of [p1_t0marg(buf,err)]

(* ****** ****** *)

local
//
// HX-2018-09-25:
// [f0_ids] should always returns
// a non-empty list of identifiers
//
fun
f0_ids
( buf:
! tkbf0 >> _
, err: &sint >> _): i0dntlst =
let
//
val ids =
list_vt2t
(
ps_COMMA_p1fun{s0aid}(buf,err,p1_s0aid)
) (* end of [val] *)
//
in
//
case+ ids of
|
list_nil() =>
list_sing(p1_s0aid(buf, err)) | _ => ids
//
end (*let*) // end of [f0_ids(buf,err)]

in//local

#implfun
p1_s0qua(buf, err) =
let
//
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
| _
when t0_s0aid(tnd) =>
let
//
val id0 =
p1_s0aid(buf, err)
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
T_CLN() =>
let
val ( ) = buf.skip1()
val ids = list_sing(id0)
val s0t = p1_sort0(buf, err)
val lres = id0.lctn() + s0t.lctn()
in//let
  err := e00
; s0qua(lres, S0QUAvars(ids, some(s0t)))
end (*end*) // end of [T_CLN]
//
|
T_COMMA() =>
let
val ( ) = buf.skip1()
val ids = f0_ids(buf, err)
val ids = list_cons(id0, ids)
val tres = pq_sort0_anno(buf, err)
val lres =
(
case+ tres of
|
optn_nil() => id0.lctn()
|
optn_cons(s0t) =>
id0.lctn() + s0t.lctn()): loc_t//end(val)
in//let
err := e00; s0qua(lres, S0QUAvars(ids, tres))
end (*let*) // end of [T_COMMA]
//
| _(*s0expseq_atm*) =>
let
val s0es =
p1_s0expseq_atm(buf, err)
val s0e0 =
s0exp(id0.lctn(), S0Eid0(id0))
val s0e1 =
(
case+ s0es of
|
list_nil
((*void*)) => s0e0
|
list_cons _ =>
let
val s0ez = list_last(s0es)
val lres = id0.lctn() + s0ez.lctn()
in//let
s0exp
( lres
, S0Eapps(list_cons(s0e0, s0es)))end): s0exp
//
in
  err := e00
; s0qua(s0e1.lctn(), S0QUAprop(s0e1))
end (*let*) // end of [s0expseq_atm]
//
end (*let*) // end of [t0_s0aid(tnd)]
//
| _(*not-t0_s0aid*) =>
let
  val s0e0 = p1_s0exp(buf, err)
in//let
// HX-2018-09-09:
// for improving error message reporting?
(err := e00; s0qua(s0e0.lctn(), S0QUAprop(s0e0)))
end (*let*) // end of [not(t0_s0aid(tnd)]
//
end (*let*) // end of [ p1_s0qua(buf,err) ]

endloc (*local*) // end of [local(p1_s0qua)]

(* ****** ****** *)
//
#implfun
p1_s0magseq
(  buf, err  ) =
list_vt2t
(ps_p1fun{s0mag}(buf, err, p1_s0mag))
#implfun
p1_t0magseq
(  buf, err  ) =
list_vt2t
(ps_p1fun{t0mag}(buf, err, p1_t0mag))
//
(* ****** ****** *)
//
#implfun
p1_s0tcnseq_BAR
(  buf, err  ) =
list_vt2t
(
ps_BAR_p1fun{s0tcn}(buf, err, p1_s0tcn)
) (*end of [p1_s0tcnseq_BAR(buf,err)]*)
//
#implfun
p1_d0tstseq_AND
(  buf, err  ) =
list_vt2t
(
ps_AND_p1fun{d0tst}(buf, err, p1_d0tst)
) (*end of [p1_d0tstseq_AND(buf,err)]*)
//
(* ****** ****** *)

#implfun
p1_s0argseq_COMMA
(  buf, err  ) =
list_vt2t
(
ps_COMMA_p1fun{s0arg}(buf, err, p1_s0arg)
) (*end of [p1_s0argseq_COMMA](buf,err)*)

(* ****** ****** *)

#implfun
p1_t0argseq_COMMA
(  buf, err  ) =
list_vt2t
(
ps_COMMA_p1fun{t0arg}(buf, err, p1_t0arg)
) (*end of [p1_t0argseq_COMMA(buf,err)]*)

(* ****** ****** *)

#implfun
p1_s0quaseq_BSCLN
(  buf, err  ) =
list_vt2t
(
ps_BSCLN_p1fun{s0qua}(buf, err, p1_s0qua)
) (*end of [p1_s0argseq_BSCLN(buf,err)]*)

(* ****** ****** *)

local
//
fun
p1_napps
( buf:
! tkbf0
, err: &sint >> _): s0exp =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
|
T_LAM(k0) =>
let
val tok0 = tok
val (  ) = buf.skip1()
val s0ms = p1_s0magseq(buf, err)
val anno = pq_sort0_anno(buf, err)
val tok1 = p1_EQGT(buf, err)
val s0e0 = p1_s0exp(buf, err)
val opt2 = pq_ENDLAM(buf, err)
val lres =
(
case+ opt2 of
|optn_nil() =>
tok0.lctn() + s0e0.lctn()
|optn_cons(tok2) =>
tok0.lctn() + tok2.lctn() ): loc_t
//
in//let
//
err := e00;
s0exp
(lres
,S0Elams(tok0, s0ms, anno, tok1, s0e0, opt2))
end (*let*) // end of [T_LAM(k0)]
//
|
_(*non-T_LAM*) =>
(err := e00 + 1; s0exp(tok.lctn(), S0Etkerr(tok)))
//
end (*let*) // end of [p1_napps(buf,err)]
//
in//local

(* ****** ****** *)

#implfun
p1_s0exp(buf, err) =
let
//
val e00 = err
//
val s0es =
p1_s0expseq_atm(buf, err)
//
in//let
//
case+ s0es of
|
list_nil() =>
p1_napps(buf, err)
|
list_cons
(s0e1, ses1) =>
let
val opt =
pq_sort0_anno(buf, err)
in//let
case+ ses1 of
|
list_nil _ =>
(
  s0exp_annotopt(s0e1, opt)
)
|
list_cons _ =>
(
  s0exp_annotopt(s0e0, opt)
) where
{
  val s0e2 = list_last(ses1)
  val loc0 = s0e1.lctn()+s0e2.lctn()
  val s0e0 = s0exp(loc0, S0Eapps(s0es))
} (*where*) // end of [list_cons]
end (*let*) // end of [list_cons]
end (*let*) // end of [p1_s0exp(buf,err)]

(* ****** ****** *)

#implfun
p1_s0tdf(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
|
T_LBRACE() =>
let
val tbeg = tok
val (  ) = buf.skip1()
val s0a0 = p1_s0arg(buf, err)
val tbar = p1_BAR(buf, err)
val s0es = p1_s0expseq_SMCLN(buf, err)
val tend = p1_RBRACE(buf, err)
val lres = tbeg.lctn()+tend.lctn()
in//let
err := e00;
s0tdf(lres,S0TDFtsub(tbeg,s0a0,tbar,s0es,tend))
end (*let*) // end of [T_LBRACE]
| _(*non-T_LBRACE*) =>
let
val s0t = p1_sort0(buf, err)
in//let
(err := e00; s0tdf(s0t.lctn(), S0TDFsort(s0t)))
end (*let*) // end of [non-T_LBRACE]
//
end (*let*) // end of [p1_s0tdf(buf,err)]

(* ****** ****** *)

#implfun
p1_l0s0e(buf, err) =
let
//
val e00 = err
//
val lab =
p1_l0abl(buf, err)
val tok = p1_EQ0(buf, err)
val s0e = p1_s0exp(buf, err)
//
(*
val ((*void*)) =
println! ("p1_l0s0e: lab = ", lab)
val ((*void*)) =
println! ("p1_l0s0e: tok = ", tok)
val ((*void*)) =
println! ("p1_l0s0e: s0e = ", s0e)
*)
//
in
  (err := e00; S0LAB(lab, tok, s0e))
end (*let*) // end of [p1_l0s0e(buf,err)]

(* ****** ****** *)

endloc (*local*) // end of [local(p1_s0exp)]

(* ****** ****** *)

#implfun
p1_s0exp_atm(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val () =
prerrln("p1_s0exp_atm: tok = ", tok)
*)
//
in//let
//
case+ tnd of
//
| _
when t0_s0eid(tnd) =>
let
  val id0 = p1_s0eid(buf, err)
in
  err := e00
; s0exp(id0.lctn(), S0Eid0(id0))
end (*let*) // end of [t0_s0eid]
//
| _
when t0_t0int(tnd) =>
let
  val i00 = p1_t0int(buf, err)
in
  err := e00
; s0exp(i00.lctn(), S0Eint(i00))
end (*let*) // end of [t0_t0int]
| _
when t0_t0chr(tnd) =>
let
  val c00 = p1_t0chr(buf, err)
in
  err := e00
; s0exp(c00.lctn(), S0Echr(c00))
end (*let*) // end of [t0_t0chr]
| _
when t0_t0flt(tnd) =>
let
  val f00 = p1_t0flt(buf, err)
in
  err := e00
; s0exp(f00.lctn(), S0Eflt(f00))
end (*let*) // end of [t0_t0flt]
| _
when t0_t0str(tnd) =>
let
  val s00 = p1_t0str(buf, err)
in
  err := e00
; s0exp(s00.lctn(), S0Estr(s00))
end (*let*) // end of [t0_t0str]
//
| T_OP1 _ =>
let
val tok0 = tok
val (  ) = buf.skip1()
in//let
  s0exp(tok0.lctn(), S0Eop1(tok0))
end (*let*) // end of [T_OP1()]
| T_OP2 _ =>
let
val tok0 = tok
val (  ) = buf.skip1()
in//let
  s0exp(tok0.lctn(), S0Eop2(tok0))
end (*let*) // end of [T_OP3(sym)]
| T_OP3 _ =>
let
val tbeg = tok
val (  ) = buf.skip1()
val opid = p1_s0eid(buf, err)
val tend = p1_RPAREN(buf, err)
val lres = tbeg.lctn()+tend.lctn()
in//let
  err := e00
; s0exp(lres, S0Eop3(tbeg,opid,tend))
end (*let*) // end of [T_OP2(par)]
//
|
T_MSLT() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val s0es =
  list_vt2t
  (
  ps_COMMA_p1fun{s0exp}
  (buf, err, p1_s0exp_app_NGT0))
  val tend = p1_GT0(buf, err)
  val lres = tbeg.lctn() + tend.lctn()
in
  err := e00
; s0exp(lres, S0Efimp(tbeg,s0es,tend))
end (*let*) // end of [ -< ... > ]
//
|
T_LBRACE() =>
let
val tbeg = tok
val (  ) = buf.skip1()
val s0qs =
p1_s0quaseq_BSCLN(buf, err)
val tend = p1_RBRACE(buf, err)
val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00
; s0exp(lres, S0Euni0(tbeg,s0qs,tend))
end (*let*) // end of [ { ... } ]
//
|
T_LBRCKT() =>
let
val tok0 = tok
val (  ) = buf.skip1()
val s0qs =
p1_s0quaseq_BSCLN(buf, err)
val tbeg =
token(tok0.lctn(),T_EXISTS(0))
val tend = p1_RBRCKT(buf, err)
val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00
; s0exp(lres, S0Eexi0(tbeg,s0qs,tend))
end (*let*) // end of [ [ ... ] ]
|
T_EXISTS(k0) =>
let
val tbeg = tok
val () = buf.skip1()
val s0qs =
p1_s0quaseq_BSCLN(buf, err)
val tend = p1_RBRCKT(buf, err)
val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00
; s0exp(lres, S0Eexi0(tbeg,s0qs,tend))
end (*let*) // end of [ #[ ... ] ]
//
|
T_IDQUA(qid) =>
let
val tqua = tok
val (  ) = buf.skip1()
val s0e0 = p1_s0exp_atm(buf, err)
val loc0 = tqua.lctn()+s0e0.lctn()
in//let
  err := e00
; s0exp(loc0 , S0Equal0( tqua, s0e0 ))
end (*let*) // end of [T_IDQUA(qid)]
//
|
T_LPAREN() =>
let
val tbeg = tok
val (  ) = buf.skip1()
val s0es =
p1_s0expseq_COMMA(buf, err)
val tend = p1_s0exp_RPAREN(buf, err)
val lres =
tbeg.lctn() + s0exp_RPAREN_lctn(tend)
in//let
  err := e00
; s0exp(lres, S0Elpar(tbeg,s0es,tend))
end (*let*) // end of [T_LPAREN(...)]
//
|
T_TRCD10(k0) =>
let
val tbeg = tok
val () = buf.skip1()
val topt =
(
if
(k0 <= 1)
then optn_nil()
else optn_cons(p1_LPAREN(buf, err))
) : tokenopt // end-of(val)
//
val s0es =
p1_s0expseq_COMMA(buf, err)
val tend = p1_s0exp_RPAREN(buf, err)
//
val lres =
(tbeg.lctn()+s0exp_RPAREN_lctn(tend))
//
in//let
  err := e00
; s0exp(lres,S0Etup1(tbeg,topt,s0es,tend))
//
end (*let*) // end of [T_TRCD10(...|...)]
//
|
T_TRCD20(k0) =>
let
val tbeg = tok
val (  ) = buf.skip1()
val topt =
( if
(k0 <= 1)
then optn_nil()
else optn_cons(p1_LBRACE(buf, err))
) : tokenopt // end-of(val)
val lses =
p1_l0s0eseq_COMMA(buf, err)
val tend = p1_l0s0e_RBRACE(buf, err)
//
val lres =
(tbeg.lctn()+l0s0e_RBRACE_lctn(tend))
//
in//let
  err := e00
; s0exp(lres,S0Ercd2(tbeg,topt,lses,tend))
end (*let*) // end of [T_TRCD20{...|...}]
//
| _(*otherwise*) =>
let
(*
val () =
prerrln
("p1_s0exp_atm: otherwise: tok = ", tok)
*)
in//let
let
val loc = tok.lctn() in
(
err := e00 + 1; s0exp(loc, S0Etkerr(tok)))
end(*let*)
end(*let*)
//
end(*let*)//end-of-[p1_s0exp_atm(buf,err)]

(* ****** ****** *)
//
#implfun
p1_s0expseq_atm
(  buf, err  ) =
list_vt2t
(ps_p1fun{s0exp}(buf, err, p1_s0exp_atm))
//
(* ****** ****** *)
//
#implfun
p1_s0expseq_COMMA
(  buf, err  ) =
list_vt2t
(ps_COMMA_p1fun{s0exp}(buf, err, p1_s0exp))
//
#implfun
p1_l0s0eseq_COMMA
(  buf, err  ) =
list_vt2t
(ps_COMMA_p1fun{l0s0e}(buf, err, p1_l0s0e))
//
(* ****** ****** *)
//
#implfun
p1_s0expseq_SMCLN
(  buf, err  ) =
list_vt2t
(ps_SMCLN_p1fun{s0exp}(buf, err, p1_s0exp))
//
(* ****** ****** *)

#implfun
p1_s0exp_RPAREN
  (buf, err) =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in
//
case+ tnd of
| T_BAR() =>
let
  val tok1 = tok
  val () = buf.skip1()
  val s0es =
  p1_s0expseq_COMMA(buf, err)
  val tok2 = p1_RPAREN(buf, err)
in//let
  err := e00
; s0exp_RPAREN_cons1(tok1, s0es, tok2)
end (*let*) // end of [ | ... ]
| _(*non-T_BAR*) =>
(
case+ tnd of
| T_RPAREN() => let
    val () = buf.skip1()
  in
    (err := e00; s0exp_RPAREN_cons0(tok))
  end // end of [RPAREN]
| _(*non-RPAREN*) =>
  (err := e00 + 1; s0exp_RPAREN_cons0(tok))
) (*case*) // end of [non-T_BAR]
//
end (*let*) // end-of-[p1_s0exp_RPAREN(buf,err)]

(* ****** ****** *)

#implfun
p1_l0s0e_RBRACE
  (buf, err) =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in
//
case+ tnd of
|
T_BAR() =>
let
  val tok1 = tok
  val () = buf.skip1()
  val lses =
  p1_l0s0eseq_COMMA(buf, err)
  val tok2 = p1_RBRACE(buf, err)
in//let
  err := e00
; l0s0e_RBRACE_cons1(tok1, lses, tok2)
end (*let*) // end of [ | ... ]
| _(*non-T_BAR*) =>
(
case+ tnd of
| T_RBRACE() => let
    val () = buf.skip1()
  in
    (err := e00; l0s0e_RBRACE_cons0(tok))
  end // end of [RBRACE]
| _(*non-RBRACE*) =>
  (err := e00 + 1; l0s0e_RBRACE_cons0(tok))
) (*case*) // end of [non-T_BAR]
//
end (*let*) // end-of-[p1_l0s0e_RBRACE(buf,err)]

(* ****** ****** *)

#implfun
s0exp_RPAREN_lctn
  (node) =
(
case+ node of
| s0exp_RPAREN_cons0
  (      tbar      ) => tbar.lctn()
| s0exp_RPAREN_cons1
  (tok1, s0es, tok2) => tok1.lctn() + tok2.lctn()
) (*case*) // end of [s0exp_RPAREN_lctn(node)] 

(* ****** ****** *)

#implfun
l0s0e_RBRACE_lctn
  (node) =
(
case+ node of
| l0s0e_RBRACE_cons0
  (      tbar      ) => tbar.lctn()
| l0s0e_RBRACE_cons1
  (tok1, lses, tok2) => tok1.lctn() + tok2.lctn()
) (*case*) // end of [l0s0e_RBRACE_lctn(node)]

(* ****** ****** *)

local
//
fun
p1_s0exp_app_ntk
( buf:
! tkbf0
, err: &sint >> _
, ntk
: (tnode) -> bool): s0exp =
let
//
fun
f1_ntk
( buf:
! tkbf0
, err: &sint >> _): s0exp =
let
//
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
//
in
if
ntk(tnd)
then
p1_s0exp_atm(buf, err)
else
let
val () =
(err := e00 + 1) in//let
s0exp(tok.lctn(), S0Etkerr(tok))
end (*let*) // end of [else]
end (*let*) // end of [f1_ntk]
//
val s0e1 = f1_ntk(buf, err)
val s0es =
list_vt2t
(ps_p1fun{s0exp}(buf,err,f1_ntk))
//
in
//
case+ s0es of
|
list_nil
((*void*)) => s0e1
|
list_cons _ =>
let
  val s0e2 = list_last(s0es)
  val lres = s0e1.lctn()+s0e2.lctn()
in//let
s0exp(lres, S0Eapps(list_cons(s0e1,s0es)))
end // end of [list_cons]
//
end(*let*)//end(p1_s0exp_app_ntk(buf,err,ntk))
//
in//local
//
#implfun
p1_s0exp_app_NEQ0
  (buf, err) =
(
p1_s0exp_app_ntk(buf, err, ntk)
) where
{
fun
ntk(tnd: tnode): bool =
(case+ tnd of T_EQ0() => false | _ => true)
} (*where*)//end-of(p1_s0exp_app_NEQ0(buf,err))
//
#implfun
p1_s0exp_app_NGT0
  (buf, err) =
(
p1_s0exp_app_ntk(buf, err, ntk)
) where
{
fun
ntk(tnd: tnode): bool =
(case+ tnd of T_GT0() => false | _ => true)
} (*where*)//end-of(p1_s0exp_app_NGT0(buf,err))
//
endloc(*local*)//end-of[local(p1_s0exp_app_ntk]

(* ****** ****** *)

#implfun
p1_s0uni(buf, err) =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in
//
case+ tnd of
|
T_LBRACE() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val s0qs =
    p1_s0quaseq_BSCLN(buf, err)
  val tend = p1_RBRACE(buf, err)
  val lres = tbeg.lctn()+tend.lctn()
in//let
  err := e00;
  s0uni_make_node
  (lres, S0UNIsome(tbeg, s0qs, tend))
end (*let*) // end of [T_LBRACE]
|
_ (*non-T_LBRACE*) =>
(
err := e00 + 1;
s0uni_make_node(tok.lctn(),S0UNInone(tok)))
//
end (*let*) // end-of-[p1_s0uni(buf,err)]

(* ****** ****** *)
//
#implfun
p1_s0uniseq(buf, err) =
(
list_vt2t(ps_p1fun{s0uni}(buf,err,p1_s0uni))
) (*case*)//end-of-[p1_s0uniseq(buf,err)]
//
(* ****** ****** *)
//
(*
d0tcn::
| s0uniseq d0eid [s0exp] [OF sort0]
*)
//
#implfun
p1_d0tcn(buf, err) =
let
  val e00 = err
//
  val s0us =
    p1_s0uniseq(buf, err)
//
  val dcon = p1_d0eid(buf, err)
//
  val s0is = // HX: indices
    p1_s0expseq_atm(buf, err)
//
  val tok0 = buf.getk0((*void*))
  val tnd0 = tok0.tnode((*void*))
//
in
//
case+ tnd0 of
|
T_OF0() =>
let
  val (  ) = buf.skip1()
  val sarg = p1_s0exp(buf, err)
  val lres =
  (
    case+ s0us of
    | list_nil() =>
      dcon.lctn() + sarg.lctn()
    | list_cons(s0u0, _) =>
      s0u0.lctn() + sarg.lctn()
  ) : loc_t // end of [val]
in//let
err := e00;
d0tcn_make_node
( lres
, D0TCNnode
  (s0us, dcon, s0is, optn_cons(sarg)))
end (*let*) // end of [T_OF0]
//
|
_(*non-T_OF0*) =>
let
//
val lres =
(
case+ s0us of
| list_nil() =>
  (
  case+ s0is of
  | list_nil _ =>
    dcon.lctn((*void*))
  | list_cons _ =>
    let
      val
      s0i1 = list_last(s0is)
    in
      dcon.lctn() + s0i1.lctn()
    end
  )
| list_cons(s0u0, _) =>
  (
  case+ s0is of
  | list_nil() =>
    s0u0.lctn((*void*))
  | list_cons _ =>
    let
      val
      s0i1 = list_last(s0is)
    in
      s0u0.lctn() + s0i1.lctn()
    end (*let*) // list_cons _
  )
) : loc_t // end of [val(lres)]
//
in//let
err := e00;
d0tcn_make_node
( lres
, D0TCNnode(s0us, dcon, s0is, optn_nil()))
end
//
end (*let*) // end of [ p1_d0tcn(buf,err) ]

(* ****** ****** *)

#implfun
p1_d0typ(buf, err) =
let
//
val e00 = err
//
val sid0 =
  p1_s0eid(buf, err)
val args =
  p1_t0magseq(buf, err)
val tres =
  pq_ids0t_anno(buf, err)
//
val tok1 = p1_EQ0(buf, err)
//
val opt2 = pq_BAR(buf, err)
//
val dtcs =
  p1_d0tcnseq_BAR(buf, err)
//
val lres =
(
case+ dtcs of
|
list_nil() =>
(
case+ opt2 of
| optn_nil() =>
  sid0.lctn() + tok1.lctn()
| optn_cons(tok2) =>
  sid0.lctn() + tok2.lctn()
) (* end of [list_nil] *)
|
list_cons _ =>
let
val
dtc1 = list_last(dtcs)
in sid0.lctn()+dtc1.lctn() end
) : loc_t // end of [val(lres)]
//
in//let
//
err := e00;
d0typ_make_node
( lres
, D0TYPnode(sid0, args, tres, tok1, dtcs))
//
end (*let*) // end of [p1_d0typ( buf,err) ]

(* ****** ****** *)

#implfun
p1_d0tcnseq_BAR(buf, err) =
(
list_vt2t(ps_BAR_p1fun{d0tcn}(buf,err,p1_d0tcn))
)(*case*)//end-of-[p1_d0tcnseq_BAR(buf,err)]

(* ****** ****** *)

#implfun
p1_d0typseq_AND(buf, err) =
(
list_vt2t(ps_AND_p1fun{d0typ}(buf,err,p1_d0typ))
)(*case*)//end-of-[p1_d0typseq_AND(buf,err)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_parsing_staexp.dats] *)
