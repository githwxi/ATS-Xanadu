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

#implfun
p1_EQGT(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_EQGT() =>
let val () = buf.skip1() in tok end
|
_(* non-EQGT *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_EQGT]

(* ****** ****** *)

#implfun
p1_GTDOT(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_GTDOT() =>
let val () = buf.skip1() in tok end
|
_(* non-GTDOT *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_GTDOT]

(* ****** ****** *)

#implfun
pq_SMCLN(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_SMCLN() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-SMCLN *) => optn_nil()
end (*let*) // end of [pq_SMCLN]

(* ****** ****** *)

#implfun
p1_LPAREN(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_LPAREN() =>
let val () = buf.skip1() in tok end
|
_(* non-LPAREN *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_LPAREN]

#implfun
p1_RPAREN(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_RPAREN() =>
let val () = buf.skip1() in tok end
|
_(* non-RPAREN *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_RPAREN]

(* ****** ****** *)

#implfun
p1_LBRCKT(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_LBRCKT() =>
let val () = buf.skip1() in tok end
|
_(* non-LBRCKT *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_LBRCKT]

#implfun
p1_RBRCKT(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_RBRCKT() =>
let val () = buf.skip1() in tok end
|
_(* non-RBRCKT *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_RBRCKT]

(* ****** ****** *)

#implfun
p1_LBRACE(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_LBRACE() =>
let val () = buf.skip1() in tok end
|
_(* non-LBRACE *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_LBRACE]

#implfun
pq_LBRACE(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_LBRACE() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-LBRACE *) => optn_nil()
end (*let*) // end of [pq_LBRACE]

#implfun
p1_RBRACE(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_RBRACE() =>
let val () = buf.skip1() in tok end
|
_(* non-RBRACE *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_RBRACE]

(* ****** ****** *)

#implfun
p1_IN0(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_IN0() =>
let val () = buf.skip1() in tok end
|
_(* non-IN0 *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_IN0]

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
p1_OF0(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_OF0() =>
let val () = buf.skip1() in tok end
|
_(* non-OF0 *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_OF0]

(* ****** ****** *)

#implfun
p1_WITH(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_WITH() =>
let val () = buf.skip1() in tok end
|
_(* non-WITH *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_WITH]

(* ****** ****** *)

#implfun
p1_END(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_END() =>
let val () = buf.skip1() in tok end
|
_(* non-END *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_END]

(* ****** ****** *)

#implfun
pq_ENDLAM(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_ENDLAM() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-ENDLAM *) => optn_nil()
end (*let*) // end of [pq_ENDLAM]

(* ****** ****** *)

#implfun
pq_ENDFIX(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_ENDFIX() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-ENDFIX *) => optn_nil()
end (*let*) // end of [pq_ENDFIX]

(* ****** ****** *)

#implfun
p1_ENDLET(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_ENDLET() =>
let val () = buf.skip1() in tok end
|
_(* non-ENDLET *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_ENDLET]

(* ****** ****** *)

#implfun
p1_ENDTRY(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_ENDTRY() =>
let val () = buf.skip1() in tok end
|
_(* non-ENDTRY *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_ENDTRY]

(* ****** ****** *)

#implfun
p1_ENDLOC(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
case+
tok.node() of
|
T_ENDLOC() =>
let val () = buf.skip1() in tok end
|
_(* non-ENDLOC *) =>
let val () = (err := e00 + 1) in tok end
end (*let*) // end of [p_ENDLOC]

(* ****** ****** *)

#implfun
pq_SRP_THEN(buf, err) =
let
//
val tok = buf.getk0()
//
in//let
case+
tok.node() of
|
T_SRP_THEN() =>
optn_cons(tok) where
{ val () = buf.skip1() }
|
_ (* non-SRP_THEN *) => optn_nil()
end (*let*) // end of [pq_SRP_THEN]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_basics.dats] *)
