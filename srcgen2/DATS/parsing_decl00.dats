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
Start Time: June 20th, 2022
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
(* ****** ****** *)
#symload
lctn with s0mag_get_lctn//staexp0
#symload
lctn with t0mag_get_lctn//staexp0
#symload
lctn with s0qid_get_lctn//staexp0
#symload
lctn with d0qid_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with g0nam_get_lctn//staexp0
#symload
lctn with g0exp_get_lctn//staexp0
#symload
lctn with g0mag_get_lctn//staexp0
(* ****** ****** *)
//
#symload
lctn with sort0_get_lctn//staexp0
#symload
lctn with s0exp_get_lctn//staexp0
//
#symload
lctn with s0tcn_get_lctn//staexp0
#symload
lctn with d0tst_get_lctn//staexp0
#symload
lctn with s0tdf_get_lctn//staexp0
#symload
lctn with d0tcn_get_lctn//staexp0
#symload
lctn with d0typ_get_lctn//staexp0
//
(* ****** ****** *)
//
#symload
lctn with q0arg_get_lctn//dynexp0
#symload
lctn with s0qag_get_lctn//dynexp0
#symload
lctn with t0qag_get_lctn//dynexp0
//
(* ****** ****** *)
#symload
lctn with a0typ_get_lctn//dynexp0
#symload
lctn with d0arg_get_lctn//dynexp0
(* ****** ****** *)
//
#symload
lctn with d0pat_get_lctn//dynexp0
#symload
lctn with d0exp_get_lctn//dynexp0
#symload
lctn with d0ecl_get_lctn//dynexp0
//
(* ****** ****** *)
#symload
node with token_get_node//lexing0
(* ****** ****** *)
#symload
node with i0dnt_get_node//staexp0
#symload
node with l0abl_get_node//staexp0
(* ****** ****** *)
#symload
node with g0exp_get_node//staexp0
(* ****** ****** *)
#symload
node with s0exp_get_node//staexp0
#symload
node with s0qua_get_node//staexp0
(* ****** ****** *)
#symload
tnode with token_get_node//lexing0
(* ****** ****** *)
#symload
lctn with d0cstdcl_get_lctn//dynexp0
(* ****** ****** *)
#symload
lctn with d0valdcl_get_lctn//dynexp0
#symload
lctn with d0vardcl_get_lctn//dynexp0
#symload
lctn with d0fundcl_get_lctn//dynexp0
(* ****** ****** *)
#symload + with add_loctn_loctn//locinfo
(* ****** ****** *)

fun
precopt_lctn
( opt
: precopt)
: optn_vt(loc_t) =
(
case+ opt of
| PRECnil0() =>
  optn_vt_nil()
| PRECint1(tok) =>
  optn_vt_cons(tok.lctn())
|
PRECopr2(id0, pmd) =>
(
case+ pmd of
|
PMODnone() =>
optn_vt_cons(id0.lctn())
|
PMODsome
(tbeg, _, tend) =>
optn_vt_cons(id0.lctn()+tend.lctn())
)
) (*case*) // end of [precopt_lctn(precopt)]

(* ****** ****** *)
//
#extern
fun
p1_i0dntseq: p1_fun(i0dntlst)
//
(* ****** ****** *)
#extern
fun
p1_g0magseq: p1_fun(g0maglst)
(* ****** ****** *)
//
#extern
fun p1_precopt: p1_fun(precopt)
#extern
fun p1_precmod: p1_fun(precmod)
#extern
fun p1_precint: p1_fun(precint)
//
(* ****** ****** *)
//
#implfun
p1_i0dntseq
( buf, err ) =
list_vt2t
( ps_p1fun
  {i0dnt}(buf, err, p1_i0dnt))
//
(* ****** ****** *)
//
#implfun
p1_g0magseq
( buf, err ) =
list_vt2t
( ps_p1fun
  {g0mag}(buf, err, p1_g0mag))
//
(* ****** ****** *)
//
#implfun
p1_precopt
  (buf, err) = let
//
val tok = buf.getk0()
val tnd = tok.tnode()
//
in//let
//
case+ tnd of
//
|
T_INT01 _ =>
PRECint1(tok) where
{
  val () = buf.skip1()
}
|
T_INT02 _ =>
PRECint1(tok) where
{
  val () = buf.skip1()
}
(*
|
T_INT03 _ =>
PRECint1(tok) where
{
  val () = buf.skip1()
}
*)
|
_ (* non-T_INT01 *) =>
PRECopr2(dnt1, pmod) where
{
  val dnt1 = p1_i0dnt(buf, err)
  val pmod = p1_precmod(buf, err)
}
//
endlet // end of [p1_precopt(buf,err)]

(* ****** ****** *)

#implfun
p1_precint
  (buf, err) = let
//
val tok = buf.getk0()
val tnd = tok.tnode()
//
in
//
case+ tnd of
(*
|
T_INT01 _ =>
PINTint1(tok) where
{
  val () = buf.skip1()
}
*)
|
_ (* non-T_INT01 *) =>
let
val tok0 = tok
val (  ) = buf.skip1()
val tint = buf.getk1()
in PINTopr2(tok0, tint) endlet
//
endlet // end of [p1_precint(buf,err)]

(* ****** ****** *)

#implfun
p1_precmod
  (buf, err) = let
//
val tok0 = buf.getk0()
val tnd0 = tok0.tnode()
//
in//let
//
case+ tnd0 of
|
T_LPAREN() =>
PMODsome
(tbeg, pint, tend) where
{
  val tbeg = tok0
  val (  ) = buf.skip1()
  val pint =
    p1_precint(buf, err)
  val tend = p1_RPAREN(buf, err)
}
| _(*non-T_LPAREN*) => PMODnone()
//
endlet // end of [p1_precmod(buf,err)]

(* ****** ****** *)

#implfun
p1_g0edf(buf, err) =
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
T_EQ0() => let
  val ( ) = buf.skip1()
  val g0e = p1_g0exp(buf, err)
in//let
G0EDFsome(optn_cons(tok), g0e(*def*))
end (*let*) // end of [T_EQ0]
|
_(*non-T_EQ0*) => let
  val g0e = p1_g0exp(buf, err)
