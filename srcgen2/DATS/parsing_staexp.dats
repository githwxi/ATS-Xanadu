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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#symload
node with i0dnt_get_node//staexp0
#symload
node with l0abl_get_node//staexp0
(* ****** ****** *)
#symload
tnode with token_get_node//lexing0
(* ****** ****** *)

#implfun
t0_t0int(tnd) =
(
case+ tnd of
| T_INT01 _ => true
| T_INT02 _ => true
| T_INT03 _ => true
| _ (* non-INT0? *) => false
) (*case*) // end of [t0_t0int(tnd)]

#implfun
t0_t0chr(tnd) =
(
case+ tnd of
| T_CHAR1 _ => true
| T_CHAR2 _ => true
| _ (* non-CHAR? *) => false
) (*case*) // end of [t0_t0chr(tnd)]

#implfun
t0_t0flt(tnd) =
(
case+ tnd of
| T_FLT01 _ => true
| T_FLT02 _ => true
| T_FLT03 _ => true
| _ (* non-FLT0? *) => false
) (*case*) // end of [t0_t0flt(tnd)]

#implfun
t0_t0str(tnd) =
(
case+ tnd of
| T_STRN1 _ => true
| T_STRN2 _ => true
| _ (* non-STRN? *) => false
) (*case*) // end of [t0_t0str(tnd)]

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
_(*non-i0dnt*) => (err := e00+1; i0dnt_none(tok))
//
end (*let*) // end of [p_i0dnt(buf,err)]

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

(* end of [ATS3/XATSOPT_parsing_basics.dats] *)
