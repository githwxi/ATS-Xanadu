(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Sun 29 Jan 2023 11:34:20 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#staload "./../SATS/fperr20.sats"
(* ****** ****** *)
(* ****** ****** *)
#define FPERR20_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with s2cst_get_lctn
#symload sort with s2cst_get_sort
#symload d2cs with s2cst_get_d2cs
(* ****** ****** *)
#symload lctn with d2con_get_lctn
#symload styp with d2con_get_styp
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
fperr20_d2conlst
( out: FILR
, d2cs: d2conlst): void =
(
case+ d2cs of
|
list_nil() => ()
|
list_cons(d2c1, d2cs) =>
let
val loc1 = d2c1.lctn()
val t2p1 = d2c1.styp()
val (  ) =
(
printsln("\
FPERR20-ERROR:",
loc1,":",d2c1,"(",t2p1,")"))
in//let
(
  fperr20_d2conlst(out, d2cs))
end//let//end-of-[list_cons(...)]
) where
{
  #impltmp g_print$out<>() = out
}(*where*)//end-of-[fperr20_d2conlst]
//
(* ****** ****** *)
//
fun
fperr20_s2cstlst
( out: FILR
, s2cs: s2cstlst): void =
(
case+ s2cs of
|
list_nil() => ()
|
list_cons(s2c1, s2cs) =>
let
//
val loc1 = s2c1.lctn()
val s2t1 = s2c1.sort()
val opt1 = s2c1.d2cs()
//
val (  ) =
(
printsln("\
FPERR20-ERROR:",
loc1,":",s2c1,"(",s2t1,")"))
//
val (  ) =
(
case+ opt1 of
| ~
optn_vt_nil() => ()
| ~
optn_vt_cons(d2cs) =>
(
  fperr20_d2conlst(out, d2cs))
)
//
in//let
(
  fperr20_s2cstlst(out, s2cs))
end//let//end-of-[list_cons(...)]
) where
{
  #impltmp g_print$out<>() = out
}(*where*)//end-of-[fperr20_s2cstlst]
//
(* ****** ****** *)
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, dcl0: d2ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcl0.node() of
//
|
D2Cstatic
(tknd, dcl1) =>
let
val () =
fperr20_d2ecl(out, dcl1)
endlet//end-of(D2Cstatic(_,_))
|
D2Cextern
(tknd, dcl1) =>
let
val () =
fperr20_d2ecl(out, dcl1)
endlet//end-of(D2Cextern(_,_))
//
|
D2Clocal0
(dcs1, dcs2) =>
let
val () =
fperr20_d2eclist(out, dcs1)
val () =
fperr20_d2eclist(out, dcs2)
endlet // end of [D2Clocal0(...)]
//
|
D2Cabssort _ => ( (*nil*) )
|
D2Cstacst0
(s2c1, s2t2) => ( (*nil*) )
|
D2Csortdef
(sym1, s2tx) => ( (*nil*) )
|
D2Csexpdef
(s2c1, s2e2) => ( (*nil*) )
//
|
D2Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) => let
val () =
fperr20_d2eclistopt(out, dopt)
endlet // end-of-(D2Cinclude(...))
//
|
D2Cvaldclst
(tknd, d2vs) => let
val () =
  fperr20_d2valdclist(out, d2vs)
endlet // end-of-(D2Cvaldclst(_,_,_))
|
D2Cvardclst
(tknd, d2vs) => let
val () =
  fperr20_d2vardclist(out, d2vs)
endlet // end-of-(D2Cvardclst(_,_,_))
//
|
D2Cfundclst
( tknd
, tqas
, d2cs, d2fs) => let
(*
val () =
  fperr20_t2qaglst(out, tqas)
val () =
  fperr20_d2cstlst(out, d2cs)
*)
val () =
  fperr20_d2fundclist(out, d2fs)
endlet // end-of-(D2Cfundclst(_,_,_))
//
|
D2Cimplmnt0
( tknd
, sqas, tqas
, dimp, tias
, f2as, sres, dexp) =>
let
(*
val () =
  fperr20_s2qaglst(out, sqas)
val () =
  fperr20_t2qaglst(out, tqas)
val () =
  fperr20_t2iaglst(out, tias)
*)
val () =
  fperr20_f2arglst(out, f2as)