in
case+
g0e.node() of
|
G0Etkerr(_) => G0EDFnone(*void*)
|
_(*non-G0Etkerr*) =>
G0EDFsome(optn_nil(*void*), g0e(*def*))
end (*let*) // end of [non-T_EQ0]
//
end (*let*) // end of [p_g0edf(buf,err)]

(* ****** ****** *)

#implfun
p1_a0tdf(buf, err) =
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
T_IDSYM(sym) =>
(
case+ 0 of
| _
when(sym = "==") =>
let
val ( ) = buf.skip1()
val s0e = p1_s0exp(buf, err)
in
(err := e00; A0TDFeqeq(tok, s0e))
end (*let*)//end-of-(sym = "==")
| _
when(sym = "<=") =>
let
val ( ) = buf.skip1()
val s0e = p1_s0exp(buf, err)
in
(err := e00; A0TDFlteq(tok, s0e))
end (*let*)//end-of-(sym = "<=")
)
| _(*non-lteq-eqeq*) => A0TDFsome()
//
end (*let*)//end-of-[p1_a0tdf(buf,err)]

(* ****** ****** *)
//
#typedef
pk_fun(r0:type) =
(token,
!tkbf0, &sint >> _)->(r0)
//
(* ****** ****** *)
//
#extern
fun
pk_dynconst: pk_fun(d0ecl)
//
(* ****** ****** *)
#extern
fun
pk_valdclst: pk_fun(d0ecl)
#extern
fun
pk_vardclst: pk_fun(d0ecl)
(* ****** ****** *)
#extern
fun
pk_fundclst: pk_fun(d0ecl)
(* ****** ****** *)
#extern
fun
pk_implmnt0: pk_fun(d0ecl)
(* ****** ****** *)

#implfun
fp_d0ecl
(f00, buf, err) = let
//
val e00 = err
//
val tok = buf.getk0()
val tnd = tok.tnode()
//
(*
val () =
prerrln
("fp_d0ecl: tok=", tok)
*)
//
fun
ENDq(tnd: tnode): bool =
(
case+ tnd of
|
T_END() => true
(*
|
T_ENDST() => true
*)
|
T_ENDLAM() => true
|
T_ENDFIX() => true
|
T_ENDLET() => true
(*
|
T_ENDTRY() => true
*)
|
T_ENDWHR() => true
|
T_ENDLOC() => true | _ => false)
//
(*
val ( ) =
prerrln("fp_d0ecl: f00 = ", f00)
val ( ) =
prerrln("fp_d0ecl: tok = ", tok)
*)
//
in//let
//
case+ tnd of
//
|
T_LOCAL() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val head =
  fp_d0eclseq(f00, buf, err)
  val tmid = pq_IN0(buf, err)
  val body =
  fp_d0eclseq( f00, buf, err )
  val tend = p1_ENDLOC(buf, err)
  val lres = tbeg.lctn() + tend.lctn()
in
err := e00;
d0ecl_make_node
( lres
, D0Clocal0(tbeg, head, tmid, body, tend))
end (*let*) // end of [ T_LOCAL() ]
//
|
T_VAL _
when f00 > 0 => pk_valdclst(tok, buf, err)
|
T_VAR _
when f00 > 0 => pk_vardclst(tok, buf, err)
|
T_FUN _
when f00 > 0 => pk_fundclst(tok, buf, err)
//
|
T_IMPLMNT _
when f00 > 0 => pk_implmnt0(tok, buf, err)
//
|
T_ABSSORT() => let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val tid0 = p1_s0tid(buf, err)
  val lres = tknd.lctn() + tid0.lctn()
//
in
err := e00;
d0ecl_make_node(lres, D0Cabssort(tknd,tid0))
end (*let*) // end of [ T_ABSSORT ]
//
|
T_STACST0() => let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val seid = p1_s0eid(buf, err)
  val tmas = p1_t0magseq(buf, err)
//
  val tok1 = p1_CLN(buf, err)
  val s0t2 = p1_sort0(buf, err)
//
  val lres = tknd.lctn() + s0t2.lctn()
//
in
err := e00;
d0ecl_make_node
(lres, D0Cstacst0(tknd,seid,tmas,tok1,s0t2))
end (*let*) // end of [ T_STACST0() ]
//
|
T_SORTDEF() =>
let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val tid0 = p1_s0tid(buf, err)
//
  val teq1 = p1_EQ0(buf, err)
  val def2 = p1_s0tdf(buf, err)
  val lres = tknd.lctn() + def2.lctn()
in
err := e00;
d0ecl_make_node
( lres, D0Csortdef(tknd, tid0, teq1, def2) )
end (*let*) // end of [ T_SORTDEF() ]
//
|
T_SEXPDEF(k0) =>
let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val sid0 = p1_s0eid(buf, err)
  val smas = p1_s0magseq(buf, err)
  val tres = pq_sort0_anno(buf, err)
  val teq1 = p1_EQ0(buf, err)
  val def2 = p1_s0exp(buf, err)
  val lres = tknd.lctn() + def2.lctn()
in
err := e00;
d0ecl_make_node
( lres
, D0Csexpdef(tknd,sid0,smas,tres,teq1,def2))
end (*let*) // end of [T_SEXPDEF(k0)]
//
|
T_ABSTYPE(k0) =>
let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val sid0 =
    p1_s0eid(buf, err)
  val tmas =
    p1_t0magseq(buf, err)
  val tres =
    pq_ids0t_anno(buf, err)
//
  val tdef = p1_a0tdf(buf, err)
//
  val lres = let
    val lknd = tknd.lctn()
  in
    case+ tdef of
    | A0TDFsome() =>
      (
      case+ tmas of
      | list_nil _ =>
        (
          lknd+sid0.lctn())
      | list_cons _ =>
        (
          lknd+t0ma.lctn()) where
        {
          val t0ma = list_last(tmas)
        }
      ) (* A0TDFsome *)
    | A0TDFlteq(tok, s0e) => lknd+s0e.lctn()
    | A0TDFeqeq(tok, s0e) => lknd+s0e.lctn()
  end : loc_t // end-of-let // end-of-val
in
(
err := e00;
d0ecl_make_node
(lres, D0Cabstype(tknd,sid0,tmas,tres,tdef)))
end (*let*) // end of [T_ABSTYPE(k0)]
|
T_ABSOPEN() =>
let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val sqid = p1_s0qid(buf, err)
  val lres = tknd.lctn() + sqid.lctn()
