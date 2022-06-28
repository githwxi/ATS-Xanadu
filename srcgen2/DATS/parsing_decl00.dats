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
(* ****** ****** *)
#symload
lctn with sort0_get_lctn//staexp0
(* ****** ****** *)
#symload
lctn with s0exp_get_lctn//staexp0
#symload
lctn with s0tdf_get_lctn//staexp0
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
