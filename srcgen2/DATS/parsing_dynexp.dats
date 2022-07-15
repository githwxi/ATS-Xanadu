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
(* ****** ****** *)
#symload
lctn with g0nam_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with sort0_get_lctn//staexp0
#symload
lctn with s0exp_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with d0pat_get_lctn//dynexp0
#symload
lctn with f0arg_get_lctn//dynexp0
#symload
lctn with d0exp_get_lctn//dynexp0
#symload
lctn with d0cls_get_lctn//dynexp0
(* ****** ****** *)
#symload
node with token_get_node//lexing0
#symload
node with i0dnt_get_node//staexp0
#symload
node with l0abl_get_node//staexp0
(* ****** ****** *)
#symload
node with s0exp_get_node//staexp0
#symload
node with s0qua_get_node//staexp0
(* ****** ****** *)
#symload
node with f0arg_get_node//dynexp0
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
l0d0p_RBRACE ::=
  | RPAREN
  | BAR l0d0pseq_COMMA RBRACE
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
(*
val ( ) =
prerrln
("p1_d0pat_atm: tok=", tok)
*)
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
  val (  ) = buf.skip1()
  val d0ps =
    p1_d0patseq_COMMA(buf, err)
  val dend = p1_d0pat_RPAREN(buf, err)
  val lres =
  (tbeg.lctn()+d0pat_RPAREN_lctn(dend))
in//let
  err := e00
; d0pat(lres, D0Plpar(tbeg, d0ps, dend))
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
val dend = p1_d0pat_RPAREN(buf, err)
//
val lres =
(tbeg.lctn()+d0pat_RPAREN_lctn(dend))
//
in//let
  err := e00
; d0pat_make_node
  (lres, D0Ptup1(tbeg, topt, d0ps, dend))
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
// (*
val () =
prerrln
("p1_d0pat_atm: otherwise: tok = ", tok)
// *)
in//let
err := e00+1; d0pat(tok.lctn(),D0Ptkerr(tok))
end (*let*) // end of [ _(*otherwise*) ]
//
end (*let*) // end of [p1_d0pat_atm(buf,err)]

(* ****** ****** *)
//
#implfun
p1_d0patseq_atm
  (buf, err) =
( list_vt2t
  (ps_p1fun{d0pat}(buf, err, p1_d0pat_atm))
) (* end of [p1_d0patseq_atm] *)
//
(* ****** ****** *)
//
#implfun
p1_d0patseq_COMMA
  (buf, err) =
( list_vt2t
  (ps_COMMA_p1fun{d0pat}(buf, err, p1_d0pat))
) (* end of [p1_d0patseq_COMMA] *)
//
#implfun
p1_l0d0pseq_COMMA
  (buf, err) =
( list_vt2t
  (ps_COMMA_p1fun{l0d0p}(buf, err, p1_l0d0p))
) (* end of [p1_l0d0pseq_COMMA] *)
//
(* ****** ****** *)
//
#extern
fun
p1_f0argseq: p1_fun(f0arglst)
#extern
fun
p1_f0argsq1: p1_fun(f0arglst)
#extern
fun
p1_f0unarrw: p1_fun(f0unarrw)
//
(* ****** ****** *)

#implfun
p1_f0arg(buf, err) =
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
T_DOTLT(_) =>
let
  val tbeg = tok
  val () = buf.skip1()
  val s0es =
    p1_s0expseq_COMMA(buf, err)
  val tend = p1_GTDOT(buf, err)
  val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00;
  f0arg_make_node
  (lres, F0ARGmet0(tbeg, s0es, tend))
end (*let*) // end of [ T_DOTLT() ]
//
|
T_LBRACE() =>
let
  val tbeg = tok
  val () = buf.skip1()
  val s0qs =
  p1_s0quaseq_BSCLN(buf, err)
  val tend = p1_RBRACE(buf, err)
  val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00;
  f0arg_make_node
  (lres, F0ARGsta0(tbeg, s0qs, tend))
end (*let*) // end of [T_LBRACE() ]
//
|
_(* non-sta-met *) =>
let
  val d0p = p1_d0pat_atm(buf, err)
in
  f0arg_make_node(d0p.lctn(), F0ARGdyn0(d0p))
end (*let*) // end of [non-sta-met]
//
end (*let*) // end of [ p1_f0arg(buf,err) ]

(* ****** ****** *)
#impltmp
p1_f0argseq
  (buf, err) =
(
list_vt2t(ps_p1fun{f0arg}(buf,err,p1_f0arg)))
(* ****** ****** *)