//
in
(
err := e00;
d0ecl_make_node(lres, D0Cabsopen(tknd,sqid)))
end (*let*) // end of [ T_ABSOPEN() ]
//
|
T_ABSIMPL() =>
let
//
  val tknd = tok
  val (  ) = buf.skip1()
  val sqid = p1_s0qid(buf, err)
  val smas = p1_s0magseq(buf, err)
  val tres = pq_sort0_anno(buf, err)
  val teq1 = p1_EQ0(buf, err)
  val def2 = p1_s0exp(buf, err)
  val lres = tknd.lctn() + def2.lctn()
in//let
(
err := e00;
d0ecl_make_node
( lres
, D0Cabsimpl
  (tknd, sqid, smas, tres, teq1, def2)))
end (*let*) // end of [ T_ABSIMPL() ]
//
|
T_DATASORT() =>
let
//
val tknd = tok
val (  ) = buf.skip1()
//
val dtcs =
p1_d0tstseq_AND(buf, err)
//
val lres =
(
case+ dtcs of
|
list_nil
((*nil*)) => tknd.lctn()
|
list_cons
( _ , _ ) =>
let
val dtc1 =
list_last(dtcs) in tknd.lctn()+dtc1.lctn()
endlet // end of [list_cons]
) : loc_t // end of [val(lres)]
in//let
(
err := e00;
d0ecl_make_node(lres,D0Cdatasort(tknd,dtcs)))
end (*let*) // end of [ T_DATASORT() ]
//
(* ****** ****** *)
|
T_EXCPTCON() => let
//
val tknd = tok
val (  ) = buf.skip1()
//
val lknd = tknd.lctn()
//
val topt = pq_BAR(buf, err)
val dtcs =
  p1_d0tcnseq_BAR(buf, err)
//
val lres =
(
case+ dtcs of
| list_nil() =>
(
case+ topt of
| optn_nil() => lknd
| optn_cons(tbar) =>
(
  lknd + tbar.lctn())
)
| list_cons _ =>
(
  lknd + dtc1.lctn()) where
  {
    val dtc1 = list_last(dtcs)
  }
) : loc_t // end of [val(lres)]
//
in//let
(
err := e00;
d0ecl(lres, D0Cexcptcon(tknd, topt, dtcs)))
end (*let*) // end of [ T_EXCPTCON() ]
(* ****** ****** *)
|
T_DATATYPE(k0) =>
let
//
val tknd = tok
val (  ) =
  buf.skip1((*nil*))
//
val dtps =
  p1_d0typseq_AND(buf, err)
//
val tok1 = buf.getk0((*nil*))
//
val wopt =
(
case+
tok1.node() of
|
T_WHERE() =>
let
//
val (  ) =
  buf.skip1()
val topt =
  pq_LBRACE(buf, err)
val wdcs =
p1_d0eclseq_sta(buf, err)
//
val
tok2 = buf.getk0((*void*))
//
val
((*void*)) =
(
case+
tok2.node() of
(*
| T_END() => buf.skip1()
*)
//
| T_RBRACE() => buf.skip1()
| T_ENDWHR() => buf.skip1()
//
|
_(*non-closing*) => (err:=err+1)
) : void // end of [val((*void*))]
in//let
  WD0CSsome(tok1, topt, wdcs, tok2)
end (*let*) // end of [ T_WHERE() ]
|
_(*non-T_WHERE*) => WD0CSnone((*void*))
)
: wd0eclseq(*case*)//end-of-[val(wopt)]
//
val lknd = tknd.lctn()
//
val lres =
(
  case+ wopt of
  | WD0CSnone() =>
    (
    case+ dtps of
    | list_nil() => lknd
    | list_cons _ =>
      (
        lknd+dtp1.lctn()) where
      {
        val dtp1 = list_last(dtps)
      } (*where*) // end(list_cons)
    )
  | WD0CSsome
    (_, _, _, tend) => lknd+tend.lctn()
) : loc_t // case // end of [ val(lres) ]
in//let
(
err := e00;
d0ecl(lres, D0Cdatatype(tknd, dtps, wopt)))
end (*let*) // end of [ T_DATATYPE( k0 ) ]
//
(* ****** ****** *)
//
|
_ when
t0_dctkind(tnd) => pk_dynconst(tok, buf, err)
//
(* ****** ****** *)
//
|
T_SRP_STATIC( ) => let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val dcl0 =
    fp_d0ecl(f00, buf, err)
  // end of [val]
  val lres = tknd.lctn()+dcl0.lctn()
in
(
err := e00;
d0ecl_make_node(lres, D0Cstatic(tknd, dcl0)))
end // end of [T_SRP_STATIC]
|
T_SRP_EXTERN() => let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val dcl0 =
    fp_d0ecl(f00, buf, err)
  // end of [val]
  val lres = tknd.lctn()+dcl0.lctn()
in
(
err := e00;
d0ecl_make_node(lres, D0Cextern(tknd, dcl0)))
end (*let*) // end of [T_SRP_EXTERN]
//
(* ****** ****** *)
//
|
T_SRP_DEFINE() => let
//
val tknd = tok
val (  ) = buf.skip1()
//
val gid0 =
  p1_g0eid(buf, err)
val gmas =
  p1_g0magseq(buf, err)
val gedf = p1_g0edf(buf, err)
//
val lres =
(
case+ gedf of
| G0EDFnone
  ((*void*)) =>
(
  case+ gmas of
  |
  list_nil _ =>
  (
    gid0.lctn()
  )
  |
  list_cons _ =>
  (
    gid0.lctn() + larg
  ) where
  {
    val larg = lctn(list_last(gmas))
  }
)
| G0EDFsome
  (topt, g0e1) => gid0.lctn() + g0e1.lctn()
) : loc_t // end of [ val(lres) ]
//
in
err := e00;
d0ecl(lres, D0Cdefine(tknd, gid0, gmas, gedf))
end (*let*) // end of [T_SRP_DEFINE]
//
(* ****** ****** *)
//
|
T_SRP_SYMLOAD() => let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val symb =
    p1_s0ymb(buf, err)
  val twth =
    p1_WITH( buf, err )
  val dqid =
    p1_d0qid( buf, err )
