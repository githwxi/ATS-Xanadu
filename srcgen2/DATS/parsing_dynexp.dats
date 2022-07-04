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
  val d0p2 = list_last(dps1)
  val lres = d0p1.lctn()+d0p2.lctn()
in
d0pat_anno_opt
(d0pat_make_node(lres, D0Papps(d0ps)), opt1)
end // end of [list_cons]
//
end (* end of [list_cons] *)
//
end // end of [let] // end of [p1_d0pat]
//
endlocal (*local*) // end of [local(p1_d0pat)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_dynexp.dats] *)