local
//
fun
f0_s0q0
( s0q0
: s0qua): s0qua =
(
case+
s0q0.node() of
|
S0QUAprop(s0p) =>
(
case+
s0p.node() of
|
S0Eid0(sid) =>
let
  val loc = s0p.lctn()
  val opt =
    optn_nil(*sort0*)
  val ids = list_sing(sid)
in
  s0qua_make_node
  (loc, S0QUAvars(ids, opt))
end
| _ (* non-S0Eid0 *) => s0q0
)
| _(* non-S0QUAprop *) => s0q0
)
fun
auxs0qs
( xs
: s0qualst): s0qualst =
list_map
<s0qua><s0qua>(xs) where
{
#impltmp
map$fopr<s0qua><s0qua> = f0_s0q0
}
//
fun
f0_f0a0
( f0a0
: f0arg): f0arg =
(
case+
f0a0.node() of
|
F0ARGsta0
(tbeg, s0qs, tend) =>
(
  f0arg_make_node(loc0, node)
) where
{
  val loc0 = f0a0.lctn()
  val s0qs = auxs0qs(s0qs)
  val node =
  F0ARGsta0(tbeg, s0qs, tend)
}
| _ (* non-F0ARGsom_sta *) => f0a0
)
fun
f0_f0as
( xs
: f0arglst): f0arglst =
list_map
<f0arg><f0arg>(xs) where
{
#impltmp
map$fopr<f0arg><f0arg> = f0_f0a0
}
//
fun
t0_s0qs
( xs
: s0qualst): bool =
(
case+ xs of
|
list_nil() => false
|
list_cons(x1, xs) =>
(
case+
x1.node() of
|
S0QUAprop(s0p) =>
(
case+
s0p.node() of
| S0Eid0(sid) => true
| _(*non-S0Eid0*) => t0_s0qs(xs)
)
| _(*non-S0QUAprop*) => t0_s0qs(xs)
)
)
fun
t0_f0as
( xs
: f0arglst): bool =
(
case+ xs of
|
list_nil() => false
|
list_cons(x1, xs) =>
(
case+
x1.node() of
|
F0ARGsta0
(tbeg, s0qs, tend) =>
if
t0_s0qs(s0qs)
then true else t0_f0as(xs)
| _(*non-F0ARGsta0*) => t0_f0as(xs)
)
)
//
in
//
#implfun
p1_f0argsq1
( buf, err ) =
let
val
f0as = p1_f0argseq(buf, err)
in//let
if t0_f0as(f0as) then f0_f0as(f0as) else f0as
end (*let*) // end of [p_f0argsq1]
//
endloc (*local*) // end of [local(p1_f0argsq1)]

(* ****** ****** *)
//
#implfun
p1_f0unarrw(buf, err) =
let
//
val e00 = err
//
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
T_EQGT() =>
F0UNARRWdflt(tok) where
{
  val () = buf.skip1( )
} (*where*) // end of [T_EQGT]
//
|
T_EQLT() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val s0es =
  list_vt2t
  (
  ps_COMMA_p1fun{s0exp}
  (buf, err, p1_s0exp_app_NGT0))
  val tend = p1_GT0(buf, err)
in//let
  err := e00;
  F0UNARRWlist(tbeg, s0es, tend)
end (*let*) // end of [ T_EQLT() ]
//
| _(*non-arrow*) => F0UNARRWnone(tok)
//
end (*let*) // end of [p_f0unarrw(buf,err)]

(* ****** ****** *)
//
(*
//
atmd0exp ::=
//
| d0eid // D0Eid0
//
| t0int // D0Eint
| t0chr // D0Echr
| t0flt // D0Eflt
| t0str // D0Estr
//
| qualid atm0exp
//
| { d0eclseq }
| LET d0eclseq END
| LET d0eclseq IN d0expseq END
//
| ( d0expseq_COMMA )
| ( d0expseq_COMMA | d0expseq_COMMA )
| ( d0expseq_COMMA ; d0expseq_SMCLN )
//
| { l0d0eseq_COMMA }
| { l0d0eseq_COMMA | l0d0eseq_COMMA }
//
*)
//
#extern
fun
p1_d0exp_atm: p1_fun(d0exp)
//
#extern
fun
p1_d0exp_app: p1_fun(d0exp)
//
#extern
fun
p1_d0expseq_atm: p1_fun(d0explst)
//
#extern
fun
p1_d0exp_THEN: p1_fun(d0exp_THEN)
fun
p1_d0exp_ELSE: p1_fun(d0exp_ELSE)
//
#extern
fun
p1_d0exp_sqarg: p1_fun(d0exp)
#extern
fun
p1_d0expseq_sqarg: p1_fun(d0explst)
//
(* ****** ****** *)
//
#extern
fun
p1_d0clsseq_BAR: p1_fun(d0clslst)
//
(* ****** ****** *)
//
#extern
fun
p1_d0expseq_COMMA: p1_fun(d0explst)
#extern
fun
p1_l0d0eseq_COMMA: p1_fun(l0d0elst)
//
#extern
fun
p1_d0expseq_SMCLN: p1_fun(d0explst)
//
(* ****** ****** *)
//
(*
d0exp_RPAREN ::=
  | RPAREN
  | BAR d0expseq_COMMA RPAREN
  | SMCLN d0expseq_SMCLN RPAREN
*)
(*
l0d0exp_RBRACE ::=
  | RPAREN
  | BAR l0d0expseq_COMMA RBRACE
*)
//
#extern
fun
p1_d0exp_RPAREN: p1_fun(d0exp_RPAREN)
#extern
fun
p1_l0d0e_RBRACE: p1_fun(l0d0e_RBRACE)
//
#extern
fun
d0exp_RPAREN_lctn:(d0exp_RPAREN)->loc_t
#extern
fun
l0d0e_RBRACE_lctn:(l0d0e_RBRACE)->loc_t
//
(* ****** ****** *)

