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
#symload node with token_get_node
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
t0_t0flt(tnd) =
(
case+ tnd of
| T_FLT01 _ => true
| T_FLT02 _ => true
| T_FLT03 _ => true
| _ (* non-FLT0? *) => false
) (*case*) // end of [t0_t0flt(tnd)]

#implfun
t0_t0chr(tnd) =
(
case+ tnd of
| T_CHAR1_nil0 _ => true
| T_CHAR2_char _ => true
| T_CHAR3_blsh _ => true
| _ (* non-CHAR? *) => false
) (*case*) // end of [t0_t0chr(tnd)]

#implfun
t0_t0str(tnd) =
(
case+ tnd of
| T_STRN1_clsd _ => true
| T_STRN2_ncls _ => true
| _ (* non-STRN? *) => false
) (*case*) // end of [t0_t0str(tnd)]

(* ****** ****** *)

#implfun
t0_s0tid(tnd) =
(
case+ tnd of
//
| T_IDALP _ => true
| T_IDSYM _ => true
//
| T_BSLSH() => true
//
| _(*otherwise*) => false
//
) (*case*) // end of [t0_s0tid(tnd)]

(* ****** ****** *)

#implfun
t0_s0aid(tnd) =
(
case+ tnd of
|
T_IDALP _ => true | _ => false
) (*case*) // end of [t0_s0aid(tnd)]

(* ****** ****** *)

#implfun
t0_s0eid(tnd) =
(
case+ tnd of
//
|
T_IDALP _ => true
|
T_IDSYM _ => true
|
T_IDDLR _ => true
//
| T_AT0() => true // "@"
//
| T_EQ0() => true // "="
//
| T_LT0() => true // "<"
| T_GT0() => true // ">"
//
| T_LTGT() => true // "<>"
(*
| T_EQGT() => true // "=>"
*)
//
| T_BSLSH() => true // "\\"
//
| _(* otherwise *) => false
) (*case*) // end of [t0_s0eid(tnd)]

(* ****** ****** *)

#implfun
t0_d0eid(tnd) =
(
case+ tnd of
//
|
T_IDALP _ => true
|
T_IDSYM _ => true
|
T_IDDLR _ => true
//
| T_AT0() => true // "@"
//
| T_EQ0() => true // "="
//
(*
| T_LT0() => true // "<"
| T_GT0() => true // ">"
| T_LTGT() => true // "<>"
//
*)
| T_EQGT() => true // "=>"
//
| T_BSLSH() => true // "\\"
//
| _(* otherwise *) => false
) (*case*) // end of [t0_d0eid(tnd)]

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
//
#implfun
ps_p1fun{a}
(buf, err, pfn) = let
//
val e00 = err
//
#vwtpdef res = list_vt(a)
//
fnx
loop
( buf: !tkbf0
, err: &int >> _
, res: list_vt(a)): res =
let
  val x0 = pfn( buf, err )
in//let
if
(err = e00)
then
loop(buf, err, cons_vt(x0, res))
else
(err := e00; list_vt_reverse0(res))
//
end (*let*)//end-of(loop(buf,err,res))
//
in
  loop( buf, err, list_vt_nil(*res*) )
end(*let*)//end-of(ps_p1fun(buf,err,pfn))
//
(* ****** ****** *)
//
#implfun
ps_AND_p1fun{a}
(buf, err, pfn) =
ps_sep_p1fun
(buf, err, tnode_ANDq, pfn)
where
{
fun
tnode_ANDq(tnd: tnode): bool =
(case+ tnd of T_AND() => true | _ => false)
}
//
(* ****** ****** *)
//
#implfun
ps_BAR_p1fun{a}
(buf, err, pfn) =
ps_sep_p1fun
(buf, err, tnode_BARq, pfn)
where
{
fun
tnode_BARq(tnd: tnode): bool =
(case+ tnd of T_BAR() => true | _ => false)
}
//
(* ****** ****** *)
//
#implfun
ps_COMMA_p1fun{a}
(buf, err, pfn) =
ps_sep_p1fun
(buf, err, tnode_COMMAq, pfn)
where
{
fun
tnode_COMMAq(tnd: tnode): bool =
(case+ tnd of T_COMMA() => true | _ => false)
}
//
(* ****** ****** *)
//
#implfun
ps_SMCLN_p1fun{a}
(buf, err, pfn) =
ps_sep_p1fun
(buf, err, tnode_SMCLNq, pfn)
where
{
fun
tnode_SMCLNq(tnd: tnode): bool =
(case+ tnd of T_SMCLN() => true | _ => false)
}
//
(* ****** ****** *)
//
#implfun
ps_BSCLN_p1fun{a}
(buf, err, pfn) =
ps_sep_p1fun
(buf, err, tnode_BSCLNq, pfn)
where
{
fun
tnode_BSCLNq(tnd: tnode): bool =
(case+ tnd of
| T_BAR() => true | T_SMCLN() => true | _ => false)
}
//
(* ****** ****** *)

#implfun
ps_sep_p1fun{a}
( buf
, err, fsp, pfn) = let
//
val e00 = err
val fst = pfn(buf, err)
//
#vwtpdef res = list_vt(a)
//
fnx
loop
( buf: !tkbf0
, err: &int >> _
, res: list_vt(a)): res =
let
val
tok = buf.getk0()
in//let
//
if
~(fsp(tok.node()))
then
list_vt_reverse0(res)
else
let
val () = buf.skip1()
val x0 = pfn(buf, err)
in//let
loop
(buf, err, cons_vt(x0, res))
end (*let*) // end of [else]
//
end (*let*) // end of [loop]
//
in//let
//
if
(err = e00)
then
loop(buf, err, res) where
{ val res = list_vt_sing(fst) }
else
(err := e00; list_vt_nil(*res*))
//
end//end-of(ps_sep_p1fun(buf,err,fsp,pfn))

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_basics.dats] *)
