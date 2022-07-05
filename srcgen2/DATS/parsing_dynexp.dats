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
Start Time: July 4th, 2022
(*
Mon Jul  4 19:02:42 EDT 2022
*)
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
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#symload
lctn with token_get_lctn//lexing0
#symload
lctn with t0int_get_lctn//lexing0
#symload
lctn with t0chr_get_lctn//lexing0
#symload
lctn with t0flt_get_lctn//lexing0
#symload
lctn with t0str_get_lctn//lexing0
#symload
lctn with i0dnt_get_lctn//staexp0
#symload
lctn with l0abl_get_lctn//staexp0
#symload
lctn with sort0_get_lctn//staexp0
#symload
lctn with s0exp_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with d0pat_get_lctn//dynexp0
#symload
lctn with d0exp_get_lctn//dynexp0
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
(*
atmd0pat::
//
  | d0pid
//
  | t0int // int
  | t0chr // char
  | t0flt // float
  | t0str // string
//
*)
//
#extern
fun
p1_l0d0p: p1_fun(l0d0p)
//
#extern
fun
p1_d0pat_atm: p1_fun(d0pat)
#extern
fun
p1_d0patseq_atm: p1_fun(d0patlst)
//
(* ****** ****** *)
//
#extern
fun
p1_d0patseq_COMMA: p1_fun(d0patlst)
#extern
fun
p1_l0d0pseq_COMMA: p1_fun(l0d0plst)
//
(* ****** ****** *)
//
(*
d0pat_RPAREN ::=
  | RPAREN
  | BAR d0patseq_COMMA RPAREN
labd0pat_RBRACE ::=
  | RPAREN
  | BAR labd0patseq_COMMA RBRACE
*)
//
#extern
fun
p1_d0pat_RPAREN: p1_fun(d0pat_RPAREN)
#extern
fun
p1_l0d0p_RBRACE: p1_fun(l0d0p_RBRACE)
//
(* ****** ****** *)
#extern
fun
d0pat_RPAREN_lctn:(d0pat_RPAREN)->loc_t
#extern
fun
l0d0p_RBRACE_lctn:(l0d0p_RBRACE)->loc_t
(* ****** ****** *)

local

fun
p1_napps
( buf:
! tkbf0
, err:
& sint >> _): d0pat =
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
_ (* error *) =>
( err := e00 + 1;
  d0pat(tok.lctn(), D0Ptkerr(tok))
) (* end-of-error *)
//
end (*let*) // end of [p1_napps(buf,err)]

in(*in-of-local*)
//
#implfun
p1_d0pat(buf, err) =
let
//
val
d0ps =
p1_d0patseq_atm(buf, err)
//
in//let
//
case+ d0ps of
|
list_nil() =>
p1_napps(buf, err)
|
list_cons
(d0p1, dps1) =>
let
  val opt1 =
  pq_s0exp_anno(buf, err)
in
case+ dps1 of
|
list_nil() =>
d0pat_anno_opt(d0p1, opt1)
|
list_cons _ => let
val d0p2 =
list_last(dps1)
val lres =
d0p1.lctn()+d0p2.lctn()
in
d0pat_anno_opt
(d0pat(lres, D0Papps(d0ps)), opt1)
end // end of [list_cons]
//
end (* end of [list_cons] *)
//
end (* let *) // end of [p1_d0pat]
//
endloc(*local*) // end of [local(p1_d0pat)]

(* ****** ****** *)

#implfun
p1_l0d0p(buf, err) =
let
//
val e00 = err
//
val lab0 =
(
  p1_l0abl(buf, err)
)
val teq1 = p1_EQ0(buf, err)
val d0p2 = p1_d0pat(buf, err)
//
(*
val ( ) =
println("p1_l0d0p: lab0 = ", lab0)
val ( ) =
println("p1_l0d0p: teq1 = ", teq1)
val ( ) =
println("p1_l0d0p: d0p2 = ", d0p2)
*)
//
in
  err := e00; D0LAB(lab0, teq1, d0p2)
end (*let*) // end of [p1_l0d0p(buf,err)]

(* ****** ****** *)

#implfun
p1_d0pat_atm
  (buf, err) =
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
when t0_d0pid(tnd) =>
let
  val id0 = p1_d0pid(buf, err)
in
  err := e00
; d0pat(id0.lctn(), D0Pid0(id0))
end (*let*) // end of [t0_d0pid]
//
| _
when t0_t0int(tnd) =>
let
  val i00 = p1_t0int(buf, err)
in
  err := e00
; d0pat(i00.lctn(), D0Pint(i00))
end (*let*) // end of [t0_t0int(tnd)]
| _
when t0_t0chr(tnd) =>
let
  val c00 = p1_t0chr(buf, err)
