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
Thu Nov  9 13:21:34 EST 2023
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
#staload "./../SATS/trtmp3c.sats"
(* ****** ****** *)

local
(* ****** ****** *)
(*
HX-2023-11-17:
It is implemented in
[dynexp3_utils0.dats]:
tmpmatch_d3cl_t2js(d3cl,t2js)
*)
(* ****** ****** *)
in (*local*)
(* ****** ****** *)

#implfun
tr3cenv_timp_resolve
  (  env0, timp  ) =
(
case+
timp.node() of
| TIMPLallx _ => timp
| TIMPLall1 _ => timp // HX: FIXME!
) where
{
//
val () = prerrln
("tr3cenv_timp_resolve: timp = ", timp)
//
}(*where*)//end-of-[tr3cenv_timp_resolve]

(* ****** ****** *)
//
#implfun
tr3cenv_tapq_resolve
  (env0, d2c0, t2js) =
let
//
val
stmp =
tr3cenv_getstmp(env0)
//
val // HX: [trtmp3b]
svts = // guarantees it to
tr3cenv_getsvts(env0) // exist
//
val
dcls =
tr3cenv_search_dcst(env0, d2c0)
//
val () = prerrln
("\
tr3cenv_tapq_resolve:d2c0=",d2c0)
val () = prerrln
("\
tr3cenv_tapq_resolve:t2js=",t2js)
val () = prerrln
("\
tr3cenv_tapq_resolve:stmp=",stmp)
val () = prerrln
("\
tr3cenv_tapq_resolve:svts=",svts)
val () = prerrln
("\
tr3cenv_tapq_resolve:dcls=",dcls)
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
let
//
val
opt1 =
tmpmatch_d3cl_t2js
(dcl1(*impl*),t2js(*targ*))
//
in//let
case+ opt1 of
|optn_nil
((*void*)) => filter( dcls )
|optn_cons
(  tsub  ) =>
let
//
val
dcl1 = d3ecl_tmpsub(tsub,dcl1)
//
(*
val (  ) =
prerr("tr3cenv_tapq_resolve:")
val (  ) =
prerrln("filter: dcl1 = ", dcl1)
*)
//
in//let
(
  list_cons(dcl1, filter(dcls)))
end//let
end//let//end-of-[list_cons(...)]
//
)(*case+*) // end of [ filter(dcls) ]
//
(*
val () =
prerrln("tr3cenv_tapq_resolve: d2c0 = ", d2c0)
val () =
prerrln("tr3cenv_tapq_resolve: t2js = ", t2js)
*)
//
}(*where*)//end-of-[tr3cenv_tapq_resolve(env0,...)]
//
(* ****** ****** *)

end(*local*) // end-of-[local(tr3cenv_tapq_resolve)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_utils0.dats] *)
