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
#staload "./../SATS/parsing.sats"
(* ****** ****** *)

#implfun
p1_EQ0(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_EQ0() =>
let val () = buf.skip1() in tok end
|
_(* non-EQ0 *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_EQ0]

#implfun
pq_EQ0(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_EQ0() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-EQ0 *) => optn_nil()
end (*let*) // end of [pq_EQ0]

(* ****** ****** *)

#implfun
p1_GT0(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_GT0() =>
let val () = buf.skip1() in tok end
|
_(* non-GT0 *) =>
let val () = (err := e00 + 1) in tok end
end // end of [p_GT0]

(* ****** ****** *)

#implfun
pq_IN0(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_IN0() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-IN0 *) => optn_nil()
end (*let*) // end of [pq_IN0]

(* ****** ****** *)

#implfun
p1_BAR(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_BAR() =>
let val () = buf.skip1() in tok end
|
_(* non-BAR *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_BAR]

#implfun
pq_BAR(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_BAR() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-BAR *) => optn_nil()
end (*let*) // end of [pq_BAR]

(* ****** ****** *)

#implfun
p1_CLN(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_CLN() =>
let val () = buf.skip1() in tok end
|
_(* non-CLN *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_CLN]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_basics.dats] *)
