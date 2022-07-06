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
end (*let*)//end-of-[p1_d0pat_RPAREN(buf,err)]

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
(* ****** ****** *)

#implfun
p1_d0exp_atm
( buf, err ) = let
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
(*
//
| T_LTGT() => let
    val () =
      buf.skip1()
    // end-of-[val]
    val tbeg = tok
    val tend = tok
    val s0es = list_nil()
    val loc_res = tok.lctn()
  in
    d0exp_make_node
    (loc_res, D0Etqarg(tbeg, s0es, tend))
  end // end-of-[T_LTGT]
//
| T_LBRACE() => let
    val () = buf.skip1()
    val s0es =
      p_s0expseq_COMMA(buf, err)
    val tbeg = tok
    val tend = p_RBRACE(buf, err)
  in
    err := e00;
    d0exp_make_node
    ( loc_res
    , D0Esqarg(tbeg, s0es, tend)) where
    {
      val loc_res = tbeg.lctn()+tend.lctn()
    }
  end // end-of-[T_LBRACE]
//
| T_LPAREN() => let
    val () = buf.skip1()
    val d0es =
      p1_d0expseq_COMMA(buf, err)
    // end-of-[val]
    val tbeg = tok
    val tend = p1_d0exp_RPAREN(buf, err)
  in
    err := e00;
    d0exp_make_node
    ( loc_res
    , D0Eparen(tbeg, d0es, tend)) where
    {
      val loc_res =
        tbeg.lctn()+d0exp_RPAREN_loc(tend)
      // end-of-[val]
    }
  end // end-of-[T_LPAREN]
//
| T_TRCD1(k0) => let
    val () = buf.skip1()
    val topt =
    ( if
      (k0 <= 1)
      then None()
      else Some(p_LPAREN(buf, err))
    ) : tokenopt // end-of-[val]
    val d0es =
      p1_d0expseq_COMMA(buf, err)
    // end-of-[val]
    val tbeg = tok
    val tend = p1_d0exp_RPAREN(buf, err)
  in
    err := e00;
    d0exp_make_node
    ( loc_res
    , D0Etrcd1
      (tbeg, topt, d0es, tend)) where
    {
      val loc_res =
        tbeg.lctn()+d0exp_RPAREN_loc(tend)
      // end-of-[val]
    }
  end // end-of-[T_TRCD1]
//
| T_LET() => let
//
    val () = buf.skip1()
//
    val d0cs =
    p1_d0eclseq_dyn(buf, err)
//
    val
    topt = popt_IN(buf, err)
    val d0es =
    p1_d0expseq_SMCLN(buf, err)
    val tok2 = p_ENDLET(buf, err)
//
    val loc_res = tok.lctn()+tok2.lctn()
  in
    err := e00;
    d0exp_make_node
    ( loc_res
    , D0Elet(tok, d0cs, topt, d0es, tok2))
  end // end-of-[T_LET]
//
| T_TRY() => let
//
    val () = buf.skip1()
//
    val d0e1 =
      p_appd0exp(buf, err)
    // end-of-[val]
//
    val tok2 =
      p_WITH(buf, err)
    val tbar =
      popt_BAR(buf, err)
    val d0cs =
      p1_d0clauseq_BAR(buf, err)
    val tend = p_ENDTRY(buf, err)
//
    val loc_res = tok.lctn()+tend.lctn()
//
  in
    err := e00;
    d0exp_make_node
    ( loc_res
    , D0Etry0
      (tok, d0e1, tok2, tbar, d0cs, tend))
  end // end-of-[T_TRY]
//
| T_DOT() => let
    val () =
      buf.skip1()
    // end-of-[val]
    val lab =
      p_l0abl(buf, err)
    val arg = let
      val tok2 = buf.get0()
    in
      case+
      tok2.node() of
      | T_LPAREN() =>
        Some( d0e ) where
        {
          val d0e =
            p_atmd0exp(buf, err)
          // end-of-[val]
        }
      | _(* non-LPAREN *) => None()
    end : d0expopt // end-of-[val]
    val loc_res = let
      val loc = tok.lctn()
    in
      case+ arg of
      | None() => loc + lab.lctn()
      | Some(d0e) => loc + d0e.lctn()
    end // end-of-[val]
  in
    d0exp_make_node
    (loc_res, D0Edtsel(tok, lab, arg))
  end // end-of-[T_DOT]
//
| T_LBRACK() => let
    val () = buf.skip1()
    val d0es =
      p1_d0expseq_COMMA(buf, err)
    val tbeg = tok
    val tend = p_RBRACK(buf, err)
  in
    err := e00;
    let
      val
      loc_res =
      tbeg.lctn()+tend.lctn()
    in
      d0exp_make_node
      ( loc_res
      , D0Ebrack(tbeg, d0es, tend) )
    end
  end // end-of-[T_LBRACK]
//
| T_IDENT_qual _ => let
    val () = buf.skip1()
    val d0e = p_atmd0exp(buf, err)
  in
    err := e00;
    d0exp_make_node
    ( loc_res
    , D0Equal(tok, d0e)) where
    {
      val loc_res = tok.lctn()+d0e.lctn()
    }
  end // end-of-[T_IDENT_qual]
//
|
T_DLR_EXTNAM _ => let
  val () = buf.skip1()
  val gnm = p_g0nam(buf, err)
in
  err := e00;
  d0exp_make_node
  ( loc_res, D0Eextnam(gnm) ) where
  {
    val loc_res = tok.lctn()+gnm.lctn()
  }
end // end-of-[T_DLR_EXTNAM]
//
|
T_DLR_EXISTS _ => let
  val () = buf.skip1()
  val sqs =
    p1_D0Esqargseq(buf, err)
  val d0e = p_atmd0exp(buf, err)
in
  err := e00;
  d0exp_make_node
  ( loc_res
  , D0Eexists(tok, sqs, d0e)) where
  {
    val loc_res = tok.lctn()+d0e.lctn()
  }
end // end-of-[T_DLR_EXISTS]
//
*)
|
_(* error-processing *) =>
(
err := e00 + 1;
d0exp_make_node(tok.lctn(), D0Etkerr(tok)))
//
end(*end*)//end-of-[p1_d0exp_atm(buf,err)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_dynexp.dats] *)
