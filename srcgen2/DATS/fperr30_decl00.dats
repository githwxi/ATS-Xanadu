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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed 26 Jul 2023 01:46:46 PM EDT
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
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/fperr20.sats"
#staload "./../SATS/fperr30.sats"
(* ****** ****** *)
#define FPERR30_ERRVL 2
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, dcl0: d3ecl): void =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
dcl0.node() of
//
|D3Cstatic
(tknd, dcl1) =>
let
val () =
fperr30_d3ecl(out, dcl1)
endlet//end-of(D3Cstatic(_,_))
|D3Cextern
(tknd, dcl1) =>
let
val () =
fperr30_d3ecl(out, dcl1)
endlet//end-of(D3Cextern(_,_))
//
|D3Clocal0
(dcs1, dcs2) =>
let
val () =
fperr30_d3eclist(out, dcs1)
val () =
fperr30_d3eclist(out, dcs2)
endlet // end of [D3Clocal0(...)]
//
(* ****** ****** *)
//
|D3Cinclude
(knd0
,tknd, gsrc
,fopt, dopt) => let
val () =
fperr30_d3eclistopt(out, dopt)
endlet // end-of-(D3Cinclude(...))
//
|D3Cstaload
(knd0
,tknd, gsrc
,fopt, dopt) => let
(*
val () =
fperr30_s2taloadopt(out, dopt)
*)
endlet // end-of-(D3Cstaload(...))
//
(* ****** ****** *)
//
|
D3Cvaldclst
(tknd, d3vs) => let
val () =
  fperr30_d3valdclist(out, d3vs)
endlet//end-of-(D3Cvaldclst(_,_,_))
|
D3Cvardclst
(tknd, d3vs) => let
val () =
  fperr30_d3vardclist(out, d3vs)
endlet//end-of-(D3Cvardclst(_,_,_))
//
|
D3Cfundclst
( tknd
, tqas
, d2cs, d3fs) => let
(*
val () =
  fperr30_t3qaglst(out, tqas)
val () =
  fperr30_d3cstlst(out, d3cs)
*)
val () =
  fperr30_d3fundclist(out, d3fs)
endlet//end-of-(D3Cfundclst(_,_,_))
//
(* ****** ****** *)
//
|
D3Cimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp, tias
, f3as, sres, dexp) =>
let
//
(*
val () =
  fperr30_s2qaglst(out, sqas)
val () =
  fperr30_t2qaglst(out, tqas)
val () =
  fperr30_t2iaglst(out, tias)
*)
//
val () =
(
  fperr30_f3arglst(out, f3as))
//
(*
val () = fperr30_s2res(out, sres)
*)
//
val () = fperr30_d3exp(out, dexp)
//
endlet//end of [ D3Cimplmnt0(...) ]
//
(* ****** ****** *)
//
|D3Cnone0 _ => ( (*void*) )
|D3Cnone1
(  d2cl  ) => fperr20_d2ecl(out, d2cl)
|D3Cnone2
(  d3cl  ) => fperr30_d3ecl(out, d3cl)
//
|D3Cerrck
(lvl1,dcl1) => fperr30_d3ecl(out, dcl0)
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val
loc0 = dcl0.lctn()
//
val () = prerrsln
("fperr30_d3ecl: auxmain: loc0 = ", loc0)
val () = prerrsln
("fperr30_d3ecl: auxmain: dcl0 = ", dcl0)
endlet
//
(* ****** ****** *)
//
end (*let*) // end-of-[ auxmain(out, dcl0) ]

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
fperr30_d3ecl
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
("fperr30_d3ecl: loc0 = ", loc0)
*)
end//let
(*
val () =
prerrsln
("fperr30_d3ecl: dcl0 = ", dcl0)
*)
//
in//let
//
case+
dcl0.node() of
//
|
D3Cerrck(lvl, d3cl)  =>
(
(
auxmain(out, d3cl));
if
(lvl
>FPERR30_ERRVL)
then ((*void*)) else
let
val loc0 = dcl0.lctn() in
printsln();
printsln("\
FPERR30-ERROR:", loc0, ":", dcl0)
end
)
//
| _(* otherwise *) => (   (*skipped*)   )
//
end (*let*)//end-of(fperr30_d3ecl(out,dcl0))
//
endloc(*local*)//end-of(local(fperr30_d3ecl))

(* ****** ****** *)
//
#implfun
fperr30_d3eclist
  (out, dcls) =
(
  list_fperr30_fnp(out, dcls, fperr30_d3ecl))
//
(* ****** ****** *)
//
#implfun
fperr30_teqd3exp
  (out, tdxp) =
(
case+ tdxp of
|
TEQD3EXPnone() => ()
|
TEQD3EXPsome(teq1, d3e2) =>
let
val (  ) = fperr30_d3exp(out, d3e2)
endlet // end of [TEQD3EXPsome(_,_)]
) (*case+*)//end-(fperr30_teqd3exp(out,tdxp))
//
(* ****** ****** *)
//
#implfun
fperr30_d3valdcl
(out, dval) =
let
//
val (  ) =
fperr30_d3pat(out, dpat)
//
val (  ) =
fperr30_teqd3exp(out, tdxp)
//
endlet where
{
//
val dpat = d3valdcl_get_dpat(dval)
val tdxp = d3valdcl_get_tdxp(dval)
//
(*
val wsxp = d3valdcl_get_wsxp(dval)
*)
//
} (*where*)//end-of-[fperr30_d3valdcl(...)]
//
(* ****** ****** *)
//
#implfun
fperr30_d3vardcl
(out, dvar) =
let
//
val (  ) =
fperr30_teqd3exp(out, dini)
//
endlet where
{
//
(*
val dpid = d3vardcl_get_dpid(dvar)
val vpid = d3vardcl_get_vpid(dvar)
val sres = d3vardcl_get_sres(dvar)
*)
//
val dini = d3vardcl_get_dini(dvar)
//
} (*where*)//end-of-[fperr30_d3vardcl(...)]
//
(* ****** ****** *)
//
#implfun
fperr30_d3fundcl
(out, dfun) =
let
//
val (  ) =
fperr30_f3arglst(out, fags)
//
val (  ) =
fperr30_teqd3exp(out, tdxp)
//
endlet where
{
//
(*
  val dpid = d3fundcl_get_dpid(dfun)
*)
//
  val fags = d3fundcl_get_farg(dfun)
(*
  val sres = d3fundcl_get_sres(dfun)
*)
  val tdxp = d3fundcl_get_tdxp(dfun)
//
(*
  val wsxp = d3fundcl_get_wsxp(dfun)
*)
//
} (*where*)//end-of-[fperr30_d3fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
fperr30_d3valdclist
  (out, d3vs) =
(
list_fperr30_fnp(out, d3vs, fperr30_d3valdcl))
//
#implfun
fperr30_d3vardclist
  (out, d3vs) =
(
list_fperr30_fnp(out, d3vs, fperr30_d3vardcl))
//
(* ****** ****** *)
//
#implfun
fperr30_d3fundclist
  (out, d3fs) =
(
list_fperr30_fnp(out, d3fs, fperr30_d3fundcl))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_fperr30_decl00.dats] *)