local
//
#extern
fun
p1_napps: p1_fun(d0exp)
//
#implfun
p1_napps(buf, err) =
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
(*
|
T_IF0() => let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val d0e1 =
    p1_d0exp_app(buf, err)
  val d0e2 =
    p1_d0exp_THEN(buf, err)
  val d0e3 =
    p1_d0exp_ELSE(buf, err)
//
(*
  val topt =
    popt_ENDIF(buf, err)
*)
  val topt =
    pq_endst0inv(buf, err)
//
  val lres =
  (
    case+ topt of
    | ENDST0INVnone() =>
      (
      case d0e3 of
      | d0exp_ELSE_none
          () =>
        (
        case+ d0e2 of
        | d0exp_THEN
          ( _, d0e ) =>
          tok.lctn() + d0e.lctn()
          // end of [d0exp_THEN]
        )
      | d0exp_ELSE_some
          (_, d0e) =>
          tok.lctn() + d0e.lctn()
        // end of [d0exp_ELSEsome]
      )
    | ENDST0INVsome
      ( tend, inv0 ) => tok.lctn() + inv0.lctn()
    ) : loc_t // end of [val]
//
  in
    err := e0;
    (
    case+ topt of
    | ENDST0INVnone _ =>
      d0exp_make_node
      ( loc_res
      , D0Eif0(tok, d0e1, d0e2, d0e3))
    | ENDST0INVsome(_, tinv) =>
      d0exp_make_node
      ( loc_res
      , D0Eif1(tok, d0e1, d0e2, d0e3, tinv))
    )
  end // end of [T_IF]
*)
//
(*
| T_CASE _ => let
//
    val () = buf.skip1()
//
    val d0e1 =
      p1_d0exp_app(buf, err)
//
    val tok2 =
      p1_OF(buf, err)
    val tbar =
      pq_BAR(buf, err)
    val dcls =
      p1_d0clauseq_BAR(buf, err)
//
(*
    val topt =
      popt_ENDCASE(buf, err)
*)
    val topt =
      pq_endst0inv(buf, err)
//
    val
    loc_res = let
      val loc = tok.lctn()
    in
      case+ topt of
      | ENDST0INVnone
        ( (*void*) ) =>
        (
        case+ dcls of
        | list_nil() =>
          (
          case+ tbar of
          | None() => loc + tok2.lctn()
          | Some(tbar) => loc + tbar.lctn()
          )
        | list_cons(_, _) =>
          let
          val d0cl =
          list_last(dcls) in loc + d0cl.lctn()
          end // end of [list_cons]
        )
      | ENDST0INVsome
        ( tend, inv0 ) => loc + inv0.lctn()
    end : loc_t // end of [let] // end of [val]
//
  in
    err := e0;
    (
    case+ topt of
    | ENDST0INVnone _ =>
      d0exp_make_node
      ( loc_res
      , D0Ecas0(tok, d0e1, tok2, tbar, dcls))
    | ENDST0INVsome(_, tinv) =>
      d0exp_make_node
      ( loc_res
      , D0Ecas1(tok, d0e1, tok2, tbar, dcls, tinv))
    )
  end // end of [T_CASE]
*)
//
|
T_LAM(k0) =>
let
//
val tknd = tok
val (  ) = buf.skip1()
//
val
farg = p1_f0argseq(buf, err)
//
val sres = p1_s0res(buf, err)
//
val arrw = p1_f0unarrw(buf, err)
//
val body = p1_d0exp(buf, err)
val tend = pq_ENDLAM(buf, err)
//
val lres =
(
case+ tend of 
| optn_nil() =>
  tknd.lctn()+body.lctn()
| optn_cons(tok2) =>
  tknd.lctn()+tok2.lctn()): loc_t
//
in//let
err := e00;
d0exp_make_node
( lres
, D0Elam0
  ( tknd // lam|lam@
  , farg, sres, arrw, body, tend))
end (*let*) // end of [ T_LAM(k0) ]
//
|
T_FIX(k0) =>
let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val fid0 =
    p1_d0pid(buf, err)
  val farg =
    p1_f0argseq(buf, err)
  val sres =
    p1_s0res(buf, err)
  val arrw =
    p1_f0unarrw(buf, err)
  val body = p1_d0exp(buf, err)
  val tend = pq_ENDLAM(buf, err)
//
  val lres =
  (
  case+ tend of 
  | optn_nil() =>
    tknd.lctn()+body.lctn()
  | optn_cons(tok2) =>
    tknd.lctn()+tok2.lctn()): loc_t
