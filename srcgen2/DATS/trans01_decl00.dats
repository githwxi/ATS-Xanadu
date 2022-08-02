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
(*
Tue Jul 26 12:37:48 EDT 2022
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
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#symload lctn with i0dnt_get_lctn
#symload node with i0dnt_get_node
(* ****** ****** *)
#symload lctn with s0tdf_get_lctn
#symload node with s0tdf_get_node
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)

#implfun
trans01_d0ecl
  (d0cl) = let
//
// (*
val
loc0 = d0cl.lctn()
val () =
prerrln
("trans01_decl: d0cl = ", d0cl)
// *)
//
in//let
//
case+
d0cl.node() of
//
| D0Cstatic _ => f0_static(d0cl)
| D0Cextern _ => f0_extern(d0cl)
//
| D0Cabssort _ => f0_abssort(d0cl)
| D0Cstacst0 _ => f0_stacst0(d0cl)
//
| D0Csortdef _ => f0_sortdef(d0cl)
| D0Csexpdef _ => f0_sexpdef(d0cl)
//
|
_ (*otherwise*) => d1ecl_none1(d0cl)
//
end where
{
(* ****** ****** *)
//
fun
f0_static
(d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cstatic
(tknd, dcl1) = d0cl.node()
//
val dcl1 = trans01_d0ecl(dcl1)
//
in
d1ecl(loc0, D1Cstatic(tknd, dcl1))
end (* let *) // end of [f0_static]
//
fun
f0_extern
(d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cextern
(tknd, dcl1) = d0cl.node()
//
val dcl1 = trans01_d0ecl(dcl1)
//
in
d1ecl(loc0, D1Cextern(tknd, dcl1))
end (* let *) // end of [f0_extern]
//
(* ****** ****** *)

fun
f0_abssort
(d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cabssort
(tknd, tid0) = d0cl.node()
//
val tid0 = trans01_i0dnt(tid0)
//
in
d1ecl(loc0, D1Cabssort(tknd, tid0))
end // end of [f0_abssort]

(* ****** ****** *)

fun
f0_stacst0
(d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cstacst0
(tknd
,sid0, tmas
,tcln, s0t1) = d0cl.node()
//
val sid0 =
  trans01_i0dnt(sid0)
val tmas =
  trans01_t0maglst(tmas)
//
val s1t1 = trans01_sort0(s0t1)
//
in
d1ecl_make_node
( loc0
, D1Cstacst0(tknd, sid0, tmas, s1t1))
end // end of [f0_stacst0]

(* ****** ****** *)

fun
f0_sortdef
(d0cl: d0ecl): d1ecl =
let
//
val-
D0Csortdef
( tknd
, tid0
, teq1, stdf) = d0cl.node()
//
val tid0 = trans01_i0dnt(tid0)
//
val stdf =
(
case+
stdf.node() of
|
S0TDFsort
(  s0t1  ) =>
let
val
s1t1 = trans01_sort0(s0t1)
in
s1tdf
(stdf.lctn(), S1TDFsort(s1t1))
end
|
S0TDFtsub
( tbeg
, s0a1, tbar
, s0es, tend) =>
let
val s1a1 = trans01_s0arg(s0a1)
val s1es = trans01_s0explst(s0es)
in
s1tdf
(stdf.lctn(),S1TDFtsub(s1a1,s1es))
endlet // end of [S0TDFtsub]
) : s1tdf // end of [ val(stdf) ]
//
(*
val () =
println!("f0_sortdef: tid0 = ", tid0)
val () =
println!("f0_sortdef: stdf = ", stdf)
*)
//
in
d1ecl_make_node
(d0cl.lctn(), D1Csortdef(tknd, tid0, stdf))
end // end of [f0_sortdef]

(* ****** ****** *)

fun
f0_sexpdef
(d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Csexpdef
( tknd
, seid
, smas
, tres
, teq1, s0e2) = d0cl.node()
//
val seid =
  trans01_i0dnt(seid)
val smas =
  trans01_s0maglst(smas) 
val tres =
  trans01_sort0opt(tres)
//
val s1e2 = trans01_s0exp(s0e2)
//
(*
val () =
println!("f0_sexpdef: seid = ", seid)
val () =
println!("f0_sexpdef: smas = ", smas)
val () =
println!("f0_sexpdef: tres = ", tres)
val () =
println!("f0_sexpdef: s1e2 = ", s1e2)
*)
//
in
d1ecl_make_node
(loc0, D1Csexpdef(tknd,seid,smas,tres,s1e2))
end // end of [f0_sexpdef]

(* ****** ****** *)

} (*where*) // end of [trans01_d0ecl(d0cl)]

(* ****** ****** *)

#implfun
trans01_d0eclist
  (dcls) =
(
list_map
<d0ecl><d1ecl>(dcls)) where
{
#impltmp
map$fopr<d0ecl><d1ecl> = trans01_d0ecl
} (*where*) // end of [trans01_d0eclist(dcls)]

(* ****** ****** *)

#implfun
trans01_d0eclistopt
  (opt0) =
(
case+ opt0 of
| optn_nil() => optn_nil()
| optn_cons(dcls) =>
  optn_cons(trans01_d0eclist(dcls))
) (*where*) // end of [trans01_d0eclistopt(opt0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_decl00.dats] *)