in
  err := e00
; d0pat(c00.lctn(), D0Pchr(c00))
end (*let*) // end of [t0_t0chr(tnd)]
| _
when t0_t0flt(tnd) =>
let
  val f00 = p1_t0flt(buf, err)
in
  err := e00
; d0pat(f00.lctn(), D0Pflt(f00))
end (*let*) // end of [t0_t0flt(tnd)]
| _
when t0_t0str(tnd) =>
let
  val s00 = p1_t0str(buf, err)
in//let
  err := e00
; d0pat(s00.lctn(), D0Pstr(s00))
end (*let*) // end of [t0_t0str(tnd)]
//
|
T_LPAREN() =>
let
val tbeg = tok
val () = buf.skip1()
val d0ps =
  p1_d0patseq_COMMA(buf, err)
val tend = p1_d0pat_RPAREN(buf, err)
val lres =
tbeg.lctn() + d0pat_RPAREN_lctn(tend)
in//let
  err := e00
; d0pat(lres, D0Plpar(tbeg, d0ps, tend))
end (*let*) // end of [T_LPAREN()]
//
|
T_LBRACE() =>
let
  val tbeg = tok
  val () = buf.skip1()
  val s0as =
    p1_s0argseq_COMMA(buf, err)
  val tend = p1_RBRACE(buf, err)
  val lres = tbeg.lctn() + tend.lctn()
in//elt
  err := e00
; d0pat(lres, D0Psqarg(tbeg, s0as, tend))
end (*let*) // end of [T_LBRACE()]
//
|
T_TRCD10(k0) =>
let
val tbeg = tok
val (  ) = buf.skip1()
//
val topt =
( if
  (k0 <= 1)
  then optn_nil()
  else
  optn_cons
  (p1_LPAREN(buf, err))
) : tokenopt // end of [val(topt)]
//
val d0ps =
  p1_d0patseq_COMMA(buf, err)
//
val tend = p1_d0pat_RPAREN(buf, err)
//
val lres =
tbeg.lctn() + d0pat_RPAREN_lctn(tend)
//
in//let
  err := e00
; d0pat_make_node
  (lres, D0Ptup1(tbeg, topt, d0ps, tend))
end (*let*) // end of [ T_TRCD1(k0) ]
//
|
T_IDQUA _ =>
let
  val tqua = tok
  val (  ) = buf.skip1()
  val d0p1 = p1_d0pat_atm(buf, err)
  val lres = tqua.lctn() + d0p1.lctn()
in//let
  err := e00; d0pat(lres, D0Pqual(tok, d0p1))
end(*let*) // end of [ T_IDQUA(...) ]
//
| _(*otherwise*) =>
let
(*
val () =
prerrln
("p1_s0exp_atm: otherwise: tok = ", tok)
*)
in//let
(err := e00 + 1; d0pat(tok.lctn(), D0Ptkerr(tok)))
end (*let*) // end of [ _(*otherwise*) ]
//
end (*let*) // end of [p1_d0pat_atm(buf,err)]

(* ****** ****** *)

#implfun
p1_d0patseq_atm
  (buf, err) =
(
list_vt2t
(ps_p1fun{d0pat}(buf, err, p1_d0pat_atm))
) (* end of [p1_d0patseq_atm] *)

(* ****** ****** *)
//
#implfun
p1_d0patseq_COMMA
  (buf, err) =
(
list_vt2t
(ps_COMMA_p1fun{d0pat}(buf, err, p1_d0pat))
) (* end of [p1_d0patseq_COMMA] *)
//
#implfun
p1_l0d0pseq_COMMA
  (buf, err) =
(
list_vt2t
(ps_COMMA_p1fun{l0d0p}(buf, err, p1_l0d0p))
) (* end of [p1_l0d0pseq_COMMA] *)
//
(* ****** ****** *)

#implfun
p1_d0pat_RPAREN
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
  val tbeg = tok
  val (  ) = buf.skip1()
  val d0ps =
    p1_d0patseq_COMMA(buf, err)
  val tend = p1_RPAREN(buf, err)
in
  err := e00
; d0pat_RPAREN_cons1(tbeg, d0ps, tend)
end (*let*) // end of [ T_BAR() ]
| 
_(* non-T_BAR *) =>
(
case+ tnd of
|
T_RPAREN() =>
let
  val () = buf.skip1()
in
  err := e00; d0pat_RPAREN_cons0(tok)
end (*let*) // end of [T_RPAREN]
|
_(*non-T_RPAREN*) =>
(err := e00 + 1; d0pat_RPAREN_cons0(tok)))
//
end (*let*) // end of [p_d0pat_RPAREN(buf,err)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_dynexp.dats] *)