//
in//let
err := e00;
d0exp_make_node
( lres
, D0Efix0
  ( tknd // fix|fix@
  , fid0, farg, sres, arrw, body, tend))
end (*let*) // end of [ T_FIX(k0) ]
//
|
_ (* rest-of-token *) =>
let
  val () = err := e00 + 1
in
  d0exp_make_node(tok.lctn(), D0Etkerr(tok))
end (*let*) // HX: indicating a parsing error
//
end (*let*) // end of [ p1_napps(buf, err) ]

in//local

#implfun
p1_d0exp(buf, err) =
let
//
val e00 = err
//
val
d0es =
p1_d0expseq_atm(buf, err)
//
// (*
val () =
prerrln("p1_d0exp: d0es = ", d0es)
// *)
//
in//let
//
case+ d0es of
|
list_nil
((*void*)) =>
p1_napps(buf, err)
|
list_cons
(d0e1, des2) =>
let
val sopt =
pq_s0exp_anno(buf, err)
(*
val d0e0 =
auxwhr_list(d0e0, wdcs)
*)
//
in//let
  d0exp_anno_opt(d0e0, sopt)
end where
{
val d0e0 =
(
case+ des2 of
|
list_nil() => d0e1
|
list_cons _ => let
  val d0e2 =
  list_last(des2)
  val loc0 =
  (d0e1.lctn()+d0e2.lctn())
in
d0exp_make_node(loc0, D0Eapps(d0es))
endlet // end of [list_cons]
) : d0exp // end of [val(d0e0)]
(*
val wdcs = ps_d0eclseq_WHERE(buf, err)
*)
} (* end of [ list_cons(...) ] *)
//
endlet // end of [ p1_d0exp(buf, err) ]

endloc (*local*) // end of [local(p1_d0exp)]

(* ****** ****** *)

#implfun
p1_l0d0e(buf, err) =
let
//
val e00 = err
//
val lab0 =
(
  p1_l0abl(buf, err)
)
val teq1 = p1_EQ0(buf, err)
val d0e2 = p1_d0exp(buf, err)
//
(*
val ( ) =
println("p1_l0d0e: lab0 = ", lab0)
val ( ) =
println("p1_l0d0e: teq1 = ", teq1)
val ( ) =
println("p1_l0d0e: d0e2 = ", d0e2)
*)
//
in
  err := e00; D0LAB(lab0, teq1, d0e2)
end (*let*) // end of [p1_l0d0e(buf,err)]

(* ****** ****** *)
//
#implfun
p1_s0res(buf, err) =
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
(
err := e00;
S0RESsome(seff, s0e1)) where
{
val tcln = tok
val (  ) = buf.skip1()
val seff = S0EFFnone(tcln)
val s0e1 = p1_s0exp_app_NEQ0(buf, err)
} (*where*) // end of [T_CLN]
|
T_CLNLT(_) =>
let
//
  val tbeg = tok
  val () = buf.skip1()
//
  val s0fs =
  list_vt2t
  (
  ps_COMMA_p1fun{s0exp}
  (buf, err, p1_s0exp_app_NGT0)
  ) : s0explst // end-val(s0fs)
//
  val tend =
    p1_GT0(buf, err)
  val s0e1 =
    p1_s0exp_app_NEQ0(buf, err)
//
  val lres = tbeg.lctn()+tend.lctn()
in
err := e00;
S0RESsome(S0EFFsome(tbeg,s0fs,tend), s0e1)
end (*let*) // end of [T_CLNLT]
|
_(*non-T_CLN/CLNLT*) => S0RESnone((*void*))
//
end (*let*) // end of [ p1_s0res(buf, err) ]
//
(* ****** ****** *)

#implfun
p1_d0exp_atm
( buf, err ) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
//
val ( ) =
prerrln
("p1_d0exp_atm: e00=", e00)
val ( ) =
prerrln
("p1_d0exp_atm: tok=", tok)
//
in//let
//
case+ tnd of
//
| _
when t0_d0eid(tnd) =>
let
val id0 = p1_d0eid(buf, err)
in//let
  err := e00
; d0exp(id0.lctn(), D0Eid0(id0))
end // end of [t0_d0eid]
//
| _
when t0_t0int(tnd) =>
let
val i00 = p1_t0int(buf, err)
in//let
  err := e00
; d0exp(i00.lctn(), D0Eint(i00))
end(*let*)//end-of-[t0_t0int(tnd)]
| _
when t0_t0chr(tnd) =>
let
val c00 = p1_t0chr(buf, err)
in//let
  err := e00
; d0exp(c00.lctn(), D0Echr(c00))
end(*let*)//end-of-[t0_t0chr(tnd)]
| _
when t0_t0flt(tnd) =>
let
val f00 = p1_t0flt(buf, err)
in//let
  err := e00
; d0exp(f00.lctn(), D0Eflt(f00))
end(*let*)//end-of-[t0_t0flt(tnd)]
| _
when t0_t0str(tnd) =>
let
val s00 = p1_t0str(buf, err)
in//let
  err := e00
