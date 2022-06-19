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
fp_d0ecl
(f00, buf, err) = let
//
val e00 = err
val tok = buf.getk0()
val tnd = tok.tnode()
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
(lres, D0Clocal(tbeg, head, tmid, body, tend))
end (*let*) // end of [ T_LOCAL() ]
//
|
T_SORTDEF() => let
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
_(*case-of-error*) =>
(err := e00 + 1; d0ecl(tok.lctn(), D0Ctkerr(tok)))
//
end (*let*) // end of [fp_d0ecl(f00,buf,err)]

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
endloc (*local*) // end of [local(p1_declseq...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_decl02.dats] *)
