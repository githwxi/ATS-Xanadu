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
lctn with sort0_get_lctn//staexp0
(* ****** ****** *)
//
#symload
lctn with s0exp_get_lctn//staexp0
#symload
lctn with s0tcn_get_lctn//staexp0
#symload
lctn with d0tst_get_lctn//staexp0
#symload
lctn with s0tdf_get_lctn//staexp0
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
(ps_p1fun{i0dnt}(buf, err, p1_i0dnt))
//
(* ****** ****** *)
//
#implfun
p1_precopt
  (buf, err) = let
//
val tok0 = buf.getk0()
val tnd0 = tok0.tnode()
//
in
//
case+ tnd0 of
//
|
T_INT01 _ =>
PRECint1(tok0) where
{
  val () = buf.skip1()
}
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
val tok0 = buf.getk0()
val tnd0 = tok0.tnode()
//
in
//
case+ tnd0 of
(*
|
T_INT01 _ =>
PINTint1(tok0) where
{
  val () = buf.skip1()
}
*)
|
_ (* non-T_INT01 *) =>
let
val (  ) = buf.skip1()
val tint = buf.getk1()
in PINTopr2(tok0, tint) end
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

#implfun
fp_d0ecl
(f00, buf, err) = let
//
val e00 = err
//
val tok = buf.getk0()
val tnd = tok.tnode()
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
(lres, D0Clocal(tbeg,head,tmid,body,tend))
end (*let*) // end of [ T_LOCAL() ]
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
d0ecl(lres, D0Csortdef(tknd, tid0, teq1, def2))
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
, D0Csexpdef(tknd, sid0, smas, tres, teq1, def2))
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
err := e00;
d0ecl_make_node
(lres, D0Cabstype(tknd, sid0, tmas, tres, tdef))
end // end of [T_ABSTYPE(k0)]
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
 (err := e00; d0ecl(lres, D0Cabsopen(tknd,sqid)))
end (*let*) // end of [ T_ABSOPEN() ]
//
|
T_ABSIMPL() => let
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
err := e00;
d0ecl_make_node
( lres
, D0Cabsimpl(tknd, sqid, smas, tres, teq1, def2))
end (*let*) // end of [ T_ABSIMPL() ]
//
|
T_DATASORT() => let
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
  | list_nil
    ((*nil*)) => tknd.lctn()
  | list_cons
    ( _ , _ ) =>
    let
    val dtc1 =
    list_last(dtcs) in tknd.lctn()+dtc1.lctn()
    end
  ) : loc_t // end of [val(lres)]
in
err := e00;
d0ecl_make_node(lres, D0Cdatasort(tknd, dtcs))
end // end of [T_DATASORT()]
//
(* ****** ****** *)
//
|
T_SRP_STATIC() => let
//
  val tknd = tok
  val (  ) = buf.skip1()
//
  val dcl0 =
    fp_d0ecl(f00, buf, err)
  // end of [val]
  val lres = tknd.lctn()+dcl0.lctn()
in
err := e00;
d0ecl_make_node( lres, D0Cstatic(tknd, dcl0) )
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
err := e00;
d0ecl_make_node( lres, D0Cextern(tknd, dcl0) )
end // end of [T_SRP_EXTERN]
//
(* ****** ****** *)
//
|
T_SRP_INCLUDE() =>
let
  val tknd = tok
  val (  ) = buf.skip1()
  val g0e0 = p1_g0exp(buf, err)
  val lres = tknd.lctn()+g0e0.lctn()
in//let
err := e00;
d0ecl_make_node( lres, D0Cinclude(tknd, g0e0) )
end // end of [T_SRP_INCLUDE(...)]
|
T_SRP_STALOAD() =>
let
  val tknd = tok
  val (  ) = buf.skip1()
  val g0e0 = p1_g0exp(buf, err)
  val lres = tknd.lctn()+g0e0.lctn()
in//let
err := e00;
d0ecl_make_node( lres, D0Cstaload(tknd, g0e0) )
end // end of [T_SRP_STALOAD(...)]
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
    | _(*non-T_OF0*) => PRECnil0()
  ) : precopt // end of [val]
//
  val lopt = precopt_lctn(opt1)
  val lres =
  (
  case+ lopt of
  | ~
  optn_vt_nil() =>
  (tknd.lctn() + dqid.lctn())
  | ~
  optn_vt_cons(loc1) => tknd.lctn() + loc1
  ) : loc_t // end of [ val(lrec) ]
//
in
err := e00;
d0ecl_make_node
(lres, D0Csymload(tknd, symb, twth, dqid, opt1))
end (*let*) // end of [T_SRP_SYMLOAD(...)]
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
T_SRP_FIXITY(knd) =>
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
end // end of [T_SRP_FIXITY(knd)]
//
(* ****** ****** *)
//
| T_IN0() => // HX: let-IN-end / local-IN-end
(err := e00 + 1; d0ecl(tok.lctn(), D0Ctkerr(tok)))
| _
when
ENDq(tnd) => // HX: end / endlam/fix/let/whr/loc
(err := e00 + 1; d0ecl(tok.lctn(), D0Ctkerr(tok)))
//
| _(* else *) =>
(
case+ tnd of
| T_EOF() =>
(err := e00 + 1; d0ecl(tok.lctn(), D0Ctkerr(tok)))
| _(*non-T_EOF*) =>
let
val () =
buf.skip1() in d0ecl(tok.lctn(), D0Ctkskp(tok)) end
)
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
fun
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

(* end of [ATS3/XATSOPT_parsing_decl00.dats] *)