; d0exp(s00.lctn(), D0Estr(s00))
end(*let*)//end-of-[t0_t0str(tnd)]
//
(*
| T_OP1 of () // 'op'
| T_OP2 of token // 'opid'
| T_OP3 of token // 'op()'
*)
//
|
T_OP1() => let
//
val tok0 = tok
val (  ) =
buf.skip1((*void*))
val deid = p1_d0eid(buf, err)
//
val loc0 = tok0.lctn()+deid.lctn()
//
in
err := e00;
d0exp_make_node(loc0, D0Eopid(deid))
end(*let*) // end-of-[  T_OP1()  ]
|
T_OP2 _ => let
val tok0 = tok
val (  ) = buf.skip1()
val loc0 = tok0.lctn()
val opid = i0dnt_some(tok)
in//let
err := e00;
d0exp_make_node(loc0, D0Eopid(opid))
end(*let*) // end-of-[  T_OP2(_)  ]
|
T_OP3 _ => let
//
val tbeg = tok
val (  ) = buf.skip1()
val deid = p1_d0eid(buf, err)
val tend = p1_RPAREN(buf, err)
val loc0 = tbeg.lctn() + tend.lctn()
//
in
err := e00;
d0exp_make_node(loc0, D0Eopid(deid))
end(*let*) // end-of-[  T_OP3(_)  ]
//
| T_LT0() =>
let
//
val tok1 = tok
val (  ) = buf.skip1()
//
val
mark = tokbuf_mark_get(buf)
//
val
s0es = list_vt2t
(
ps_COMMA_p1fun{s0exp}
(buf, err, p1_s0exp_app_NGT0))
//
val tok2 = buf.getk0((*void*))
//
in//let
//
case+
tok2.node() of
| T_GT0() =>
let
val tbeg = tok1
val tend = tok2
val (  ) = buf.skip1()
val (  ) =
tokbuf_mark_clr(buf, mark)
val lres = tbeg.lctn()+tend.lctn()
in//let
err := e00;
d0exp_make_node
(lres, D0Etqarg(tbeg, s0es, tend))
end(*let*) // end of [ T_GT0() ]
|
_(*non-T_GT0*) =>
let
//
val (  ) =
tokbuf_mark_set(buf, mark)
//
val loc0 = tok1.lctn()
val tnd2 = T0IDENT_LT0(*val*)
val tok2 = token_make_node(loc0,tnd2)
in//let
  d0exp(loc0, D0Eid0(i0dnt_some(tok2)))
end(*let*) // end-of-[ non-T_GT0 ]
//
end(*let*) // end-of-[ T_LT0(  ) ]
//
|
T_GT0() =>
let
val tok1 = tok
val (  ) = buf.skip1()
val loc0 = tok1.lctn()
val tnd2 = T0IDENT_GT0(*val*)
val tok2 = token_make_node(loc0,tnd2)
in//let
  d0exp(loc0, D0Eid0(i0dnt_some(tok2)))
end (*let*) // end-of-[ T_GT0(  ) ]
//
|
T_LTGT() => let
  val tbeg = tok
  val tend = tok
  val (  ) = buf.skip1()
  val s0es = list_nil()
  val lres = tbeg.lctn()
in
  err := e00
; d0exp(lres, D0Etqarg(tbeg,s0es,tend))
end(*let*) // end-of-[  T_LTGT()  ]
//
|
T_LBRACE() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val s0es =
    p1_s0expseq_COMMA(buf, err)
  val tend = p1_RBRACE(buf, err)
  val lres = tbeg.lctn()+tend.lctn()
in//let
  err := e00
; d0exp(lres, D0Esqarg(tbeg,s0es,tend))
end(*let*) // end-of-[  T_LBRACE()  ]
//
|
T_LPAREN() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val d0es =
    p1_d0expseq_COMMA(buf,err)
  val dend = p1_d0exp_RPAREN(buf,err)
  val lres =
  tbeg.lctn()+d0exp_RPAREN_lctn(dend)
in//let
  err := e00
; d0exp(lres,D0Elpar(tbeg, d0es, dend))
end(*let*) // end-of-[  T_LPAREN()  ]
//
|
T_TRCD10(k0) =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val topt =
  ( if
    (k0 <= 1)
    then optn_nil()
    else
    optn_cons(p1_LPAREN(buf, err))
  ) : tokenopt // end-of-[val]
  val d0es =
    p1_d0expseq_COMMA(buf, err)
  val dend = p1_d0exp_RPAREN(buf, err)
//
  val lres =
  (tbeg.lctn()+d0exp_RPAREN_lctn(dend))
//
in//let
  err := e00
; d0exp_make_node
  (lres, D0Etup1(tbeg, topt, d0es, dend))
end (*let*)//end-of-[T_TRCD10(k0)]
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
    else
    optn_cons(p1_LBRACE(buf, err))
  ) : tokenopt // end-of-[val]
  val ldes =
    p1_l0d0eseq_COMMA(buf, err)
  val dend = p1_l0d0e_RBRACE(buf, err)
