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
Tue Aug 16 16:09:56 EDT 2022
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
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
(* ****** ****** *)
#define FPEMSG_ERRVL 2
(* ****** ****** *)
#symload fpemsg with g1exp_fpemsg
(* ****** ****** *)
#symload fpemsg with sort1_fpemsg
#symload fpemsg with s1exp_fpemsg
#symload fpemsg with l1s1e_fpemsg
(* ****** ****** *)

local
//
fun
auxmain
( out: FILR
, g1e: g1exp): void =
let
#impltmp
g_print$out<>() = out
in//let
case+
g1e.node() of
//
|G1Eid0 _ => ()
//
|G1Eint _ => ()
|G1Echr _ => ()
|G1Eflt _ => ()
|G1Estr _ => ()
//
|
G1Eb0sh _ => ()
|
G1Eb1sh(g1e1) =>
g1exp_fpemsg(out, g1e1)
//
|G1Ea0pp() => ()
|
G1Ea1pp(g1f0,g1e1) =>
(
g1exp_fpemsg(out, g1f0)
;
g1exp_fpemsg(out, g1e1))
|
G1Ea2pp
(g1f0,g1e1,g1e2) =>
(
g1exp_fpemsg(out, g1f0)
;
g1exp_fpemsg(out, g1e1)
;
g1exp_fpemsg(out, g1e2))
|
G1Elist(g1es) =>
g1explst_fpemsg(out, g1es)
|
G1Eif0
(g1e1,g1e2,g1e3) =>
(
g1exp_fpemsg(out, g1e1)
;
g1exp_fpemsg(out, g1e2)
;
g1exp_fpemsg(out, g1e3))
//
|G1Enone0() => ((*void*))
|G1Enone1(g0e1) => ((*void*))
//
|
G1Eerrck _ => g1exp_fpemsg(out, g1e)
end(*let*)//end-of-(auxmain(out,g1e))
//
in//local

#implfun
g1exp_fpemsg
(out, g1e0) =
let
#impltmp
g_print$out<>() = out
in//let
case+
g1e0.node() of
|
G1Eerrck(lvl,g1e1) =>
(
auxmain( out, g1e1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("TREAD01-ERROR:",g1e0.lctn(),":",g1e0)
)
| _(* otherwise *) => (  (*ignored*)  )
//
end(*let*)//end-of(g1exp_fpemsg(out,g1e0))
//
endloc(*local*)//end-of(local(g1exp_fpemsg))

(* ****** ****** *)

local

fun
auxmain
( out: FILR
, s1t: sort1): void =
let
#impltmp
g_print$out<>() = out
in//let
case
s1t.node() of
//
|S1Tid0 _ => ()
|S1Tint _ => ()
//
|S1Ta0pp() => ()
|
S1Ta1pp(s1f0,s1t1) =>
(
sort1_fpemsg(out, s1f0)
;
sort1_fpemsg(out, s1t1))
|
S1Ta2pp
(s1f0,s1t1,s1t2) =>
(
sort1_fpemsg(out, s1f0)
;
sort1_fpemsg(out, s1t1)
;
sort1_fpemsg(out, s1t2))
|
S1Tlist(s1ts) =>
sort1lst_fpemsg(out, s1ts)
|
S1Tqual(tok1,s1t2) =>
(
sort1_fpemsg(out, s1t2))
//
|S1Tnone0() => ((*void*))
|S1Tnone1(s0t1) => ((*void*))
//
|
S1Terrck _ => sort1_fpemsg(out, s1t)
end(*let*)//end-of-(auxmain(out,s1t))
//
in//local
//
#implfun
sort1_fpemsg
( out, s1t0 ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
s1t0.node() of
|
S1Terrck(lvl, s1t1) =>
(
auxmain( out, s1t1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
println
("TREAD01-ERROR:",s1t0.lctn(),":",s1t0)
)
| _(* otherwise *) => (  (* ignored *)  )
//
end(*let*)//end-of(sort1_fpemsg(out,s1t0))
//
endloc(*local*)//end-of(local(sort1_fpemsg))

(* ****** ****** *)

local

fun
auxmain
( out: FILR
, dcl: d1ecl): void =
let
#impltmp
g_print$out<>() = out
in//let
//
case+
dcl.node() of
//
|D1Cnone0() => ((*void*))
|D1Cnone1(s0t1) => ((*void*))
//
|
D1Cerrck _ => d1ecl_fpemsg(out, dcl)
//
end(*let*)//end-of-(auxmain(out,dcl))

in(*in-of-local*)

#implfun
d1ecl_fpemsg
(out, dcl0) =
let
#impltmp
g_print$out<>() = out
in//let
case+
dcl0.node() of
|
D1Cerrck(lvl, d1cl)  =>
(
auxmain( out, d1cl );
println
("TREAD01-ERROR:",dcl0.lctn(),":",dcl0))
//
| _(* otherwise *) => (   (*ignored*)   )
end (*let*)//end-of(d1ecl_fpemsg(out,dcl0))
//
endloc(*local*)//end-of(local(d1ecl_fpemsg))

(* ****** ****** *)
//
#implfun
sort1lst_fpemsg
(out, s1ts) =
list_foreach<sort1>(s1ts) where
{
#impltmp
foreach$work<sort1>(s1t1) = sort1_fpemsg(out,s1t1)
}
//
(* ****** ****** *)
//
#implfun
s1explst_fpemsg
(out, s1es) =
list_foreach<s1exp>(s1es) where
{
#impltmp
foreach$work<s1exp>(s1e1) = s1exp_fpemsg(out,s1e1)
}
//
(* ****** ****** *)
//
#implfun
d1patlst_fpemsg
(out, d1ps) =
list_foreach<d1pat>(d1ps) where
{
#impltmp
foreach$work<d1pat>(d1p1) = d1pat_fpemsg(out,d1p1)
}
//
(* ****** ****** *)
//
#implfun
d1explst_fpemsg
(out, d1es) =
list_foreach<d1exp>(d1es) where
{
#impltmp
foreach$work<d1exp>(d1e1) = d1exp_fpemsg(out,d1e1)
}
//
(* ****** ****** *)
//
#implfun
d1eclist_fpemsg
(out, dcls) =
list_foreach<d1ecl>(dcls) where
{
#impltmp
foreach$work<d1ecl>(dcl1) = d1ecl_fpemsg(out,dcl1)
}
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01_errmsg.dats] *)