//
  val tok1 = buf.getk0()
//
  val opt1 =
  (
  case+
  tok1.node() of
  |
  T_OF0() =>
  let
    val () = buf.skip1()
  in//let
    optn_cons
    (p1_g0exp(buf, err))
  endlet // end-of(T_OF0())
  |
  _(*non-T_OF0*) => optn_nil()
  ) : g0expopt // end of [val]
//
  val lres =
  (
  case+ opt1 of
  | optn_nil
    ((*void*)) =>
    (tknd.lctn() + dqid.lctn())
  | optn_vt_cons
    (  g0e1  ) =>
    (tknd.lctn() + g0e1.lctn())
  ) : loc_t // end of [ val(lrec) ]
//
in
(
err := e00;
d0ecl_make_node
( lres
, D0Csymload(tknd, symb, twth, dqid, opt1)))
end (*let*) // end of [T_SRP_SYMLOAD(...)]
//
(* ****** ****** *)
//
|
T_SRP_INCLUDE() =>
let
  val tknd = tok
  val (  ) = buf.skip1()
  val g0e1 = p1_g0exp(buf, err)
  val lres = tknd.lctn()+g0e1.lctn()
in//let
err := e00;
d0ecl_make_node(lres, D0Cinclude(tknd, g0e1))
end (*let*) // end of [T_SRP_INCLUDE(...)]
|
T_SRP_STALOAD() =>
let
  val tknd = tok
  val (  ) = buf.skip1()
  val g0e1 = p1_g0exp(buf, err)
  val lres = tknd.lctn()+g0e1.lctn()
in//let
err := e00;
d0ecl_make_node(lres, D0Cstaload(tknd, g0e1))
end (*let*) // end of [T_SRP_STALOAD(...)]
//
(* ****** ****** *)
|
T_SRP_DYNINIT() =>
let
  val tknd = tok
  val (  ) = buf.skip1()
  val g0e1 = p1_g0exp(buf, err)
  val lres = tknd.lctn()+g0e1.lctn()
in//let
err := e00;
d0ecl_make_node(lres, D0Cdyninit(tknd, g0e1))
end (*let*) // end of [T_SRP_DYNINIT(...)]
//
(* ****** ****** *)
//
| T_SRP_NONFIX() =>
let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val dnts =
  p1_i0dntseq(buf, err)
//
  val lres =
  (
    case+ dnts of
    | list_nil _ => tknd.lctn()
    | list_cons _ =>
      (
      tknd.lctn()+dnt1.lctn()
      ) where
      {
        val dnt1 = list_last(dnts)
      } (*where*) // end of [list_cons]
  ) : loc_t // end of [ val(lres) ]
//
in//let
err := e00;
d0ecl_make_node(lres, D0Cnonfix(tknd, dnts))
end (*let*) // end of [ T_SRP_NONFIX ]
//
|
T_SRP_FIXITY(k0) =>
let
//
  val tknd = tok
  val loc0 = tok.lctn()
  val (  ) = buf.skip1()
//
  val dnts =
    p1_i0dntseq(buf, err)
  val tok1 = buf.getk0( )
  val opt1 =
  (
    case+
    tok1.node() of
    | T_OF0() =>
      p1_precopt
      (buf, err) where
      {
        val () = buf.skip1()
      }
    | _(* non-T_OF0 *) => PRECnil0()
  ) : precopt // end of [val]
//
  val lopt = precopt_lctn(opt1)
  val lopt =
  (
  case+ lopt of
  | !
  optn_vt_cons _ => lopt
  | ~
  optn_vt_nil( ) =>
  (
    case+ dnts of
    | list_nil() =>
      (
        optn_vt_nil()
      )
    | list_cons _ =>
      (
        optn_vt_cons(dnt1.lctn())
      ) where
      {
        val dnt1 = list_last(dnts)
      }
  )
  ) : optn_vt(loc_t) // end of [val]
//
  val lres =
  (
    case+ lopt of
    | ~optn_vt_nil() => loc0
    | ~optn_vt_cons(loc1) => loc0 + loc1
  ) : loc_t // end of [val(lres)]
//
in//let
err := e00;
d0ecl_make_node(lres, D0Cfixity(tknd,dnts,opt1))
end // end of [T_SRP_FIXITY(k0)]
//
(* ****** ****** *)
| _(* else *) =>
(err := e00 + 1; d0ecl(tok.lctn(), D0Ctkerr(tok)))
(* ****** ****** *)
//
end (*let*) // end-of-[ fp_d0ecl( f00, buf, err ) ]

(* ****** ****** *)

#implfun
fp_d0eclseq
(f00, buf, err) =
let
//
  val e00 = err
//
fnx
loop
( buf:
! tkbf0 >> _
, err
: &sint >> _
, res
: list_vt(d0ecl)
) : list_vt(d0ecl) =
let
val
dcl = fp_d0ecl(f00, buf, err)
in//let
if
(err = e00)
then
loop(buf, err, cons_vt(dcl, res))
else
(err := e00; list_vt_reverse0(res))
end(*let*)//end-of[loop(buf,err,res)]
//
in
list_vt2t
(loop(buf, err, list_vt_nil(*void*)))
end(*let*)//end-of[fp_d0eclseq(f00,buf,err)]

(* ****** ****** *)

local
//
#define STA 0
#define DYN 1
//
in//local
//
#implfun
p1_d0eclseq_sta
(buf, err) = fp_d0eclseq(STA, buf, err)
#implfun
p1_d0eclseq_dyn
(buf, err) = fp_d0eclseq(DYN, buf, err)
//
endloc(*local*)//end-of[local(p1_declseq...)]

(* ****** ****** *)

#implfun
fp_d0eclsq1
(f00, buf, err) =
let
//
fnx
loop
( buf:
! tkbf0 >> _
, e00: sint
, err
: &sint >> _
, res
: list_vt(d0ecl)
) : list_vt(d0ecl) =
let
val
dcl =
fp_d0ecl
(f00, buf, err)
val
res =
list_vt_cons(dcl,res)
//
in//let
//
if
(err = e00)
then
(
loop(buf, e00, err, res)
)
else
let
val tok = buf.getk0() in//let
//
case+
tok.node() of
| // HX: no more tokens left
T_EOF() =>
(err := e00;list_vt_reverse0(res))
| // HX: there are still
_(*non-T_EOF*) => // unused tokens
let
//
(*
HX-2022-07-17:
skip the current token and continue
*)
//
  val ( ) = err := e00
  val ( ) = buf.skip1()
  val dcl =
  d0ecl(tok.lctn(), D0Ctkskp(tok))