//
  val lres =
  (tbeg.lctn()+l0d0e_RBRACE_lctn(dend))
//
in//let
  err := e00
; d0exp_make_node
  (lres, D0Ercd2(tbeg, topt, ldes, dend))
end (*let*)//end-of-[T_TRCD20(k0)]
//
|
T_LET() => let
//
  val tok1 = tok
  val (  ) = buf.skip1()
//
  val d0cs =
    p1_d0eclseq_dyn(buf, err)
//
  val topt = pq_IN0(buf, err)
//
  val d0es =
    p1_d0expseq_SMCLN(buf, err)
  val tok2 = p1_ENDLET(buf, err)
//
  val lres = tok1.lctn()+tok2.lctn()
//
in//let
  err := e00
; d0exp_make_node
  ( lres
  , D0Elet0(tok1, d0cs, topt, d0es, tok2))
end (*let*) // end-of-[ T_LET() ]
//
|
T_TRY() => let
//
  val tok1 = tok
  val (  ) = buf.skip1()
//
  val d0e1 =
    p1_d0exp_app(buf, err)
//
  val tok2 = p1_WITH(buf, err)
//
  val tbar =
    pq_BAR(buf, err)
  val dcls =
    p1_d0clsseq_BAR( buf, err )
//
  val tend = pq_ENDTRY(buf, err)
//
  val lres =
    tok1.lctn()+lend where
  {
    val lend =
    (
    case+ tend of
    | optn_nil() =>
    (
    case+ dcls of
    | list_nil() =>
    (
    case+ tbar of
    | optn_nil() => tok2.lctn()
    | optn_cons(tbar) => tbar.lctn()
    )
    | list_cons _ =>
      let
      val dcl1 =
      list_last(dcls) in dcl1.lctn()
      endlet // end of [ list_cons ]
    )
    | optn_cons(tend) => tend.lctn()
    ) : loc_t // end of [ val(lend) ]
  }
//
in
  err := e00
; d0exp_make_node
  ( lres
  , D0Etry0
    (tok1, d0e1, tok2, tbar, dcls, tend))
end (*let*) // end-of-[ T_TRY() ]
//
(*
|T_DOT()=>|T_MSGT()=>
*)
| _
when t0_dtsel(tnd) =>
let
val tok1 = tok
val (  ) = buf.skip1()
val lab1 = p1_l0abl(buf, err)
val arg2 =
let
  val tok2 = buf.getk0()
in
case+
tok2.node() of
| T_LPAREN() =>
  optn_cons(d0e2) where
  {
  val
  d0e2 = p1_d0exp_atm(buf, err)
  }
| _(*non-T_LPAREN*) => optn_nil()
end : d0expopt // end-of-[val]
//
val lres =
let
  val loc1 = tok1.lctn()
in
  case+ arg2 of
  | optn_nil() => loc1 + lab1.lctn()
  | optn_cons(d0e2) => loc1 + d0e2.lctn()
end : loc_t // end-of-[val(lres)]
in
  err := e00
; d0exp(lres, D0Edtsel(tok1, lab1, arg2))
end (*let*) // end-of-[ T_DOT() ]
//
|
T_LBRCKT() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val d0es =
    p1_d0expseq_COMMA(buf, err)
  val tend = p1_RBRCKT(buf, err)
  val lres = tbeg.lctn()+tend.lctn()
in//let
  err := e00
; d0exp_make_node
  (lres, D0Ebrckt(tbeg, d0es, tend))
end(*let*) // end-of-[  T_LBRCKT()  ]
//
|
T_IDQUA _ => let
  val tok0 = tok
  val (  ) = buf.skip1()
  val d0e1 = p1_d0exp_atm(buf, err)
in
  err := e00
; d0exp_make_node
  (lres,D0Equal(tok0,d0e1)) where
  {
    val lres = tok0.lctn()+d0e1.lctn()
  }
end (*let*) // end-of-[  T_IDQUA(_)  ]
//
|
T_DLR_EXTNAM _ =>
let
  val tok0 = tok
  val (  ) = buf.skip1()
  val gnm1 = p1_g0nam(buf, err)
in
  err := e00
; d0exp_make_node
  ( lres, D0Eextnam(gnm1) ) where
  {
    val lres = tok0.lctn()+gnm1.lctn() }
end(*let*) // end-of-[ T_DLR_EXTNAM(_) ]
//
|
T_DLR_EXISTS _ =>
let
  val tok0 = tok
  val (  ) = buf.skip1()
  val sqas =
  p1_d0expseq_sqarg(buf, err)
  val d0e1 = p1_d0exp_atm(buf, err)
in//let
  err := e00
; d0exp_make_node
  ( lres
  , D0Eexists(tok0,sqas,d0e1)) where
  {
    val lres = tok0.lctn()+d0e1.lctn() }