(*
val () = fperr20_s2res(out, sres)
*)
val () = fperr20_d2exp(out, dexp)
endlet // end of [ D2Cimplmnt0(...) ]
//
(* ****** ****** *)
//
|D2Cexcptcon
(d1cl, d2cs) =>
let
val () = fperr20_d2conlst(out, d2cs)
endlet // end of [ D2Cexcptcon(...) ]
//
|D2Cdatatype
(d1cl, s2cs) =>
let
val () = fperr20_s2cstlst(out, s2cs)
endlet // end of [ D2Cdatatype(...) ]
//
(* ****** ****** *)
//
|D2Cnone0 _ => ( (*void*) )
|D2Cnone1
(  d1cl  ) => d1ecl_fpemsg(out, d1cl)
|D2Cnone2
(  d2cl  ) => fperr20_d2ecl(out, d2cl)
//
(* ****** ****** *)
//
|D2Cerrck
(lvl1,dcl1) => fperr20_d2ecl(out, dcl0)
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val
loc0 = dcl0.lctn()
val () = prerrsln
("fperr20_d2ecl: auxmain: loc0 = ", loc0)
val () = prerrsln
("fperr20_d2ecl: auxmain: dcl0 = ", dcl0)
endlet
//
(* ****** ****** *)
//
end (*let*) // end-of-[ auxmain(out, dcl0) ]

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
fperr20_d2ecl
(out, dcl0) =
let
//
#impltmp
g_print$out<>() = out
//
val () =
let
val loc0 = dcl0.lctn()
in//let
(*
prerrsln
("fperr20_d2ecl: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr20_d2ecl: dcl0 = ", dcl0)
*)
//
in//let
//
case+
dcl0.node() of
//
|
D2Cerrck(lvl, d2cl)  =>
(
auxmain( out, d2cl );
if
(lvl
>FPERR20_ERRVL) then () else
let
val loc0 = dcl0.lctn() in
printsln();
printsln("\
FPERR20-ERROR:", loc0, ":", dcl0)
end
)
//
| _(* otherwise *) => (   (*skipped*)   )
//
end (*let*)//end-of(fperr20_d2ecl(out,dcl0))
//
endloc(*local*)//end-of(local(fperr20_d2ecl))

(* ****** ****** *)
//
#implfun
fperr20_d2eclist
  (out, dcls) =
(
  list_fperr20_fnp(out, dcls, fperr20_d2ecl))
//
(* ****** ****** *)
//
#implfun
fperr20_teqd2exp
  (out, tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() => ()
|
TEQD2EXPsome(teq1, d2e2) =>
let
val (  ) = fperr20_d2exp(out, d2e2)
endlet // end of [TEQD2EXPsome(_,_)]
) (*case+*)//end-(fperr20_teqd2exp(out,tdxp))
//
(* ****** ****** *)
//
#implfun
fperr20_d2valdcl
(out, dval) =
let
//
val (  ) =
fperr20_d2pat(out, dpat)
//
val (  ) =
fperr20_teqd2exp(out, tdxp)
//
endlet where
{
//
  val dpat = d2valdcl_get_dpat(dval)
  val tdxp = d2valdcl_get_tdxp(dval)
//
(*
  val wsxp = d2valdcl_get_wsxp(dval)
*)
//
} (*where*)//end-of-[fperr20_d2valdcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
fperr20_d2vardcl
(out, dvar) =
let
//
val (  ) =
fperr20_teqd2exp(out, dini)
//
endlet where
{
//
(*
  val dpid = d2vardcl_get_dpid(dvar)
  val vpid = d2vardcl_get_vpid(dvar)
  val sres = d2vardcl_get_sres(dvar)
*)
//
  val dini = d2vardcl_get_dini(dvar)
//
} (*where*)//end-of-[fperr20_d2vardcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
fperr20_d2fundcl
(out, dfun) =
let
//
val (  ) =
fperr20_f2arglst(out, fags)
//
val (  ) =
fperr20_teqd2exp(out, tdxp)
//
endlet where
{
//
(*
  val dpid = d2fundcl_get_dpid(dfun)
*)
//
  val fags = d2fundcl_get_farg(dfun)
(*
  val sres = d2fundcl_get_sres(dfun)
*)
  val tdxp = d2fundcl_get_tdxp(dfun)
//
(*
  val wsxp = d2fundcl_get_wsxp(dfun)
*)
//
} (*where*)//end-of-[fperr20_d2fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
fperr20_d2valdclist
  (out, d2vs) =
list_fperr20_fnp(out, d2vs, fperr20_d2valdcl)
#implfun
fperr20_d2vardclist
  (out, d2vs) =
list_fperr20_fnp(out, d2vs, fperr20_d2vardcl)
//
#implfun
fperr20_d2fundclist
  (out, d2fs) =
list_fperr20_fnp(out, d2fs, fperr20_d2fundcl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_fperr20_decl00.dats] *)