in
  loop
  (buf, e00, err, cons_vt(dcl, res))
end(*let*)//end-of[(*non-T_EOF*)]
end(*let*)//end-of[else]//end-of(if)
//
end(*let*)//end-of[loop(buf,err,res)]
//
in
let
val e00 = err
in//let
list_vt2t
(loop(buf, e00, err, list_vt_nil(*void*)))
end(*let*)
end(*let*)//end-of[fp_d0eclsq1(f00,buf,err)]

(* ****** ****** *)

local
//
#define STA 0
#define DYN 1
//
in//local
//
#implfun
p1_d0eclsq1_sta
(buf, err) = fp_d0eclsq1(STA, buf, err)
#implfun
p1_d0eclsq1_dyn
(buf, err) = fp_d0eclsq1(DYN, buf, err)
//
endloc(*local*)//end-of[local(p1_declsq1...)]

(* ****** ****** *)
//
#extern
fun
p1_q0arg: p1_fun(q0arg)
#extern
fun
p1_s0qag: p1_fun(s0qag)
#extern
fun
p1_t0qag: p1_fun(t0qag)
#extern
fun
p1_t0iag: p1_fun(t0iag)
//
#extern
fun
p1_s0qagseq: p1_fun(s0qaglst)
#extern
fun
p1_t0qagseq: p1_fun(t0qaglst)
#extern
fun
p1_t0iagseq: p1_fun(t0iaglst)
//
#extern
fun
p1_q0argseq_COMMA: p1_fun(q0arglst)
//
(* ****** ****** *)
//
#extern
fun
p1_d0argseq: p1_fun(d0arglst)
#extern
fun
p1_a0typseq_COMMA: p1_fun(a0typlst)
#extern
fun
p1_a0typsqt_COMMA: p1_fun(a0typlstopt)
//
(* ****** ****** *)
#extern
fun
p1_d0cstdcl: p1_fun(d0cstdcl)
#extern
fun
p1_d0cstdclseq_AND: p1_fun(d0cstdclist)
(* ****** ****** *)
//
#implfun
p1_q0arg(buf, err) =
let
//
val sid0 =
  p1_s0aid(buf, err)
//
val tok0 = buf.getk0()
//
val topt =
(
case+
tok0.node() of
|
T_CLN() =>
let
val () = buf.skip1()
in//let
optn_cons
(p1_sort0_app_NGT0(buf, err))
end (*let*) // end of [T_CLN]
| _(* non-T_CLN *) => optn_nil(*nil*)
) : sort0opt (*case*) // end of [val]
//
val loc0 =
let
val lid0 = sid0.lctn()
in//let
case+ topt of
| optn_nil() => (lid0)
| optn_cons(s0t0) => lid0+s0t0.lctn()
end : loc_t (* let *) // end of [val]
//
in
  q0arg( loc0, Q0ARGsome(sid0, topt) )
end (*let*) // end of [p1_q0arg(buf,err)]

(* ****** ****** *)
//
#implfun
p1_q0argseq_COMMA
  (buf, err) =