end(*let*) // end-of-[ T_DLR_EXISTS(_) ]
//
|
_(* error-processing *) =>
let
val () =
prerrln
("p1_d0exp_atm(error): tok=", tok)
in//let
(
err := e00 + 1;
d0exp_make_node(tok.lctn(), D0Etkerr(tok)))
end(*let*)//end-of-[ (error-processing) ]
//
end(*let*)//end-of-[ p1_d0exp_atm(buf,err) ]

(* ****** ****** *)

#implfun
p1_d0exp_THEN
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
|
T_THEN() => let
  val ( ) = buf.skip1()
  val d0e = p1_d0exp(buf, err)
in
err := e00; d0exp_THEN_some(tok, d0e)
end // end of [T_THEN]
|
_(*non-THEN*) =>
let
val // HX-2018-09-25: error
( ) = err := e00 + 1
in//let
d0exp_THEN_some(tok, p1_d0exp(buf, err))
end(*let*)//end-of-[non-T_THEN]
//
end(*let*)//end-of-[p1_d0exp_THEN(buf,err)]

(* ****** ****** *)

#implfun
p1_d0exp_ELSE
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
|
T_ELSE() => let
  val ( ) = buf.skip1()
  val d0e = p1_d0exp(buf, err)
in
  err := e00; d0exp_ELSE_some(tok, d0e)
end // end of [T_THEN]
|
_(*non-ELSE*) =>
(
  d0exp_ELSE_none(tok) // HX: ELSE-less
)
//
end(*let*)//end-of-[p1_d0exp_ELSE(buf,err)]

(* ****** ****** *)

#implfun
p1_d0exp_sqarg
  (buf, err) = let
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
T_LBRACE() => let
  val tbeg = tok
  val (  ) = buf.skip1()
  val s0es =
    p1_s0expseq_COMMA(buf, err)
  val tend = p1_RBRACE(buf, err)
in
  err := e00;
  d0exp_make_node
  ( lres
  , D0Esqarg(tbeg, s0es, tend)) where
  {
    val lres = tbeg.lctn()+tend.lctn()
  }
end (*let*) // end of [ T_LBRACE() ]
//
|
_(*non-T_LBRACE*) =>
let
  val () = (err := e00 + 1)
in//let
d0exp_make_node(tok.lctn(), D0Etkerr(tok))
end(*let*)//HX: indicating a parsing error
//
end(*let*)//end-of-[p1_d0exp_sqarg(buf,err)]

(* ****** ****** *)
//
#implfun
p1_d0expseq_sqarg
  (buf, err) =
(
list_vt2t
(ps_p1fun{d0exp}(buf, err, p1_d0exp_sqarg)))
//
(* ****** ****** *)
//
#implfun
p1_d0expseq_atm
  (buf, err) =
( list_vt2t
  (ps_p1fun{d0exp}(buf, err, p1_d0exp_atm)))
(* end of [ p1_d0expseq_atm( buf, err ) ] *)
//
(* ****** ****** *)
//
#implfun
p1_d0expseq_COMMA
  (buf, err) =
(
list_vt2t
(ps_COMMA_p1fun{d0exp}(buf, err, p1_d0exp)))
//
#implfun
p1_l0d0eseq_COMMA
  (buf, err) =
(
list_vt2t
(ps_COMMA_p1fun{l0d0e}(buf, err, p1_l0d0e)))
//
(* ****** ****** *)
//
#implfun
p1_d0expseq_SMCLN
  (buf, err) =
(
list_vt2t
(ps_SMCLN_p1fun{d0exp}(buf, err, p1_d0exp)))
//
(* ****** ****** *)

#implfun
p1_d0pat_RPAREN
  (buf, err) =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in//let
//
case+ tnd of
|
T_BAR() =>
let
  val tok1 = tok
  val (  ) = buf.skip1()
  val d0ps =
    p1_d0patseq_COMMA(buf, err)
  val tok2 = p1_RPAREN(buf, err)
