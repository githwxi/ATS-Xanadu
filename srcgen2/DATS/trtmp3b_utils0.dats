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
Mon Oct 23 00:46:25 EDT 2023
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
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
#symload name with d2cst_get_name
(* ****** ****** *)
#staload _ = "./xsymmap_topmap.dats"
(* ****** ****** *)

#implfun
static_search_cst
  (d3cl, d2c0) =
(
case+
d3cl.node() of
| D3Cstaload _ =>
  f0_staload(d3cl, d2c0)
| _(* otherwise *) => list_nil()
) where
{
//
fun
f0_staload
( d3cl: d3ecl
, d2c0: d2cst): d3eclist =
let
//
val-
D3Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = d3cl.node()
//
in//let
//
case+ dopt of
|
S3TALOADnone(s2ta) =>
(
  list_nil(*void*) )
|
S3TALOADdpar(shrd, dpar) =>
let
//
val
tenv =
d3parsed_get_t3penv(dpar)
//
val () = prerrln
("static_search_cst: shrd = ", shrd)
val () = prerrln
("static_search_cst: tenv = ", tenv)
//
in//let
//
case+ tenv of
|
D3TOPENVnone() =>
list_nil((*void*))
|
D3TOPENVsome(tmap) =>
let
val opt0 =
topmap_search_opt
(tmap, d2c0.name()) in//let
//
case+ opt0 of
| ~optn_vt_nil() => list_nil()
| ~optn_vt_cons(dcls) => ( dcls )
end//let//end-of-[D3TOPENVsome(...)]
//
end(*end-of-[S3TALOADdpar(sknd,dpar)]*)
//
end//let//end-of-[f0_staload(d3cl,d2c0)]
//
val () =
prerrln("static_search_cst: d3cl = ", d3cl)
val () =
prerrln("static_search_cst: d2c0 = ", d2c0)
//
} (*where*)//end of [static_search_cst(...)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr3benv_tapq_resolve
  (env0, d2c0, t2js) =
let
//
val
stmp =
tr3benv_getstmp(env0)
//
val
dcls =
tr3benv_search_cst(env0, d2c0)
//
in//let
//
let
val dcls = filter(dcls)
in//let
timpl_make_node
(stmp, TIMPLall1(d2c0, dcls)) end//let
//
end where
{
//
fun
filter
( dcls
: d3eclist_vt): d3eclist =
(
//
case+ dcls of
| ~
list_vt_nil() => list_nil()
| ~
list_vt_cons
(dcl1, dcls) =>
list_cons
(dcl1, filter(dcls)) where
{
val () =
prerr
("tr3benv_tapq_resolve: ")
val () =
prerrln("filter: d2c0 = ", d2c0)
val () =
prerrln("filter: t2js = ", t2js)
val () =
prerrln("filter: dcl1 = ", dcl1)
}
//
) (*case+*) // end of [ filter(dcls) ]
//
val () =
prerrln("tr3benv_tapq_resolve: d2c0 = ", d2c0)
val () =
prerrln("tr3benv_tapq_resolve: t2js = ", t2js)
//
}(*where*)//end-of-[tr3benv_tapq_resolve(env0,...)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_utils0.dats] *)