(
list_vt2t
(ps_COMMA_p1fun{q0arg}(buf,err,p1_q0arg))
) (* end-of(p1_q0argseq_COMMA(buf,err)) *)
//
(* ****** ****** *)
//
#implfun
p1_s0qag(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
//
(*
val () =
prerrln("p1_s0qag: tok = ", tok)
*)
//
in//let
//
case+
tok.node() of
|
T_LBRACE() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val q0as =
  p1_q0argseq_COMMA(buf, err)
  val tend = p1_RBRACE(buf, err)
  val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00
; s0qag_make_node
  (lres, S0QAGsome(tbeg, q0as, tend))
end (*let*) // end of [T_LT0]
|
_(* non-T_LT/GT *) =>
let
val () = (err := e00 + 1)
in//let
s0qag_make_node(tok.lctn(), S0QAGnone(tok))
end (*let*) // end of [ non-T_LTGT ]
//
end (*let*) // end of [p1_s0qag(buf,err)]
//
(* ****** ****** *)
//
#implfun
p1_t0qag(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
//
(*
val () =
prerrln("p1_t0qag: tok = ", tok)
*)
//
in//let
//
case+
tok.node() of
|
T_LT0() => let
  val tbeg = tok
  val (  ) = buf.skip1()
  val q0as =
  p1_q0argseq_COMMA(buf, err)
  val tend = p1_GT0(buf, err)
  val lres = tbeg.lctn() + tend.lctn()
in//let
  err := e00
; t0qag_make_node
  (lres, T0QAGsome(tbeg, q0as, tend))
end (*let*) // end of [T_LT0]
|
T_LTGT() => let
  val tbeg = tok
  val tend = tok
  val q0as = list_nil()
  val (  ) = buf.skip1()
  val lres = tbeg.lctn()
in
  t0qag_make_node
  (lres, T0QAGsome(tbeg, q0as, tend))
end (*let*) // end of [ T_LTGT ]
|
_(* non-T_LT/GT *) =>
let
val () = (err := e00 + 1)
in//let
t0qag_make_node(tok.lctn(), T0QAGnone(tok))
end (*let*) // end of [ non-T_LTGT ]
//
end (*let*) // end of [p1_t0qag(buf,err)]
//
(* ****** ****** *)

#implfun
p1_t0iag(buf, err) =
let
//
val e00 = err
val tok = buf.getk0()
//
(*
val () =
println! ("p1_t0iag: tok = ", tok)
*)
//
in//let
//
case+
tok.node() of
//
|
T_LT0() => let
  val tbeg = tok
  val (  ) = buf.skip1()
//
  val s0es =
  list_vt2t
  (
  ps_COMMA_p1fun{s0exp}
  (buf, err, p1_s0exp_app_NGT0))
//
  val tend = p1_GT0(buf, err)
//
  val lres = tbeg.lctn()+tend.lctn()
//
in
  err := e00;
  t0iag_make_node
  (lres, T0IAGsome(tbeg, s0es, tend))
end (*let*) // end of [ T_LT0() ]
| T_LTGT() => let
//
  val tbeg = tok
  val tend = tok
  val (  ) = buf.skip1()
//
  val s0es = list_nil()
  val lres = tbeg.lctn()
//
in
  err := e00;
  t0iag_make_node
  (lres, T0IAGsome(tbeg, s0es, tend))
end (*let*) // end of [ T_LTGT() ]
|
_(* non-T_LT/T_LTGT *) =>
(
err := e00 + 1;
t0iag_make_node(tok.lctn(),T0IAGnone(tok)))
//
end (*let*) // end of [ p1_ti0arg(buf,err) ]

(* ****** ****** *)
//
#implfun
p1_s0qagseq(buf, err) =
(
list_vt2t(ps_p1fun{s0qag}(buf,err,p1_s0qag))
)
//
#implfun
p1_t0qagseq(buf, err) =
(
list_vt2t(ps_p1fun{t0qag}(buf,err,p1_t0qag))
)
//
#implfun
p1_t0iagseq(buf, err) =
(
list_vt2t(ps_p1fun{t0iag}(buf,err,p1_t0iag))
)
//
(* ****** ****** *)

#implfun
p1_a0typ(buf, err) =
let
//
val e00 = err
//
val mark =
tokbuf_mark_get(buf)
//
val tok0 = buf.getk1()
val tnd0 = tok0.node()
//
val tok1 = buf.getk0()
//
in//let
//
case+
tok1.node() of
|
T_CLN() when
t0_d0pid(tnd0) =>
let
  val (  ) =
  tokbuf_mark_clr(buf, mark)
  val (  ) = buf.skip1((*nil*))
  val s0e1 = p1_s0exp(buf, err)
  val lres = tok0.lctn() + s0e1.lctn()
in
  err := e00
; a0typ_make_node
  (lres, A0TYPsome(s0e1, optn_cons(tok0)))
end (*let*) // end of [T_CLN]
|
_(*non-T_CLN*) =>
let
  val (  ) =
  tokbuf_mark_set(buf, mark)
  val s0e0 = p1_s0exp(buf, err)
in
a0typ_make_node
(s0e0.lctn(), A0TYPsome(s0e0, optn_nil()))
end (*let*) // end of [non-T_CLN]
//
end (*let*) // end of [p1_a0typ(buf,err)]

(* ****** ****** *)
//
#implfun
p1_a0typseq_COMMA
(  buf, err  ) =
(
list_vt2t
(ps_COMMA_p1fun{a0typ}(buf,err,p1_a0typ))
) (*end-of-[p1_a0typseq_COMMA(buf, err)]*)
//
#implfun
p1_a0typsqt_COMMA
(  buf, err  ) =
let
//
val tok = buf.getk0()
//
in//let
//
case+
tok.node() of
|
T_BAR() => let
  val () = buf.skip1()
in
  optn_cons(p1_a0typseq_COMMA(buf, err))
end // end of [T_BAR]
| _(* non-T_BAR *) => optn_nil( (*void*) )
//
end(*let*) // end-of-[p1_a0typsqt(buf,err)]
//
(* ****** ****** *)

#implfun
p1_d0arg(buf, err) =
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
T_LPAREN() =>
let
  val tbeg = tok
  val (  ) = buf.skip1()
  val arg1 =
  p1_a0typseq_COMMA(buf, err)
  val opt2 =
  p1_a0typsqt_COMMA(buf, err)
  val tend = p1_RPAREN(buf, err)
  val lres = tbeg.lctn()+tend.lctn()
in//let
  err := e00
; d0arg_make_node
  (lres, D0ARGdyn2(tbeg,arg1,opt2,tend))
end
//
|
T_LBRACE() => let
  val tbeg = tok
  val (  ) = buf.skip1()
  val s0qs =
  p1_s0quaseq_BSCLN(buf, err)
  val tend = p1_RBRACE(buf, err)
  val lres = tbeg.lctn()+tend.lctn()
in
  err := e00
; d0arg(lres, D0ARGsta0(tbeg, s0qs, tend))
end // end of [T_LBRACE]
//
| _
when t0_d0pid(tnd) =>
let
  val dpid =
    p1_d0pid(buf, err)
  val loc0 = dpid.lctn()
in
  err := e00
; d0arg_make_node(loc0, D0ARGdyn1( dpid ))
end (*let*) // end of [t0_s0eid(tnd)]
//
|
_ (* d0arg-error *) =>
(
err := e00 + 1;
d0arg_make_node(tok.lctn(), D0ARGnone(tok)))
//
end (*let*) // end of [ p1_d0arg(buf, err) ]

(* ****** ****** *)
//
#implfun
p1_d0argseq
(  buf, err  ) =
(
list_vt2t(ps_p1fun{d0arg}(buf,err,p1_d0arg))
)
//
(* ****** ****** *)

#implfun
p1_d0res(buf, err) =
let
val e00 = err
val tok = buf.getk0()
in//let
//
case+
tok.node() of
|
T_EQ0() =>
let
  val teq1 = tok
  val (  ) = buf.skip1()
  val dexp = p1_d0exp(buf, err)
in
  err := e00; D0RESsome(teq1, dexp)
end(*let*) // end of [ T_EQ0() ]
| _(*non-T_EQ0*) => D0RESnone((*void*))
//
end (*let*) // end of [ p1_d0res(buf, err) ]

(* ****** ****** *)

#implfun
pk_dynconst
(tok, buf, err) = let
//
  val e00 = err
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val lknd = tknd.lctn()
//
  val tqas =
    p1_t0qagseq(buf, err)
//
  val d0cs =
    p1_d0cstdclseq_AND(buf, err)
//
  val lres =
  (
  case+ d0cs of
  | list_nil() =>
    (
    case+ tqas of
    | list_nil() => lknd
    | list_cons _ =>
      let
      val tqa1 =
      list_last(tqas) in lknd + tqa1.lctn()
      end
    )
  | list_cons _ =>
    let
    val
    d0c1 = list_last(d0cs) in lknd+d0c1.lctn()
    end
  ) : loc_t // end of [val(lres)]
//
in//let
err := e00;
d0ecl_make_node(lres, D0Cdynconst(tknd, tqas, d0cs))
end (*let*) // end of [ptok_dynconst(buf, err)]

(* ****** ****** *)
//
#implfun
p1_d0cstdcl
  (buf, err) = let
//
val e00 = err
//
val
dpid =
p1_d0pid(buf, err)
val
args =
p1_d0argseq(buf, err)
//
val
sres = p1_s0res(buf, err)
val
dres = p1_d0res(buf, err)
//
val
lpid = dpid.lctn()
val
loc0 =
(
case+ dres of
|
D0RESnone() =>
(
case+ sres of
| S0RESnone() =>
  (
  case+ args of
  |
  list_nil _ => lpid
  |
  list_cons _ =>
  let
  val
  arg1 =
  list_last(args) in lpid+arg1.lctn()
  end (*let*) // end of [list_cons]
  )
| S0RESsome(seff, s0e1) => lpid+s0e1.lctn()
)
| D0RESsome(teq1, d0e2) => lpid+d0e2.lctn()
) : loc_t // end of [val]
//
in
err := e00;
d0cstdcl_make_args(loc0,dpid,args,sres,dres)
end (*let*) // end of [p1_d0cstdcl(buf,err)]
//
(* ****** ****** *)
//
#implfun
p1_d0cstdclseq_AND(buf, err) =
list_vt2t
(ps_AND_p1fun{d0cstdcl}(buf, err, p1_d0cstdcl))
//
(* ****** ****** *)
//
#typedef
d0valdclist = list(d0valdcl)
#typedef
d0vardclist = list(d0vardcl)
#typedef
d0fundclist = list(d0fundcl)
//
#extern
fun
p1_wths0exp: p1_fun(wths0exp)
//
#extern
fun
p1_d0valdcl: p1_fun(d0valdcl)
#extern
fun
p1_d0vardcl: p1_fun(d0vardcl)
#extern
fun
p1_d0fundcl: p1_fun(d0fundcl)
//
#extern
fun
p1_d0valdclseq_AND: p1_fun(d0valdclist)
#extern
fun
p1_d0vardclseq_AND: p1_fun(d0vardclist)
#extern
fun
p1_d0fundclseq_AND: p1_fun(d0fundclist)
//
(* ****** ****** *)
//
#implfun
pk_valdclst
(tok, buf, err) =
let
//
val e00 = err
val tknd = tok
val (  ) = buf.skip1()
//
(*
val (  ) =
prerrln
("pk_valdclst: tknd=", tknd)
*)
//
val d0cs =
p1_d0valdclseq_AND(buf, err)
//
val lres =
(
  case+ d0cs of
  | list_nil _ =>
    tknd.lctn((*nil*))
  | list_cons _ =>
    (
    tknd.lctn()+d0c1.lctn()
    ) where
    {
      val d0c1 = list_last(d0cs)
    }
) : loc_t // end of [val(lres)]
in//let
  err := e00
; d0ecl(lres, D0Cvaldclst(tok, d0cs))
end (*let*)//end-of-[pk_valdclst(tok, buf, err)]

(* ****** ****** *)

#implfun
pk_vardclst
(tok, buf, err) =
let
//
val e00 = err
val tknd = tok
val (  ) = buf.skip1()
//
(*
val (  ) =
prerrln
("pk_vardclst: tknd=", tknd)
*)
//
val d0cs =
p1_d0vardclseq_AND(buf, err)
//
val lres =
(
  case+ d0cs of
  | list_nil _ =>
    tknd.lctn((*nil*))
  | list_cons _ =>
    (
    tknd.lctn()+d0c1.lctn()
    ) where
    {
      val d0c1 = list_last(d0cs)
    }
) : loc_t // end of [val(lres)]
in//let
  err := e00
; d0ecl(lres, D0Cvardclst(tok, d0cs))
end (*let*)//end-of-[pk_vardclst(tok,buf,err)]

(* ****** ****** *)

#implfun
pk_fundclst
(tok, buf, err) =
let
//
val e00 = err
val tknd = tok
val (  ) = buf.skip1()
//
(*
val (  ) =
prerrln
("pk_fundclst: tknd=", tknd)
*)
//
val tqas =
p1_t0qagseq(buf, err)
val d0cs =
p1_d0fundclseq_AND(buf, err)
//
val lres =
(
  case+ d0cs of
  | list_nil _ =>
    tknd.lctn((*nil*))
  | list_cons _ =>
    (
    tknd.lctn()+d0c1.lctn()
    ) where
    {
      val d0c1 = list_last(d0cs)
    }
) : loc_t // end of [val(lres)]
in//let
  err := e00
; d0ecl(lres, D0Cfundclst(tok, tqas, d0cs))
end (*let*)//end-of-[pk_fundclst(tok,buf,err)]

(* ****** ****** *)

#implfun
p1_wths0exp(buf, err) =
let
//
  val tok = buf.getk0()
  val tnd = tok.tnode()
//
in//let
//
case+ tnd of
|
T_WITHTYPE _ =>
WTHS0EXPsome(tok, s0e) where
{
  val ( ) = buf.skip1()
  val s0e = p1_s0exp(buf, err)
}
|
_(*non-WITH*) => WTHS0EXPnone(*void*)
//
end(*let*)//end-of-[p1_wths0exp(buf,err)]

(* ****** ****** *)

local
//
// HX: nothing
//
(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
#implfun
pk_implmnt0
(tok, buf, err) = let
//
val e00 = err
//
val tknd = tok
val (  ) = buf.skip1()
//
val sqas =
  p1_s0qagseq(buf, err)
val tqas =
  p1_t0qagseq(buf, err)
//
val dqid =
  p1_d0qid(buf, err)
val tias =
  p1_t0iagseq(buf, err)
//
val f0as =
  p1_f0argsq1(buf, err)
//
val tres = p1_s0res(buf, err)
//
val teq1 = p1_EQ0(buf, err)
val d0e2 = p1_d0exp(buf, err)
//
val lres = tknd.lctn() + d0e2.lctn()
//
in
err := e00;
d0ecl_make_node
( lres
, D0Cimplmnt0
  ( tknd, sqas, tqas
  , dqid, tias, f0as, tres, teq1, d0e2))
end (*let*)//end-of-[pk_implmnt0(tok,buf,err)]
//
endloc (*local*) // end of [local(pk_implmnt0)]

(* ****** ****** *)

#implfun
p1_d0valdcl
  (buf, err) = let
//
val e00 = err
//
val
dpat =
p1_d0pat(buf, err)
//
val
topt = pq_EQ0(buf, err)
//
(*
val () =
prerrln("p1_d0valdcl: dpat = ", dpat)
val () =
prerrln("p1_d0valdcl: topt = ", topt)
*)
//
in//let
//
case+ topt of
|
optn_nil() =>
let
val tdxp =
TEQD0EXPnone()
val wsxp =
WTHS0EXPnone()
val loc0 = dpat.lctn()
val loc1 =
(
case+ wsxp of
|
WTHS0EXPnone
((*nil*)) => loc0
|
WTHS0EXPsome
(_, sexp) => loc0+sexp.lctn()): loc_t
//
in
err := e00;
d0valdcl_make_args(loc1, dpat, tdxp, wsxp)
end (*let*) // end of [ optn_nil() ]
|
optn_cons(teq1) =>
let
//
val dexp =
p1_d0exp(buf, err)
//
val tdxp =
TEQD0EXPsome(teq1, dexp)
//
val
wsxp = p1_wths0exp(buf, err)
//
val loc0 =
let
val
loc0 = dpat.lctn((*nil*))
in//let
//
case+ wsxp of
|
WTHS0EXPnone
((*nil*)) => loc0+dexp.lctn()
|
WTHS0EXPsome
(_, sexp) => loc0+sexp.lctn()
end : loc_t // end of [val(loc0)]
//
in//let
err := e00;
d0valdcl_make_args(loc0, dpat, tdxp, wsxp)
end (*let*) // end of [optn_cons(teq1)]
//
end (*let*) // end of [p1_d0valdcl(buf,err)]
//
(* ****** ****** *)

#implfun
p1_d0vardcl
  (buf, err) = let
//
val e00 = err
//
val dpid =
p1_d0pid(buf, err)
//
val sres =
pq_s0exp_anno(buf, err)
//
val vpid =
let
val tok = buf.getk0()
in//in-of-let
//
case+
tok.node() of
|
T_WITH() =>
let
val () = buf.skip1()
in//let
optn_cons
(p1_d0pid(buf, err))
end // end of [T_WITH]
|
_(*non-T_WITH*) => optn_nil()
//
end : d0pidopt // end of [val]
//
val dini =
let
val tok = buf.getk0()
in//in-of-let
//
case+
tok.node() of
|
T_EQ0( ) =>
let
val () = buf.skip1()
in//let
TEQD0EXPsome
(tok, p1_d0exp(buf, err))
end // end of [T_EQ0]
|
_(*non-T_EQ0*) => TEQD0EXPnone()
//
end : teqd0exp // end of [val]
//
val loc0 =
let
val
lpid = dpid.lctn()
in//in-of-let
(
case+ dini of
|
TEQD0EXPnone() =>
(
case+ vpid of
|
optn_nil() =>
(
case+ sres of
|
optn_nil() => lpid
|
optn_cons(s0e1) => lpid+s0e1.lctn())
|
optn_cons(vpid) => lpid + vpid.lctn())
|
TEQD0EXPsome
(teq1, d0e2) => lpid+d0e2.lctn()): loc_t
end (*let*) // end of [val(loc0)]
//
in
err := e00;
d0vardcl_make_args(loc0,dpid,vpid,sres,dini)
end (*let*) // end of [ p1_d0vardcl(buf,err) ]
//
(* ****** ****** *)

#implfun
p1_d0fundcl
  (buf, err) = let
//
val e00 = err
//
val dpid =
p1_d0pid(buf, err)
//
val farg =
p1_f0argsq1(buf, err)
//
val
sres = p1_s0res(buf, err)
//
val teq1 = pq_EQ0(buf, err)
//
in//in-of-let
//
case+ teq1 of
|
optn_nil() =>
let
val tdxp = TEQD0EXPnone()
val wsxp = WTHS0EXPnone()
val loc0 =
let
val
lpid = dpid.lctn((*void*))
in//let
case+ sres of
|
S0RESnone() =>
(
case+ farg of
|
list_nil() => lpid
|
list_cons _ =>
(
lpid+f0a1.lctn()) where
{
val f0a1 = list_last(farg) }
)
|
S0RESsome
(seff,s0e1) => lpid+s0e1.lctn()
end : loc_t // end of [val(loc0)]
in
err := e00;
d0fundcl_make_args
(loc0, dpid, farg, sres, tdxp, wsxp)
end
|
optn_cons(teq1) =>
let
val d0e2 =
  p1_d0exp(buf,err)
val tdxp =
  TEQD0EXPsome(teq1, d0e2)
val wsxp = p1_wths0exp(buf,err)
//
val loc0 =
let
val lpid = dpid.lctn((*void*))
in//let
case+ wsxp of
|
WTHS0EXPnone
( (*void*) ) => lpid+d0e2.lctn()
|
WTHS0EXPsome
(twth, s0e1) => lpid+s0e1.lctn()
end : loc_t // end of [val(loc0)]
//
in
err := e00;
d0fundcl_make_args
(loc0, dpid, farg, sres, tdxp, wsxp)
end (*let*) // end of [optn_cons(teq1)]
//
endlet (*let*) // end-of-[p1_d0fundcl(buf, err)]

(* ****** ****** *)
//
#implfun
p1_d0valdclseq_AND
  (buf, err) =
(
list_vt2t
(ps_AND_p1fun{d0valdcl}(buf,err,p1_d0valdcl))
) (* end-of-[p1_d0valdclseq_AND(buf, err) ] *)
//
#implfun
p1_d0vardclseq_AND
  (buf, err) =
(
list_vt2t
(ps_AND_p1fun{d0vardcl}(buf,err,p1_d0vardcl))
) (* end-of-[p1_d0vardclseq_AND(buf, err) ] *)
//
#implfun
p1_d0fundclseq_AND
  (buf, err) =
(
list_vt2t
(ps_AND_p1fun{d0fundcl}(buf,err,p1_d0fundcl))
) (* end-of-[p1_d0fundclseq_AND(buf, err) ] *)
//
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

(* end of [ATS3/XATSOPT_parsing_decl00.dats] *)