in//let
err := e00;
d0pat_RPAREN_cons1(tok1, d0ps, tok2)
end (*let*) // end of [ T_BAR() ]
|
_ (*non-T_BAR*) =>
(
case+ tnd of
|
T_RPAREN() =>
let
  val () = buf.skip1()
in//let
  err := e00; d0pat_RPAREN_cons0(tok)
end (*let*) // end of [T_RPAREN()]
|
_(*non-T_RPAREN*) =>
(
err := e00 + 1; d0pat_RPAREN_cons0(tok)
) (* end of [non-RPAREN *)
)
//
end(*let*)//end-[p1_d0pat_RPAREN(buf,err)]

(* ****** ****** *)

#implfun
p1_l0d0p_RBRACE
  (buf, err) =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in//let
//
case+ tnd of
|
T_BAR() =>
let
  val tok1 = tok
  val (  ) = buf.skip1()
  val ldps =
    p1_l0d0pseq_COMMA(buf, err)
  val tok2 = p1_RBRACE(buf, err)
in//let
err := e00;
l0d0p_RBRACE_cons1(tok1, ldps, tok2)
end (*let*) // end of [ T_BAR() ]
|
_(* non-T_BAR *) =>
(
case+ tnd of
|
T_RBRACE() =>
let
  val () = buf.skip1()
in//let
  err := e00; l0d0p_RBRACE_cons0(tok)
end (*let*) // end of [ T_RBRACE() ]
|
_(*non-T_RPAREN*) =>
(
  err := e00 + 1; l0d0p_RBRACE_cons0(tok)
) (* end of [non-RPAREN] *)
) (* end of [ non-T_BAR ] *)
//
end(*let*)//end-[p1_l0d0p_RBRACE(buf,err)]

(* ****** ****** *)

#implfun
p1_d0exp_RPAREN
  (buf, err) =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in//let
//
case+ tnd of
|
T_BAR() =>
let
  val tok1 = tok
  val (  ) = buf.skip1()
  val d0es =
    p1_d0expseq_COMMA(buf, err)
  val tok2 = p1_RPAREN(buf, err)
in//let
err := e00;
d0exp_RPAREN_cons1(tok1, d0es, tok2)
end (*let*) // end of [ T_BAR() ]
|
_ (*non-T_BAR*) =>
(
case+ tnd of
|
T_RPAREN() =>
let
  val () = buf.skip1()
in//let
  err := e00; d0exp_RPAREN_cons0(tok)
end (*let*) // end of [T_RPAREN()]
|
_(*non-T_RPAREN*) =>
(
err := e00 + 1; d0exp_RPAREN_cons0(tok)
) (* end of [non-RPAREN *)
)
//
end(*let*)//end-[p1_d0exp_RPAREN(buf,err)]

(* ****** ****** *)

#implfun
p1_l0d0e_RBRACE
  (buf, err) =
let
  val e00 = err
  val tok = buf.getk0()
  val tnd = tok.tnode()
in//let
//
case+ tnd of
|
T_BAR() =>
let
  val tok1 = tok
  val (  ) = buf.skip1()
  val ldes =
    p1_l0d0eseq_COMMA(buf, err)
  val tok2 = p1_RBRACE(buf, err)
in//let
err := e00;
l0d0e_RBRACE_cons1(tok1, ldes, tok2)
end (*let*) // end of [ T_BAR() ]
|
_(* non-T_BAR *) =>
(
case+ tnd of
|
T_RBRACE() =>
let
  val () = buf.skip1()
in//let
  err := e00; l0d0e_RBRACE_cons0(tok)
end (*let*) // end of [ T_RBRACE() ]
|
_(*non-T_RPAREN*) =>
(
  err := e00 + 1; l0d0e_RBRACE_cons0(tok)
) (* end of [non-RPAREN] *)
) (* end of [ non-T_BAR ] *)
//
end(*let*)//end-[p1_l0d0e_RBRACE(buf,err)]

(* ****** ****** *)
#implfun
d0pat_RPAREN_lctn
  (node) =
(
case+ node of
| d0pat_RPAREN_cons0
  (      tbar      ) => tbar.lctn()
| d0pat_RPAREN_cons1
  (tok1, d0ps, tok2) => tok1.lctn() + tok2.lctn()
) (*case*) // end of [d0pat_RPAREN_lctn(node)] 
(* ****** ****** *)
#implfun
l0d0p_RBRACE_lctn
  (node) =
(
case+ node of
| l0d0p_RBRACE_cons0
  (      tbar      ) => tbar.lctn()
| l0d0p_RBRACE_cons1
  (tok1, lses, tok2) => tok1.lctn() + tok2.lctn()
) (*case*) // end of [l0d0p_RBRACE_lctn(node)]
(* ****** ****** *)
#implfun
d0exp_RPAREN_lctn
  (node) =
(
case+ node of
| d0exp_RPAREN_cons0
  (      tbar      ) => tbar.lctn()
| d0exp_RPAREN_cons1
  (tok1, d0es, tok2) => tok1.lctn() + tok2.lctn()
) (*case*) // end of [d0exp_RPAREN_lctn(node)] 
(* ****** ****** *)
#implfun
l0d0e_RBRACE_lctn
  (node) =
(
case+ node of
| l0d0e_RBRACE_cons0
  (      tbar      ) => tbar.lctn()
| l0d0e_RBRACE_cons1
  (tok1, lses, tok2) => tok1.lctn() + tok2.lctn()
) (*case*) // end of [l0d0e_RBRACE_lctn(node)]
(* ****** ****** *)

#implfun
pq_s0exp_anno
  (buf, err) = let
//
val e00 = err
val tok = buf.getk0()
//
(*
val ( )
prerrln
("pq_s0exp_anno: tok = ", tok)
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
val s0t = p1_s0exp(buf, err)
in//let
  (err := e00; optn_cons(s0t))
end (*let*) // end of [T_CLN]
|
_(*non-T_CLN*) => optn_nil(*void*)
//
end (*let*)//end-of(pq_s0exp_anno(buf,err))

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_dynexp.dats] *)
